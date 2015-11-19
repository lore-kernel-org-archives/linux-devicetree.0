From: "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH v4 0/4] Add support for the TI TPS65086 PMIC
Date: Thu, 19 Nov 2015 17:01:38 -0600
Message-ID: <1447974102-24938-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>
List-Id: devicetree@vger.kernel.org

This series adds support for the TPS65086 PMIC. It is a MFD with an I2C
interface, several regulators and load switches, and a GPO controller.

v1 can be found here: [1] v2: [2] v3: [3]

Changes from v3:
 - Removed compatible strings from DT sub-nodes
 - Rearranged DT bindings
 - Small fixes

Changes from v2:
 - Use DT match callback in regulator
 - Typo fixes

Changes from v1:
 - Split up DT Docs into separate patches
 - Use mfd core to instantiate sub-devices
 - Several small fixes as discussed in v1 thread

[1] http://www.spinics.net/lists/devicetree/msg98403.html
[2] http://www.spinics.net/lists/kernel/msg2111345.html
[3] https://lkml.org/lkml/2015/11/4/393

Andrew F. Davis (4):
  Documentation: tps65086: Add DT bindings for the TPS65086 PMIC
  mfd: tps65086: Add driver for the TPS65086 PMIC
  regulator: tps65086: Add regulator driver for the TPS65086 PMIC
  gpio: tps65086: Add GPO driver for the TPS65086 PMIC

 Documentation/devicetree/bindings/mfd/tps65086.txt |  55 +++++
 drivers/gpio/Kconfig                               |   6 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-tps65086.c                       | 144 ++++++++++++
 drivers/mfd/Kconfig                                |  13 ++
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/tps65086.c                             | 150 ++++++++++++
 drivers/regulator/Kconfig                          |   7 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/tps65086-regulator.c             | 251 +++++++++++++++++++++
 include/linux/mfd/tps65086.h                       | 118 ++++++++++
 11 files changed, 747 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/tps65086.txt
 create mode 100644 drivers/gpio/gpio-tps65086.c
 create mode 100644 drivers/mfd/tps65086.c
 create mode 100644 drivers/regulator/tps65086-regulator.c
 create mode 100644 include/linux/mfd/tps65086.h

-- 
1.9.1

