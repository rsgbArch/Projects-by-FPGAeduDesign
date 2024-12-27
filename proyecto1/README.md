# Diseño lógido para el sensor ultrasónico HC-SR04 en una FPGA
Para poder manipular el sensor HC-SR04, se tiene que conocer el funcionamiento de este. Quien te proporciona esto es la empresa que fabrica dicho sensor (ver [aquí](https://cdn.sparkfun.com/datasheets/Sensors/Proximity/HCSR04.pdf). El diagrama de tiempos muestra las señales tanto para le pin de entrada (Trig) y de salida (Echo). Así como también la señal interna que se genera para el zumbador (la señal cuadrada de 8 pulsos a 40 KHz).
<p align="center">
  <img src="timing_diagram.png" alt="timing_diagram" width="400"/><br>
  Diagram de tiempos del sensor HC-SR04
</p>


Para este proyecto, se hizo el diseño con un enfoque estructual como se muestra el la siguiente Figura. 
<p align="center">
  <img src="block_diagram_hcsr04.png" alt="Block Diagram" width="400"/> <br>
  Diagrama esquemático para el controlador HC-SR04
</p>
Este consta simplemente de tres bloques que tienen las siguientes funcionalidades:

1. sdf
2. sd
3. sdf
