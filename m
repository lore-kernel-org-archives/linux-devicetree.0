From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 1/2] bus: imx-weim: assert GPIO at boot in order to
 connect NOR
Date: Mon, 7 Dec 2015 09:24:40 +0100
Message-ID: <20151207082440.GY11966@pengutronix.de>
References: <1449372657-18496-1-git-send-email-alison_chaiken@mentor.com>
 <1449372657-18496-2-git-send-email-alison_chaiken@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1449372657-18496-2-git-send-email-alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: alchaiken-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Dec 05, 2015 at 07:30:56PM -0800, alchaiken-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: Alison Chaiken <alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> 
> PAD_EIM_D18 must be pulled low at boot in order for the parallel NOR
> connected to the EIM switch to probe properly.  Otherwise
> cfi_qry_present() may return "U-V-]" rather than "Q-R-Y" if the
> PAD_EIM_D18 is high.  Add a nor-gpios property to the nor node in the
> SabreAuto device-tree and add a function to the imx-weim probe to set
> GPIO5 to drive the pad.
> 
> Signed-off-by: Alison Chaiken <alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx6qdl-sabreauto.dtsi |  1 +
>  drivers/bus/imx-weim.c                   | 45 ++++++++++++++++++++++++++++++++
>  2 files changed, 46 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi b/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
> index 8263fc1..530b4d6 100644
> --- a/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
> @@ -625,5 +625,6 @@
>  		bank-width = <2>;
>  		fsl,weim-cs-timing = <0x00620081 0x00000001 0x1c022000
>  				0x0000c000 0x1404a38e 0x00000000>;
> +		nor-gpios = <&gpio5 4 GPIO_ACTIVE_LOW>;
>  	};
>  };

Please do not make board specific and driver specific changes in a
single patch. Also this would need an update to the binding
documentation.

How is this pin connected? Is this a problem of this NOR flash,
something i.MX6 specific or some problem of this particular board?
Depending on the answer we may find a better place to implement the
handling of this gpio. If it's a board problem Markus Pargmanns
gpio-initval series is better suited, if it's a problem of the NOR flash
the parallel NOR flash driver is a better place.

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
