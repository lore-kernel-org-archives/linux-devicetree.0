From: Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 0/9] ARM: hisi: enable hi3519 soc
Date: Thu, 3 Dec 2015 10:29:14 +0800
Message-ID: <1449109754-23309-1-git-send-email-xuejiancheng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yanghongwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, suwenping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, ml.yang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, gaofei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

Hi3519 soc is mainly used for ip camera and sport DV solutions. This patchset adds initial support
for Hi3519 soc. It includes clock driver, arch configuration, device tree and debug uart configuration.
It has been tested on hi3519 reference board.

Spi-nor flash driver and other peripheral drivers will be submitted later.

Any comments will be appreciated!

Thanks!

Change Log
----------
v2:
-Rebase to v4.4-rc3
-Put dt-binding doc and header file in a separate patch.
-Delete unused clocks definitions.
-Adjust the ARCH_xxx order in Kconfig file
-Rename ARCH_HI3xxx to ARCH_36xx

Jiancheng Xue (9):
  clk: hi3519: add dt-binding document and header file
  clk: hi3519: add CRG driver for hisilicon hi3519 soc
  ARM: hisi: enable Hi3519 soc
  ARM: dts: add dts files for hi3519-demb board
  ARM: config: enable ARCH_HI3519
  ARM: debug: add Hi3519 debug uart
  ARM: hisi: rename ARCH_HI3xxx to ARCH_HI36xx
  clk: hisilicon: rename ARCH_HI3xxx to ARCH_HI36xx
  dmaengine: Kconfig: rename ARCH_HI3xxx to ARCH_HI36xx

 .../devicetree/bindings/clock/hi3519-crg.txt       |  46 +++++++
 arch/arm/Kconfig.debug                             |  14 +-
 arch/arm/boot/dts/Makefile                         |   4 +-
 arch/arm/boot/dts/hi3519-demb.dts                  |  55 ++++++++
 arch/arm/boot/dts/hi3519.dtsi                      | 129 ++++++++++++++++++
 arch/arm/configs/hisi_defconfig                    |   3 +-
 arch/arm/configs/multi_v7_defconfig                |   2 +-
 arch/arm/mach-hisi/Kconfig                         |  11 +-
 arch/arm/mach-hisi/hisilicon.c                     |   9 ++
 drivers/clk/hisilicon/Makefile                     |   3 +-
 drivers/clk/hisilicon/clk-hi3519.c                 | 100 ++++++++++++++
 drivers/clk/hisilicon/reset.c                      | 149 +++++++++++++++++++++
 drivers/clk/hisilicon/reset.h                      |  25 ++++
 drivers/dma/Kconfig                                |   2 +-
 include/dt-bindings/clock/hi3519-clock.h           |  51 +++++++
 15 files changed, 595 insertions(+), 8 deletions(-)
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
