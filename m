From: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 0/6] misc: add reboot mode driver
Date: Mon, 21 Dec 2015 19:27:29 +0800
Message-ID: <1450697249-29994-1-git-send-email-andy.yan@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


This driver parse the reboot commands like "reboot loader"
and "reboot recovery" to get a boot mode described in the
device tree , then call the vendor specific write interfae
to store the boot mode in some place like special register
or sram , which can be read by the bootloader after system
reboot.

This is commonly done on Android based devices, in order to
reboot the device into fastboot or recovery mode.

Before this patch , I have try some hack on[0], and then found
John Stultz also doing the same work[1].

As John is busy these days, I go on with this work.

[0]https://patchwork.kernel.org/patch/7647751/
[1]https://patchwork.kernel.org/patch/7802391/


Andy Yan (6):
  dt-bindings: misc: add document for reboot-mode driver
  dt-bindings: soc: add document for rockchip reboot-mode driver
  misc: add reboot mode driver
  soc: rockchip: add reboot mode driver
  ARM: dts: rockchip: add reboot mode node
  ARM64: dts: rockchip: add reboot mode node

 .../devicetree/bindings/misc/reboot-mode.txt       | 41 +++++++++
 .../bindings/soc/rockchip/rockchip,reboot-mode.txt | 39 +++++++++
 arch/arm/boot/dts/rk3288.dtsi                      | 25 ++++++
 arch/arm/boot/dts/rk3xxx.dtsi                      | 26 ++++++
 arch/arm64/boot/dts/rockchip/rk3368.dtsi           | 26 ++++++
 drivers/misc/Kconfig                               |  7 ++
 drivers/misc/Makefile                              |  1 +
 drivers/misc/reboot_mode.c                         | 96 ++++++++++++++++++++++
 drivers/power/reset/Kconfig                        |  1 -
 drivers/soc/rockchip/Kconfig                       |  8 ++
 drivers/soc/rockchip/Makefile                      |  1 +
 drivers/soc/rockchip/loader.h                      | 22 +++++
 drivers/soc/rockchip/reboot.c                      | 66 +++++++++++++++
 include/dt-bindings/soc/rockchip_boot-mode.h       | 30 +++++++
 include/linux/reboot.h                             |  4 +-
 15 files changed, 391 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/misc/reboot-mode.txt
 create mode 100644 Documentation/devicetree/bindings/soc/rockchip/rockchip,reboot-mode.txt
 create mode 100644 drivers/misc/reboot_mode.c
 create mode 100644 drivers/soc/rockchip/loader.h
 create mode 100644 drivers/soc/rockchip/reboot.c
 create mode 100644 include/dt-bindings/soc/rockchip_boot-mode.h

-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
