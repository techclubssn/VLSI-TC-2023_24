# Difference between Latch and Flip-flop

A latch is a sequential element in which the state changes with change in the level of its inputs (level triggered). The basic NOR S-R latch and the NAND S-R latch (The S’R’ latch or the active-low S-R latch) is a good way to understand the storing property of latches.

Negative D-Latch and Negative Edge Triggered D-Flip flop  are used for convenience in explanation and all the below mentioned points can be applied to all flip-flops and latches, such as S-R, J-K, T etc.,

## D-Latch

![image](https://github.com/techclubssn/VLSI-TC-2023_24/assets/93860462/9b5886f7-2faa-4ea1-a2e2-65606e64cfa9)

Image Courtesy: www.build-electronic-circuits.com

The above circuit is a Negative D-Latch which means that the output Q follows input D when Enable E is high, and when E goes low, the D value just before the event, is latched in Q, and once E goes back high, Q starts following D again.

D_Latch_Structural.v and D_Latch_Dataflow.v are the verilog implementations of Negative D-Flip flop in structural and dataflow modeling respectively. Both give the same results on simulating. The below image is the result of simulating D_Latch_Structural.v in Vivado. 

![image](https://github.com/techclubssn/VLSI-TC-2023_24/assets/93860462/8409ed58-8938-4506-a80a-d6b992e135c1)


Note that, before the first marker, EN is high, and Q follows D, after the marker, EN is made low, and D is latched in Q, and during the period EN is low (before the second marker), any change in D is not reflected in Q. But once EN is made high again, Q starts following D.

## D-Flip flop

  

![image](https://github.com/techclubssn/VLSI-TC-2023_24/assets/93860462/26c61af1-da5d-46f8-8b28-01ad47107b1b)


Image courtesy: [en.m.wikipedia.org/wiki/File:Edge_triggered_D_flip_flop_with_set_and_reset.svg](https://en.m.wikipedia.org/wiki/File:Edge_triggered_D_flip_flop_with_set_and_reset.svg)

The image above is of a positive edge triggered D-Flip flop, which asynchronous SET and RESET inputs, which are active low. Asynchronous and active low mean that the inputs act independent of the clock and perform the action when they are low.

D_Flip_flop_posedge.v is a behavioral model of the same (except for some minor differences which lie out of the valid working region). The below image is a result of simulation of D_Flip_flop_posedge.v.

![image](https://github.com/techclubssn/VLSI-TC-2023_24/assets/93860462/ac5defa9-e63d-43d4-86bd-effcfca79eb5)


It can be observed that Q is being updated only on the positive edges of clk, which makes it a more reliable storage element, eliminating the possibilities of racing etc., The asynchronous SET and RST perform set or reset perform the action immediately and independent of the clock, as soon as it is applied.
