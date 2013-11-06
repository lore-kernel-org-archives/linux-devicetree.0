From: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v6 0/8] ARM: imx27 pinctrl
Date: Wed, 6 Nov 2013 13:49:06 +0100
Message-ID: <20131106124906.GG15098@pengutronix.de>
References: <1382950843-26066-1-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1382950843-26066-1-git-send-email-mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Shawn,

On Mon, Oct 28, 2013 at 10:00:35AM +0100, Markus Pargmann wrote:
> Hi,
> 
> v6 updates the binding documentation.
> 
> this series implements a imx27 pinctrl driver. imx1/21/27 have a register
> format that is not compatible with the rest of imx series processors. The
> series adds a imx1 core driver for the different register layout.
> 
> Regards,
> 
> Markus
> 
> 
> Markus Pargmann (8):
>   pinctrl: imx1 core driver
>   pinctrl: imx27: imx27 pincontrol driver
>   ARM: dts: imx27 pin functions
>   ARM: dts: imx27 pinctrl
>   ARM: dts: imx27 phyCARD-S pinctrl
>   ARM: dts: imx27 phycore move uart1 to rdk
>   ARM: dts: imx27 phycore pinctrl
>   ARM: imx27: enable pinctrl

Linus applied the first two patches. Could you take the others?

Thanks,

Markus Pargmann

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
