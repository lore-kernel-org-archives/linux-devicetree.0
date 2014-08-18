From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/9] arm: mediatek: Add more basic features
Date: Mon, 18 Aug 2014 16:58:28 +0200
Message-ID: <1408373917-10002-1-git-send-email-matthias.bgg@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, anders.berg-M7mHMAq9Yzo@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, srv_yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch set adds some minor changes to the Mediatek mt6589 support.

The most important patch enables the arm arch timer for mt6589. As already seen
on other vendor SoCs, to enable the arch timer we have to enable a SoC timer.
This should be normally done by the bootloader. As up to now no open source
bootloader exists for the mt6589, I added the functionality to the init_time
function.

Other features are low-level debugging on the mt6589, the addition to the
"make dtbs" and multi_v7_defconfig, as well as a small typo in the dtsi file.

The patch set is based on v3.17-rc1

Changes for v2:
- rebased on v3.17-rc1
- add patch for the compatible property of aquaris5
- add patch setting GIC compatible string to new "arm,cortex-a7-gic"
- set ARM arch timer frequency in DTS

--- 

Matthias Brugger (9):
  arm: dts: Build dtb for Mediatek board
  arm: multi_v7_defconfig: Enable Mediatek platform
  arm: dts: mt6589: Fix typo in GIC unit address
  arm: mediatek: Add earlyprintk support for mt6589
  arm: dts: mt6589-aquaris5: Add boot argument earlyprintk
  arm: mediatek: enable gpt6 on boot up to make arch timer working
  arm: dts: mt6589: Add arm arch timer node
  arm: dts: mediatek: Add compatible property for aquaris5
  arm: dts: mt6589: Change compatible string for GIC

 Documentation/devicetree/bindings/arm/mediatek.txt |    6 +++++
 arch/arm/Kconfig.debug                             |   10 ++++++++
 arch/arm/boot/dts/Makefile                         |    1 +
 arch/arm/boot/dts/mt6589-aquaris5.dts              |    5 ++++
 arch/arm/boot/dts/mt6589.dtsi                      |   17 ++++++++++---
 arch/arm/configs/multi_v7_defconfig                |    1 +
 arch/arm/mach-mediatek/mediatek.c                  |   26 ++++++++++++++++++++
 7 files changed, 62 insertions(+), 4 deletions(-)

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
