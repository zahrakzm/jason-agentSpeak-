// Agent math1 with Erdos number 1
!start.

+!start : true <- 
    .print("Math1 agent started with Erdos number 1"); 
    !initialize.

+!initialize : true <- 
    .print("Math1 initializing");
    !erdos_number(1).

+!erdos_number(N) : true <- 
    .print("Setting Erdos number to ", N).

+!kqml_received(facilitator, cfp, collaborate(Math), MsgID) : true <-
    .print("Math1 received CFP (collaborate) from facilitator to collaborate with ", Math);
    if (N < Math) {
        .print("Math1 accepting proposal to collaborate with ", Math);
        .send(facilitator, tell, respond_collaboration(self, yes, Math), MsgID);
        .print("Math1 sent respond_collaboration to facilitator for ", Math);
    } else {
        .print("Math1 rejecting proposal to collaborate with ", Math);
        .send(facilitator, tell, respond_collaboration(self, no, Math), MsgID);
        .print("Math1 sent respond_collaboration to facilitator for ", Math);
    }. // End of the if-else block
