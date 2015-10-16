From: "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH 0/4] Add support for the TI TPS65086 PMIC.
Date: Fri, 16 Oct 2015 11:59:09 -0500
Message-ID: <1445014753-15450-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>
List-Id: devicetree@vger.kernel.org

This series adds support for the TPS65086 PMIC. It is a MFD with an I2C
interface, several regulators and load switches, and a GPO controller.

Based on v4.3-rc1 and needs b4fe8ba ("regmap: Add generic macro to define regmap_irq")
from Lee Jones' tree to build.

Andrew F. Davis (4):
  Documentation: tps65086: Add DT bindings for the TPS65086 PMIC
  mfd: tps65086: Add driver for the TPS65086 PMIC
  regulator: tps65086: Add regulator driver for the TPS65086 PMIC
  gpio: tps65086: Add GPIO driver for the TPS65086 PMIC

 .../devicetree/bindings/gpio/gpio-tps65086.txt     |  17 ++
 Documentation/devicetree/bindings/mfd/tps65086.txt |  46 ++++
 .../bindings/regulator/tps65086-regulator.txt      |  36 +++
 drivers/gpio/Kconfig                               |   6 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-tps65086.c                       | 114 +++++++++
 drivers/mfd/Kconfig                                |  13 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/tps65086.c                             | 145 ++++++++++++
 drivers/regulator/Kconfig                          |   7 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/tps65086-regulator.c             | 263 +++++++++++++++++++++
 include/linux/mfd/tps65086.h                       | 120 ++++++++++
 13 files changed, 770 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-tps65086.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/tps65086.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/tps65086-regulator.txt
 create mode 100644 drivers/gpio/gpio-tps65086.c
 create mode 100644 drivers/mfd/tps65086.c
 create mode 100644 drivers/regulator/tps65086-regulator.c
 create mode 100644 include/linux/mfd/tps65086.h

-- 
1.9.1

