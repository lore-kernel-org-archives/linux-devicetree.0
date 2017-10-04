From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: Enable watchdog two
Date: Wed, 04 Oct 2017 21:45:39 +1030
Message-ID: <1507115739.5452.33.camel@aj.id.au>
References: <20171004091635.12499-1-joel@jms.id.au>
         <20171004091635.12499-3-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-KzVTcEZ8FhmnxCRI2AMr"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171004091635.12499-3-joel@jms.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org


--=-KzVTcEZ8FhmnxCRI2AMr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-10-04 at 19:46 +1030, Joel Stanley wrote:
> The second watchdog is left running by u-boot in the common
> configurations of the firmware shipped on ASPEED boards. Ensure a driver
> is loaded so the system can succcessfully boot.
>=C2=A0
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0arch/arm/boot/dts/aspeed-g4.dtsi | 1 -
> =C2=A0arch/arm/boot/dts/aspeed-g5.dtsi | 1 -
> =C2=A02 files changed, 2 deletions(-)
>=C2=A0
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-=
g4.dtsi
> index 5be2e6a39917..9bf84d2ba038 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -212,7 +212,6 @@
> =C2=A0			wdt2: watchdog@1e785020 {
> =C2=A0				compatible =3D "aspeed,ast2400-wdt";
> =C2=A0				reg =3D <0x1e785020 0x1c>;
> -				status =3D "disabled";
> =C2=A0			};
> =C2=A0
> =C2=A0			vuart: serial@1e787000 {
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-=
g5.dtsi
> index 71e1264b81aa..ca023e9ab0b8 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -256,7 +256,6 @@
> =C2=A0			wdt2: watchdog@1e785020 {
> =C2=A0				compatible =3D "aspeed,ast2500-wdt";
> =C2=A0				reg =3D <0x1e785020 0x20>;
> -				status =3D "disabled";
> =C2=A0			};
> =C2=A0
> =C2=A0			wdt3: watchdog@1e785040 {
--=-KzVTcEZ8FhmnxCRI2AMr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1MLbAAoJEJ0dnzgO5LT56+4P/A933gXqpQ913pZQ/HppQtlt
OevOJmJtRmoMq3cISQT+oTbDgK0k4qNOudFpkgds4bVOkIr1ESih4vX1Ga+eGmEj
HB3tPn8jkwMgtf/CTKyYClwhnim2Tq5D8JQAD2tabnOz3/NOld3x3rPzfNdvg2T9
R/37dvP4unbCZz+JWRBcvsBJ6N3w6Teqhnvqe/bw4R989w1T8m0BneWhv7hpqTa/
8qZedhsBjBlN2Ef9lq4SBP+rRUfbhEIYTGolsyox7DGgxIyDZkDAlHsRAf6aSgR/
thx3rMQe6RLOdWz/HThlotQsghm6XN9+NE7Lq5HuwkxZxiNDEoGn4NH2YVE9f6Pm
w//1bpZKOkymzbIkjLuprI+IVSEjkoiloVpQvJSItYX5RrNdycX9yIjMES00POAm
C+e8JSjREGCnNgqGV9lRvJm364rX3A5/ZG8tQ4fJC6PJMe2ofo8X6U0yyQ9oU8DT
5UMEW3yKNRlpYOB3Elc8vTNx1oDmM/m4z40p8AkNkpkmpjhCbZT9vnrPlyMpBLFt
v7Lgql6MORwGKuWkegmryLMTovK7hbMD4Ed95NSM967nHl0A9tWzq+qUkIAx8MtW
MKi0RS4tc+/a5ldpnpWAHKNa461fyDr4B1wWi5mdo8/hmi7JE8nfK0qQZIpYM4YV
SUvux4Qw86Jz6HXvBciE
=PuaF
-----END PGP SIGNATURE-----

--=-KzVTcEZ8FhmnxCRI2AMr--
