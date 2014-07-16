From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 6/6] ARM: dts: add rk3288 evaluation board
Date: Wed, 16 Jul 2014 13:02:53 -0700
Message-ID: <CAD=FV=Vo-J2cmyUZfD6KUdvw=5iaCgANsSvaSKfuJRWz1DCCeg@mail.gmail.com>
References: <1471578.ILeMmG2DL6@diego>
	<2186895.xqgxh7zegl@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2186895.xqgxh7zegl@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Eddie Cai <eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Heiko,

On Tue, Jul 15, 2014 at 4:02 PM, Heiko St=C3=BCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> w=
rote:
> diff --git a/arch/arm/boot/dts/rk3288-evb-rk808.dts b/arch/arm/boot/d=
ts/rk3288-evb-rk808.dts
> new file mode 100644
> index 0000000..c168cb2
> --- /dev/null
> +++ b/arch/arm/boot/dts/rk3288-evb-rk808.dts
> @@ -0,0 +1,19 @@
> +/*
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +/dts-v1/;
> +#include "rk3288-evb.dtsi"
> +
> +/ {
> +       compatible =3D "rockchip,rk3288-evb-rk808", "rockchip,rk3288"=
;
> +

nit: remove extra blank line?

> +};
> diff --git a/arch/arm/boot/dts/rk3288-evb.dtsi b/arch/arm/boot/dts/rk=
3288-evb.dtsi
> new file mode 100644
> index 0000000..ff642d4
> --- /dev/null
> +++ b/arch/arm/boot/dts/rk3288-evb.dtsi
> @@ -0,0 +1,77 @@
> +/*
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include "rk3288.dtsi"
> +
> +/ {
> +       aliases {
> +               serial0 =3D &uart0;
> +               serial1 =3D &uart1;
> +               serial2 =3D &uart2;
> +               serial3 =3D &uart3;
> +               serial4 =3D &uart4;

Can the aliases go in the main dtsi?

> +       };
> +
> +       memory {
> +               reg =3D <0x0 0x80000000>;
> +       };
> +
> +       soc {
> +               gpio-keys {
> +                       compatible =3D "gpio-keys";
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       autorepeat;

I would have expected pinctrl for gpio0-5 to make sure pulls are
enabled / disabled as appropriate.

> +
> +                       button@0 {
> +                               gpios =3D <&gpio0 5 GPIO_ACTIVE_HIGH>=
;
> +                               linux,code =3D <116>;
> +                               label =3D "GPIO Key Power";
> +                               linux,input-type =3D <1>;
> +                               gpio-key,wakeup =3D <1>;
> +                               debounce-interval =3D <100>;
> +                       };
> +               };
> +
> +               i2c0: i2c@ff650000 {
> +                       pinctrl-names =3D "default";
> +                       pinctrl-0 =3D <&i2c0_xfer>;
> +                       status =3D "okay";
> +               };
> +
> +               watchdog@ff800000 {
> +                       status =3D "okay";
> +               };
> +
> +               serial@ff180000 {
> +                       status =3D "okay";
> +               };
> +
> +               serial@ff190000 {
> +                       status =3D "okay";
> +               };
> +
> +               uart2: serial@ff690000 {
> +                       pinctrl-names =3D "default";
> +                       pinctrl-0 =3D <&uart2_xfer>;

Why is this pinctrl here?

> +                       status =3D "okay";
> +               };
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
