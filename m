From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: aspeed: Remove undocumented wdt properties
Date: Wed, 04 Oct 2017 21:44:18 +1030
Message-ID: <1507115658.5452.32.camel@aj.id.au>
References: <20171004091635.12499-1-joel@jms.id.au>
         <20171004091635.12499-2-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-324F2hv2QDRLq7TZc0Z+"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171004091635.12499-2-joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg-Bxea+6Xhats@public.gmane.org>, linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--=-324F2hv2QDRLq7TZc0Z+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-10-04 at 19:46 +1030, Joel Stanley wrote:
> The watchdog bindings do not describe an interrupt property nor clock
> phandle, and the upstream driver never had code to use them. Drop them
> from the device tree.
>=C2=A0
> Also rename the node from wdt the more commonly used watchdog.
>=C2=A0
> Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>

Reviewed-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>

> ---
> =C2=A0arch/arm/boot/dts/aspeed-g4.dtsi | 7 ++-----
> =C2=A0arch/arm/boot/dts/aspeed-g5.dtsi | 8 +++-----
> =C2=A02 files changed, 5 insertions(+), 10 deletions(-)
>=C2=A0
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-=
g4.dtsi
> index e455bd236798..5be2e6a39917 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -204,17 +204,14 @@
> =C2=A0				status =3D "disabled";
> =C2=A0			};
> =C2=A0
> -			wdt1: wdt@1e785000 {
> +			wdt1: watchdog@1e785000 {
> =C2=A0				compatible =3D "aspeed,ast2400-wdt";
> =C2=A0				reg =3D <0x1e785000 0x1c>;
> -				interrupts =3D <27>;
> =C2=A0			};
> =C2=A0
> -			wdt2: wdt@1e785020 {
> +			wdt2: watchdog@1e785020 {
> =C2=A0				compatible =3D "aspeed,ast2400-wdt";
> =C2=A0				reg =3D <0x1e785020 0x1c>;
> -				interrupts =3D <27>;
> -				clocks =3D <&clk_apb>;
> =C2=A0				status =3D "disabled";
> =C2=A0			};
> =C2=A0
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-=
g5.dtsi
> index 77dded187d5a..71e1264b81aa 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -248,20 +248,18 @@
> =C2=A0				status =3D "disabled";
> =C2=A0			};
> =C2=A0
> -			wdt1: wdt@1e785000 {
> +			wdt1: watchdog@1e785000 {
> =C2=A0				compatible =3D "aspeed,ast2500-wdt";
> =C2=A0				reg =3D <0x1e785000 0x20>;
> -				interrupts =3D <27>;
> =C2=A0			};
> =C2=A0
> -			wdt2: wdt@1e785020 {
> +			wdt2: watchdog@1e785020 {
> =C2=A0				compatible =3D "aspeed,ast2500-wdt";
> =C2=A0				reg =3D <0x1e785020 0x20>;
> -				interrupts =3D <27>;
> =C2=A0				status =3D "disabled";
> =C2=A0			};
> =C2=A0
> -			wdt3: wdt@1e785040 {
> +			wdt3: watchdog@1e785040 {
> =C2=A0				compatible =3D "aspeed,ast2500-wdt";
> =C2=A0				reg =3D <0x1e785040 0x20>;
> =C2=A0				status =3D "disabled";
--=-324F2hv2QDRLq7TZc0Z+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1MKKAAoJEJ0dnzgO5LT56mUP/Ahy6kILllEcrlf7aQ4yS5Ii
y3NaCa7dvOuL7TlZwWJWrUqt2sTW/AFIIeqjpaWZDZ0mLlere+9h3fMxkvHoQWg7
d6hTBEFX5xTE42AEL4WBITL7q7mF+hQxaKgyScKSW8ejJNI2vdRtYEYanOfMrHw/
ERsq5tY83WXqVbdNoy8+jwpxvx5AK1khrrQblf/wvo42Yyv0UKU4DgkHqzIw6a+1
zsAlp40iQLJSL5K4b1dZsvDXgd1HntFFFHNVhz9hlnopwMZX/dmNwU3s/hLxAFrj
85QpxAwaFxwFCW9gFfk3Y2xB9ybaGHd4HD+HASZlNkFdxI9DoBqFt9xDp5MGeZxf
zEpOAcj2d6FPdgElFCnK2fK/jxpAPWTK9NHk/9RYftpvTlrpAcz0QwkejC4P8DnD
JmjwluYbEDHXhGfPCC31K0gI6cZrafPEfWxmu5G6t1QOn8b8lQHXFBa1I/OvW2NY
LPEyye/oDRzGhlXaXHL89VfnytCyQCgvsmMHN1xhRp26yK/wgw2smGVo9SbFqOmX
8DwMPMHcykWLTGClomUOXzyLdBDx148eGWbUgr5vMf70oLSiGO7mGiLqty6RYooy
lPBJE/ifzBv6BfPoyC0oUpaIC3qcSYuJ3tIvxlwewZXbkMLgALGmkUckrMZmZ5WB
jUk83aQCqkAVDU/WDtat
=8NGx
-----END PGP SIGNATURE-----

--=-324F2hv2QDRLq7TZc0Z+--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
