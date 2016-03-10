From: Julien Chauveau <chauveau.julien-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 6/8] arm64: dts: rockchip: Add power key to GeekBox
Date: Fri, 11 Mar 2016 00:04:09 +0100
Message-ID: <6BD669A2-4971-4702-8742-77C9994AA4E9@gmail.com>
References: <1457294038-14243-1-git-send-email-afaerber@suse.de> <1457294038-14243-7-git-send-email-afaerber@suse.de>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457294038-14243-7-git-send-email-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?Q?Andreas_F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM64 PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


> Le 6 mars 2016 =C3=A0 20:53, Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org> a=
 =C3=A9crit :
>=20
> Signed-off-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
> ---
> v2 -> v3:
> * Adopted wakeup-source instead of gpio-key,wakeup (Julien)
> * Dropped gpio-keys #address-cells and #size-cells properties (Julien=
)
> * Dropped power button reg property (Julien)
> * Adopted KEY_POWER (Julien)
> * Fixed power button pinctrl pull setting (Julien)
>=20
> v2: New
>=20
> arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts | 20 ++++++++++++++++=
++++
> 1 file changed, 20 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts b/arch/a=
rm64/boot/dts/rockchip/rk3368-geekbox.dts
> index 098be3700a6f..7036b49c9206 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts
> @@ -42,6 +42,7 @@
>=20
> /dts-v1/;
> #include "rk3368.dtsi"
> +#include <dt-bindings/input/input.h>
>=20
> / {
> 	model =3D "GeekBox";
> @@ -70,6 +71,19 @@
> 		pinctrl-0 =3D <&ir_int>;
> 	};
>=20
> +	keys: gpio-keys {

I think you don't need the "keys" label, because there=E2=80=99s no pha=
ndle that refers to this.

> +		compatible =3D "gpio-keys";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pwr_key>;
> +
> +		button@0 {

Here you should use "power" instead of "button@0".

> +			gpios =3D <&gpio0 2 GPIO_ACTIVE_LOW>;
> +			label =3D "GPIO Power";
> +			linux,code =3D <KEY_POWER>;

According to Documentation/input/event-codes.txt, there=E2=80=99s a spe=
cial event type for the power button.
Should we use it here for that purpose?

			linux,input-type =3D <EV_PWR>

> +			wakeup-source;
> +		};
> +	};
> +
> 	leds: gpio-leds {
> 		compatible =3D "gpio-leds";
>=20
> @@ -265,6 +279,12 @@
> 		};
> 	};
>=20
> +	keys {
> +		pwr_key: pwr-key {
> +			rockchip,pins =3D <0 2 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> 	pmic {
> 		pmic_sleep: pmic-sleep {
> 			rockchip,pins =3D <0 0 RK_FUNC_2 &pcfg_pull_none>;
> --=20
> 2.6.2
>=20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
