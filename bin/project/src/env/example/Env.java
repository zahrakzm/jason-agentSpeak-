package example;

import jason.asSyntax.*;
import jason.environment.*;

import java.util.logging.*;

public class Env extends Environment {

    private Logger logger = Logger.getLogger("example.mas2j."+Env.class.getName());

    // Initial Erdos numbers for mathematicians
    private int[] erdosNumbers = {1, 2, 3, 4, 5};

    @Override
    public void init(String[] args) {
        super.init(args);
        logger.info("Environment initialized");
    }

    @Override
    public boolean executeAction(String agName, Structure action) {
        logger.info("executeAction called with agent: " + agName + " and action: " + action);
        
        if (action.getFunctor().equals("erdos_number")) {
            logger.info("Handling erdos_number action for agent: " + agName);
            int id = Integer.parseInt(agName.substring(4)) - 1;
            int erdosNumber = erdosNumbers[id];
            Literal response = Literal.parseLiteral("erdos_number(" + erdosNumber + ")");
            addPercept(agName, response);
            logger.info("Sent erdos_number percept to " + agName);
            return true;
        } else if (action.getFunctor().equals("update_erdos")) {
            logger.info("Handling update_erdos action");
            int id1 = Integer.parseInt(action.getTerm(0).toString().substring(4)) - 1;
            int id2 = Integer.parseInt(action.getTerm(1).toString().substring(4)) - 1;
            int newErdosNumber = Math.min(erdosNumbers[id1], erdosNumbers[id2]) + 1;
            erdosNumbers[id2] = newErdosNumber;
            logger.info("Updating Erdos number for " + action.getTerm(0) + " and " + action.getTerm(1));
            logger.info("New Erdos number for " + action.getTerm(1) + ": " + newErdosNumber);
            addPercept(action.getTerm(1).toString(), Literal.parseLiteral("update_erdos_finished"));
            return true;
        } else if (action.getFunctor().equals("get_erdos_number")) {
            logger.info("Handling get_erdos_number action for agent: " + agName);
            int id = Integer.parseInt(agName.substring(4)) - 1;
            int erdosNumber = erdosNumbers[id];
            Literal response = Literal.parseLiteral("response_erdos_number(" + erdosNumber + ")");
            addPercept(agName, response);
            logger.info("Sent response_erdos_number percept to " + agName);
            return true;
        } else {
            logger.info("Unknown action: " + action);
        }
        return false;
    }
}

