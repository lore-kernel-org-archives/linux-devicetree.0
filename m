From: Flora Fu <flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v4 0/6] Add Support for MediaTek PMIC MT6397 MFD Core and Regulator
Date: Fri, 26 Dec 2014 15:09:22 +0800
Message-ID: <1419577768-12037-1-git-send-email-flora.fu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Flora Fu <flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Dongdong Cheng <dongdong.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, HenryC Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Menghui Lin <menghui.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Chen Zhong <chen.zhong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

The patch sets add support for MediaTek PMIC MT6397 MFD core and its regulator driver.
This is hardware layout for access PMIC MT6397 from AP SoC MT8135.
Between PMIC MT6397 and MT8135, the physical signal channel is SPI bus.
A specific hardware called PMIC Wrapper or PWRAP to handle access protocols in both PMIC and AP side.

+-----------------+           +---------------+
|                 |           |               |
| Mediatek AP SoC |           |               |
| (ex. MT8135)    |           |    MT6397     |
|                 |           |               |
|      +--------+ | (SPI bus) | +--------+    |
|      |        | |-----------| |        |    |
|      |  PMIC  | |-----------| |  PMIC  |    |
|      | Wrapper| |-----------| | Wrapper|    |
|      |        | |-----------| |        |    |
|      +--------+ |           | +--------+    |
|                 |           |               |
+-----------------+           +---------------+

This driver is based on kernel release 3.19.

Changes since v3
================
(1) Patch 1/6: PMIC Wrapper is the parent of MT6397 MFD. Use auxdata to pass regmap pointer as MFD's platform data.
(2) Patch 2/6: Update MT6397 MFD implmentation according to patch 1/6. Update MFD cells table: rtc, codec, clock for sub modules.
(3) Patch 4/6: Document for MT8135 PMIC wrapper.
(4) Patch 5/6: Document for MT6397 MFD.
(5) Patch 7/6: Device tree for MT8135 PMIC wrapper in mt8135.dtsi.
			   - nodes of clocks depend on mt8135 clocks 
			   - nodes of resets depend on mt8135 reset controllers:
                 https://lkml.org/lkml/2014/11/3/134
                 https://lkml.org/lkml/2014/11/5/283
(6) Patch 6/6: Add device tree for MT6397 MFD and regulators in mt8135 board file.
v3:
https://lkml.org/lkml/2014/12/4/924

Changes since v2
================
(1) Patch 1/8: Update kernel config of MT8135 PMIC Wrapper. It needs to select REGMAP.
(2) Patch 2/8: Update patch of MT6397 MFD driver to fix defeat of coding styles.
(3) Patch 3/8: Update MT6397 regulator driver
	- use standard helpers for ops ".set_voltage_sel", ".get_voltage_sel" and ".is_enabled"
	- remove regulator's DT matching codes in the driver.  
	- fix defeat of coding styles.
(4) Patch 4/8: Update document for MT8135 PMIC wrapper.
(5) Patch 5/8: Update document for MT6397 MFD.
(6) Patch 6/8: Update document for MT6397 regulators.
(7) Patch 7/8: Update device tree for MT8135 PMIC wrapper in mt8135.dtsi.
(8) Patch 8/8: Add device tree for MT6397 MFD and regulators in mt8135-evbp1.dts board file.
v2:
http://lists.infradead.org/pipermail/linux-arm-kernel/2014-November/307069.html

Changes since v1
================
(1) Patch 1/8: Add MT8135 PMIC wrapper driver for SoC's proprietary hardware.
(2) Patch 2/8: Update patch of MT6397 MFD driver to contain only MFD related codes and fix defeat of coding styles.
(3) Patch 3/8: Update MT6397 regulator driver
	- use helpers and standard ways for specifying data in regulator description.
	- add more comments to explaining why the driver implement its own regulator_ops for ".is_enabled", ".set_voltage_sel" and ".get_voltage_sel".
	- update driver implement for coding styles.
(4) Patch 4/8: Add document for MT8135 PMIC wrapper.
(5) Patch 5/8: Update document for MT6397 MFD.
(6) Patch 6/8: Update document for MT6397 regulators.
(7) Patch 7/8: Add device tree for MT6397 MFD in mt8135.dtsi.
(8) Patch 8/8: Update device tree for MT6397 regulators in mt8135.dtsi.
Initial version (v1):
http://lists.infradead.org/pipermail/linux-arm-kernel/2014-November/302984.html

Flora Fu (6):
  soc: mediatek: Add PMIC wrapper for MT8135 and MT6397 SoC
  mfd: MT6397: Add support for PMIC MT6397 MFD
  dt-bindings:: Add document for MT8135 PMIC Wrapper
  dt-bindings: Add document for MT6397 MFD
  arm: dts: mt8135: Add support for MT8135 PMIC wrapper
  arm: dts: mt8135: Add support for MT6397 MFD and regulator

 Documentation/devicetree/bindings/mfd/mt6397.txt   |  75 ++
 .../soc/mediatek/mediatek,mt8135-pwrap.txt         |  51 ++
 arch/arm/boot/dts/mt8135-evbp1.dts                 | 193 +++++
 arch/arm/boot/dts/mt8135.dtsi                      |  14 +
 drivers/mfd/Kconfig                                |  10 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/mt6397-core.c                          |  94 +++
 drivers/soc/Kconfig                                |   1 +
 drivers/soc/Makefile                               |   1 +
 drivers/soc/mediatek/Kconfig                       |  12 +
 drivers/soc/mediatek/Makefile                      |   1 +
 drivers/soc/mediatek/mt8135-pmic-wrap.c            | 855 +++++++++++++++++++++
 drivers/soc/mediatek/mt8135-pmic-wrap.h            | 138 ++++
 include/linux/mfd/mt6397/core.h                    |  23 +
 include/linux/mfd/mt6397/registers.h               | 362 +++++++++
 15 files changed, 1831 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/mt6397.txt
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8135-pwrap.txt
 create mode 100644 drivers/mfd/mt6397-core.c
 create mode 100644 drivers/soc/mediatek/Kconfig
 create mode 100644 drivers/soc/mediatek/Makefile
 create mode 100644 drivers/soc/mediatek/mt8135-pmic-wrap.c
 create mode 100644 drivers/soc/mediatek/mt8135-pmic-wrap.h
 create mode 100644 include/linux/mfd/mt6397/core.h
 create mode 100644 include/linux/mfd/mt6397/registers.h

--
1.8.1.1.dirty

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
