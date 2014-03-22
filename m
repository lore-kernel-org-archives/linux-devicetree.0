From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 1/5] ARM: dts: tx53: remove redundant regulator-boot-on
Date: Sat, 22 Mar 2014 14:47:48 +0800
Message-ID: <20140322064747.GD5938@dragon>
References: <1395235721-13847-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1395235721-13847-1-git-send-email-LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 19, 2014 at 02:28:37PM +0100, Lothar Wa=DFmann wrote:
>=20
> Signed-off-by: Lothar Wa=DFmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>

Please add something in the commit log, e.g. why regulator-boot-on is
redundant in this case.

Shawn

> ---
>  arch/arm/boot/dts/imx53-tx53-x13x.dts |    2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/imx53-tx53-x13x.dts b/arch/arm/boot/dt=
s/imx53-tx53-x13x.dts
> index 6480471..c8a3473 100644
> --- a/arch/arm/boot/dts/imx53-tx53-x13x.dts
> +++ b/arch/arm/boot/dts/imx53-tx53-x13x.dts
> @@ -72,7 +72,6 @@
>  			regulator-max-microvolt =3D <3300000>;
>  			gpio =3D <&gpio3 29 GPIO_ACTIVE_HIGH>;
>  			enable-active-high;
> -			regulator-boot-on;
>  		};
> =20
>  		reg_lcd_pwr1: regulator@6 {
> @@ -83,7 +82,6 @@
>  			regulator-max-microvolt =3D <3300000>;
>  			gpio =3D <&gpio2 31 GPIO_ACTIVE_HIGH>;
>  			enable-active-high;
> -			regulator-boot-on;
>  		};
>  	};
>  };
> --=20
> 1.7.10.4
>=20
>=20
>=20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
