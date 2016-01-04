From: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: rockchip: Adding LEDs handling via
 leds-gpio for the Radxa Rock2 Square
Date: Mon, 04 Jan 2016 10:10:29 +0100
Message-ID: <1451898629.3269.11.camel@collabora.co.uk>
References: <1451553232-2533-1-git-send-email-romain.perier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1451553232-2533-1-git-send-email-romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2015-12-31 at 10:13 +0100, Romain Perier wrote:
> Describe the two user-controllable LEDs on Rock2 Square boards.
> All information have been retrieved from the schematics and the
> vendor
> devicetree. The default-triggers mimic the behaviour of the vendor-
> kernel to
> keep functionalities in sync.
>=20
> Signed-off-by: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Reviewed-by: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>

> ---
>=20
> Changes in v2:
> - Changed labels according to what is defined in the schematics
> - Added a long commit message describing this patch in details
>=20
> =C2=A0arch/arm/boot/dts/rk3288-rock2-square.dts | 17 ++++++++++++++++=
+
> =C2=A01 file changed, 17 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/rk3288-rock2-square.dts
> b/arch/arm/boot/dts/rk3288-rock2-square.dts
> index c5453a0..0813428 100644
> --- a/arch/arm/boot/dts/rk3288-rock2-square.dts
> +++ b/arch/arm/boot/dts/rk3288-rock2-square.dts
> @@ -56,6 +56,23 @@
> =C2=A0		pinctrl-0 =3D <&ir_int>;
> =C2=A0	};
> =C2=A0
> +	gpio-leds {
> +		compatible =3D "gpio-leds";
> +
> +		heartbeat {
> +			gpios =3D <&gpio7 15 GPIO_ACTIVE_LOW>;
> +			label =3D "rock2:green:state1";
> +			linux,default-trigger =3D "heartbeat";
> +		};
> +
> +		mmc {
> +			gpios =3D <&gpio0 11 GPIO_ACTIVE_LOW>;
> +			label =3D "rock2:blue:state2";
> +			linux,default-trigger =3D "mmc0";
> +		};
> +	};
> +
> +
> =C2=A0	sound {
> =C2=A0		compatible =3D "simple-audio-card";
> =C2=A0		simple-audio-card,name =3D "SPDIF";

--=20
Sjoerd Simons
Collabora Ltd.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
