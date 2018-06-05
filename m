From: Lee Jones <lee.jones@linaro.org>
Subject: [GIT PULL] Immutable branch between MFD, GPIO and Pinctrl due for
 the v4.19 merge window
Date: Tue, 5 Jun 2018 12:15:28 +0100
Message-ID: <20180605111528.GR21163@dell>
References: <20180521100002.11094-1-rf@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180521100002.11094-1-rf@opensource.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linus.walleij@linaro.org, andy.shevchenko@gmail.com, robh+dt@kernel.org, patches@opensource.cirrus.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Enjoy!

The following changes since commit 29dcea88779c856c7dc92040a0c01233263101d4:

  Linux 4.17 (2018-06-03 14:15:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-gpio-pinctrl-v4.19

for you to fetch changes up to aca429ff9d14f0f55f6d319d6bb1dfc2bbee09fe:

  gpio: madera: Support Cirrus Logic Madera class codecs (2018-06-05 11:15:30 +0100)

----------------------------------------------------------------
Immutable branch between MFD, GPIO and Pinctrl due for the v4.19 merge window

----------------------------------------------------------------
Richard Fitzgerald (9):
      mfd: madera: Add register definitions for Cirrus Logic Madera codecs
      mfd: madera: Add DT bindings for Cirrus Logic Madera codecs
      mfd: madera: Add common support for Cirrus Logic Madera codecs
      mfd: madera: Register map tables for Cirrus Logic CS47L35
      mfd: madera: Register map tables for Cirrus Logic CS47L85
      mfd: madera: Register map tables for Cirrus Logic CS47L90/91
      pinctrl: madera: Add DT bindings for Cirrus Logic Madera codecs
      pinctrl: madera: Add driver for Cirrus Logic Madera codecs
      gpio: madera: Support Cirrus Logic Madera class codecs

 Documentation/devicetree/bindings/mfd/madera.txt   |  102 +
 .../bindings/pinctrl/cirrus,madera-pinctrl.txt     |   99 +
 MAINTAINERS                                        |   16 +
 drivers/gpio/Kconfig                               |    6 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-madera.c                         |  206 +
 drivers/mfd/Kconfig                                |   50 +
 drivers/mfd/Makefile                               |   14 +
 drivers/mfd/cs47l35-tables.c                       | 1609 ++++++++
 drivers/mfd/cs47l85-tables.c                       | 3009 +++++++++++++++
 drivers/mfd/cs47l90-tables.c                       | 2674 +++++++++++++
 drivers/mfd/madera-core.c                          |  609 +++
 drivers/mfd/madera-i2c.c                           |  140 +
 drivers/mfd/madera-spi.c                           |  139 +
 drivers/mfd/madera.h                               |   44 +
 drivers/pinctrl/Kconfig                            |    1 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/cirrus/Kconfig                     |   14 +
 drivers/pinctrl/cirrus/Makefile                    |   13 +
 drivers/pinctrl/cirrus/pinctrl-cs47l35.c           |   45 +
 drivers/pinctrl/cirrus/pinctrl-cs47l85.c           |   59 +
 drivers/pinctrl/cirrus/pinctrl-cs47l90.c           |   57 +
 drivers/pinctrl/cirrus/pinctrl-madera-core.c       | 1076 ++++++
 drivers/pinctrl/cirrus/pinctrl-madera.h            |   41 +
 include/linux/mfd/madera/core.h                    |  187 +
 include/linux/mfd/madera/pdata.h                   |   59 +
 include/linux/mfd/madera/registers.h               | 3917 ++++++++++++++++++++
 27 files changed, 14188 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/madera.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/cirrus,madera-pinctrl.txt
 create mode 100644 drivers/gpio/gpio-madera.c
 create mode 100644 drivers/mfd/cs47l35-tables.c
 create mode 100644 drivers/mfd/cs47l85-tables.c
 create mode 100644 drivers/mfd/cs47l90-tables.c
 create mode 100644 drivers/mfd/madera-core.c
 create mode 100644 drivers/mfd/madera-i2c.c
 create mode 100644 drivers/mfd/madera-spi.c
 create mode 100644 drivers/mfd/madera.h
 create mode 100644 drivers/pinctrl/cirrus/Kconfig
 create mode 100644 drivers/pinctrl/cirrus/Makefile
 create mode 100644 drivers/pinctrl/cirrus/pinctrl-cs47l35.c
 create mode 100644 drivers/pinctrl/cirrus/pinctrl-cs47l85.c
 create mode 100644 drivers/pinctrl/cirrus/pinctrl-cs47l90.c
 create mode 100644 drivers/pinctrl/cirrus/pinctrl-madera-core.c
 create mode 100644 drivers/pinctrl/cirrus/pinctrl-madera.h
 create mode 100644 include/linux/mfd/madera/core.h
 create mode 100644 include/linux/mfd/madera/pdata.h
 create mode 100644 include/linux/mfd/madera/registers.h
 
-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
