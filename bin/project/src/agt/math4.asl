// Agent math4 with Erdos number 4
!start.

+!start : true <- 
    .print("Math4 agent started with Erdos number 4"); 
    !initialize.

+!initialize : true <- 
    .print("Math4 initializing");
    !erdos_number(4).

+!erdos_number(N) : true <- 
    .print("Setting Erdos number to ", N).

+!kqml_received(facilitator, cfp, collaborate(Math), MsgID) : true <-
    .print("Math4 received CFP (collaborate) from facilitator to collaborate with ", Math);
    if (N < Math) {
        .print("Math4 accepting proposal to collaborate with ", Math);
        .send(facilitator, tell, respond_collaboration(self, yes, Math), MsgID);
        .print("Math4 sent respond_collaboration to facilitator for ", Math);
    } else {
        .print("Math4 rejecting proposal to collaborate with ", Math);
        .send(facilitator, tell, respond_collaboration(self, no, Math), MsgID);
        .print("Math4 sent respond_collaboration to facilitator for ", Math);
    }. // End of the if-else block
