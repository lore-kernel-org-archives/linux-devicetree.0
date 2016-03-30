From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V10 0/6] Add support for MAXIM MAX77620/MAX20024 PMIC
Date: Wed, 30 Mar 2016 19:59:42 +0530
Message-ID: <1459348188-11726-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: lee.jones@linaro.org, linus.walleij@linaro.org, robh+dt@kernel.org
Cc: mark.rutland@arm.com, gnurou@gmail.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, ijc+devicetree@hellion.org.uk, swarren@nvidia.com, treding@nvidia.com, Laxman Dewangan <ldewangan@nvidia.com>
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
- Move register access APIs from header to c file.
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


Changes from V4:
- Provide more details in the dt binding doc.
- Take care of fps nodes.
- Split the submodule's DT binding doc on respective folder.
- Drop the battery charger and low battery binding and related code as
  it need to go on power driver.

Changes from V5:
- None

Changes from V6:
- Taken care of Lee's comment like used defines for irqs, remove max77620
  register access abstractions, remove DTof module and use ID table only,
  reduce the copyright lines.
- Drop configuration for hard power off time change as it will be in
  power driver.
- Taken care of Mark's comment about the active discharge. Currently
  drop this configuration and follow up patches to move this to core
  and add callback apis are planned.
- Use direct regmap from all drivers instead of using abstractions.
- move regulator supply to device node instead of regulators sub node.

Changes from V7:
- Used mfd defines, better describe the FPS sequence properties.

Changes from V8:
- Used local defines as the MFD defines need to be fix for size calculations.
- Regulator patches are already applied and hence droping it.
- Run checkpatch --strict in final patches and fix error/warning.

Changes from V9:
Use devm_regmap_add_irq_chip() and devm_gpiochip_add_data()

Laxman Dewangan (6):
  mfd: add device-tree binding doc for PMIC max77620/max20024
  mfd: max77620: add core driver for MAX77620/MAX20024
  pinctrl: add DT binding doc for pincontrol of PMIC max77620/max20024
  pinctrl: max77620: add pincontrol driver for MAX77620/MAX20024
  gpio: add DT binding doc for gpio of PMIC max77620/max20024
  gpio: max77620: add gpio driver for MAX77620/MAX20024

 .../devicetree/bindings/gpio/gpio-max77620.txt     |  25 +
 Documentation/devicetree/bindings/mfd/max77620.txt | 143 +++++
 .../bindings/pinctrl/pinctrl-max77620.txt          | 127 ++++
 drivers/gpio/Kconfig                               |   9 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-max77620.c                       | 238 +++++++
 drivers/mfd/Kconfig                                |  15 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/max77620.c                             | 544 ++++++++++++++++
 drivers/pinctrl/Kconfig                            |  10 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-max77620.c                 | 688 +++++++++++++++++++++
 include/dt-bindings/mfd/max77620.h                 |  39 ++
 include/linux/mfd/max77620.h                       | 337 ++++++++++
 14 files changed, 2178 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-max77620.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/max77620.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-max77620.txt
 create mode 100644 drivers/gpio/gpio-max77620.c
 create mode 100644 drivers/mfd/max77620.c
 create mode 100644 drivers/pinctrl/pinctrl-max77620.c
 create mode 100644 include/dt-bindings/mfd/max77620.h
 create mode 100644 include/linux/mfd/max77620.h

-- 
2.1.4

