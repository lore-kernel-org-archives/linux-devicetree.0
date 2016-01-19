From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V4 0/5] Add support for MAXIM MAX77620/MAX20024 PMIC
Date: Tue, 19 Jan 2016 15:49:38 +0530
Message-ID: <1453198783-28383-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, lee.jones@linaro.org, broonie@kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com
Cc: lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, rtc-linux@googlegroups.com, swarren@nvidia.com, treding@nvidia.com, k.kozlowski@samsung.com, vreddytalla@nvidia.com, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

Add SW support for MAXIM Semiconductor's Power Management
IC (PMIC) MAX77620/MAX20024. This PMIC supports DC-DC/LDOS, GPIOs,
RTC, watchdog, clocks etc.

This series add respective driver for each of sub-modules.

--- 
Changes from V1: 
DT DOC:
- Added units in some of properties.
- Change the boolean property to tristate type and detail some of
  properties.

RTC:
- Rename the file to rtc-max77xxx.c and make the generic implementation.
- Direct regmap apis are used for the register access.
- Decouped from max77620 driver.
- Taken care of cleanup comments form V1 version.

MFD:
- Code cleanups per review from V1. 
- Move register acccess APIs from header to c file.
- Remove some of non required variable, remove duplication in error message
 and simplify some of function implementation.

GPIO:
- Use the gpiochip_add_data and get the chip data from core APIs.
- Cleanups based on comment received on mfd/rtc.
- Avoid duplication on error message.

Pinctrl:
- Cleanup code based on comment received on mfd/rtc.
- Avoid duplication on error message.

Regulators:
- Cleanup code based on comment received on mfd/rtc.
- Avoid duplication on error message.
- Taken care of review comment from Mark.

Changes from V2: 
- Run coccicheck and checkpatch in strict mode for the alignment.
- Drop RTC driver and its i2c client registartion.
- Refactor Regulator  driver to use core API for DT parsing.

Changes from V3:
- Change all sys initcall to module driver.
- change the max77620_read argument to unisgned int from u8.

Laxman Dewangan (5):
  DT: mfd: add device-tree binding doc fro PMIC max77620/max20024
  mfd: max77620: add core driver for MAX77620/MAX20024
  pinctrl: max77620: add pincontrol driver for MAX77620/MAX20024
  gpio: max77620: add gpio driver for MAX77620/MAX20024
  regulator: max77620: add regulator driver for max77620/max20024

 Documentation/devicetree/bindings/mfd/max77620.txt | 397 +++++++++
 drivers/gpio/Kconfig                               |   9 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-max77620.c                       | 292 +++++++
 drivers/mfd/Kconfig                                |  15 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/max77620.c                             | 871 ++++++++++++++++++++
 drivers/pinctrl/Kconfig                            |  10 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-max77620.c                 | 693 ++++++++++++++++
 drivers/regulator/Kconfig                          |   9 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/max77620-regulator.c             | 883 +++++++++++++++++++++
 include/dt-bindings/mfd/max77620.h                 |  38 +
 include/linux/mfd/max77620.h                       | 404 ++++++++++
 15 files changed, 3625 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/max77620.txt
 create mode 100644 drivers/gpio/gpio-max77620.c
 create mode 100644 drivers/mfd/max77620.c
 create mode 100644 drivers/pinctrl/pinctrl-max77620.c
 create mode 100644 drivers/regulator/max77620-regulator.c
 create mode 100644 include/dt-bindings/mfd/max77620.h
 create mode 100644 include/linux/mfd/max77620.h

-- 
2.1.4
