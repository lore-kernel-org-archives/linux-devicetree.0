From: Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 0/4] GPIO driver for Maxim MAX3191x
Date: Mon, 21 Aug 2017 15:12:00 +0200
Message-ID: <cover.1503319573.git.lukas@wunner.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mathias Duckeck <m.duckeck-XB/JSsFECOqzQB+pC5nmwQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Bart Van Assche <bart.vanassche-Sjgp3cTcYWE@public.gmane.org>, Alasdair Kergon <agk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mike Snitzer <snitzer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

GPIO driver for Maxim MAX31910, MAX31911, MAX31912, MAX31913,
MAX31953 and MAX31963 industrial serializer, a daisy-chainable
chip to make 8 digital 24V inputs available via SPI.  Supports
CRC checksums to guard against electromagnetic interference,
as well as undervoltage and overtemperature detection.

The chip is used by the "Revolution Pi" family of open source PLCs
based on the Raspberry Pi (https://revolution.kunbus.com/).

In a typical SCADA system, all input signals are read periodically,
say, every 5 or 10 ms, and stored in a so-called "process image".
To make this perform well with serializers, add a ->get_multiple
callback to struct gpio_chip, add corresponding consumer functions
and wire it up with linehandle_ioctl().

Thanks,

Lukas


Lukas Wunner (4):
  bitops: Introduce assign_bit()
  gpio: Introduce ->get_multiple callback
  dt-bindings: gpio: max3191x: Document new driver
  gpio: Add driver for Maxim MAX3191x industrial serializer

 .../devicetree/bindings/gpio/gpio-max3191x.txt     |  37 ++
 drivers/gpio/Kconfig                               |  10 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-max3191x.c                       | 482 +++++++++++++++++++++
 drivers/gpio/gpiolib.c                             | 181 +++++++-
 drivers/gpio/gpiolib.h                             |   4 +
 drivers/md/dm-mpath.c                              |   8 -
 include/linux/bitops.h                             |  24 +
 include/linux/gpio/consumer.h                      |  44 ++
 include/linux/gpio/driver.h                        |   5 +
 10 files changed, 777 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-max3191x.txt
 create mode 100644 drivers/gpio/gpio-max3191x.c

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
