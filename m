From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx6qdl-sabresd.dtsi: Add heartbeat led
Date: Wed, 5 Mar 2014 14:22:19 +0800
Message-ID: <20140305062216.GI8784@S2101-09.ap.freescale.net>
References: <1393943685-32579-1-git-send-email-vincent.stehle@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1393943685-32579-1-git-send-email-vincent.stehle-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vincent =?iso-8859-1?Q?Stehl=E9?= <vincent.stehle-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 04, 2014 at 03:34:45PM +0100, Vincent Stehl=E9 wrote:
> Use the red gpio led for heartbeat.

Some people think it's annoying to have a LED blinking all the time.
Since it's a user defined LED, let's leave it to users for their
particular use case.

Shawn

>=20
> Signed-off-by: Vincent Stehl=E9 <vincent.stehle-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>=20
> Hi,
>=20
> This has been tested on Sabre SD i.MX6 Quad board, with linux v3.14-r=
c5+ and
> imx_v6_v7_defconfig.
>=20
> As a side note, checkpatch.pl complains about gpio-leds being undocum=
ented, but
> I am not sure what to do about that.
>=20
> Best regards,
>=20
> V.
>=20
>  arch/arm/boot/dts/imx6qdl-sabresd.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi b/arch/arm/boot/d=
ts/imx6qdl-sabresd.dtsi
> index e75e11b..cf4d736 100644
> --- a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> @@ -88,6 +88,16 @@
>  		default-brightness-level =3D <7>;
>  		status =3D "okay";
>  	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		heartbeat-led {
> +		        label =3D "Heartbeat";
> +		        gpios =3D <&gpio1 2 0>;
> +		        linux,default-trigger =3D "heartbeat";
> +		};
> +	};
>  };
> =20
>  &audmux {
> @@ -182,6 +192,7 @@
>  				MX6QDL_PAD_ENET_TXD1__GPIO1_IO29 0x80000000
>  				MX6QDL_PAD_EIM_D22__GPIO3_IO22  0x80000000
>  				MX6QDL_PAD_ENET_CRS_DV__GPIO1_IO25 0x80000000
> +				MX6QDL_PAD_GPIO_2__GPIO1_IO02 0x80000000
>  			>;
>  		};
>  	};
> --=20
> 1.9.0
>=20
>=20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
