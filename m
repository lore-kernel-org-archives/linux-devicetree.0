From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: Re: [PATCH 2/8] ARM: dts: aspeed: Reorder ADC node
Date: Wed, 04 Oct 2017 14:05:59 +1030
Message-ID: <1507088159.5452.3.camel@aj.id.au>
References: <20170928075149.8154-1-joel@jms.id.au>
         <20170928075149.8154-3-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-75AtwNxlYxnC1tzum8ve"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170928075149.8154-3-joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rick Altherr <raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg-Bxea+6Xhats@public.gmane.org>, linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--=-75AtwNxlYxnC1tzum8ve
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-09-28 at 17:21 +0930, Joel Stanley wrote:
> We try to keep the nodes in address order. The ADC node was out of
> place.
>=C2=A0
> Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
> ---
> =C2=A0arch/arm/boot/dts/aspeed-g4.dtsi | 16 ++++++++--------
> =C2=A0arch/arm/boot/dts/aspeed-g5.dtsi | 16 ++++++++--------
> =C2=A02 files changed, 16 insertions(+), 16 deletions(-)
>=C2=A0
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-=
g4.dtsi
> index 1edd0cee6221..a4579498fc25 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -129,6 +129,14 @@
> =C2=A0				};
> =C2=A0			};
> =C2=A0
> +			adc: adc@1e6e9000 {
> +				compatible =3D "aspeed,ast2400-adc";
> +				reg =3D <0x1e6e9000 0xb0>;
> +				clocks =3D <&syscon ASPEED_CLK_APB>;

We can't do this yet as the clk driver isn't yet merged, and it breaks from=
 the
"just move the node" description in the commit message.

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
> index f56dd67efa50..f6430b313f90 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -173,6 +173,14 @@
> =C2=A0				reg-io-width =3D <4>;
> =C2=A0			};
> =C2=A0
> +			adc: adc@1e6e9000 {
> +				compatible =3D "aspeed,ast2500-adc";
> +				reg =3D <0x1e6e9000 0xb0>;

Did you intend to change the size cell value here? It now matches the g4, b=
ut
there was an explicit comment about the size for some reason in the -hunk
below. It's probably worth an explicit call-out if we're going to change it=
.=C2=A0

> +				clocks =3D <&syscon ASPEED_CLK_APB>;

See the clk comment on the g4 diff.

Cheers,

Andrew

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
--=-75AtwNxlYxnC1tzum8ve
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1FcfAAoJEJ0dnzgO5LT56D0QAKBIiiWefjEIJBx3XbhChtEP
hDdd8MhJ6s3pf/3Pv+kI2xq4huvmDMQ9L01YfpGN3TguqmHA+0LHLpR6VtrsjUBO
NNi2AXb/GNXB+eB7bqcXN6POd3K7DAW7k3M/MCh2oMZU9Vet2Jn1R1FTw3F5s8zR
wA7GViE6L1kLsSgHsK8RlwfLeBhgwpoZWw6KmaKas473EZ1n9WjVZQQ/jBXlktWd
crjDEcpawj0dLrFpsKXgdSm7nxqvODLp9opas2vnEkLySRtoCetB9umrEv0f/P6s
wOF3Frx6GYoFrr+nkpX+G+0jwoTpwXCbSR0b0mCmtW12oA2M/kSx4feG77ZMiyeg
Mm+jdehsuHUAlJXUCsEQBQ+UIGn6irfTZGgXBnmFsjv6E7S6E9zieyfYPdARRpMA
no3sD3nXYGdTjB1GPU3o+JA3ti+SUZkPY7FJXG+SjOMLauifG+P5j3tfcHKxHT3P
SURxB+wB3jR8pfUG9aCyhxkSeJDPGgjKwXVkIi5K7TuiY7JlVL7/u+Dl5u5e6mRy
5Fav9scaz93pDk13RwIYyZ0JOAko75hcBEM5eQD6VhO3jdtcknP0BozxWO6OSNM4
eNxpdSUGj2oWhyIhpkzshJORq/M4fv2wuDQY/bb4eoSiaO3HBUy7WYI18JTCr4zd
cgt1nEA9DbNmAhKIYG7N
=EK27
-----END PGP SIGNATURE-----

--=-75AtwNxlYxnC1tzum8ve--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
