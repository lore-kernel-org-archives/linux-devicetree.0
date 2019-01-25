From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a64-amarula-relic: Add STLM75
 sensor
Date: Fri, 25 Jan 2019 09:40:04 +0100
Message-ID: <20190125084004.fsbxtpcesb5yaiod@flea>
References: <20190124175254.27650-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cqlyaxwsslzi66qo"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190124175254.27650-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Trimarchi <michael@amarulasolutions.com>, linux-amarula@amarulasolutions.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--cqlyaxwsslzi66qo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 24, 2019 at 11:22:54PM +0530, Jagan Teki wrote:
> Amarula A64 Relic has STLM75 sensor for digital temperature
> and thermal watchdog.
>=20
> Add support for it.
>=20
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Note: the respective driver change is already in mainline
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3D2e9a41bbc1079776dabe42ed8113b086b99ae56c
>=20
>  .../dts/allwinner/sun50i-a64-amarula-relic.dts    | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts b=
/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
> index 6cb2b7f0c817..5d942543d978 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
> @@ -34,6 +34,21 @@
>  	status =3D "okay";
>  };
> =20
> +&i2c0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c0_pins>;
> +	status =3D "okay";
> +
> +	temp@48 {

That would be sensor@48

> +		compatible =3D "st,stlm75";

That compatible isn't documented.

The rest looks good, thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--cqlyaxwsslzi66qo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXErLYwAKCRDj7w1vZxhR
xdJsAQCkGNW1D6vgjZZi2m2OyaFk/OM5jou7yJaveoU0vEeuzgD/fDDwXy3yfWnA
PQcsxjl7Ogj6oNY63U+pBRW8tJZ34wE=
=SIYm
-----END PGP SIGNATURE-----

--cqlyaxwsslzi66qo--
