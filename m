From: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Subject: [PATCH v4 0/5] gpio: driver for the RPi3 GPIO expander
Date: Wed,  7 Feb 2018 20:35:21 +0200
Message-ID: <cover.1517923836.git.baruch@tkos.co.il>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dave Stevenson <dave.stevenson-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Zoran <mzoran-O+n0w2l5AFbk1uMJSBkQmQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Raspberry Pi 3 has a GPIO expander that controls, among others, the 
activity LED, and the camera connector GPIOs. The GPIO expander on an I2C bus 
that is not directly controlled from the ARM core. The VC4 firmware controls 
the I2C bus, and allows the ARM core to set/get GPIO settings over its mailbox 
interface.

This series adds support for the RPi3 expander.

The driver is ported from the downstream kernel at 
https://github.com/raspberrypi/linux/, branch rpi-4.9.y.

This series is based on commit e237f98a9c.

Changes in v4:

  * Move the gpio expander node under the firmware node; this requires an
    addtional patch that makes the firmware node into a bus
  * Rename the gpio node to just 'gpio'
  * Drop the platform driver .owner set

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

Baruch Siach (4):
  ARM: bcm2835: sync firmware properties with downstream
  dt-bindings: gpio: add raspberry pi GPIO expander binding
  ARM: dts: bcm2835: make the firmware node into a bus
  ARM: dts: bcm2837-rpi-3-b: add GPIO expander

Dave Stevenson (1):
  gpio: raspberrypi-exp: Driver for RPi3 GPIO expander via mailbox
    service

 .../bindings/gpio/raspberrypi,firmware-gpio.txt    |  29 +++
 arch/arm/boot/dts/bcm2835-rpi.dtsi                 |   4 +-
 arch/arm/boot/dts/bcm2837-rpi-3-b.dts              |  18 ++
 drivers/gpio/Kconfig                               |   9 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-raspberrypi-exp.c                | 252 +++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-firmware.h         |  18 ++
 7 files changed, 330 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/raspberrypi,firmware-gpio.txt
 create mode 100644 drivers/gpio/gpio-raspberrypi-exp.c

-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
