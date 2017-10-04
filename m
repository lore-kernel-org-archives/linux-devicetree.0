From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2 2/9] ARM: dts: aspeed: Reorder ADC node
Date: Thu, 05 Oct 2017 10:01:50 +1030
Message-ID: <1507159910.5452.34.camel@aj.id.au>
References: <20171004064917.2498-1-joel@jms.id.au>
         <20171004064917.2498-3-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-C5wYG+KaI68WPs6jF9Uf"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171004064917.2498-3-joel@jms.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rick Altherr <raltherr@google.com>, Brendan Higgins <brendanhiggins@google.com>, =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org


--=-C5wYG+KaI68WPs6jF9Uf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-10-04 at 17:19 +1030, Joel Stanley wrote:
> We try to keep the nodes in address order. The ADC node was out of
> place.
>=C2=A0
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

>=C2=A0
> ---
> v2:
> =C2=A0- Don't introduce new clk bindings
> ---
> =C2=A0arch/arm/boot/dts/aspeed-g4.dtsi | 16 ++++++++--------
> =C2=A0arch/arm/boot/dts/aspeed-g5.dtsi | 16 ++++++++--------
> =C2=A02 files changed, 16 insertions(+), 16 deletions(-)
>=C2=A0
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-=
g4.dtsi
> index 1edd0cee6221..c2d96b8a5065 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -129,6 +129,14 @@
> =C2=A0				};
> =C2=A0			};
> =C2=A0
> +			adc: adc@1e6e9000 {
> +				compatible =3D "aspeed,ast2400-adc";
> +				reg =3D <0x1e6e9000 0xb0>;
> +				clocks =3D <&clk_apb>;
> +				#io-channel-cells =3D <1>;
> +				status =3D "disabled";
> +			};
> +
> =C2=A0			sram@1e720000 {
> =C2=A0				compatible =3D "mmio-sram";
> =C2=A0				reg =3D <0x1e720000 0x8000>;	// 32K
> @@ -227,14 +235,6 @@
> =C2=A0				no-loopback-test;
> =C2=A0				status =3D "disabled";
> =C2=A0			};
> -
> -			adc: adc@1e6e9000 {
> -				compatible =3D "aspeed,ast2400-adc";
> -				reg =3D <0x1e6e9000 0xb0>;
> -				clocks =3D <&clk_apb>;
> -				#io-channel-cells =3D <1>;
> -				status =3D "disabled";
> -			};
> =C2=A0		};
> =C2=A0	};
> =C2=A0};
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-=
g5.dtsi
> index f56dd67efa50..9e71c2dac0ba 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -173,6 +173,14 @@
> =C2=A0				reg-io-width =3D <4>;
> =C2=A0			};
> =C2=A0
> +			adc: adc@1e6e9000 {
> +				compatible =3D "aspeed,ast2500-adc";
> +				reg =3D <0x1e6e9000 0xb0>;
> +				clocks =3D <&clk_apb>;
> +				#io-channel-cells =3D <1>;
> +				status =3D "disabled";
> +			};
> +
> =C2=A0			sram@1e720000 {
> =C2=A0				compatible =3D "mmio-sram";
> =C2=A0				reg =3D <0x1e720000 0x9000>;	// 36K
> @@ -307,14 +315,6 @@
> =C2=A0				no-loopback-test;
> =C2=A0				status =3D "disabled";
> =C2=A0			};
> -
> -			adc: adc@1e6e9000 {
> -				compatible =3D "aspeed,ast2500-adc";
> -				reg =3D <0x1e6e9000 0xb0>;
> -				clocks =3D <&clk_apb>;
> -				#io-channel-cells =3D <1>;
> -				status =3D "disabled";
> -			};
> =C2=A0		};
> =C2=A0	};
> =C2=A0};
--=-C5wYG+KaI68WPs6jF9Uf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1W9mAAoJEJ0dnzgO5LT5XNcP/1gAkOUWm+H2ZBnOF2oAuoSF
vDpNSiLjFv+URWVJ/YNyj1UiT+OPW0dTyJ0P69cp0pP6ty4RBhd3Huk2K16AMirE
zY9QBUsWfUvNhwuX5Tqb38Lcb2UNRdM2FqpkSb96thCOsANtSyfxq7sH9tdC2HGB
b2FV35jS0+uyYaJcN5+AzeuZt7OZPVN5W2zZmoacKAuTvokeql6j1Tot/02KG20c
X/r6z/g8jhXssmkMDDxuR+lxqLwI3+vesbUS5EW1MOF3K2HsUBs7WG+2l4dln/8G
YMKS4aBDL3xxgV8mRgq6fP2v98bf9SmHXtkxNEp2I08gGfs0ZCEnkVPZxVmHGHhb
Uw3SIOl6Zmi0E35fJCL1EwVBRaTcYj8LHXXk2Zu29oYAuvVvmr+W/0QgQhzqWSVw
EQWQmqQVKTvUgvlXgjvry1UcCHAs50CnhOhkuh+lLw08hWbglaKkj9Qzu5OWWHAz
bBI4BCF9RZfxl4hqTKf+1HyaKgYM41agQiOtG2LcXk/Of8AZRq8hmaUeiawU9so3
L/5njvNfpJgVaNV4GhugXdPryGTtncgoXn1a98NKaIwKP7v3oRG8g+VJzUOzF0F3
NLUrHtLXger/G2uWdm4DHWLpGdsWZk2v6ZeyJ5fH14cYgWBPLUpbxzy9YiWob7wf
OHZLbQuVb796rTNlPL9n
=x8fF
-----END PGP SIGNATURE-----

--=-C5wYG+KaI68WPs6jF9Uf--
