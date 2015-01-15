From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] i.MX6-SabreAuto: EIM: pull PAD_EIM_D18 low for NOR probe
Date: Thu, 15 Jan 2015 08:56:46 +0100
Message-ID: <20150115075646.GM23940@pengutronix.de>
References: <1421278609-8446-1-git-send-email-alison_chaiken@mentor.com>
 <20150115000334.GA9759@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150115000334.GA9759@ld-irv-0074>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: alison-hh6fLRYtCEIS+FvcfC7Uqw@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, shijie8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 14, 2015 at 04:03:34PM -0800, Brian Norris wrote:
> + linux-arm-kernel, maintainers, devicetree
> 
> Shawn, Sascha: should this driver be listed under the Freescale IMX
> MAINTAINERS entry?

This driver is purely i.MX, so yes, that would be good.

> 
> On Wed, Jan 14, 2015 at 03:36:49PM -0800, alison-hh6fLRYtCEIS+FvcfC7Uqw@public.gmane.org wrote:
> > From: Alison Chaiken <alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> > 
> > PAD_EIM_D18 must be pulled low at boot in order for the parallel NOR
> > connected to the EIM switch to probe properly.  Otherwise
> > cfi_qry_present() may return "U-V-]" rather than "Q-R-Y" if the
> > PAD_EIM_D18 is high.  Add a nor-gpios property to the nor node in the
> > SabreAuto device-tree and add a function to the imx-weim probe to set
> > GPIO5 to drive the pad.
> > 
> > Signed-off-by: Alison Chaiken <alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/imx6qdl-sabreauto.dtsi |  1 +
> >  drivers/bus/imx-weim.c                   | 43 ++++++++++++++++++++++++++++++++
> >  2 files changed, 44 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi b/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
> > index 009abd6..dd5e3bc 100644
> > --- a/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
> > +++ b/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
> > @@ -454,5 +454,6 @@
> >  		bank-width = <2>;
> >  		fsl,weim-cs-timing = <0x00620081 0x00000001 0x1c022000
> >  				0x0000c000 0x1404a38e 0x00000000>;
> > +		nor-gpios = <&gpio5 4 GPIO_ACTIVE_LOW>;
> 
> Such a binding needs to be documented. Also, if it's going to be named
> generically like that, it needs to be generically useful and supported
> under MTD code, not platform-specific bus code.
> 
> So what pin is this, exactly? A write-protect pin? An address pin? A
> toaster control, where the toaster is keeping the flash too hot?

Yeah, the gpio should probably be named after the input pin on the flash
where it's connected to. Otherwise people just use this property for any
GPIO they need to put in a certain direction.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
