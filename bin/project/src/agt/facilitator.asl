// Facilitator agent

!start.

+!start : true <- 
    .print("Facilitator agent started"); 
    .print("facilitator.asl file is loaded and agent is starting");
    !initialize.

+!initialize : true <- 
    .print("Facilitator initialized");
    !wait_for_agents.

+!wait_for_agents : true <-
    .wait(5000); // wait for 5 seconds to ensure all agents are ready
    .print("All agents should be ready now");
    !start_collaboration.

+!request_collaboration[math1, math2,math3,math4, math5] : true <-
    .print("Requesting collaboration between ", math1, " and ", math2);
    .send(math1, cfp, collaborate(math2));
    .print("Sent CFP to ", math1);
    .send(math2, cfp, collaborate(math1));
    .print("Sent CFP to ", math2);
    .send(math1, cfp, collaborate(math5));
    .print("Sent CFP to ", math1);
    .send(math2, cfp, collaborate(math3));
    .print("Sent CFP to ", math2);
    .send(math4, cfp, collaborate(math2));
    .print("Sent CFP to ", math4).

+respond_collaboration[Math, yes, Collaborator] : true <-
    .print("Received acceptance from ", Math);
    .send(Collaborator, accept_proposal, collaborate(Math));
    .print("Sent accept_proposal to ", Collaborator);
    .send(env, tell, update_erdos(Math, Collaborator));
    .print("Requested update_erdos from Env for ", Math, " and ", Collaborator).

+respond_collaboration[Math, no, Collaborator] : true <-
    .print("Received rejection from ", Math);
    .send(Collaborator, reject_proposal, collaborate(Math));
    .print("Sent reject_proposal to ", Collaborator).

+!start_collaboration : true <- 
    .print("Starting collaboration test"); 
    !request_collaboration[math1, math2, math3, math4,math5].
