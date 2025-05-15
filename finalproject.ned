
// Paula Herrera, Melody Cheung, and Tejal Dhiman

//OUR GOAL:
//We propose to simulate and analyze the performance of a bank teller system consisting of multiple service counters (tellers). 
//Each teller operates independently, serving customers who arrive randomly and queue for the next available teller. 
//This setup can be modeled as multiple M/M/1 queues in parallel, where each queue has a single server (teller)...
//...exponential interarrival times, and exponential service times.
// Our simulation will also allow us to explore scalability and optimization,
//...such as the impact of adding more tellers or modifying service rates. 
//We will also include a histogram(s) for further data analysis. 



//THREE PARALLEL M/M/1 QUEUES

import ned.IdealChannel;
import org.omnetpp.queueing.Queue;
import org.omnetpp.queueing.Source;
import org.omnetpp.queueing.Sink;

network Finalproject
{
    parameters:
        int numTellers = default(3); //setting the number of bank tellers
        @display("bgb=776,437");
    submodules:
        gen[numTellers]: Source {
            @display("p=106,194");
        }
        fifo[numTellers]: Queue {
            @display("p=351,194");
        }
        sink[numTellers]: Sink {

            @display("p=564,194");
        }
    connections allowunconnected:
        for i=0..numTellers-1 {
            gen[i].out --> fifo[i].in++;
            fifo[i].out --> sink[i].in++;
        }
}

