From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v2 06/10] ARM64: dts: rockchip: Add IR receiver to GeekBox
Date: Tue, 9 Feb 2016 04:08:23 +0100
Message-ID: <56B95827.7060204@suse.de>
References: <1454897859-7601-1-git-send-email-afaerber@suse.de>
 <1454897859-7601-7-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454897859-7601-7-git-send-email-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, DT <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am 08.02.2016 um 03:17 schrieb Andreas F=C3=A4rber:
> Signed-off-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
> ---
>  v2: New
> =20
>  arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts b/arch/a=
rm64/boot/dts/rockchip/rk3368-geekbox.dts
> index e4523a74050f..e84383fd6f10 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts
> @@ -63,6 +63,13 @@
>  		#clock-cells =3D <0>;
>  	};
> =20
> +	ir: ir-receiver {
> +		compatible =3D "gpio-ir-receiver";
> +		gpios =3D <&gpio3 30 GPIO_ACTIVE_LOW>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&ir_int>;

		status =3D "disabled";

Should only be enabled in the new Landingship config. Will fix.

Andreas

P.S. See Heiko, two bugs in the new nodes already, glad I have them
separate. :)

> +	};
> +
>  	leds: gpio-leds {
>  		compatible =3D "gpio-leds";
> =20
[snip]

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton; HRB 21284 (AG=
 N=C3=BCrnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
