`ifndef TOP_SEQ_LIB_SV
`define TOP_SEQ_LIB_SV

class top_default_seq extends uvm_sequence #(uvm_sequence_item);

  `uvm_object_utils(top_default_seq)

  top_config m_config;

  ahb_agent m_ahb_m0_agent;
  ahb_agent m_ahb_m1_agent;
  ahb_agent m_ahb_m2_agent;
  ahb_agent m_ahb_m3_agent;
  ahb_agent m_ahb_s0_agent;
  ahb_agent m_ahb_s1_agent;
  ahb_agent m_ahb_s2_agent;
  ahb_agent m_ahb_s3_agent;

  int m_seq_count = 1;

  extern function new(string name = "");
  extern task body();
  extern task pre_start();
  extern task post_start();

endclass : top_default_seq


function top_default_seq::new(string name = "");
  super.new(name);
endfunction : new


task top_default_seq::body();
  `uvm_info(get_type_name(), "Default sequence starting", UVM_HIGH)

  repeat (m_seq_count)
  begin
    fork
      if (m_ahb_m0_agent.m_config.is_active == UVM_ACTIVE)
      begin
        ahb_default_seq seq;
        seq = ahb_default_seq::type_id::create("seq");
        seq.set_item_context(this, m_ahb_m0_agent.m_sequencer);
        if ( !seq.randomize() )
          `uvm_error(get_type_name(), "Failed to randomize sequence")
        seq.m_config = m_ahb_m0_agent.m_config;
        seq.set_starting_phase( get_starting_phase() );
        seq.start(m_ahb_m0_agent.m_sequencer, this);
      end
      if (m_ahb_m1_agent.m_config.is_active == UVM_ACTIVE)
      begin
        ahb_default_seq seq;
        seq = ahb_default_seq::type_id::create("seq");
        seq.set_item_context(this, m_ahb_m1_agent.m_sequencer);
        if ( !seq.randomize() )
          `uvm_error(get_type_name(), "Failed to randomize sequence")
        seq.m_config = m_ahb_m1_agent.m_config;
        seq.set_starting_phase( get_starting_phase() );
        seq.start(m_ahb_m1_agent.m_sequencer, this);
      end
      if (m_ahb_m2_agent.m_config.is_active == UVM_ACTIVE)
      begin
        ahb_default_seq seq;
        seq = ahb_default_seq::type_id::create("seq");
        seq.set_item_context(this, m_ahb_m2_agent.m_sequencer);
        if ( !seq.randomize() )
          `uvm_error(get_type_name(), "Failed to randomize sequence")
        seq.m_config = m_ahb_m2_agent.m_config;
        seq.set_starting_phase( get_starting_phase() );
        seq.start(m_ahb_m2_agent.m_sequencer, this);
      end
      if (m_ahb_m3_agent.m_config.is_active == UVM_ACTIVE)
      begin
        ahb_default_seq seq;
        seq = ahb_default_seq::type_id::create("seq");
        seq.set_item_context(this, m_ahb_m3_agent.m_sequencer);
        if ( !seq.randomize() )
          `uvm_error(get_type_name(), "Failed to randomize sequence")
        seq.m_config = m_ahb_m3_agent.m_config;
        seq.set_starting_phase( get_starting_phase() );
        seq.start(m_ahb_m3_agent.m_sequencer, this);
      end
      if (m_ahb_s0_agent.m_config.is_active == UVM_ACTIVE)
      begin
        ahb_default_seq seq;
        seq = ahb_default_seq::type_id::create("seq");
        seq.set_item_context(this, m_ahb_s0_agent.m_sequencer);
        if ( !seq.randomize() )
          `uvm_error(get_type_name(), "Failed to randomize sequence")
        seq.m_config = m_ahb_s0_agent.m_config;
        seq.set_starting_phase( get_starting_phase() );
        seq.start(m_ahb_s0_agent.m_sequencer, this);
      end
      if (m_ahb_s1_agent.m_config.is_active == UVM_ACTIVE)
      begin
        ahb_default_seq seq;
        seq = ahb_default_seq::type_id::create("seq");
        seq.set_item_context(this, m_ahb_s1_agent.m_sequencer);
        if ( !seq.randomize() )
          `uvm_error(get_type_name(), "Failed to randomize sequence")
        seq.m_config = m_ahb_s1_agent.m_config;
        seq.set_starting_phase( get_starting_phase() );
        seq.start(m_ahb_s1_agent.m_sequencer, this);
      end
      if (m_ahb_s2_agent.m_config.is_active == UVM_ACTIVE)
      begin
        ahb_default_seq seq;
        seq = ahb_default_seq::type_id::create("seq");
        seq.set_item_context(this, m_ahb_s2_agent.m_sequencer);
        if ( !seq.randomize() )
          `uvm_error(get_type_name(), "Failed to randomize sequence")
        seq.m_config = m_ahb_s2_agent.m_config;
        seq.set_starting_phase( get_starting_phase() );
        seq.start(m_ahb_s2_agent.m_sequencer, this);
      end
      if (m_ahb_s3_agent.m_config.is_active == UVM_ACTIVE)
      begin
        ahb_default_seq seq;
        seq = ahb_default_seq::type_id::create("seq");
        seq.set_item_context(this, m_ahb_s3_agent.m_sequencer);
        if ( !seq.randomize() )
          `uvm_error(get_type_name(), "Failed to randomize sequence")
        seq.m_config = m_ahb_s3_agent.m_config;
        seq.set_starting_phase( get_starting_phase() );
        seq.start(m_ahb_s3_agent.m_sequencer, this);
      end
    join
  end

  `uvm_info(get_type_name(), "Default sequence completed", UVM_HIGH)
endtask : body


task top_default_seq::pre_start();
  uvm_phase phase = get_starting_phase();
  if (phase != null)
    phase.raise_objection(this);
endtask: pre_start


task top_default_seq::post_start();
  uvm_phase phase = get_starting_phase();
  if (phase != null)
    phase.drop_objection(this);
endtask: post_start


`endif // TOP_SEQ_LIB_SV
