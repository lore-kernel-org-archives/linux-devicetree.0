From: Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH v3 0/4] gpio: driver for the RPi3 GPIO expander
Date: Tue, 16 Jan 2018 14:45:06 +0200
Message-ID: <cover.1516105893.git.baruch@tkos.co.il>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Dave Stevenson <dave.stevenson@raspberrypi.org>, Eric Anholt <eric@anholt.net>, Stefan Wahren <stefan.wahren@i2se.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>, linux-gpio@vger.kernel.org, Michael Zoran <mzoran@crowfest.net>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

The Raspberry Pi 3 has a GPIO expander that controls, among others, the 
activity LED, and the camera connector GPIOs. The GPIO expander on an I2C bus 
that is not directly controlled from the ARM core. The VC4 firmware controls 
the I2C bus, and allows the ARM core to set/get GPIO settings over its mailbox 
interface.

This series adds support for the RPi3 expander.

The driver is ported from the downstream kernel at 
https://github.com/raspberrypi/linux/, branch rpi-4.9.y.

Changes in v3:

  * Kconfig tweaks
  * Check rpi_exp_gpio_get_polarity() return value
  * Redundant header removal
  * Redundant platform_set_drvdata() call removal
  * Small coding style changes

Changes in v2:

  * Driver renamed to gpio-raspberrypi-exp
  * Compatible string renamed to "raspberrypi,firmware-gpio"
  * Firmware error check
  * Smaller tweaks listed in individual patches

Baruch Siach (3):
  ARM: bcm2835: sync firmware properties with downstream
  dt-bindings: gpio: add raspberry pi GPIO expander binding
  ARM: dts: bcm2837-rpi-3-b: add GPIO expander

Dave Stevenson (1):
  gpio: raspberrypi-exp: Driver for RPi3 GPIO expander via mailbox
    service

 .../bindings/gpio/raspberrypi,firmware-gpio.txt    |  24 ++
 arch/arm/boot/dts/bcm2837-rpi-3-b.dts              |  16 ++
 drivers/gpio/Kconfig                               |   9 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-raspberrypi-exp.c                | 253 +++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-firmware.h         |  18 ++
 6 files changed, 321 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/raspberrypi,firmware-gpio.txt
 create mode 100644 drivers/gpio/gpio-raspberrypi-exp.c

-- 
2.15.1

