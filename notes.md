# Teclado Prototipo


## Documentación general

* [QMK Keyboard Guidelines](https://github.com/qmk/qmk_firmware/blob/master/docs/hardware_keyboard_guidelines.md)
  * Como hacer los directorios.
  * Como nombrar los teclados.
  * la estructura del directorio.
* [How to Customize Your Keyboard's Behavior](https://github.com/qmk/qmk_firmware/blob/master/docs/custom_quantum_functions.md)
  * Custom Keycodes
  * Keyboard Initialization Code
  *

## Lista de teclados en que basarse

Teclados del firmware de QMK que tiene información que puede ayudar al proyecto.


* [61Key](https://github.com/qmk/qmk_firmware/tree/master/keyboards/0xc7/61key)
  * []/rules.mk](https://github.com/qmk/qmk_firmware/blob/master/keyboards/0xc7/61key/rules.mk)
    En este archivo especifica el ```MCU = atmega32u4```  y el ```BOOTLOADER = atmel-dfu```.
  * [/config.h](https://github.com/qmk/qmk_firmware/blob/master/keyboards/0xc7/61key/config.h)
    Especifica la dirección de los diodos
    ```C++
    /* COL2ROW, ROW2COL */
    #define DIODE_DIRECTION COL2ROW
    ```
* [Cassette42](https://github.com/qmk/qmk_firmware/tree/master/keyboards/25keys/cassette42)
  Dos encoders.
* [https://github.com/qmk/qmk_firmware/tree/master/keyboards/handwired/daskeyboard](https://github.com/qmk/qmk_firmware/tree/master/keyboards/handwired/daskeyboard/daskeyboard4)
   * Teclado de tamaño completo con encoder.
   * Además usa microcontrolador  [WeAct Black Pill V3.0](https://stm32-base.org/boards/STM32F401CEU6-WeAct-Black-Pill-V3.0.html)
   * Tiene un ```make``` muy anidado:

     ```
     make handwired/daskeyboard/daskeyboard4:default
     ```

### Teclados con encoder interesantes

* [ANAVI Knob 1](https://github.com/qmk/qmk_firmware/tree/master/keyboards/anavi/knob1)
  Solo tiene el encoder y no más.
* [handwired/snatchpad/snatchpad.c](https://github.com/qmk/qmk_firmware/blob/master/keyboards/handwired/snatchpad/snatchpad.c)
  Un ejemplo de dos encoders y layers.
  * [keeb_files/snatchpad/](https://github.com/xia0/keeb_files/tree/main/snatchpad)
    La parte hardware de la anterior. Está cableado a mano y con buenas explicaciones.
* [keebio/bdn9/rev2/rev2.c](https://github.com/qmk/qmk_firmware/blob/master/keyboards/keebio/bdn9/rev2/rev2.c)
  Ejemplo de tres encorders en un macropad pequeño.
* [nightly_boards/n40_o](https://github.com/qmk/qmk_firmware/tree/master/keyboards/nightly_boards/n40_o)
   * Un teclado con tres enoders.
   * Un código en el que se ganeraliza el numero de encoders [encoder_action.c](https://github.com/qmk/qmk_firmware/blob/master/keyboards/nightly_boards/n40_o/encoder_action.c)
* [nullbitsco/tidbit/tidbit.c](https://github.com/qmk/qmk_firmware/blob/master/keyboards/nullbitsco/tidbit/tidbit.c)
  Tiene un manejo que perece ser una matriz de encoders.
* [kabedon/kabedon98e/kabedon98e.c](https://github.com/qmk/qmk_firmware/blob/master/keyboards/kabedon/kabedon98e/kabedon98e.c)
  * Teclado con dos encoders.
  * Tiene las dos funciones de registro y unregistro de encoders:
    1. ```encoder_action_unregister```
    1. ```encoder_action_register```


## Joystick

Es la forma QMK de manejar los joystick analogicos (los basados en potenciometros).

Ene el ```rules.mk```:

```
JOYSTICK_ENABLE = yes
```

### Documentación de QMK Joystick

* [Joystick](https://github.com/qmk/qmk_firmware/blob/master/docs/feature_joystick.md)
  * [Virtual Axes](https://github.com/qmk/qmk_firmware/blob/master/docs/feature_joystick.md#virtual-axes-idvirtual-axes)
    * Eje virtuales de un joystick que pueden ser emulados con:
      1. Teclas.
      1. Algún *Pointing Device* como el [GlidePoint® Circle Trackpads](https://www.cirque.com/glidepoint-circle-trackpads).

### Ejemplos de QMK Joystick con eje virtual

* [Gamepad Synth Labs Solo Layout](https://github.com/qmk/qmk_firmware/tree/master/keyboards/synthlabs/solo/keymaps/gamepad)
  Un "teclado"que es solamente un encoder y emula con él un eje del joystick.

## Pointing Device

Es la forma de manejar QMK dispositivos de apuntado, como los mouse, Analog
Joystick o Cirque Trackpad;

* [Pointing Device :id=pointing-device](https://github.com/qmk/qmk_firmware/blob/master/docs/feature_pointing_device.md)
  * [Analog Joystick](https://github.com/qmk/qmk_firmware/blob/master/docs/feature_pointing_device.md#analog-joystick)
  * [Cirque Trackpad](https://github.com/qmk/qmk_firmware/blob/master/docs/feature_pointing_device.md#cirque-trackpad)

Nota importante:

> Escribiendo la función ```pointing_device_task_kb(mouse_report)```
> o la función ```pointing_device_task_user(mouse_report)``` de
> [Callbacks and Functions](https://github.com/qmk/qmk_firmware/blob/master/docs/feature_pointing_device.md#callbacks-and-functions)
> se procesa el *joysitck análogo' o el *Cirque Glidepoint Trackpad*
> pero no se hacen acciones de mouse sino que acciones de joystick
> virtual [Virtual Axes](https://github.com/qmk/qmk_firmware/blob/master/docs/feature_joystick.md#virtual-axes-idvirtual-axes) y se
> retorna el mismo ```mouse_report```de la entrada sin modificar.

### Joystick análogo

Un joystick común y corriente. También sirve para controlar los sliders.

#### Documentación Joystick análogo

* [QMK: Pinting Device: Analog Joystick](https://github.com/qmk/qmk_firmware/blob/master/docs/feature_pointing_device.md#analog-joystick)

### *Cirque Glidepoint Trackpad*

El trackpad que usa el Steamcontroller.

* Funciona por SPI.
* Hay código tanto para Arduino como para Teensy.

#### Ejemplos de uso de *Cirque Glidepoint Trackpad*

* [mechwild/puckbuddy](https://github.com/qmk/qmk_firmware/tree/master/keyboards/mechwild/puckbuddy)
  Teclado que usa trackpad.

#### El *GlidePoint® Circle Trackpads* documentación y venta.

* [GlidePoint® Circle Trackpads](https://www.cirque.com/glidepoint-circle-trackpads)
  * [Circle Trackpad Development Kit](https://www.cirque.com/circle-trackpad-dev-kit)
    * [Circle Trackpad Dev Kit Assembly (Arduino Based)](https://www.youtube.com/watch?v=v1yNGt9UvIM)
    * [Circle Trackpad Setup and Demo (Arduino Based)](https://www.youtube.com/watch?v=kUDN9xXJZjA)

## Código a tener en cuenta

### ```encoder_update_kb```

Una callback para procesar los encoders, parece ser opcional. Referencias:

* [qmk doscs: Encoders ](https://qmk.github.io/qmk_mkdocs/master/en/feature_encoders/#callbacks)
* [anavi/knob1/knob1.c](https://github.com/qmk/qmk_firmware/blob/master/keyboards/anavi/knob1/knob1.c)
  Un ejemplo sencillo que solo funciona con un encoder.


### Función ```encoder_update_user```

Una callback para procesar los encoders, parece ser opcional. Referencias:

* [qmk doscs: Encoders](https://qmk.github.io/qmk_mkdocs/master/en/feature_encoders/#callbacks)

### Función ```encoder_action_register```

* [kabedon/kabedon98e/kabedon98e.c](https://github.com/qmk/qmk_firmware/blob/master/keyboards/kabedon/kabedon98e/kabedon98e.c)
  Ejemplo de register y unregister.

### Función ```encoder_action_unregister```

* [kabedon/kabedon98e/kabedon98e.c](https://github.com/qmk/qmk_firmware/blob/master/keyboards/kabedon/kabedon98e/kabedon98e.c)
  Ejemplo de register y unregister.

Parece ser una función que se pone para reiniciar contadores de encoders. Ver un
ejemplo en [atlantis/encoder_actions.c](https://github.com/qmk/qmk_firmware/blob/master/keyboards/atlantis/encoder_actions.c)

## Búsquedad de ejemplos de teclados en qmk_firmware

### Teclados con encoder activado

```
egrep -R '$[ \t]*ENCODER_ENABLE[ \t]' ~/qmk_firmware/keyboards/* | grep rules.mk > tecladosConEncoders.md
```

En atom:

Find: ```/home/aztlek/qmk_firmware/keyboards/(.*)/rules.mk:[ \t]*ENCODER_ENABLE[ \t]*=[ \t]*yes```

Replase: ```1. [$1](https://github.com/qmk/qmk_firmware/tree/master/keyboards/$1)```


```
markdown tecladosConEncoders.md > tecladosConEncoders.html
```

### Teclados con ejes de joystick virtuales

```
egrep -R 'JOYSTICK_AXIS_VIRTUAL' ~/qmk_firmware/keyboards/*  > tecladosConJoystickVirtual.md
```

En Atom, ```ctrl+f```:

Find: ```/home/aztlek/qmk_firmware/keyboards/(.*)/(.*\.[ch])```
Replace: ```1. [$1/$2](https://github.com/qmk/qmk_firmware/tree/master/keyboards/$1/$2)```


### Teclados con Cirque Glidepoint Trackpad

```
egrep -R '[ \t]*POINTING_DEVICE_DRIVER[ \t]*=[ \t]*cirque_pinnacle' ~/qmk_firmware/keyboards/* | grep rules.mk > tecladosConCirqueGlidepointTrackpad.md
```

En atom:

Find: ```/home/aztlek/qmk_firmware/keyboards/(.*)/rules.mk:[ \t]*POINTING_DEVICE_DRIVER[ \t]*=[ \t]*cirque_pinnacle.*```

Replase: ```1. [$1](https://github.com/qmk/qmk_firmware/tree/master/keyboards/$1)```


### Teclados con la función ```encoder_update```
