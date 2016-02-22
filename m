From: Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v9 0/6] ARM: hisi: Add initial support including clock driver for Hi3519 soc.
Date: Mon, 22 Feb 2016 15:47:54 +0800
Message-ID: <1456127280-23275-1-git-send-email-xuejiancheng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yanghongwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, suwenping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, raojun-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, ml.yang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, gaofei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhangzhenxing-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, lidongpo-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

Hi3519 soc is mainly used for ip camera and sport DV solutions. This patchset adds initial support
for Hi3519 soc. It includes clock driver, arch configuration, debug uart configuration and device tree.
It has been tested on hi3519 reference board.

Any comments will be appreciated!

Thanks!

Change Log
----------
v9:
--Fixed issues pointed by Michael Turquette.

v8:
--Made hi3519 clock driver can be compiled as a module
--Fixed an issue in arch/arm/Kconfig.debug

v7:
--Rebased to v4.5-rc1

v6:
-Changed clock driver to a real platform driver

v5:
-Adjusted clock and reset controller driver code

v4:
-Rebased to v4.4-rc7
-Divided patches according to Rob's comments
-Added spi nodes in hi3519-demb.dts

v3:
-Rebased to v4.4-rc4
-Adjusted according to Arnd's comments
-Removed ARCH_HI3519, using ARCH_HISI directly

v2:
-Rebased to v4.4-rc3
-Put dt-binding doc and header file in a separate patch.
-Deleted unused clocks definitions.
-Adjusted the ARCH_xxx order in Kconfig file
-Renamed ARCH_HI3xxx to ARCH_36xx

Jiancheng Xue (6):
  clk: hisilicon: export some hisilicon APIs to modules
  clk: hisilicon: add CRG driver for hi3519 soc
  ARM: hisi: add compatible string for Hi3519 soc
  ARM: debug: add hi3519 debug uart
  ARM: dt-bindings: add device tree bindings for Hi3519 sysctrl
  ARM: dts: add dts files for Hi3519

 .../bindings/arm/hisilicon/hi3519-sysctrl.txt      |  14 ++
 .../devicetree/bindings/clock/hi3519-crg.txt       |  46 +++++
 arch/arm/Kconfig.debug                             |  10 ++
 arch/arm/boot/dts/Makefile                         |   2 +
 arch/arm/boot/dts/hi3519-demb.dts                  |  42 +++++
 arch/arm/boot/dts/hi3519.dtsi                      | 187 +++++++++++++++++++++
 arch/arm/mach-hisi/hisilicon.c                     |  23 +--
 drivers/clk/hisilicon/Kconfig                      |  15 ++
 drivers/clk/hisilicon/Makefile                     |   2 +
 drivers/clk/hisilicon/clk-hi3519.c                 | 129 ++++++++++++++
 drivers/clk/hisilicon/clk.c                        |  23 ++-
 drivers/clk/hisilicon/clk.h                        |  14 +-
 drivers/clk/hisilicon/reset.c                      | 124 ++++++++++++++
 drivers/clk/hisilicon/reset.h                      |  32 ++++
 include/dt-bindings/clock/hi3519-clock.h           |  40 +++++
 15 files changed, 669 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/hisilicon/hi3519-sysctrl.txt
 create mode 100644 Documentation/devicetree/bindings/clock/hi3519-crg.txt
 create mode 100644 arch/arm/boot/dts/hi3519-demb.dts
 create mode 100644 arch/arm/boot/dts/hi3519.dtsi
 create mode 100644 drivers/clk/hisilicon/clk-hi3519.c
 create mode 100644 drivers/clk/hisilicon/reset.c
 create mode 100644 drivers/clk/hisilicon/reset.h
 create mode 100644 include/dt-bindings/clock/hi3519-clock.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
