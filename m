From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: [PATCH v2 0/2] GPIO: add single-register GPIO via CREG driver
Date: Tue, 28 Aug 2018 14:27:19 +0300
Message-ID: <20180828112721.28178-1-Eugeniy.Paltsev@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-snps-arc@lists.infradead.org, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
List-Id: devicetree@vger.kernel.org

Add single-register MMIO GPIO driver for complex cases where
only several fields in register belong to GPIO lines and each GPIO line
owns a field with different length and on/off value.

Here is the example:

31            11        8         7        5         0   < bit number
|              |        |         |        |         |
[   not used   | gpio-1 | shift-1 | gpio-0 | shift-0 ]   < 32 bit MMIO
                   ^                  ^                     register
                (3 bit)            (2 bit)
                   |                  |
                   |                  |
                   |           write 0x2 == set output to "1" (on)
                   |           write 0x3 == set output to "0" (off)
                   |
            write 0x1 == set output to "1" (on)
            write 0x4 == set output to "0" (off)

This is different from gpio-reg, gpio-mmio and gpio-74xx-mmio:
* They all don't support cases when GPIO output register have
  more than one bit per GPIO line.
* They don't support holes in MMIO register.
* They don't support cases when GPIO lines have different on/off
  values.

This driver supports GPIOs via CREG on various Synopsys SoCs/boards.

Eugeniy Paltsev (2):
  GPIO: add single-register GPIO via CREG driver
  dt-bindings: Document the Synopsys GPIO via CREG bindings

 .../devicetree/bindings/gpio/snps,creg-gpio.txt    |  49 +++++
 MAINTAINERS                                        |   6 +
 drivers/gpio/Kconfig                               |   9 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-creg-snps.c                      | 242 +++++++++++++++++++++
 5 files changed, 307 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/snps,creg-gpio.txt
 create mode 100644 drivers/gpio/gpio-creg-snps.c

-- 
2.14.4
