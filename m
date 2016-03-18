From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: rockchip: Add mdio node to ethernet node
Date: Fri, 18 Mar 2016 22:34:07 +0100
Message-ID: <56EC744F.90308@suse.de>
References: <1458300056-6174-1-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458300056-6174-1-git-send-email-tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 18.03.2016 um 12:20 schrieb Tomeu Vizoso:
> So the dwmac device manages to probe again.
>=20
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> Fixes: 88f8b1bb41c6 ("stmmac: Fix 'eth0: No PHY found' regression")
> ---
>  arch/arm/boot/dts/rk3288-rock2-som.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/rk3288-rock2-som.dtsi b/arch/arm/boot/=
dts/rk3288-rock2-som.dtsi
> index 1ece66f3e162..4ba7ddecb478 100644
> --- a/arch/arm/boot/dts/rk3288-rock2-som.dtsi
> +++ b/arch/arm/boot/dts/rk3288-rock2-som.dtsi
> @@ -101,6 +101,14 @@
>  	snps,reset-delays-us =3D <0 10000 30000>;
>  	rx_delay =3D <0x10>;
>  	tx_delay =3D <0x30>;
> +	mdio0 {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		compatible =3D "snps,dwmac-mdio";
> +		ethphy1: ethernet-phy@1 {
> +			reg =3D <1>;
> +		};
> +	};

This is a) ugly for lack of white lines in between, b) unnecessary sinc=
e
this is being fixed in the stmmac driver where it will benefit more tha=
n
just this one SoM.

Regards,
Andreas

>  };
> =20
>  &i2c0 {

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer, Jane Smithard, Graham Norton; HRB 21284 (AG N=FC=
rnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
