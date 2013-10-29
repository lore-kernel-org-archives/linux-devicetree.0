From: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v6 1/8] pinctrl: imx1 core driver
Date: Tue, 29 Oct 2013 16:10:06 +0100
Message-ID: <20131029151006.GD20839@pengutronix.de>
References: <1382950843-26066-1-git-send-email-mpa@pengutronix.de>
 <1382950843-26066-2-git-send-email-mpa@pengutronix.de>
 <CACRpkdZZhwYtvki-2AQFOSND4BQmOenZb6sSm2tOpQUYWwETgA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZZhwYtvki-2AQFOSND4BQmOenZb6sSm2tOpQUYWwETgA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 29, 2013 at 02:55:56PM +0100, Linus Walleij wrote:
> On Mon, Oct 28, 2013 at 10:00 AM, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> 
> > Core driver for register formats of imx1/imx21/imx27 processors.
> >
> > The pins of those processors are grouped into ports. Each port has 32
> > pins. The pins mux configuration is controlled by registers with 1 or 2
> > bit per pin, depending on the specific control register.
> >
> > Signed-off-by: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > Acked-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > Acked-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> Allright, as it is a new driver and I feel sorry for it being stuck in
> DT review limbo, patch applied.

Thanks for applying.

Markus

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
