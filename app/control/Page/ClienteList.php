<?php
/**
 * DatagridSearchView
 *
 * @version    1.0
 * @package    samples
 * @subpackage tutor
 * @author     Pablo Dall'Oglio
 * @copyright  Copyright (c) 2006 Adianti Solutions Ltd. (http://www.adianti.com.br)
 * @license    http://www.adianti.com.br/framework-license
 */
class ClienteList extends TPage
{
    private $datagrid;
    
    public function __construct()
    {
        parent::__construct();
        
        // creates one datagrid
        $this->datagrid = new BootstrapDatagridWrapper(new TDataGrid);
        $this->datagrid->width = '100%';
        
        // add the columns
        $this->datagrid->addColumn( new TDataGridColumn('id',    'Id',    'center', '10%') );
        $this->datagrid->addColumn( new TDataGridColumn('nome',    'Name',    'left',   '30%') );
        $this->datagrid->addColumn( new TDataGridColumn('placa',    'City',    'left',   '30%') );
        $this->datagrid->addColumn( new TDataGridColumn('telefone',   'State',   'left',   '30%') );
        
        $action1 = new TDataGridAction([$this, 'onView'], ['placa'=>'{placa}',  'nome' => '{nome}'] );
        $this->datagrid->addAction($action1, 'View', 'fa:search blue');
        
        // creates the datagrid model
        $this->datagrid->createModel();
        
        // search box
        $input_search = new TEntry('input_search');
        $input_search->placeholder = _t('Search');
        $input_search->setSize('100%');
        
        // enable fuse search by column name
        $this->datagrid->enableSearch($input_search, 'placa, nome');
        
        $panel = new TPanelGroup( _t('Datagrid search') );
        $panel->addHeaderWidget($input_search);
        $panel->add($this->datagrid)->style = 'overflow-x:auto';
        $panel->addFooter('footer');
        
        // wrap the page content using vertical box
        $vbox = new TVBox;
        $vbox->style = 'width: 100%';
        $vbox->add(new TXMLBreadCrumb('menu.xml', __CLASS__));
        $vbox->add($panel);
        parent::add($vbox);
    }
    
    /**
     * Load the data into the datagrid
     */
    function onReload()
    {
        $this->datagrid->clear();
        
        try
		{	
		    TTransaction::open('lavagem');//
			
			$repository = new TRepository('cliente');
			$criteria   = new TCriteria;
			
            $criteria->setProperty('order', 'id');//ordena a grid em DESC 
            $criteria->setProperty('direction','DESC');
			
		    $objects2 = $repository->load( $criteria );//objects2
			
			$this->datagrid->clear();
		    if ($objects2)
		    {
				foreach ($objects2 as $object2)
				{ 
				   
				   $this->datagrid->addItem( $object2 );//ADD NA GRID
				  
				}
		    }
			else
			{
				new TMessage('info', 'Sem bancos cadastrados');
			}	
			
			//echo 'teste' . $parametro;
			
			TTransaction::close();
			
		}//try
		catch(Exception $e)
		{
			new TMessage('error', $e->getMessage());
			TTransaction::rollback();
		}

        
    }
    
    /**
     * Executed when the user clicks at the view button
     */
    public static function onView($param)
    {
        // get the parameter and shows the message
        $code = $param['nome'];
        $name = $param['placa'];
        new TMessage('info', "The code is: <b>$code</b> <br> The name is : <b>$name</b>");
    }
    
    /**
     * shows the page
     */
    function show()
    {
        $this->onReload();
        parent::show();
    }
}
