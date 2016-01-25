From: "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH v8 0/5] mfd: tps65912: Driver rewrite with DT support
Date: Mon, 25 Jan 2016 09:43:42 -0600
Message-ID: <1453736627-2634-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>
List-Id: devicetree@vger.kernel.org

In an effort to cleanup this driver and add Device Tree support
the driver has been rewritten based on new driver styles and
modern kernel driver helpers. This has nearly halved the lines
of code while keeping all previous functionality.

Platform file based initialization has been dropped as there is
no examples of this use in the kernel.

v1 can be found here: [1] v2: [2] v3: [3] v4: [4] v5: [5] v6: [6] v7: [7]

Changes from v7:
 - Now complies with gpiolib changes

Changes from v6:
 - Removed compatible strings from DT sub-nodes
 - Rearranged DT bindings
 - Small fixes

Changes from v5:
 - Small formatting changes to DT Docs
 - Converted to_tps65912_gpio from macro to inline function

Changes from v4:
 - Use mfd core to add sub-devices

Changes from v3:
 - Reorganized regulator driver and related DT node
 - Other small fixes as discussed in v3 thread

Changes from v2:
 - Split the series further into subsystems

Changes from v1:
 - Split the rewrite into delete/create patches
 - Several small fixes as discussed in v1 thread

[1] http://www.spinics.net/lists/devicetree/msg93863.html
[2] http://www.spinics.net/lists/devicetree/msg95003.html
[3] http://www.spinics.net/lists/devicetree/msg95133.html
[4] http://www.spinics.net/lists/devicetree/msg96109.html
[5] http://www.spinics.net/lists/devicetree/msg100601.html
[6] https://lkml.org/lkml/2015/10/30/690
[7] https://www.spinics.net/lists/linux-gpio/msg09710.html

Andrew F. Davis (5):
  Documentation: tps65912: Add DT bindings for the TPS65912 PMIC
  mfd: tps65912: Remove old driver in preparation for new driver
  mfd: tps65912: Add driver for the TPS65912 PMIC
  regulator: tps65912: Add regulator driver for the TPS65912 PMIC
  gpio: tps65912: Add GPIO driver for the TPS65912 PMIC

 Documentation/devicetree/bindings/mfd/tps65912.txt |  50 ++
 drivers/gpio/Kconfig                               |   2 +-
 drivers/gpio/gpio-tps65912.c                       | 309 ++++-----
 drivers/mfd/Kconfig                                |  20 +-
 drivers/mfd/Makefile                               |   3 +-
 drivers/mfd/tps65912-core.c                        | 286 ++++-----
 drivers/mfd/tps65912-i2c.c                         | 218 +++----
 drivers/mfd/tps65912-irq.c                         | 217 -------
 drivers/mfd/tps65912-spi.c                         | 218 +++----
 drivers/regulator/Kconfig                          |   2 +-
 drivers/regulator/tps65912-regulator.c             | 709 +++++----------------
 include/linux/mfd/tps65912.h                       | 209 +++---
 12 files changed, 767 insertions(+), 1476 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/tps65912.txt
 rewrite drivers/gpio/gpio-tps65912.c (74%)
 rewrite drivers/mfd/tps65912-core.c (96%)
 rewrite drivers/mfd/tps65912-i2c.c (93%)
 delete mode 100644 drivers/mfd/tps65912-irq.c
 rewrite drivers/mfd/tps65912-spi.c (92%)
 rewrite drivers/regulator/tps65912-regulator.c (94%)

-- 
2.7.0
