From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 7/7] ARM: sunxi: dt: add PRCM clk and
 reset controller subdevices
Date: Wed, 7 May 2014 22:17:00 -0500
Message-ID: <20140508031700.GO7047@lukather>
References: <1399483554-8824-1-git-send-email-boris.brezillon@free-electrons.com>
 <1399483554-8824-8-git-send-email-boris.brezillon@free-electrons.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/UvyDgxjlFfP/4zZ"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB7HPVONQKGQEI5WVHCA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1399483554-8824-8-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Emilio =?iso-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--/UvyDgxjlFfP/4zZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2014 at 07:25:54PM +0200, Boris BREZILLON wrote:
> Add DT definitions for PRCM (Power/Reset/Clock Management) clock and reset
> controller subdevices.
>=20
> Signed-off-by: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun6i-a31.dtsi | 39 ++++++++++++++++++++++++++++++++++=
++++-
>  1 file changed, 38 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a=
31.dtsi
> index ec3253a..b69be0b 100644
> --- a/arch/arm/boot/dts/sun6i-a31.dtsi
> +++ b/arch/arm/boot/dts/sun6i-a31.dtsi
> @@ -498,9 +498,46 @@
>  			reg =3D <0x01f01c00 0x300>;
>  		};
> =20
> -		prcm@01f01c00 {
> +		prcm@01f01400 {

This has already been fixed by Hans.

>  			compatible =3D "allwinner,sun6i-a31-prcm";
>  			reg =3D <0x01f01400 0x200>;
> +
> +			ar100: ar100_clk {
> +				compatible =3D "allwinner,sun6i-a31-ar100-clk";
> +				#clock-cells =3D <0>;
> +				clocks =3D <&osc32k>, <&osc24M>, <&pll6>, <&pll6>;
> +			};
> +
> +			ahb0: ahb0_clk {
> +				compatible =3D "fixed-factor-clock";
> +				#clock-cells =3D <0>;
> +				clock-div =3D <1>;
> +				clock-mult =3D <1>;
> +				clocks =3D <&ar100>;
> +				clock-output-names =3D "ahb0";
> +			};
> +
> +			apb0: apb0_clk {
> +				compatible =3D "allwinner,sun6i-a31-apb0-clk";
> +				#clock-cells =3D <0>;
> +				clocks =3D <&ahb0>;
> +				clock-output-names =3D "apb0";
> +			};
> +
> +			apb0_gates: apb0_gates_clk {
> +				compatible =3D "allwinner,sun6i-a31-apb0-gates-clk";
> +				#clock-cells =3D <1>;
> +				clocks =3D <&apb0>;
> +				clock-output-names =3D "apb0_pio", "apb0_ir",
> +						"apb0_timer01", "apb0_p2wi",

timer01 ? is this a typo?

> +						"apb0_uart", "apb0_1wire",
> +						"apb0_i2c";
> +			};
> +
> +			apb0_rst: apb0_rst {
> +				compatible =3D "allwinner,sun6i-a31-clock-reset";
> +				#reset-cells =3D <1>;
> +			};
>  		};
>  	};
>  };
> --=20
> 1.8.3.2
>=20

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--/UvyDgxjlFfP/4zZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTavcsAAoJEBx+YmzsjxAgsqkQAJfau7sAK5Unc1lvf5Rjtx0o
kc8qgAG4TBJc7sVpeG3iYqzyQYgRbJ+z1St7HdiD3D5Dj/efkE+zENcnBoxYheU9
0lTnw2nc9eRVDW1YY5yN9Mvzdp6MEv67ZlbULJSs/2nfcVhrgW7GKsGRVAMqQFsn
Xh2CVJgDdYqJfidtVYEqhC38UmAHi9Valn9YqGXvmEwdGvLMAY6Vz7yIcVB+yj12
aAG3yv/17Yqpvo/6aqkSPeHK2CeQ5Ecj5CAbynGc67cjzVXkBE6WtI4pCXb2KO97
C9N2ej0JAqgEBuCqQDIuV0euE9kbiZ43Pr6E/NLN6FNQECchRVklsYeEzLFgVWvX
CxH3WJP0jm6oP91NunCRDXn7hEIaRUGikN8QuWEDjZE6VNzlXkoVlS0MgTIp6whl
CXv12pqVzBGYw0Z2txSX5xJbem4LQQa7Pb30yNEUA2/SeN/sHIB6oKnQ4454nAWx
L9nqEEy1ULRBJSLJXDSUAjdlxxSQC8PgusLP8tI8AgmtsN9LlHDHtPUftle8wgON
oHq+4VBcSY1AL1gtH1vxmRbSKcgEbazSP0fcXihv61EYOtXm8/zVXUFqhcZt6ZEb
NtVIGRQExiQ3SNu2m2jfzY/KZzd/LnTCb8y439nBu/bN9ZuSZnhJmTgEcBah15/u
SsAUoDbRcdKEjEieUqQj
=70zX
-----END PGP SIGNATURE-----

--/UvyDgxjlFfP/4zZ--
