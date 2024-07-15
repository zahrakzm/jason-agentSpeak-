// Agent math5 with Erdos number 5
!start.

+!start : true <- 
    .print("Math5 agent started with Erdos number 5"); 
    !initialize.

+!initialize : true <- 
    .print("Math5 initializing");
    !erdos_number(5).

+!erdos_number(N) : true <- 
    .print("Setting Erdos number to ", N).

+!kqml_received(facilitator, cfp, collaborate(Math), MsgID) : true <-
    .print("Math5 received CFP (collaborate) from facilitator to collaborate with ", Math);
    if (N < Math) {
        .print("Math5 accepting proposal to collaborate with ", Math);
        .send(facilitator, tell, respond_collaboration(self, yes, Math), MsgID);
        .print("Math5 sent respond_collaboration to facilitator for ", Math);
    } else {
        .print("Math5 rejecting proposal to collaborate with ", Math);
        .send(facilitator, tell, respond_collaboration(self, no, Math), MsgID);
        .print("Math5 sent respond_collaboration to facilitator for ", Math);
    }. // End of the if-else block
