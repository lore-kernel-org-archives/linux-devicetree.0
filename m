From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 0/7] pinctrl: imx27: imx27 pincontrol driver
Date: Wed, 13 Nov 2013 22:36:00 +0800
Message-ID: <20131113143557.GA17816@S2101-09.ap.freescale.net>
References: <1384246210-9257-1-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384246210-9257-1-git-send-email-mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 12, 2013 at 09:50:03AM +0100, Markus Pargmann wrote:
> Hi,
> 
> This series contains only DTS changes for imx27-pinctrl. It depends on the
> incremental driver patch which allows iomux subdevices [1].

Applied patches #1, #2 and #7.

Unless LinusW create a topic branch for that dependency, I cannot apply
the rest.

Shawn

> 
> Regards,
> 
> Markus Pargmann
> 
> 
> [1] [PATCH] pinctrl: imx1-core populate subdevices
>     <1384193987-20740-1-git-send-email-mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>     http://thread.gmane.org/gmane.linux.drivers.devicetree/51584
> 
> Changes in v7:
>  - Added patch for imx27-pingrp.h
>  - Pin nodes moved to board dts files
>  - gpio nodes in imx27.dtsi moved to iomux node
> 
> Markus Pargmann (7):
>   ARM: dts: imx27 pin functions
>   ARM: dts: imx27 pingroups
>   ARM: dts: imx27 pinctrl
>   ARM: dts: imx27 phyCARD-S pinctrl
>   ARM: dts: imx27 phycore move uart1 to rdk
>   ARM: dts: imx27 phycore pinctrl
>   ARM: imx27: enable pinctrl
> 
>  arch/arm/boot/dts/imx27-phytec-phycard-s-rdk.dts |  43 ++
>  arch/arm/boot/dts/imx27-phytec-phycard-s-som.dts |  16 +
>  arch/arm/boot/dts/imx27-phytec-phycore-rdk.dts   |  23 +
>  arch/arm/boot/dts/imx27-phytec-phycore-som.dts   |  20 +-
>  arch/arm/boot/dts/imx27-pinfunc.h                | 526 +++++++++++++++++++++++
>  arch/arm/boot/dts/imx27-pingrp.h                 |  71 +++
>  arch/arm/boot/dts/imx27.dtsi                     | 125 +++---
>  arch/arm/mach-imx/Kconfig                        |   2 +
>  8 files changed, 764 insertions(+), 62 deletions(-)
>  create mode 100644 arch/arm/boot/dts/imx27-pinfunc.h
>  create mode 100644 arch/arm/boot/dts/imx27-pingrp.h
> 
> -- 
> 1.8.4.2
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
