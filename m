From: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v4 6/7] ARM: dts: imx27 phycore pinctrl
Date: Thu, 24 Oct 2013 11:27:52 +0200
Message-ID: <20131024092752.GB27073@pengutronix.de>
References: <1382601233-24253-1-git-send-email-mpa@pengutronix.de>
 <1382601233-24253-7-git-send-email-mpa@pengutronix.de>
 <1382603424.519504719@f304.i.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1382603424.519504719-uDhCb/4LxRRsdVUOrk1QfQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 24, 2013 at 12:30:24PM +0400, Alexander Shiyan wrote:
> > Enable pinctrl for phycore devices.
> > 
> > Signed-off-by: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > Acked-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ...
> > diff --git a/arch/arm/boot/dts/imx27-phytec-phycore-som.dts b/arch/arm/boot/dts/imx27-phytec-phycore-som.dts
> > index 4ec402c..3dbdb5e 100644
> > --- a/arch/arm/boot/dts/imx27-phytec-phycore-som.dts
> > +++ b/arch/arm/boot/dts/imx27-phytec-phycore-som.dts
> ...
> >  &uart1 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_uart1_1 &pinctrl_uart1_rtscts_1>;
> >  	status = "okay";
> >  };
> 
> No. Please put RTS & CTS pins into RDK. There are no hardware dependencies for SOM.

Okay, I will move both uarts into rdk.

Thanks,

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
