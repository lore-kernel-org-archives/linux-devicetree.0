From: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/6] MFD: add driver for HiSilicon Hi6421v530 PMIC
Date: Fri, 26 May 2017 14:35:12 +0800
Message-ID: <20170526063518.21246-1-guodong.xu@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, riku.voipio-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org, ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, hw.wangxiaoyin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset adds driver for HiSilicon Hi6421v530 PMIC.

Mainline kernel already has driver support to a similar chip, Hi6421.
Hi6421 and Hi6421v530 are both from the same vendor, HiSilicon, but
they are at different revisions. They both use the same Memory-mapped
I/O method to communicate with Main SoC. However, they differ quite a
lot in their regulator designs. Eg. they have completely different LDO
voltage points.

In order to enable future extension of Hi6421v530 functionality, a new
mfd driver and regulator driver are added in this patchset. Only header
file hi6421-pmic.h is reused between them. Patch 2 is for just this
purpose.

Patch 3 and 4 adds mfd and regulator driver respectively.
Patch 5 is dts change, it depends and can be applied on hi3660/hikey960
        patchset [1].
Patch 6 enables the relevant config items.

[1], http://www.spinics.net/lists/devicetree/msg178303.html

Guodong Xu (4):
  dt-bindings: mfd: Add hi6421v530 bindings
  mfd: hi6421-pmic: move hi6421_regmap_config definition to header file
  mfd: hi6421v530: add support for HiSilicon Hi6421v530
  arm64: defconfig: enable hi6421v530 MFD and regulator

Wang Xiaoyin (2):
  regulator: hi6421v530: add driver for hi6421v530 voltage regulator
  arm64: dts: hikey960: add device node for pmic and regulators

 .../bindings/mfd/hisilicon,hi6421v530.txt          |  25 ++
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts  |  60 ++++
 arch/arm64/configs/defconfig                       |   2 +
 drivers/mfd/Kconfig                                |   9 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/hi6421-pmic-core.c                     |   7 -
 drivers/mfd/hi6421v530-pmic.c                      |  92 ++++++
 drivers/regulator/Kconfig                          |  10 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/hi6421v530-regulator.c           | 355 +++++++++++++++++++++
 include/linux/mfd/hi6421-pmic.h                    |   6 +
 11 files changed, 561 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/hisilicon,hi6421v530.txt
 create mode 100644 drivers/mfd/hi6421v530-pmic.c
 create mode 100644 drivers/regulator/hi6421v530-regulator.c

-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
