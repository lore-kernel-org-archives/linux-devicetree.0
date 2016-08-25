From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 1/2] ARM: dts: sun8i: Add dts file for inet-d978_rev2
 tablets
Date: Thu, 25 Aug 2016 09:35:55 +0200
Message-ID: <20160825073555.GC7776@lukather>
References: <20160823064451.25997-1-icenowy@aosc.xyz>
 <20160823064451.25997-2-icenowy@aosc.xyz>
 <20160824193235.GR8103@lukather> <43601472083053@web23m.yandex.ru>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0930342371254041785=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <43601472083053@web23m.yandex.ru>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============0930342371254041785==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="R+My9LyyhiUvIEro"
Content-Disposition: inline


--R+My9LyyhiUvIEro
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 25, 2016 at 07:57:33AM +0800, Icenowy Zheng wrote:
>=20
>=20
> 25.08.2016, 03:32, "Maxime Ripard" <maxime.ripard@free-electrons.com>:
> > Hi,
> >
> > On Tue, Aug 23, 2016 at 02:44:50PM +0800, Icenowy Zheng wrote:
> >> =A0The inet-d978_rev2 is a pcb used in generic A33 based tablets. It f=
eatures
> >> =A0volume buttons, micro-usb otg, headphone connector and a power butt=
on.
> >>
> >> =A0On the board a Realtek RTL8723BS SDIO Wi-Fi module are soldered, an=
d there
> >> =A0is also a accompanied board which has a Goodix GT9271 soldered.
> >>
> >> =A0As this board is desired to create tablets with a Home key dealed by
> >> =A0GT9271, a LED is present at the front panel at the position of the
> >> =A0Home key.
> >>
> >> =A0Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> >> =A0---
> >> =A0=A0arch/arm/boot/dts/Makefile | 1 +
> >> =A0=A0arch/arm/boot/dts/sun8i-a33-inet-d978-rev2.dts | 87 ++++++++++++=
++++++++++++++
> >> =A0=A02 files changed, 88 insertions(+)
> >> =A0=A0create mode 100644 arch/arm/boot/dts/sun8i-a33-inet-d978-rev2.dts
> >>
> >> =A0diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> >> =A0index faacd52..d1812a0 100644
> >> =A0--- a/arch/arm/boot/dts/Makefile
> >> =A0+++ b/arch/arm/boot/dts/Makefile
> >> =A0@@ -782,6 +782,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0sun8i-a23-q8-tablet.dtb \
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0sun8i-a33-et-q8-v1.6.dtb \
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0sun8i-a33-ga10h-v1.1.dtb \
> >> =A0+ sun8i-a33-inet-d978-rev2.dtb \
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0sun8i-a33-ippo-q8h-v1.2.dtb \
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0sun8i-a33-q8-tablet.dtb \
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0sun8i-a33-sinlinx-sina33.dtb \
> >> =A0diff --git a/arch/arm/boot/dts/sun8i-a33-inet-d978-rev2.dts b/arch/=
arm/boot/dts/sun8i-a33-inet-d978-rev2.dts
> >> =A0new file mode 100644
> >> =A0index 0000000..78823d8
> >> =A0--- /dev/null
> >> =A0+++ b/arch/arm/boot/dts/sun8i-a33-inet-d978-rev2.dts
> >> =A0@@ -0,0 +1,87 @@
> >> =A0+/*
> >> =A0+ * Copyright 2015 Hans de Goede <hdegoede@redhat.com>
> >
> > I guess you are the author too :)
> >
> >> =A0+ *
> >> =A0+ * This file is dual-licensed: you can use it either under the ter=
ms
> >> =A0+ * of the GPL or the X11 license, at your option. Note that this d=
ual
> >> =A0+ * licensing only applies to this file, and not this project as a
> >> =A0+ * whole.
> >> =A0+ *
> >> =A0+ * a) This file is free software; you can redistribute it and/or
> >> =A0+ * modify it under the terms of the GNU General Public License as
> >> =A0+ * published by the Free Software Foundation; either version 2 of =
the
> >> =A0+ * License, or (at your option) any later version.
> >> =A0+ *
> >> =A0+ * This file is distributed in the hope that it will be useful,
> >> =A0+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> >> =A0+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> >> =A0+ * GNU General Public License for more details.
> >> =A0+ *
> >> =A0+ * Or, alternatively,
> >> =A0+ *
> >> =A0+ * b) Permission is hereby granted, free of charge, to any person
> >> =A0+ * obtaining a copy of this software and associated documentation
> >> =A0+ * files (the "Software"), to deal in the Software without
> >> =A0+ * restriction, including without limitation the rights to use,
> >> =A0+ * copy, modify, merge, publish, distribute, sublicense, and/or
> >> =A0+ * sell copies of the Software, and to permit persons to whom the
> >> =A0+ * Software is furnished to do so, subject to the following
> >> =A0+ * conditions:
> >> =A0+ *
> >> =A0+ * The above copyright notice and this permission notice shall be
> >> =A0+ * included in all copies or substantial portions of the Software.
> >> =A0+ *
> >> =A0+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> >> =A0+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> >> =A0+ * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> >> =A0+ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> >> =A0+ * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> >> =A0+ * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> >> =A0+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> >> =A0+ * OTHER DEALINGS IN THE SOFTWARE.
> >> =A0+ */
> >> =A0+
> >> =A0+/dts-v1/;
> >> =A0+#include "sun8i-a33.dtsi"
> >> =A0+#include "sun8i-reference-design-tablet.dtsi"
> >> =A0+
> >> =A0+/ {
> >> =A0+ model =3D "INet-D978 Rev 02";
> >> =A0+ compatible =3D "primux,inet-d978-rev2", "allwinner,sun8i-a33";
> >> =A0+
> >> =A0+ leds {
> >> =A0+ compatible =3D "gpio-leds";
> >> =A0+ pinctrl-names =3D "default";
> >> =A0+ pinctrl-0 =3D <&led_pin_d978>;
> >> =A0+
> >> =A0+ home {
> >> =A0+ label =3D "d978:home";
> >
> > This is not the proper format for the led labels.
> >
> > It's supposed to be <board>:<color>:<function>
>=20
> Thanks.
> So I'd use "d978:blue:home".
>=20
> >
> >> =A0+ gpios =3D <&r_pio 0 5 GPIO_ACTIVE_HIGH>; /* PL5 */
> >> =A0+ };
> >> =A0+ };
> >> =A0+};
> >> =A0+
> >> =A0+&mmc1_pins_a {
> >> =A0+ allwinner,pull =3D <SUN4I_PINCTRL_PULL_UP>;
> >> =A0+};
> >> =A0+
> >> =A0+&mmc1 {
> >> =A0+ pinctrl-names =3D "default";
> >> =A0+ pinctrl-0 =3D <&mmc1_pins_a>;
> >> =A0+ vmmc-supply =3D <&reg_dldo1>;
> >> =A0+ bus-width =3D <4>;
> >> =A0+ non-removable;
> >> =A0+ status =3D "okay";
> >> =A0+
> >> =A0+ rtl8723bs: sdio_wifi@1 {
> >> =A0+ reg =3D <1>;
> >> =A0+ };
> >
> > Don't you need an alias to this node to have the MAC address set?
>=20
> It seems that rtl8723bs come with an eFUSE.

Ok, good to know.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--R+My9LyyhiUvIEro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXvp/bAAoJEBx+YmzsjxAgHF4P/1FOhPMHotVViqu/kAqo0zT1
2UtHwJhGwlwBglt5yk1v4oZuqV2UI++nVcS+unj+P+IiirhdI8Pr0+vF+2nnjSLb
SmHkdk/5EiyehrLUKgHkjWvK0oH5JSvywnRPO01okhTMg2RPnplvQyl5g77yHIP0
JlA0N26cPzk7Cp+fBGfmxfbP9+Q5TcjLlj3GDUejk4q0eScIIb9KLueChey3RqHJ
xO/4QmHK8jdj5kgK/sQIPCUqZsHcEe65Ivc4oQNJQgFVJ4uTl+ZGuAFCSRgqcmwA
BVd81fLsMySe+AZG9jZUzp+3ha+TS2uhdgacsBMNU5yJ3P4Lt6rS2Kxdnk7723/F
inn5yNG1HwD8AUyciqCZyG/RwH3UMfFcVrHdT5hkEjwM9kT/OyANAalY5VWpqG8q
qiYNUkcC4EvafD7qZO7PimNMhLOltoyaLDN89CqcVrM+ALFBr4XQJ0bI7GJafmVJ
oeH5AJo6F5fC5O7FxnSF/vVIP5m2DM8GOiimDG4dTAbtzhWyEJA8s/ZuevRPGEER
tf+4znm27OkImg/Wt8Y6H/grtPpPVULRhLpt1Y6kDr0G1bB6BFBzUuQNU13fOSw2
nDEKj6CLYuHJZiakC6CwEaD80FaEhW1NVBcJoVKGh4buhl4JraiXXDk2JmJIZ5sx
FdfBZ6Br9iwFJW/fYg4y
=ZvBP
-----END PGP SIGNATURE-----

--R+My9LyyhiUvIEro--


--===============0930342371254041785==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0930342371254041785==--
