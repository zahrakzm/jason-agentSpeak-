// Agent math2 with Erdos number 2
!start.

+!start : true <- 
    .print("Math2 agent started with Erdos number 2"); 
    !initialize.

+!initialize : true <- 
    .print("Math2 initializing");
    !erdos_number(2).

+!erdos_number(N) : true <- 
    .print("Setting Erdos number to ", N).

+!kqml_received(facilitator, cfp, collaborate(Math), MsgID) : true <-
    .print("Math2 received CFP (collaborate) from facilitator to collaborate with ", Math);
    if (N < Math) {
        .print("Math2 accepting proposal to collaborate with ", Math);
        .send(facilitator, tell, respond_collaboration(self, yes, Math), MsgID);
        .print("Math2 sent respond_collaboration to facilitator for ", Math);
    } else {
        .print("Math2 rejecting proposal to collaborate with ", Math);
        .send(facilitator, tell, respond_collaboration(self, no, Math), MsgID);
        .print("Math2 sent respond_collaboration to facilitator for ", Math);
    }. // End of the if-else block
