# Teclado Prototipo

## Lista de teclados en que basarse

Teclados del firmware de QMK que tiene información que puede ayudar al proyecto.

* (61Key)[https://github.com/qmk/qmk_firmware/tree/master/keyboards/0xc7/61key]
  * (/rules.mk)[https://github.com/qmk/qmk_firmware/blob/master/keyboards/0xc7/61key/rules.mk]
    En este archivo especifica el ```MCU = atmega32u4```  y el ```BOOTLOADER = atmel-dfu```.
  * (/config.h)[https://github.com/qmk/qmk_firmware/blob/master/keyboards/0xc7/61key/config.h]
    Especifica la dirección de los diodos
    ```C++
    /* COL2ROW, ROW2COL */
    #define DIODE_DIRECTION COL2ROW
    ```
* ()
