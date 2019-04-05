From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 1/5] arm64: allwinner: h6: orangepi: Add PIO regulators
Date: Fri, 5 Apr 2019 17:08:46 +0200
Message-ID: <20190405150846.nurg6h4ykwtiib2v@flea>
References: <20190405122446.2101-1-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="24vqx5wgiqrte236"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190405122446.2101-1-peron.clem@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--24vqx5wgiqrte236
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 05, 2019 at 02:24:42PM +0200, Cl=E9ment P=E9ron wrote:
> OrangePi One Plus and OrangePi Lite2 use the same PIO regulators.
>
> Add this in the common device tree.
>
> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch=
/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> index b2526dac2fcf..fd2af5095425 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> @@ -72,6 +72,12 @@
>  	status =3D "okay";
>  };
>
> +&pio {
> +        vcc-pc-supply =3D <&reg_bldo2>;
> +        vcc-pd-supply =3D <&reg_cldo1>;
> +        vcc-pg-supply =3D <&reg_bldo3>;
> +};
> +
>  &r_i2c {
>  	status =3D "okay";
>
> @@ -191,6 +197,11 @@
>  	};
>  };
>
> +&r_pio {
> +        vcc-pl-supply =3D <&reg_aldo1>;
> +        vcc-pm-supply =3D <&reg_bldo3>;
> +};
> +

How was this tested?

Please run checkpatch on your patches as well.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--24vqx5wgiqrte236
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKdvfgAKCRDj7w1vZxhR
xU+WAP9gEYEPbCHJ23PZYj4W9VgUad9XxyRWrzWzEq/E4K0EbAD9G5gRann7GsLc
gpQklzZ4VKGCEvR4FGJEiqil6dU/ggI=
=PqoA
-----END PGP SIGNATURE-----

--24vqx5wgiqrte236--
