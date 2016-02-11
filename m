From: Lee Jones <lee.jones@linaro.org>
Subject: [GIT PULL] Immutable branch between MFD, GPIO and Regulator due for
 v4.6
Date: Thu, 11 Feb 2016 16:54:51 +0000
Message-ID: <20160211165451.GC20693@x1>
References: <1453736627-2634-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1453736627-2634-1-git-send-email-afd@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Enjoy!

The following changes since commit 36f90b0a2ddd60823fe193a85e60ff1906c2=
a9b3:

  Linux 4.5-rc2 (2016-01-31 18:12:16 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-mfd=
-regulator-gpio-v4.5

for you to fetch changes up to ca801a22f465eae39fadc770e15b5b7e82595f81=
:

  gpio: tps65912: Add GPIO driver for the TPS65912 PMIC (2016-02-11 16:=
31:12 +0000)

----------------------------------------------------------------
Immutable branch between MFD, GPIO and Regulator due for v4.6

----------------------------------------------------------------
Andrew F. Davis (5):
      Documentation: tps65912: Add DT bindings for the TPS65912 PMIC
      mfd: tps65912: Remove old driver in preparation for new driver
      mfd: tps65912: Add driver for the TPS65912 PMIC
      regulator: tps65912: Add regulator driver for the TPS65912 PMIC
      gpio: tps65912: Add GPIO driver for the TPS65912 PMIC

 Documentation/devicetree/bindings/mfd/tps65912.txt |  50 ++
 drivers/gpio/Kconfig                               |   2 +-
 drivers/gpio/gpio-tps65912.c                       | 171 +++---
 drivers/mfd/Kconfig                                |  20 +-
 drivers/mfd/Makefile                               |   3 +-
 drivers/mfd/tps65912-core.c                        | 240 +++-----
 drivers/mfd/tps65912-i2c.c                         | 162 ++----
 drivers/mfd/tps65912-irq.c                         | 217 --------
 drivers/mfd/tps65912-spi.c                         | 160 ++----
 drivers/regulator/Kconfig                          |   2 +-
 drivers/regulator/tps65912-regulator.c             | 613 ++++---------=
--------
 include/linux/mfd/tps65912.h                       | 209 +++----
 12 files changed, 570 insertions(+), 1279 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/tps65912.txt
 delete mode 100644 drivers/mfd/tps65912-irq.c

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
