From: "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH 0/3] mfd: tps65912: Driver rewrite with DT support
Date: Tue, 15 Sep 2015 12:57:38 -0500
Message-ID: <1442339861-30300-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>
List-Id: devicetree@vger.kernel.org

In an effort to cleanup this driver and add Device Tree support
the driver has been rewritten based on new driver styles and
modern kernel driver helpers. This has nearly halved the lines
of code while keeping all previous functionality.

Platform file based initialization has been dropped as there is
no examples of this use in the kernel.

Andrew F. Davis (3):
  Documentation: tps65912: Add DT bindings for the TPS65912 PMIC
  mfd: tps65912: Rewrite driver adding DT support and using regmap
  tps65912: Cleanup TPS65912 subdevice configuration dependencies

 .../devicetree/bindings/gpio/gpio-tps65912.txt     |  17 +
 Documentation/devicetree/bindings/mfd/tps65912.txt |  43 ++
 .../bindings/regulator/tps65912-regulator.txt      |  32 +
 drivers/gpio/Kconfig                               |   2 +-
 drivers/gpio/gpio-tps65912.c                       | 291 ++++----
 drivers/mfd/Kconfig                                |  20 +-
 drivers/mfd/Makefile                               |   3 +-
 drivers/mfd/tps65912-core.c                        | 288 +++-----
 drivers/mfd/tps65912-i2c.c                         | 233 +++---
 drivers/mfd/tps65912-irq.c                         | 217 ------
 drivers/mfd/tps65912-spi.c                         | 236 +++----
 drivers/regulator/Kconfig                          |   2 +-
 drivers/regulator/tps65912-regulator.c             | 783 +++++++--------------
 include/linux/mfd/tps65912.h                       | 256 ++++---
 14 files changed, 948 insertions(+), 1475 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-tps65912.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/tps65912.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/tps65912-regulator.txt
 rewrite drivers/gpio/gpio-tps65912.c (68%)
 rewrite drivers/mfd/tps65912-core.c (96%)
 rewrite drivers/mfd/tps65912-i2c.c (92%)
 delete mode 100644 drivers/mfd/tps65912-irq.c
 rewrite drivers/mfd/tps65912-spi.c (91%)
 rewrite drivers/regulator/tps65912-regulator.c (94%)

-- 
1.9.1

