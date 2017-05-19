From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 0/9] Add support for the pin controllers on the Marvell Armada 7K/8K
Date: Fri, 19 May 2017 18:04:42 +0200
Message-ID: <cover.0dd8a92ae74fcec8d0470d0a7016035089e46eed.1495209664.git-series.gregory.clement@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Kostya Porotchkin <kostap-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Neta Zur Hershkovits <neta-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Marcin Wojtas <mw-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>, Omri Itach <omrii-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Shadi Ammouri <shadi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

This series is adding the support for the pin controllers found on the
Marvell Armada 7K/8K.

These controllers are compatible with the ones found on the ARM32
mvebu SoCs. However, the pinctrl node in the device tree of theses SoCs
are child of a syscon. So for them we will reuse the regmap support
introduced by Russell King.

Each component of the Armada 7K and 8K comes with their own pin
controller, that's why we have 2 new drivers: one for the CP110 and
one for the AP806.

This series is based on the work of several peoples, I do my best to
cited all of them and pointed the work they have done.

The patch 1 and 6 could go to the mvebu tree once they have been
acked, but the last patch _must_ go to mvebu tree to avoid
conflicts. More over the dts changes in this patch depend on the clock
series I've just sent before.

Thanks,

Gregory

Gregory CLEMENT (6):
  MAINTAINERS: extend mvebu SoC entry with pinctrl drivers
  pinctrl: dt-bindings: add documentation for AP806 pin controllers
  pinctrl: dt-bindings: add documentation for CP110 pin controllers
  pinctrl: mvebu: remove the offset property for regmap
  arm64: marvell: enable the Armada 7K/8K pinctrl driver
  arm64: dts: marvell: add pinctrl support for Armada 7K/8K

Hanna Hawa (2):
  pinctrl: mvebu: add driver for Armada AP806 pinctrl
  pinctrl: mvebu: add driver for Armada CP110 pinctrl

Russell King (1):
  pinctrl: avoid PLAT_ORION dependency

 Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt  |  53 +++++-
 Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt | 101 ++++++++++-
 MAINTAINERS                                                                |   1 +-
 arch/arm64/Kconfig.platforms                                               |   2 +-
 arch/arm64/boot/dts/marvell/armada-7020.dtsi                               |   2 +-
 arch/arm64/boot/dts/marvell/armada-7040.dtsi                               |   2 +-
 arch/arm64/boot/dts/marvell/armada-70x0.dtsi                               |  53 ++++++-
 arch/arm64/boot/dts/marvell/armada-8020.dtsi                               |   3 +-
 arch/arm64/boot/dts/marvell/armada-8040.dtsi                               |   3 +-
 arch/arm64/boot/dts/marvell/armada-80x0.dtsi                               |  60 ++++++-
 arch/arm64/boot/dts/marvell/armada-ap806.dtsi                              |   4 +-
 drivers/pinctrl/mvebu/Kconfig                                              |  12 +-
 drivers/pinctrl/mvebu/Makefile                                             |   2 +-
 drivers/pinctrl/mvebu/pinctrl-armada-ap806.c                               | 145 +++++++++++++++-
 drivers/pinctrl/mvebu/pinctrl-armada-cp110.c                               | 692 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 drivers/pinctrl/mvebu/pinctrl-mvebu.c                                      |   6 +-
 drivers/pinctrl/mvebu/pinctrl-mvebu.h                                      |   2 +-
 17 files changed, 1113 insertions(+), 30 deletions(-)
 create mode 100644 arch/arm64/boot/dts/marvell/armada-70x0.dtsi
 create mode 100644 arch/arm64/boot/dts/marvell/armada-80x0.dtsi
 create mode 100644 drivers/pinctrl/mvebu/pinctrl-armada-ap806.c
 create mode 100644 drivers/pinctrl/mvebu/pinctrl-armada-cp110.c

base-commit: dd50dc10764735d46c8e493b8c6907aa5a3d1783
-- 
git-series 0.9.1
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
