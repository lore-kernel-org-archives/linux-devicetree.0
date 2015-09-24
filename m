From: "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH v3 0/5] mfd: tps65912: Driver rewrite with DT support
Date: Thu, 24 Sep 2015 09:52:49 -0500
Message-ID: <1443106374-4126-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>
List-Id: devicetree@vger.kernel.org

In an effort to cleanup this driver and add Device Tree support
the driver has been rewritten based on new driver styles and
modern kernel driver helpers. This has nearly halved the lines
of code while keeping all previous functionality.

Platform file based initialization has been dropped as there is
no examples of this use in the kernel.

v1 can be found here: [1] v2: [2]

Changes from v2:
 - Split the series further into subsystems

Changes from v1:
 - Split the rewrite into delete/create patches
 - several small fixes as discussed in v1 thread

[1] http://www.spinics.net/lists/devicetree/msg93863.html
[2] http://www.spinics.net/lists/devicetree/msg95003.html

Andrew F. Davis (5):
  Documentation: tps65912: Add DT bindings for the TPS65912 PMIC
  mfd: tps65912: Remove old driver in preparation for new driver
  mfd: tps65912: Add driver for the TPS65912 PMIC
  regulators: tps65912: Add regulator driver for the TPS65912 PMIC
  gpio: tps65912: Add GPIO driver for the TPS65912 PMIC

 .../devicetree/bindings/gpio/gpio-tps65912.txt     |  16 +
 Documentation/devicetree/bindings/mfd/tps65912.txt |  42 ++
 .../bindings/regulator/tps65912-regulator.txt      |  32 +
 drivers/gpio/Kconfig                               |   2 +-
 drivers/gpio/gpio-tps65912.c                       | 291 ++++----
 drivers/mfd/Kconfig                                |  20 +-
 drivers/mfd/Makefile                               |   3 +-
 drivers/mfd/tps65912-core.c                        | 289 +++-----
 drivers/mfd/tps65912-i2c.c                         | 225 +++---
 drivers/mfd/tps65912-irq.c                         | 217 ------
 drivers/mfd/tps65912-spi.c                         | 226 +++---
 drivers/regulator/Kconfig                          |   2 +-
 drivers/regulator/tps65912-regulator.c             | 781 +++++++--------------
 include/linux/mfd/tps65912.h                       | 255 ++++---
 14 files changed, 925 insertions(+), 1476 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-tps65912.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/tps65912.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/tps65912-regulator.txt
 rewrite drivers/gpio/gpio-tps65912.c (68%)
 rewrite drivers/mfd/tps65912-core.c (96%)
 rewrite drivers/mfd/tps65912-i2c.c (93%)
 delete mode 100644 drivers/mfd/tps65912-irq.c
 rewrite drivers/mfd/tps65912-spi.c (92%)
 rewrite drivers/regulator/tps65912-regulator.c (94%)

-- 
1.9.1
