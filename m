From: Lukas Wunner <lukas@wunner.de>
Subject: [PATCH v2 0/5] GPIO driver for Maxim MAX3191x
Date: Thu, 12 Oct 2017 12:40:10 +0200
Message-ID: <cover.1507797496.git.lukas@wunner.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mathias Duckeck <m.duckeck@kunbus.de>, Phil Elwell <phil@raspberrypi.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jonathan Cameron <jic23@kernel.org>, Rojhalat Ibrahim <imr@rtschenk.de>, Bart Van Assche <bart.vanassche@wdc.com>, Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Neil Brown <neilb@suse.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Theodore Ts'o <tytso@mit.edu>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Denys Vlasenko <dvlasenk@redhat.com>, linux-kernel@vger.kernel.org
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

Changes v1 -> v2:

- Patch [1/5]: Change the argument order of assign_bit() to reflect
  traditional "dst = src" in C. (Peter Zijlstra)

- Patch [2/5]: Update documentation. (Linus Walleij)
  Drop const qualifier from struct gpio_desc ** in all function
  signatures to avoid a cast when passing a non-const array created
  with gpiod_get_array(), which is likely the most common use case.

- Patch [3/5]: Newly inserted patch to introduce common property for
  number of daisy-chained devices.

- Patch [4/5]: Add vendor prefix to GPIO identifiers, use boolean
  instead of integer to select mode, rename boolean to ignore
  undervoltage alarms, separate compatible strings with newlines.
  (Rob Herring)

- Patch [5/5]: Optimize algorithm in max3191x_get_multiple() to
  iterate over the bits in the mask, instead of iterating over every
  chip, thus implicitly skipping chips which are not selected at all
  by the mask.
  Support configurations where all chips in a daisy-chain share the
  same modesel, fault or debounce pin.
  Verify that the number of db0 and db1 GPIOs specified in the DT is
  identical.

Link to v1:

https://www.spinics.net/lists/linux-gpio/msg25067.html

Thanks,

Lukas


Lukas Wunner (5):
  bitops: Introduce assign_bit()
  gpio: Introduce ->get_multiple callback
  dt-bindings: Document common property for daisy-chained devices
  dt-bindings: gpio: max3191x: Document new driver
  gpio: Add driver for Maxim MAX3191x industrial serializer

 .../devicetree/bindings/common-properties.txt      |  26 ++
 .../devicetree/bindings/gpio/gpio-max3191x.txt     |  59 +++
 Documentation/gpio/consumer.txt                    |  41 +-
 drivers/gpio/Kconfig                               |  10 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-max3191x.c                       | 492 +++++++++++++++++++++
 drivers/gpio/gpiolib.c                             | 179 +++++++-
 drivers/gpio/gpiolib.h                             |   4 +
 drivers/md/dm-mpath.c                              |  22 +-
 include/linux/bitops.h                             |  24 +
 include/linux/gpio/consumer.h                      |  43 ++
 include/linux/gpio/driver.h                        |   5 +
 12 files changed, 869 insertions(+), 37 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-max3191x.txt
 create mode 100644 drivers/gpio/gpio-max3191x.c

-- 
2.11.0
