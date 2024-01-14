## Difference between Latch and Flip-flop

A latch is a sequential element in which the state changes with change in the level of its inputs (level triggered). The basic NOR S-R latch and the NAND S-R latch (The S’R’ latch or the active-low S-R latch) is a good way to understand the storing property of latches.

Negative D-Latch and Negative Edge Triggered D-Flip flop  are used for convenience in explanation and all the below mentioned points can be applied to all flip-flops and latches, such as S-R, J-K, T etc.,

### D-Latch

![image](https://github.com/techclubssn/VLSI-TC-2023_24/assets/93860462/9b5886f7-2faa-4ea1-a2e2-65606e64cfa9)
Image Courtesy: www.build-electronic-circuits.com

The above circuit is a Negative D-Latch which means that the output Q follows input D when Enable E is high, and when E goes low, the D value just before the event, is latched in Q, and once E goes back high, Q starts following D again.

D_Latch_Structural.v and D_Latch_Dataflow.v are the verilog implementations of Negative D-Flip flop in structural and dataflow modeling respectively. Both give the same results on simulating. The below image is the result of simulating D_Latch_Structural.v in Vivado. 

https://www.notion.so/Session-2-965484290a6044b9a5622bf3905fedbe?pvs=4#f04a29515a1d488da3417978fe450b4e

Note that, before the first marker, EN is high, and Q follows D, after the marker, EN is made low, and D is latched in Q, and during the period EN is low (before the second marker), any change in D is not reflected in Q. But once EN is made high again, Q starts following D.

### D-Flip flop

  

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/5b454901-597f-4fc7-ad88-5cdaccba61fa/159cc05a-9bf0-4ec6-9268-fb41c85e6bb7/Untitled.png)

Image courtesy: [en.m.wikipedia.org/wiki/File:Edge_triggered_D_flip_flop_with_set_and_reset.svg](https://en.m.wikipedia.org/wiki/File:Edge_triggered_D_flip_flop_with_set_and_reset.svg)

The image above is of a positive edge triggered D-Flip flop, which asynchronous SET and RESET inputs, which are active low. Asynchronous and active low mean that the inputs act independent of the clock and perform the action when they are low.

D_Flip_flop_posedge.v is a behavioral model of the same (except for some minor differences which lie out of the valid working region). The below image is a result of simulation of D_Flip_flop_posedge.v.

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/5b454901-597f-4fc7-ad88-5cdaccba61fa/a6b6c1e6-34d6-47ff-ae6b-f36de549d811/Untitled.png)

It can be observed that Q is being updated only on the positive edges of clk, which makes it a more reliable storage element, eliminating the possibilities of racing etc., The asynchronous SET and RST perform set or reset perform the action immediately and independent of the clock, as soon as it is applied.
