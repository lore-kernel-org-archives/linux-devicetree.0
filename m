From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V6 0/8] Add support for MAXIM MAX77620/MAX20024 PMIC
Date: Thu, 28 Jan 2016 19:07:46 +0530
Message-ID: <1453988274-28052-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add SW support for MAXIM Semiconductor's Power Management
IC (PMIC) MAX77620/MAX20024. This PMIC supports DC-DC/LDOS, GPIOs,
RTC, watchdog, clocks etc.

This series add respective driver for each of sub-modules.

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

Laxman Dewangan (8):
  DT: mfd: add device-tree binding doc for PMIC max77620/max20024
  mfd: max77620: add core driver for MAX77620/MAX20024
  DT: pinctrl: add DT binding doc for pincontrol of PMIC
    max77620/max20024
  pinctrl: max77620: add pincontrol driver for MAX77620/MAX20024
  DT: gpio: add DT binding doc for gpio of PMIC max77620/max20024
  gpio: max77620: add gpio driver for MAX77620/MAX20024
  DT: regulator: add DT binding doc for regulator of PMIC
    max77620/max20024
  regulator: max77620: add regulator driver for max77620/max20024

 .../devicetree/bindings/gpio/gpio-max77620.txt     |  25 +
 Documentation/devicetree/bindings/mfd/max77620.txt | 118 +++
 .../bindings/pinctrl/pinctrl-max77620.txt          |  87 +++
 .../bindings/regulator/regulator-max77620.txt      | 163 ++++
 drivers/gpio/Kconfig                               |   9 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-max77620.c                       | 292 +++++++
 drivers/mfd/Kconfig                                |  15 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/max77620.c                             | 727 ++++++++++++++++++
 drivers/pinctrl/Kconfig                            |  10 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-max77620.c                 | 693 +++++++++++++++++
 drivers/regulator/Kconfig                          |   9 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/max77620-regulator.c             | 844 +++++++++++++++++++++
 include/dt-bindings/mfd/max77620.h                 |  35 +
 include/linux/mfd/max77620.h                       | 406 ++++++++++
 18 files changed, 3437 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-max77620.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/max77620.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-max77620.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/regulator-max77620.txt
 create mode 100644 drivers/gpio/gpio-max77620.c
 create mode 100644 drivers/mfd/max77620.c
 create mode 100644 drivers/pinctrl/pinctrl-max77620.c
 create mode 100644 drivers/regulator/max77620-regulator.c
 create mode 100644 include/dt-bindings/mfd/max77620.h
 create mode 100644 include/linux/mfd/max77620.h

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
