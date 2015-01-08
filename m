From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 0/8] Add Armada 385 General Purpose Development Board support
Date: Thu,  8 Jan 2015 11:51:37 +0100
Message-ID: <1420714305-7496-1-git-send-email-gregory.clement@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

this patch set adds the support for the Armada 385 GP board, this
board is pretty close to the Armada 385 RD one. It comes with a new
revision of the Armada 38x SoC (A0). Actually the SoC used here is the
Armada 388 one, which differed from the Armada 385 by allowing to use
two more SATA ports.

In this second version, I took into account the various comments from
the 1st version but also some comments addressed to the Armada 385 AP
series. The bigest changes are the removal of the regulator for the
SATA which will be part of another series, the add of a dtsi file for
the Armada 388 variant, and the add of pinctrl configuration. See the
changelog for the details.

The first 3 patches came from Maxime's series to support the AP
board. I have done this in order to have a complete series and also
because I don't expect big change in these patches.

Changelog:

v1 -> v2:
- removed the earlyprintk in the command line
- added the stdout-path for the bootloader
- added the pinctrl configuration for all the node that need it
- renamed pca9555_ into expander
- added comment about the connector
- switched the PHY address to match the hardware
- removed the nr-ports property which is specific to the mv-sata and
  not the ahci
- removed the clock-frequency property of the sdhci node
- formatted the speed-map of gpio-fan with a newline between the map
  entries
- removed the SATA regulators
- added the dtsi for the Armada 388 variant

Gregory CLEMENT (5):
  ARM: mvebu: a38x: Add more pinctrl functions
  ARM: mvebu: a38x: Add missing labels
  ARM: mvebu: Document the Device Tree binding for the Armada 388 SoC
  ARM: mvebu: Add Device Tree description of the Armada 388 SoC
  ARM: mvebu: Add Armada 385 General Purpose Development Board support

Maxime Ripard (3):
  ARM: mvebu: a38x: Fix node names
  ARM: mvebu: A38x: Remove redundant pinctrl informations
  ARM: mvebu: Add a number of pinctrl functions

 .../devicetree/bindings/arm/armada-38x.txt         |   7 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/armada-380.dtsi                  |   3 +-
 arch/arm/boot/dts/armada-385-db.dts                |   2 +-
 arch/arm/boot/dts/armada-385-gp.dts                | 288 +++++++++++++++++++++
 arch/arm/boot/dts/armada-385-rd.dts                |   2 +-
 arch/arm/boot/dts/armada-385.dtsi                  |   3 +-
 arch/arm/boot/dts/armada-388.dtsi                  |  58 +++++
 arch/arm/boot/dts/armada-38x.dtsi                  |  93 ++++++-
 9 files changed, 447 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm/boot/dts/armada-385-gp.dts
 create mode 100644 arch/arm/boot/dts/armada-388.dtsi

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
