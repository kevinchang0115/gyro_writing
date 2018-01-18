# Gyro writing
A gyro writing device designed for arm-injured patients, which allows them to write letters and numbers without moving arms but by rotating wrist joints.

## Introduction
### Language
Arduino

Matlab

### Platform
Arduino 1.6.x

Matlab R2015

### Hardwares
Developer board: Arduino UNO

Gyrometer: MPU-6050 (can also serve as an accelerometer)

## Instructions
1. Connect UNO to a computer.

2. Connect MPU-6050 "VCC" pin to UNO power supply (3.3V)

3. Connect MPU-6050 "SCL", "SDA" pins to UNO analog inputs.

4. Run "MPU6050_DMP6.ino" in Arduino IDE and start gyro writing.

5. Use Putty to capture data received from UNO and save the log file.

6. Run "plot.m" in MATLAB to process the log file and output the gyro-writing images.

## Examples
### 2
![number_2](https://github.com/kevinchang0115/gyro_writing/blob/master/examples/2.jpg)
### triangle
![shape_triangle](https://github.com/kevinchang0115/gyro_writing/blob/master/examples/tri.jpg)

## Demo
see: https://youtu.be/EFmA4S8Q_wQ
