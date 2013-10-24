From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 0/7] ARM: imx27 pinctrl
Date: Thu, 24 Oct 2013 16:35:52 +0800
Message-ID: <20131024083550.GC13614@S2101-09.ap.freescale.net>
References: <1382601233-24253-1-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1382601233-24253-1-git-send-email-mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Linus,

On Thu, Oct 24, 2013 at 09:53:46AM +0200, Markus Pargmann wrote:
> Markus Pargmann (7):
>   pinctrl: imx1 core driver
>   pinctrl: imx27: imx27 pincontrol driver

Is it still possible to queue these two patches for 3.13 merge window,
so that we get imx27 device tree machine work on 3.13-rc?

Shawn

>   ARM: dts: imx27 pin functions
>   ARM: dts: imx27 pinctrl
>   ARM: dts: imx27 phyCARD-S pinctrl
>   ARM: dts: imx27 phycore pinctrl
>   ARM: imx27: enable pinctrl
> 
>  .../bindings/pinctrl/fsl,imx27-pinctrl.txt         |  50 ++
>  arch/arm/boot/dts/imx27-phytec-phycard-s-rdk.dts   |  10 +
>  arch/arm/boot/dts/imx27-phytec-phycard-s-som.dts   |   4 +
>  arch/arm/boot/dts/imx27-phytec-phycore-rdk.dts     |   2 +
>  arch/arm/boot/dts/imx27-phytec-phycore-som.dts     |   6 +
>  arch/arm/boot/dts/imx27-pinfunc.h                  | 524 +++++++++++++++++
>  arch/arm/boot/dts/imx27.dtsi                       | 102 ++++
>  arch/arm/mach-imx/Kconfig                          |   2 +
>  drivers/pinctrl/Kconfig                            |  13 +
>  drivers/pinctrl/Makefile                           |   2 +
>  drivers/pinctrl/pinctrl-imx1-core.c                | 653 +++++++++++++++++++++
>  drivers/pinctrl/pinctrl-imx1.h                     |  73 +++
>  drivers/pinctrl/pinctrl-imx27.c                    | 477 +++++++++++++++
>  13 files changed, 1918 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx27-pinctrl.txt
>  create mode 100644 arch/arm/boot/dts/imx27-pinfunc.h
>  create mode 100644 drivers/pinctrl/pinctrl-imx1-core.c
>  create mode 100644 drivers/pinctrl/pinctrl-imx1.h
>  create mode 100644 drivers/pinctrl/pinctrl-imx27.c
> 
> -- 
> 1.8.4.rc3
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
