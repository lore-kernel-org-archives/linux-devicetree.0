From: "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH v3 0/6] Add support for the TI TPS65086 PMIC
Date: Wed, 4 Nov 2015 11:12:09 -0600
Message-ID: <1446657135-7820-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>
List-Id: devicetree@vger.kernel.org

This series adds support for the TPS65086 PMIC. It is a MFD with an I2C
interface, several regulators and load switches, and a GPO controller.

Based on v4.3-rc1 and needs b4fe8ba ("regmap: Add generic macro to define regmap_irq")
from Lee Jones' tree to build.

v1 can be found here: [1] v2: [2]

Changes from v2:
 - Use DT match callback in regulator
 - Typo fixes

Changes from v1:
 - Split up DT Docs into separate patches
 - Use mfd core to instantiate sub-devices
 - Several small fixes as discussed in v1 thread

[1] http://www.spinics.net/lists/devicetree/msg98403.html
[2] http://www.spinics.net/lists/kernel/msg2111345.html

Andrew F. Davis (6):
  Documentation: tps65086: Add DT bindings for the TPS65086 PMIC
  Documentation: tps65086: Add DT bindings for the TPS65086 regulators
  Documentation: tps65086: Add DT bindings for the TPS65086 GPO
    controller
  mfd: tps65086: Add driver for the TPS65086 PMIC
  regulator: tps65086: Add regulator driver for the TPS65086 PMIC
  gpio: tps65086: Add GPIO driver for the TPS65086 PMIC

 .../devicetree/bindings/gpio/gpio-tps65086.txt     |  16 ++
 Documentation/devicetree/bindings/mfd/tps65086.txt |  46 ++++
 .../bindings/regulator/tps65086-regulator.txt      |  35 +++
 drivers/gpio/Kconfig                               |   6 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-tps65086.c                       | 115 ++++++++++
 drivers/mfd/Kconfig                                |  14 ++
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/tps65086.c                             | 157 +++++++++++++
 drivers/regulator/Kconfig                          |   7 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/tps65086-regulator.c             | 250 +++++++++++++++++++++
 include/linux/mfd/tps65086.h                       | 120 ++++++++++
 13 files changed, 769 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-tps65086.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/tps65086.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/tps65086-regulator.txt
 create mode 100644 drivers/gpio/gpio-tps65086.c
 create mode 100644 drivers/mfd/tps65086.c
 create mode 100644 drivers/regulator/tps65086-regulator.c
 create mode 100644 include/linux/mfd/tps65086.h

-- 
1.9.1
