From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv10][ 1/3] ARM i.MX35: build in pinctrl support.
Date: Mon, 13 Jan 2014 12:19:23 +0800
Message-ID: <20140113041921.GK23525@S2101-09.ap.freescale.net>
References: <1389368441-26310-1-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1389368441-26310-1-git-send-email-denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Eric =?iso-8859-1?Q?B=E9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 10, 2014 at 04:40:39PM +0100, Denis Carikli wrote:
> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

This is an invalid email address now.

> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

I'm not sure why we need to bother device tree folks with such a tiny
SoC change.

OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
M:      Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
M:      Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
M:      Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
M:      Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
M:      Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
L:      devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
S:      Maintained
=46:      Documentation/devicetree/
=46:      arch/*/boot/dts/
=46:      include/dt-bindings/

Does arch/arm/mach-imx/Kconfig match any entry above?

Please copy people and lists with some consideration instead of doing
that blindly.

> Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Eric B=E9nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
> ---
> ChangeLog v9->v10:
> - Added Fabio Estevam to the Cc list.
> - Removed the duplicated PINCTRL Kconfig selection for the I.MX35,
>   the remaining PINCTRL Kconfig selection is now ordered alphabetical=
ly.
>=20
> ChangeLog v8->v9:
> - patch refreshed when applying it.
>=20
> ChangeLog v7->v8:
> - The addition of the imx35 pinctrl driver selection in Kconfig that =
was in the
>   patch adding the devicetree support for the imx35 was moved here.
> ---
>  arch/arm/mach-imx/Kconfig |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
> index b0c6eb3..7778b16c 100644
> --- a/arch/arm/mach-imx/Kconfig
> +++ b/arch/arm/mach-imx/Kconfig
> @@ -125,8 +125,9 @@ config SOC_IMX35
>  	select CPU_V6K
>  	select HAVE_EPIT
>  	select MXC_AVIC
> -	select SMP_ON_UP if SMP
>  	select PINCTRL
> +	select PINCTRL_IMX35

While at it, we should drop 'select PINCTRL', since it's been covered b=
y
ARCH_MXC.

I fixed it up and applied the patch.  Thanks.

Shawn

> +	select SMP_ON_UP if SMP
> =20
>  config SOC_IMX5
>  	bool
> --=20
> 1.7.9.5
>=20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
