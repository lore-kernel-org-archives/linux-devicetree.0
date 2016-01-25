From: "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH v6 0/3] Add support for the TI TPS65086 PMIC
Date: Mon, 25 Jan 2016 09:50:09 -0600
Message-ID: <1453737012-3130-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>
List-Id: devicetree@vger.kernel.org

This series adds support for the TPS65086 PMIC. It is a MFD with an I2C
interface, several regulators and load switches, and a GPO controller.

v1 can be found here: [1] v2: [2] v3: [3] v4: [4] v5: [5]

Changes from v5:
 - Now complies with gpiolib changes
 - Rebase on v4.5-rc1

Changes from v4:
 - Typo fixes in bindings
 - Regulator driver is now just an update stub
 - Use .parent in GPIO driver

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
[4] http://www.spinics.net/lists/devicetree/msg103186.html
[5] https://lkml.org/lkml/2015/12/1/576

Andrew F. Davis (3):
  Documentation: tps65086: Add DT bindings for the TPS65086 PMIC
  mfd: tps65086: Add driver for the TPS65086 PMIC
  gpio: tps65086: Add GPO driver for the TPS65086 PMIC

 Documentation/devicetree/bindings/mfd/tps65086.txt |  55 ++++++++
 drivers/gpio/Kconfig                               |   6 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-tps65086.c                       | 144 ++++++++++++++++++++
 drivers/mfd/Kconfig                                |  13 ++
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/tps65086.c                             | 149 +++++++++++++++++++++
 include/linux/mfd/tps65086.h                       | 117 ++++++++++++++++
 8 files changed, 486 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/tps65086.txt
 create mode 100644 drivers/gpio/gpio-tps65086.c
 create mode 100644 drivers/mfd/tps65086.c
 create mode 100644 include/linux/mfd/tps65086.h

-- 
2.7.0
