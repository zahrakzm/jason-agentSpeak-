// Agent math3 with Erdos number 3
!start.

+!start : true <- 
    .print("Math3 agent started with Erdos number 3"); 
    !initialize.

+!initialize : true <- 
    .print("Math3 initializing");
    !erdos_number(3).

+!erdos_number(N) : true <- 
    .print("Setting Erdos number to ", N).

+!kqml_received(facilitator, cfp, collaborate(Math), MsgID) : true <-
    .print("Math3 received CFP (collaborate) from facilitator to collaborate with ", Math);
    if (N < Math) {
        .print("Math3 accepting proposal to collaborate with ", Math);
        .send(facilitator, tell, respond_collaboration(self, yes, Math), MsgID);
        .print("Math3 sent respond_collaboration to facilitator for ", Math);
    } else {
        .print("Math3 rejecting proposal to collaborate with ", Math);
        .send(facilitator, tell, respond_collaboration(self, no, Math), MsgID);
        .print("Math3 sent respond_collaboration to facilitator for ", Math);
    }. // End of the if-else block
