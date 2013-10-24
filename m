From: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v5 0/8] ARM: imx27 pinctrl
Date: Thu, 24 Oct 2013 17:38:26 +0200
Message-ID: <1382629114-8628-1-git-send-email-mpa@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

v5 contains a small new fix which moves uart1 from phycore SOM to RDK dts file.
The uart1 pinctrl is added to RDK only.

this series implements a imx27 pinctrl driver. imx1/21/27 have a register
format that is not compatible with the rest of imx series processors. The
series adds a imx1 core driver for the different register layout.

Regards,

Markus


Markus Pargmann (8):
  pinctrl: imx1 core driver
  pinctrl: imx27: imx27 pincontrol driver
  ARM: dts: imx27 pin functions
  ARM: dts: imx27 pinctrl
  ARM: dts: imx27 phyCARD-S pinctrl
  ARM: dts: imx27 phycore move uart1 to rdk
  ARM: dts: imx27 phycore pinctrl
  ARM: imx27: enable pinctrl

 .../bindings/pinctrl/fsl,imx27-pinctrl.txt         |  50 ++
 arch/arm/boot/dts/imx27-phytec-phycard-s-rdk.dts   |  10 +
 arch/arm/boot/dts/imx27-phytec-phycard-s-som.dts   |   4 +
 arch/arm/boot/dts/imx27-phytec-phycore-rdk.dts     |   5 +
 arch/arm/boot/dts/imx27-phytec-phycore-som.dts     |   8 +-
 arch/arm/boot/dts/imx27-pinfunc.h                  | 524 +++++++++++++++++
 arch/arm/boot/dts/imx27.dtsi                       | 102 ++++
 arch/arm/mach-imx/Kconfig                          |   2 +
 drivers/pinctrl/Kconfig                            |  13 +
 drivers/pinctrl/Makefile                           |   2 +
 drivers/pinctrl/pinctrl-imx1-core.c                | 653 +++++++++++++++++++++
 drivers/pinctrl/pinctrl-imx1.h                     |  73 +++
 drivers/pinctrl/pinctrl-imx27.c                    | 477 +++++++++++++++
 13 files changed, 1919 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx27-pinctrl.txt
 create mode 100644 arch/arm/boot/dts/imx27-pinfunc.h
 create mode 100644 drivers/pinctrl/pinctrl-imx1-core.c
 create mode 100644 drivers/pinctrl/pinctrl-imx1.h
 create mode 100644 drivers/pinctrl/pinctrl-imx27.c

-- 
1.8.4.rc3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
