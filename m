From: Grzegorz Jaszczyk <jaz-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
Subject: [PATCH 00/18] ARM: mvebu: misc Armada 38x/39x DT and v7 defconfig improvements
Date: Thu, 21 Jul 2016 14:43:56 +0200
Message-ID: <1469105055-25181-1-git-send-email-jaz@semihalf.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, mw-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org, jaz-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org, alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

First 3 patches enables some commonly used features in mvebu_v7_defconfig.

Patches 4 and 5 updates armada-385-db-ap.dts. Then patch 6 is currently a fix
for broken Armada 390 dtsi.

Patches 7 to 13 updates the armada-39x.dtsi about features which all can be
supported with existing drivers.

Patch 14 introduces armada-395.dtsi which describes Armada 395 SoC family and
patch 15 updates armada-398.dtsi. Next patch updates Armada 398 DB dts about
supported usb interfaces and finally last 2 patches introduces description for 2
board: Armada 390 DB and Armada 395 GP.

Grzegorz Jaszczyk (18):
  ARM: mvebu: enable MTD command line partition table in
    mvebu_v7_defconfig
  ARM: mvebu: enable UBI and UBIFS in mvebu_v7_defconfig
  ARM: mvebu: enable E1000E in mvebu_v7_defconfig
  ARM: mvebu: a385-db-ap: enable USB (orion-ehci) port
  ARM: mvebu: a385-db-ap: add default partition description for NAND
  ARM: mvebu: a390: add missing compatibility string and add missing
    bracket
  ARM: mvebu: a39x: update the SDHCI node on Armada 39x
  ARM: mvebu: a39x: enable PMU, CA9 MPcore SoC Controller and Coherency
    fabric
  ARM: mvebu: a39x: enable the thermal sensor in Armada-39x SoCs
  ARM: mvebu: a39x: enable watchdog for all Armada-39x SoCs
  ARM: mvebu: a39x: add missing nodes describing GPIO's
  ARM: mvebu: a39x: add missing nodes describing USB2.0 and USB3.0
  ARM: mvebu: a39x: enable rtc for all Armada-39x SoCs
  ARM: mvebu: add support for the Armada 395 SoC family
  ARM: mvebu: a398: update the dtsi about missing interfaces
  ARM: mvebu: a398-db: enable supported usb interfaces
  ARM: mvebu: a390-db: add support for the Armada 390 DB board
  ARM: mvebu: a395-gp: add support for the Armada 395 GP Board

 .../devicetree/bindings/arm/marvell/armada-39x.txt |   2 +-
 arch/arm/boot/dts/armada-385-db-ap.dts             |  30 +++-
 arch/arm/boot/dts/armada-390-db.dts                | 164 +++++++++++++++++++++
 arch/arm/boot/dts/armada-390.dtsi                  |   3 +
 arch/arm/boot/dts/armada-395-gp.dts                | 147 ++++++++++++++++++
 arch/arm/boot/dts/armada-395.dtsi                  |  76 ++++++++++
 arch/arm/boot/dts/armada-398-db.dts                |   8 +
 arch/arm/boot/dts/armada-398.dtsi                  |  10 +-
 arch/arm/boot/dts/armada-39x.dtsi                  |  94 +++++++++++-
 arch/arm/configs/mvebu_v7_defconfig                |   4 +
 10 files changed, 532 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm/boot/dts/armada-390-db.dts
 create mode 100644 arch/arm/boot/dts/armada-395-gp.dts
 create mode 100644 arch/arm/boot/dts/armada-395.dtsi

-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
