From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: Re: [PATCH v2 8/9] ARM: dts: aspeed: Correctly order UART nodes
Date: Thu, 05 Oct 2017 10:07:17 +1030
Message-ID: <1507160237.5452.36.camel@aj.id.au>
References: <20171004064917.2498-1-joel@jms.id.au>
         <20171004064917.2498-9-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-kpePkbEez3SCfCY8iAzY"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171004064917.2498-9-joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rick Altherr <raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg-Bxea+6Xhats@public.gmane.org>, linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--=-kpePkbEez3SCfCY8iAzY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-10-04 at 17:19 +1030, Joel Stanley wrote:
> Order them all by address.
>=20
> Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>

Reviewed-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>

> ---
> =C2=A0arch/arm/boot/dts/aspeed-g4.dtsi | 48 +++++++++++++++--------------=
-
> -
> =C2=A0arch/arm/boot/dts/aspeed-g5.dtsi | 61 ++++++++++++++++++++--------
> ------------
> =C2=A02 files changed, 54 insertions(+), 55 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi
> b/arch/arm/boot/dts/aspeed-g4.dtsi
> index a549413bda3f..4125e07f22f9 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -183,6 +183,27 @@
> =C2=A0				clock-names =3D "PCLK";
> =C2=A0			};
> =C2=A0
> +			uart1: serial@1e783000 {
> +				compatible =3D "ns16550a";
> +				reg =3D <0x1e783000 0x1000>;
> +				reg-shift =3D <2>;
> +				interrupts =3D <9>;
> +				clocks =3D <&clk_uart>;
> +				no-loopback-test;
> +				status =3D "disabled";
> +			};
> +
> +			uart5: serial@1e784000 {
> +				compatible =3D "ns16550a";
> +				reg =3D <0x1e784000 0x1000>;
> +				reg-shift =3D <2>;
> +				interrupts =3D <10>;
> +				clocks =3D <&clk_uart>;
> +				current-speed =3D <38400>;
> +				no-loopback-test;
> +				status =3D "disabled";
> +			};
> +
> =C2=A0			wdt1: wdt@1e785000 {
> =C2=A0				compatible =3D "aspeed,ast2400-wdt";
> =C2=A0				reg =3D <0x1e785000 0x1c>;
> @@ -197,11 +218,11 @@
> =C2=A0				status =3D "disabled";
> =C2=A0			};
> =C2=A0
> -			uart1: serial@1e783000 {
> +			uart6: serial@1e787000 {
> =C2=A0				compatible =3D "ns16550a";
> -				reg =3D <0x1e783000 0x1000>;
> +				reg =3D <0x1e787000 0x1000>;
> =C2=A0				reg-shift =3D <2>;
> -				interrupts =3D <9>;
> +				interrupts =3D <10>;
> =C2=A0				clocks =3D <&clk_uart>;
> =C2=A0				no-loopback-test;
> =C2=A0				status =3D "disabled";
> @@ -237,27 +258,6 @@
> =C2=A0				status =3D "disabled";
> =C2=A0			};
> =C2=A0
> -			uart5: serial@1e784000 {
> -				compatible =3D "ns16550a";
> -				reg =3D <0x1e784000 0x1000>;
> -				reg-shift =3D <2>;
> -				interrupts =3D <10>;
> -				clocks =3D <&clk_uart>;
> -				current-speed =3D <38400>;
> -				no-loopback-test;
> -				status =3D "disabled";
> -			};
> -
> -			uart6: serial@1e787000 {
> -				compatible =3D "ns16550a";
> -				reg =3D <0x1e787000 0x1000>;
> -				reg-shift =3D <2>;
> -				interrupts =3D <10>;
> -				clocks =3D <&clk_uart>;
> -				no-loopback-test;
> -				status =3D "disabled";
> -			};
> -
> =C2=A0			i2c: i2c@1e78a000 {
> =C2=A0				compatible =3D "simple-bus";
> =C2=A0				#address-cells =3D <1>;
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi
> b/arch/arm/boot/dts/aspeed-g5.dtsi
> index de2dafa71651..61cc2d25143a 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -227,6 +227,26 @@
> =C2=A0				clock-names =3D "PCLK";
> =C2=A0			};
> =C2=A0
> +			uart1: serial@1e783000 {
> +				compatible =3D "ns16550a";
> +				reg =3D <0x1e783000 0x1000>;
> +				reg-shift =3D <2>;
> +				interrupts =3D <9>;
> +				clocks =3D <&clk_uart>;
> +				no-loopback-test;
> +				status =3D "disabled";
> +			};
> +
> +			uart5: serial@1e784000 {
> +				compatible =3D "ns16550a";
> +				reg =3D <0x1e784000 0x1000>;
> +				reg-shift =3D <2>;
> +				interrupts =3D <10>;
> +				clocks =3D <&clk_uart>;
> +				current-speed =3D <38400>;
> +				no-loopback-test;
> +				status =3D "disabled";
> +			};
> =C2=A0
> =C2=A0			wdt1: wdt@1e785000 {
> =C2=A0				compatible =3D "aspeed,ast2500-wdt";
> @@ -247,16 +267,6 @@
> =C2=A0				status =3D "disabled";
> =C2=A0			};
> =C2=A0
> -			uart1: serial@1e783000 {
> -				compatible =3D "ns16550a";
> -				reg =3D <0x1e783000 0x1000>;
> -				reg-shift =3D <2>;
> -				interrupts =3D <9>;
> -				clocks =3D <&clk_uart>;
> -				no-loopback-test;
> -				status =3D "disabled";
> -			};
> -
> =C2=A0			lpc: lpc@1e789000 {
> =C2=A0				compatible =3D "aspeed,ast2500-lpc",
> "simple-mfd";
> =C2=A0				reg =3D <0x1e789000 0x1000>;
> @@ -287,6 +297,16 @@
> =C2=A0				};
> =C2=A0			};
> =C2=A0
> +			uart6: serial@1e787000 {
> +				compatible =3D "ns16550a";
> +				reg =3D <0x1e787000 0x1000>;
> +				reg-shift =3D <2>;
> +				interrupts =3D <10>;
> +				clocks =3D <&clk_uart>;
> +				no-loopback-test;
> +				status =3D "disabled";
> +			};
> +
> =C2=A0			uart2: serial@1e78d000 {
> =C2=A0				compatible =3D "ns16550a";
> =C2=A0				reg =3D <0x1e78d000 0x1000>;
> @@ -317,27 +337,6 @@
> =C2=A0				status =3D "disabled";
> =C2=A0			};
> =C2=A0
> -			uart5: serial@1e784000 {
> -				compatible =3D "ns16550a";
> -				reg =3D <0x1e784000 0x1000>;
> -				reg-shift =3D <2>;
> -				interrupts =3D <10>;
> -				clocks =3D <&clk_uart>;
> -				current-speed =3D <38400>;
> -				no-loopback-test;
> -				status =3D "disabled";
> -			};
> -
> -			uart6: serial@1e787000 {
> -				compatible =3D "ns16550a";
> -				reg =3D <0x1e787000 0x1000>;
> -				reg-shift =3D <2>;
> -				interrupts =3D <10>;
> -				clocks =3D <&clk_uart>;
> -				no-loopback-test;
> -				status =3D "disabled";
> -			};
> -
> =C2=A0			i2c: i2c@1e78a000 {
> =C2=A0				compatible =3D "simple-bus";
> =C2=A0				#address-cells =3D <1>;
--=-kpePkbEez3SCfCY8iAzY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1XCtAAoJEJ0dnzgO5LT58UQP/RR+iylzTbZtarl+xuzNsB91
u7GmgFUmXmpAjY9HSgiZQH2eGX6Aw2YoYAMC65m07xErrPAkGAY+HqkJAB2WFl2D
wpqiwz9u6JUNi+G4CLldjVtR03XFTulBDxcnO3CRgYJJtW8NmP0QoEoIMRM9ooAc
YDgpxOGf80VwwcjJYME8NpBdEVlkNfJ/XVph7zbA4kJmZa4r9JiXevWn2ksBj5nt
ZkDIvj2H7EQ2CHyD2vjeviq63nPTaCnl8ghxeDIIu/D2wUC2/dMPj5YCsA5l/7Dj
p5wKQQ3SGGVGm9TZl+2vVeN02JGvED7YBdQytW0AFenqX5B+vAhaSZHhbtxHMTHT
5qD19Qd9G2fLZjBG6PPVGjblh2ky2KSMjepAtpj+5QUfhDxMrQf28biZlaGxy+jI
HKcgNGHaSzn8Lw+wBYjII1NuDJdFMNIUmai9xGLQk3o1z7TSCRaZB0XnP0FEozJ+
ey4MOjuTMkQnIQ+Ni7M1cECOY5jYfR6n7V6JRAsVGvCf5CCThxVdwSxnc8Yw1Fq3
kNdyq4WnYwsosSoTPEgVs7oMOIV+PHOXW5X3fNyb06sVBbieQYGuXZysUfVf51U1
PhlEIcSPNEFrAHu2y0zpOPrDeUY1rcy/1xkh8kiR4ygQiXdCEZB4rW/vIto6X4YN
y20+jf9U8ZIunB/SX+EI
=nb/z
-----END PGP SIGNATURE-----

--=-kpePkbEez3SCfCY8iAzY--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
