From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 6/6] ARM: dts: add rk3288 evaluation board
Date: Wed, 16 Jul 2014 23:22:21 +0200
Message-ID: <2347101.iYfkQC2joc@diego>
References: <1471578.ILeMmG2DL6@diego> <2186895.xqgxh7zegl@diego> <CAD=FV=Vo-J2cmyUZfD6KUdvw=5iaCgANsSvaSKfuJRWz1DCCeg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=Vo-J2cmyUZfD6KUdvw=5iaCgANsSvaSKfuJRWz1DCCeg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Eddie Cai <eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 16. Juli 2014, 13:02:53 schrieb Doug Anderson:
> Heiko,
>=20
> On Tue, Jul 15, 2014 at 4:02 PM, Heiko St=FCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wr=
ote:
> > diff --git a/arch/arm/boot/dts/rk3288-evb-rk808.dts
> > b/arch/arm/boot/dts/rk3288-evb-rk808.dts new file mode 100644
> > index 0000000..c168cb2
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/rk3288-evb-rk808.dts
> > @@ -0,0 +1,19 @@
> > +/*
> > + * This program is free software; you can redistribute it and/or m=
odify
> > + * it under the terms of the GNU General Public License as publish=
ed by
> > + * the Free Software Foundation; either version 2 of the License, =
or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +/dts-v1/;
> > +#include "rk3288-evb.dtsi"
> > +
> > +/ {
> > +       compatible =3D "rockchip,rk3288-evb-rk808", "rockchip,rk328=
8";
> > +
>=20
> nit: remove extra blank line?
>=20
> > +};
> > diff --git a/arch/arm/boot/dts/rk3288-evb.dtsi
> > b/arch/arm/boot/dts/rk3288-evb.dtsi new file mode 100644
> > index 0000000..ff642d4
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/rk3288-evb.dtsi
> > @@ -0,0 +1,77 @@
> > +/*
> > + * This program is free software; you can redistribute it and/or m=
odify
> > + * it under the terms of the GNU General Public License as publish=
ed by
> > + * the Free Software Foundation; either version 2 of the License, =
or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#include "rk3288.dtsi"
> > +
> > +/ {
> > +       aliases {
> > +               serial0 =3D &uart0;
> > +               serial1 =3D &uart1;
> > +               serial2 =3D &uart2;
> > +               serial3 =3D &uart3;
> > +               serial4 =3D &uart4;
>=20
> Can the aliases go in the main dtsi?
>=20
> > +       };
> > +
> > +       memory {
> > +               reg =3D <0x0 0x80000000>;
> > +       };
> > +
> > +       soc {
> > +               gpio-keys {
> > +                       compatible =3D "gpio-keys";
> > +                       #address-cells =3D <1>;
> > +                       #size-cells =3D <0>;
> > +                       autorepeat;
>=20
> I would have expected pinctrl for gpio0-5 to make sure pulls are
> enabled / disabled as appropriate.
>=20
> > +
> > +                       button@0 {
> > +                               gpios =3D <&gpio0 5 GPIO_ACTIVE_HIG=
H>;
> > +                               linux,code =3D <116>;
> > +                               label =3D "GPIO Key Power";
> > +                               linux,input-type =3D <1>;
> > +                               gpio-key,wakeup =3D <1>;
> > +                               debounce-interval =3D <100>;
> > +                       };
> > +               };
> > +
> > +               i2c0: i2c@ff650000 {
> > +                       pinctrl-names =3D "default";
> > +                       pinctrl-0 =3D <&i2c0_xfer>;
> > +                       status =3D "okay";
> > +               };
> > +
> > +               watchdog@ff800000 {
> > +                       status =3D "okay";
> > +               };
> > +
> > +               serial@ff180000 {
> > +                       status =3D "okay";
> > +               };
> > +
> > +               serial@ff190000 {
> > +                       status =3D "okay";
> > +               };
> > +
> > +               uart2: serial@ff690000 {
> > +                       pinctrl-names =3D "default";
> > +                       pinctrl-0 =3D <&uart2_xfer>;
>=20
> Why is this pinctrl here?

The other uarts also have rts/cts pins available, but optional it seems=
=2E So my=20
idea was to let the boards decide which pins to use, instead of setting=
 it in=20
the soc-dtsi.

Other opinions? :-)


>=20
> > +                       status =3D "okay";
> > +               };

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
