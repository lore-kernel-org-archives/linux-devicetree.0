From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv10][ 4/7] pinctrl: pinctrl-imx: add imx25 pinctrl driver
Date: Tue, 5 Nov 2013 20:22:52 +0800
Message-ID: <20131105122250.GO19770@S2101-09.ap.freescale.net>
References: <1383647918-27315-1-git-send-email-denis@eukrea.com>
 <1383647918-27315-4-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1383647918-27315-4-git-send-email-denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Eric =?iso-8859-1?Q?B=E9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 05, 2013 at 11:38:35AM +0100, Denis Carikli wrote:
>  .../bindings/pinctrl/fsl,imx25-pinctrl.txt         |   33 ++

>  arch/arm/boot/dts/imx25-pinfunc.h                  |  513 ++++++++++++++++++++
>  arch/arm/boot/dts/imx25-pingrp.h                   |   79 +++
>  arch/arm/boot/dts/imx25.dtsi                       |    1 +

Unless Linus gives his ACK on the patch to have it go via IMX tree, we
need to split above 3 files into another patch that we can apply on IMX
tree, because other patches e.g. the last one in the series depends on
them.

BTW, it seems that you missed the comments that Sascha and Markus put on
the v9 of the patch.

Shawn

>  drivers/pinctrl/Kconfig                            |    9 +
>  drivers/pinctrl/Makefile                           |    1 +
>  drivers/pinctrl/pinctrl-imx25.c                    |  351 ++++++++++++++
>  7 files changed, 987 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx25-pinctrl.txt
>  create mode 100644 arch/arm/boot/dts/imx25-pinfunc.h
>  create mode 100644 arch/arm/boot/dts/imx25-pingrp.h
>  create mode 100644 drivers/pinctrl/pinctrl-imx25.c

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
