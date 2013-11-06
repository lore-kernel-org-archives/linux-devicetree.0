From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 0/8] ARM: imx27 pinctrl
Date: Wed, 6 Nov 2013 21:27:18 +0800
Message-ID: <20131106132633.GB4352@S2101-09.ap.freescale.net>
References: <1382950843-26066-1-git-send-email-mpa@pengutronix.de>
 <20131106124906.GG15098@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131106124906.GG15098-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 06, 2013 at 01:49:06PM +0100, Markus Pargmann wrote:
> > Markus Pargmann (8):
> >   pinctrl: imx1 core driver
> >   pinctrl: imx27: imx27 pincontrol driver
> >   ARM: dts: imx27 pin functions
> >   ARM: dts: imx27 pinctrl
> >   ARM: dts: imx27 phyCARD-S pinctrl
> >   ARM: dts: imx27 phycore move uart1 to rdk
> >   ARM: dts: imx27 phycore pinctrl
> >   ARM: imx27: enable pinctrl
> 
> Linus applied the first two patches. Could you take the others?

Oh, we just changed all IMX dts pinctrl nodes to be board specific with
series [1], which is now available on branch below.  Can you please
respin your patches to use the new approach?

  git://git.linaro.org/people/shawnguo/linux-2.6.git for-next

Shawn

[1] http://thread.gmane.org/gmane.linux.ports.arm.kernel/277649

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
