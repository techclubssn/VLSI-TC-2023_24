# Finite State Machines

Mealy_Sequence_Detector_1010.v is a sequence detector which detects the sequence 1010. 

![image](https://github.com/techclubssn/VLSI-TC-2023_24/assets/93860462/df4ad602-cd99-4deb-93d3-c272fe527190)

Note that the reg "next_state" used in Verilog is inferred only as a combinational circuit in the RTL, and not as a physical register. This means that, the way in which a Verilog construct gets inferred in RTL, purely depends on the way it is used in the code, and hence it demands the use of good coding practices.

Mealy error is a condition which results from the fact that the output of a Mealy machine depends not only on the state register, but also on the input, which can make it asynchronous with the clock used.

![image](https://github.com/techclubssn/VLSI-TC-2023_24/assets/93860462/c34bdd1a-db5d-4b43-9de0-52af5d576f24)

The above simulation of Mealy_Sequence_Detector_1010.v demonstrates the Mealy error, as the output changes asynchronously between the markers. Such an asynchronous change of output can be prevented by using Moore FSMs, where the outputs are combinational functions of just the state register.
