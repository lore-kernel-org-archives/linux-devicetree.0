From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: Re: [PATCH 8/8] ARM: dts: aspeed: Clean up UART nodes
Date: Wed, 04 Oct 2017 15:58:51 +1030
Message-ID: <1507094931.5452.20.camel@aj.id.au>
References: <20170928075149.8154-1-joel@jms.id.au>
         <20170928075149.8154-9-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-kijKAuAMDPqSYXCkz2l6"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170928075149.8154-9-joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rick Altherr <raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg-Bxea+6Xhats@public.gmane.org>, linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--=-kijKAuAMDPqSYXCkz2l6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-09-28 at 17:21 +0930, Joel Stanley wrote:
> =C2=A0- Shorten size of reg property so it covers only the implemented
> =C2=A0registers
>=C2=A0
> =C2=A0- Add VUART compatible
>=C2=A0
> =C2=A0- Move stray uart1 in g5 definition
>=C2=A0
> =C2=A0- Remove outdated current-speed property. Different bootloaders use
> =C2=A0different speeds, so this is no longer helpful
>=C2=A0
> Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
> ---
> =C2=A0arch/arm/boot/dts/aspeed-g4.dtsi | 17 +++++++++--------
> =C2=A0arch/arm/boot/dts/aspeed-g5.dtsi | 36 ++++++++++++++++++-----------=
-------
> =C2=A02 files changed, 27 insertions(+), 26 deletions(-)
>=C2=A0
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-=
g4.dtsi
> index 191c33d18122..7a4a53666d70 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -27,6 +27,7 @@
> =C2=A0		serial2 =3D &uart3;
> =C2=A0		serial3 =3D &uart4;
> =C2=A0		serial4 =3D &uart5;
> +		serial5 =3D &vuart;
> =C2=A0	};
> =C2=A0
> =C2=A0	cpus {
> @@ -199,7 +200,7 @@
> =C2=A0
> =C2=A0			uart1: serial@1e783000 {
> =C2=A0				compatible =3D "ns16550a";
> -				reg =3D <0x1e783000 0x1000>;
> +				reg =3D <0x1e783000 0x20>;
> =C2=A0				reg-shift =3D <2>;
> =C2=A0				interrupts =3D <9>;
> =C2=A0				clocks =3D <&clk_uart>;
> @@ -209,7 +210,7 @@
> =C2=A0
> =C2=A0			uart2: serial@1e78d000 {
> =C2=A0				compatible =3D "ns16550a";
> -				reg =3D <0x1e78d000 0x1000>;
> +				reg =3D <0x1e78d000 0x20>;
> =C2=A0				reg-shift =3D <2>;
> =C2=A0				interrupts =3D <32>;
> =C2=A0				clocks =3D <&clk_uart>;
> @@ -219,7 +220,7 @@
> =C2=A0
> =C2=A0			uart3: serial@1e78e000 {
> =C2=A0				compatible =3D "ns16550a";
> -				reg =3D <0x1e78e000 0x1000>;
> +				reg =3D <0x1e78e000 0x20>;
> =C2=A0				reg-shift =3D <2>;
> =C2=A0				interrupts =3D <33>;
> =C2=A0				clocks =3D <&clk_uart>;
> @@ -229,7 +230,7 @@
> =C2=A0
> =C2=A0			uart4: serial@1e78f000 {
> =C2=A0				compatible =3D "ns16550a";
> -				reg =3D <0x1e78f000 0x1000>;
> +				reg =3D <0x1e78f000 0x20>;
> =C2=A0				reg-shift =3D <2>;
> =C2=A0				interrupts =3D <34>;
> =C2=A0				clocks =3D <&clk_uart>;
> @@ -239,7 +240,7 @@
> =C2=A0
> =C2=A0			uart5: serial@1e784000 {
> =C2=A0				compatible =3D "ns16550a";
> -				reg =3D <0x1e784000 0x1000>;
> +				reg =3D <0x1e784000 0x20>;
> =C2=A0				reg-shift =3D <2>;
> =C2=A0				interrupts =3D <10>;
> =C2=A0				clocks =3D <&clk_uart>;
> @@ -248,9 +249,9 @@
> =C2=A0				status =3D "disabled";
> =C2=A0			};
> =C2=A0
> -			uart6: serial@1e787000 {
> -				compatible =3D "ns16550a";
> -				reg =3D <0x1e787000 0x1000>;
> +			vuart: vuart@1e787000 {

Bit of a nit, but arguably this should be `vuart: serial@...`?

> +				compatible =3D "aspeed,ast2400-vuart";
> +				reg =3D <0x1e787000 0x40>;
> =C2=A0				reg-shift =3D <2>;
> =C2=A0				interrupts =3D <10>;
> =C2=A0				clocks =3D <&clk_uart>;
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-=
g5.dtsi
> index 251fc9f4637e..0b793305120a 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -27,6 +27,7 @@
> =C2=A0		serial2 =3D &uart3;
> =C2=A0		serial3 =3D &uart4;
> =C2=A0		serial4 =3D &uart5;
> +		serial5 =3D &vuart;
> =C2=A0	};
> =C2=A0
> =C2=A0	cpus {
> @@ -247,16 +248,6 @@
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
> =C2=A0				compatible =3D "aspeed,ast2500-lpc", "simple-mfd";
> =C2=A0				reg =3D <0x1e789000 0x1000>;
> @@ -287,9 +278,19 @@
> =C2=A0				};
> =C2=A0			};
> =C2=A0
> +			uart1: serial@1e783000 {

Earlier in the series you had a patch moving the ADC node to be in
address-order with respect to the rest of the nodes but this change puts ua=
rt1
out of address-order. As it turns out the uarts blocks are sprayed around i=
n
the address-space: uart1 and uart5 are together, the vuart is elsewhere, th=
en
uarts 2-4 are lumped together in another spot. I think it makes sense to
consolidate them, but it is inconsistent. Thoughts?

> +				compatible =3D "ns16550a";
> +				reg =3D <0x1e783000 0x20>;
> +				reg-shift =3D <2>;
> +				interrupts =3D <9>;
> +				clocks =3D <&clk_uart>;
> +				no-loopback-test;
> +				status =3D "disabled";
> +			};
> +
> =C2=A0			uart2: serial@1e78d000 {
> =C2=A0				compatible =3D "ns16550a";
> -				reg =3D <0x1e78d000 0x1000>;
> +				reg =3D <0x1e78d000 0x20>;
> =C2=A0				reg-shift =3D <2>;
> =C2=A0				interrupts =3D <32>;
> =C2=A0				clocks =3D <&clk_uart>;
> @@ -299,7 +300,7 @@
> =C2=A0
> =C2=A0			uart3: serial@1e78e000 {
> =C2=A0				compatible =3D "ns16550a";
> -				reg =3D <0x1e78e000 0x1000>;
> +				reg =3D <0x1e78e000 0x20>;
> =C2=A0				reg-shift =3D <2>;
> =C2=A0				interrupts =3D <33>;
> =C2=A0				clocks =3D <&clk_uart>;
> @@ -309,7 +310,7 @@
> =C2=A0
> =C2=A0			uart4: serial@1e78f000 {
> =C2=A0				compatible =3D "ns16550a";
> -				reg =3D <0x1e78f000 0x1000>;
> +				reg =3D <0x1e78f000 0x20>;
> =C2=A0				reg-shift =3D <2>;
> =C2=A0				interrupts =3D <34>;
> =C2=A0				clocks =3D <&clk_uart>;
> @@ -319,18 +320,17 @@
> =C2=A0
> =C2=A0			uart5: serial@1e784000 {
> =C2=A0				compatible =3D "ns16550a";
> -				reg =3D <0x1e784000 0x1000>;
> +				reg =3D <0x1e784000 0x20>;
> =C2=A0				reg-shift =3D <2>;
> =C2=A0				interrupts =3D <10>;
> =C2=A0				clocks =3D <&clk_uart>;
> -				current-speed =3D <38400>;
> =C2=A0				no-loopback-test;
> =C2=A0				status =3D "disabled";
> =C2=A0			};
> =C2=A0
> -			uart6: serial@1e787000 {
> -				compatible =3D "ns16550a";
> -				reg =3D <0x1e787000 0x1000>;
> +			vuart: vuart@1e787000 {

See serial@ comment above.

Cheers,

Andrew

> +				compatible =3D "aspeed,ast2500-vuart";
> +				reg =3D <0x1e787000 0x40>;
> =C2=A0				reg-shift =3D <2>;
> =C2=A0				interrupts =3D <10>;
> =C2=A0				clocks =3D <&clk_uart>;
--=-kijKAuAMDPqSYXCkz2l6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1HGTAAoJEJ0dnzgO5LT5zPwP/3hAwUi38m8ie047kpeHm/wH
h8qrxQbOgnxbF8DeCR6vpGquWnPhmL3u+Ncj5ohnehe/iLBC20wVrlDSqzGVPAl/
lvyNFpKFOvpZPo2/NdpNe5zfHwLMt94TQ0cDONj8UDQkLIX9kXN66AybNu+X4sgm
MKKxuDAHo6FSoHOxeCYgSmiWnsF1JlHboBzJCM9fcMXyqDz0GAxUfCaNaOR/n4ur
z5T/3eNEoPlpY7y5amze4OmEYGru2Vta4NiDv/q78H6SvA645KOsykWwl3pGJH4/
kY9R5jKNsFObV+rv69JVoMRgG38DyK2VoI18xqf45E0CnUFmRvqZQVOjpHcETDXo
vDRl1Zc721isTtLs+ragGl3izU5O1rbmnZsjk14CwM1MhxyECxC2ZiZhpeF3sN/C
kW0lpsiMr+6fYzOR7QaWJKkEKUnQNRMfxslnIPJrv6xxqD7I7hljz7SwY+Q3bHHT
PxhSGPJUgrdTXmUrbQIx/3AgMb+svxKYnRFsgtZX3CqMUeNkLAWJ3ZwtC2EXg9vp
ukRGCG2pGxbP0tcVkie964wNnXklhTX2/O6fT61HVLjmVSc2AKTrvZzOQee3Wo5k
TWheUu9RrF/3s6jkzBs/lWwiRiHFeINE94dzWmENB/As62BhMuQApNQYdzsG4KNB
F688yF0e2YFxl/DWuqTs
=AiSA
-----END PGP SIGNATURE-----

--=-kijKAuAMDPqSYXCkz2l6--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
