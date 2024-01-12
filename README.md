# CPA-Attack @ESISAR
## Introduction to Correlation Power Analysis
This laboratory involves hands-on experimentation by making use of Correlation Power Analysis (CPA) techniques on an Advanced Encryption Standard (AES) implementation coded in C, running on a STM32 ARM-based microcontroller. The main goal will be to study the AES algorithm and the STM32 – Nucleo Printed Circuit Board (PCB) and propose a measurement method. Then power traces will be captured with the use of an Oscilloscope. The attack will be completed by performing CPA on the captured traces.

- Task 1: Preparing the NUCLEO board for a CPA attack
- Task 2: Focusing the attack based on the maximum leakage
- Task 3: Explaination of the interface of the AES with the computer
- Task 4: Performing attack through Matlab script
- Task 5: Pearson Correlation Coefficient Algorithm
- Task 6: Countermeasures

## Task 2
To trigger the oscilloscope we have used these 2 HAL library commands and we placed them in a for loop for the round choose this because here we will record the power consumption of the first round of the aes encryption thus we also get the power consumption for each round during add round key.
![image](https://github.com/Ahsan728/CPA-Attack/assets/34878134/890f9927-ff2c-4a5a-a5f1-9f326731a32a)

