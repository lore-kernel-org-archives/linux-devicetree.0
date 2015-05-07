From: Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v5 0/6] arm64,hi6220: Enable Hisilicon Hi6220 SoC
Date: Thu, 7 May 2015 22:00:19 +0800
Message-ID: <1431007225-8513-1-git-send-email-bintian.wang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, yanhaifeng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, sledge.yanwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org
Cc: xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhenwei.wang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, victor.lixin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, huxinwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, z.liuxinliang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, heyunlei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, btw-aAikPa0K0u50tdys+9eLAQ@public.gmane.org, w.f-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi6220 is one mobile solution of Hisilicon, this patchset contains
initial support for Hi6220 SoC and HiKey development board, which
supports octal ARM Cortex A53 cores. Initial support is minimal and
includes just the arch configuration, clock driver, device tree
configuration.

PSCI is enabled in device tree and there is no problem to boot all the
octal cores, and the CPU hotplug is also working now, you can download
and compile the latest firmware based on the following link to run this
patch set:
https://github.com/96boards/documentation/wiki/UEFI 

Changes v5:
* Rebase to kernel 4.1-rc2
* Add compatible string "hisilicon,hi6220-pl011" for Hisilicon designed
  UART
* clk-hi6220.c: use __initdata for non-const arrays based on the commit
  692d8328e8c039f9497eb862c6cf835de922c061 

Changes v4:
* Rebase to kernel 4.1-rc1
* Delete "arm,cortex-a15-gic" from the gic node in dts 

Changes v3:
* Verified the CPU hotplug based on the new released firmware
* Redefined the compatible strings of four system controllers in dts 
* Setting COMMON_CLK_HI6220 to a bool symbol
* Keep CONFGI_ARCH_HISI sorted alphabetically

Changes v2:
* Split the DT bindings documents into earlier patches
* Change SMP enable method from spin-table to PSCI in device tree
* Remove "clock-frequency" from armv8-timer device node in device tree
* Add more description about Hisilicon designed system controllers
  in DT bindings document
* Enable high speed clock on UART1 mux
* Other changes based on the discussion in the mailing list:
  https://lkml.org/lkml/2015/2/5/147

Bintian Wang (6):
  arm64: Enable Hisilicon ARMv8 SoC family in Kconfig and defconfig
  arm64: hi6220: Document devicetree bindings for Hisilicon hi6220 SoC
  clk: hi6220: Document devicetree bindings for hi6220 clock
  Documentation: DT: PL011: hi6220: add compatible string for Hisilicon
        designed UART
  clk: hi6220: Clock driver support for Hisilicon hi6220 SoC
  arm64: dts: Add dts files for Hisilicon Hi6220 SoC

 .../bindings/arm/hisilicon/hisilicon.txt           |   87 ++++++
 .../devicetree/bindings/clock/hi6220-clock.txt     |   34 +++
 Documentation/devicetree/bindings/serial/pl011.txt |    4 +-
 arch/arm64/Kconfig                                 |    5 +
 arch/arm64/boot/dts/Makefile                       |    1 +
 arch/arm64/boot/dts/hisilicon/Makefile             |    5 +
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts     |   31 +++
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi          |  172 ++++++++++++
 arch/arm64/configs/defconfig                       |    1 +
 drivers/clk/Kconfig                                |    2 +
 drivers/clk/Makefile                               |    4 +-
 drivers/clk/hisilicon/Kconfig                      |    6 +
 drivers/clk/hisilicon/Makefile                     |    3 +-
 drivers/clk/hisilicon/clk-hi6220.c                 |  292 ++++++++++++++++++++
 drivers/clk/hisilicon/clk.c                        |   29 ++
 drivers/clk/hisilicon/clk.h                        |   17 ++
 drivers/clk/hisilicon/clkdivider-hi6220.c          |  273 ++++++++++++++++++
 include/dt-bindings/clock/hi6220-clock.h           |  173 ++++++++++++
 18 files changed, 1134 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/hi6220-clock.txt
 create mode 100644 arch/arm64/boot/dts/hisilicon/Makefile
 create mode 100644 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
 create mode 100644 arch/arm64/boot/dts/hisilicon/hi6220.dtsi
 create mode 100644 drivers/clk/hisilicon/Kconfig
 create mode 100644 drivers/clk/hisilicon/clk-hi6220.c
 create mode 100644 drivers/clk/hisilicon/clkdivider-hi6220.c
 create mode 100644 include/dt-bindings/clock/hi6220-clock.h

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
