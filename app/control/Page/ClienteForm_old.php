<?php
/**
 * FormVerticalBuilderView
 *
 * @version    1.0
 * @package    samples
 * @subpackage tutor
 * @author     Pablo Dall'Oglio
 * @copyright  Copyright (c) 2006 Adianti Solutions Ltd. (http://www.adianti.com.br)
 * @license    http://www.adianti.com.br/framework-license
 */
class ClienteForm extends TPage
{
    private $form;
    
    /**
     * Class constructor
     * Creates the page
     */
    public function __construct()
    {
        parent::__construct();
        
        $this->form = new BootstrapFormBuilder('form_builder');
        $this->form->setFormTitle('Cadastro de Cliente');
        $this->form->setFieldSizes('100%');
        $this->form->generateAria(); // automatic aria-label
        $this->form->appendPage('Dados Básicos');
        
        $id         = new TEntry('id');
        $name         = new TEntry('nome');
        $veiculo      = new TEntry('veiculo');
        $placa        = new TEntry('placa');
        $endereco     = new TEntry('endereco');
        $numero       = new TEntry('numero');
        $telefone     = new TEntry('telefone');
      
        $telefone->setMask('9999-99999');
        $id->setEditable(FALSE);
        
        $row = $this->form->addFields( [ new TLabel('Id'),   $id ],
                                       [ new TLabel('Name'),     $name ],
                                       [ new TLabel('Telefone'),   $telefone ] );
        $row->layout = ['col-sm-2', 'col-sm-8', 'col-sm-2' ];

        $row = $this->form->addFields( [ new TLabel('Veículo'),     $veiculo ],
                                       [ new TLabel('Placa'),     $placa ] );
        $row->layout = ['col-sm-8', 'col-sm-4' ];

        $row = $this->form->addFields( [ new TLabel('Endereço'),     $endereco ],
                                       [ new TLabel('Número'),     $numero ] );
        $row->layout = ['col-sm-9', 'col-sm-3' ];
        
        //Btn salvar
        $this->form->addAction('Send', new TAction(array($this, 'onSave')), 'far:check-circle green');
        
        // wrap the page content using vertical box
        $vbox = new TVBox;
        $vbox->style = 'width: 100%';
        $vbox->add(new TXMLBreadCrumb('menu.xml', __CLASS__));
        $vbox->add($this->form);
        parent::add($vbox);
    }

    public function onSave($param = null) 
    {
        try
        {
            TTransaction::open('lavagem');
			
                $this->form->validate();
                
                $cliente =  $this->form->getData('Cliente');
                
                $cliente->store();
                
                $this->form->setData($cliente);
                
                new TMessage('info', 'Salvo com sucesso');
                
                //Desabilita o 'CODIGO'
                //TEntry::disableField('formBancos', 'CODIGO');
			
			TTransaction::close();
       

        }
        catch (Exception $e) // in case of exception
        {
            //</catchAutoCode> //</blockLine>

            new TMessage('error', $e->getMessage()); // shows the exception error message
            $this->form->setData( $this->form->getData() ); // keep form data
            TTransaction::rollback(); // undo all pending operations
        }
    }
    
    /**
     * Post data
     */
    public function onSend($param)
    {
        $data = $this->form->getData();
        $this->form->setData($data);
        
        echo '<pre>';
        print_r($data);
        echo '</pre>';
    }
}
