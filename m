From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v2 11/11] arm64: allwinner: a64: enable
 Wi-Fi for Pine64
Date: Fri, 14 Apr 2017 18:56:16 +0200
Message-ID: <e51897d2-aa9d-1f4b-3fe0-e88246a9e438@suse.de>
References: <20170407183441.58750-1-icenowy@aosc.io>
 <20170407183441.58750-12-icenowy@aosc.io>
Reply-To: afaerber-l3A5Bk7waGM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCHMD3URUQDBBNP6YPDQKGQEV6TBXDI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170407183441.58750-12-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Am 07.04.2017 um 20:34 schrieb Icenowy Zheng:
> The Wi-Fi modules of Pine64 is powered via DLDO4 and ELDO1 (the latter

"modules ... are" or "module ... is"

> one provides I/O voltage).
>=20
> Add device node for it.
>=20
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts | 16 +++++++++++++++=
+
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts b/arch/a=
rm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> index 7da074f95065..9d90bb32aa87 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> @@ -64,6 +64,11 @@
>  		regulator-min-microvolt =3D <3300000>;
>  		regulator-max-microvolt =3D <3300000>;
>  	};
> +
> +	wifi_pwrseq: wifi_pwrseq {
> +		compatible =3D "mmc-pwrseq-simple";
> +		reset-gpios =3D <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2 */
> +	};
>  };
> =20
>  &ehci1 {
> @@ -91,6 +96,17 @@
>  	status =3D "okay";
>  };
> =20
> +&mmc1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc1_pins>;
> +	vmmc-supply =3D <&reg_dldo4>;
> +	vqmmc-supply =3D <&reg_eldo1>;
> +	mmc-pwrseq =3D <&wifi_pwrseq>;
> +	non-removable;
> +	bus-width =3D <4>;
> +	status =3D "okay";
> +};

As you mention above, Wi-Fi is a module, so may be absent. Is it really
correct to enable this node and hardcode a certain power sequence? In
theory other modules could be attached.

To me that calls for an overlay instead.

> +
>  &ohci1 {
>  	status =3D "okay";
>  };

Regards,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton
HRB 21284 (AG N=C3=BCrnberg)

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
