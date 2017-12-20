From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/2] eeprom: at24: write-protect pin support
Date: Wed, 20 Dec 2017 09:26:31 +0100
Message-ID: <20171220082633.32237-1-brgl@bgdev.pl>
Return-path: <linux-i2c-owner@vger.kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Peter Rosin <peda@axentia.se>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: devicetree@vger.kernel.org

AT24 EEPROMs have a write-protect pin, which - when pulled high -
inhibits writes to the upper quadrant of memory (although it has been
observed that on some chips it disables writing to the entire memory
range).

On some boards, this pin is connected to a GPIO and pulled high by
default, which forces the user to manually change its state before
writing. On linux this means that we either need to hog the line all
the time, or set the GPIO value before writing from outside of the
at24 driver.

This series adds support for the write-protect pin split into two
parts. The first patch extends the relevant binding document, while
the second modifies the at24 code to pull the write-protect GPIO
low (if present) during write operations.

v1 -> v2:
- renamed the DT property to wp-gpios

Bartosz Golaszewski (2):
  dt-bindings: at24: new optional property - wp-gpios
  eeprom: at24: add support for the write-protect pin

 Documentation/devicetree/bindings/eeprom/at24.txt |  3 +++
 drivers/misc/eeprom/at24.c                        | 11 +++++++++++
 2 files changed, 14 insertions(+)

-- 
2.15.1
