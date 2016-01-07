From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 0/6] Add support for MAXIM MAX77620/MAX20024 PMIC
Date: Thu, 7 Jan 2016 20:08:38 +0530
Message-ID: <1452177524-23192-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, lee.jones@linaro.org, broonie@kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com
Cc: lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, rtc-linux@googlegroups.com, swarren@nvidia.com, treding@nvidia.com, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

Add SW support for MAXIM Semiconductor's Power Management
IC (PMIC) MAX77620/MAX20024. This PMIC supports DC-DC/LDOS, GPIOs,
RTC, watchdog, clocks etc.

This series add respective driver for each of sub-modules.

Laxman Dewangan (6):
  DT: mfd: add device-tree binding doc fro PMIC max77620/max20024
  mfd: max77620: add core driver for MAX77620/MAX20024
  pinctrl: max77620: add pincontrol driver for MAX77620/MAX20024
  gpio: max77620: add gpio driver for MAX77620/MAX20024
  rtc: max77620: add support for max77620/max20024 RTC driver
  regulator: max77620: add regulator driver for max77620/max20024

 Documentation/devicetree/bindings/mfd/max77620.txt |  383 +++++++
 drivers/gpio/Kconfig                               |    9 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-max77620.c                       |  330 ++++++
 drivers/mfd/Kconfig                                |   15 +
 drivers/mfd/Makefile                               |    1 +
 drivers/mfd/max77620.c                             |  926 +++++++++++++++++
 drivers/pinctrl/Kconfig                            |   10 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/pinctrl-max77620.c                 |  700 +++++++++++++
 drivers/regulator/Kconfig                          |    9 +
 drivers/regulator/Makefile                         |    1 +
 drivers/regulator/max77620-regulator.c             | 1062 ++++++++++++++++++++
 drivers/rtc/Kconfig                                |    9 +
 drivers/rtc/Makefile                               |    1 +
 drivers/rtc/rtc-max77620.c                         |  574 +++++++++++
 include/dt-bindings/mfd/max77620.h                 |   38 +
 include/linux/mfd/max77620.h                       |  503 +++++++++
 18 files changed, 4573 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/max77620.txt
 create mode 100644 drivers/gpio/gpio-max77620.c
 create mode 100644 drivers/mfd/max77620.c
 create mode 100644 drivers/pinctrl/pinctrl-max77620.c
 create mode 100644 drivers/regulator/max77620-regulator.c
 create mode 100644 drivers/rtc/rtc-max77620.c
 create mode 100644 include/dt-bindings/mfd/max77620.h
 create mode 100644 include/linux/mfd/max77620.h

-- 
2.1.4

