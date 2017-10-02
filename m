From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v3 12/12] ARM: dtsi: axp81x: set pinmux for GPIO0/1 when
 used as LDOs
Date: Mon, 2 Oct 2017 22:42:35 +0200
Message-ID: <20171002204235.25d4437a2p5qzrrj@flea>
References: <20171002120854.5212-1-quentin.schulz@free-electrons.com>
 <20171002120854.5212-13-quentin.schulz@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="wqqx2x777ffcgx3o"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171002120854.5212-13-quentin.schulz@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@free-electrons.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org, linux@armlinux.org.uk, lee.jones@linaro.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, thomas.petazzoni@free-electrons.com, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--wqqx2x777ffcgx3o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 02, 2017 at 12:08:54PM +0000, Quentin Schulz wrote:
> On AXP813/818, GPIO0 and GPIO1 can be used as LDO as (respectively)
> ldo_io0 and ldo_io1.
>=20
> Let's add the pinctrl properties to the said regulators.
>=20
> Signed-off-by: Quentin Schulz <quentin.schulz@free-electrons.com>
> ---
>  arch/arm/boot/dts/axp81x.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/axp81x.dtsi b/arch/arm/boot/dts/axp81x.dtsi
> index f90f257130d5..099b0ddc1bbb 100644
> --- a/arch/arm/boot/dts/axp81x.dtsi
> +++ b/arch/arm/boot/dts/axp81x.dtsi
> @@ -52,6 +52,16 @@
>  		compatible =3D "x-powers,axp813-gpio";
>  		gpio-controller;
>  		#gpio-cells =3D <2>;
> +
> +		gpio0_ldo: gpio0_ldo {
> +			pins =3D "GPIO0";
> +			function =3D "ldo";
> +		};
> +
> +		gpio1_ldo: gpio1_ldo {
> +			pins =3D "GPIO1";
> +			function =3D "ldo";
> +		};

The node names are not supposed to contain any hyphens.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--wqqx2x777ffcgx3o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZ0qS7AAoJEBx+YmzsjxAgUkAQAIhv7hYV4R0prgkHdoQoO+Xu
akcFEGWnDusYy3UFbQ92ePsI5mFHX6PJZNPDZDGL4GAUwunZk3m8X/tKfniye+uc
O/MDjyFsS6lJ0WCuC+dN3os20KtokiImM4DW68zzJSMHVzN37HSLPRatspq1heTS
82QrYa74Xl9UzhUFQf0eFrmniyP3u/ucGFoh0GFmP6GgGkI6xKn52qG/rpy8hbgd
gtkWz/4/MO9mYWYavVdF9w/P2Tbq+NATsQTZkbchSlPU74fFViP7EHDYD5OLeR7H
OftC+WIks1Nhl+vQgRXttzX3iaFATddUDwcCR9yX4P/D1kUTFeJNnowXyOojMSMf
tOfzAYhHVDejwRaBFP7adV6y/DYYJMOwapblZBe2ump2WDO75+F3clCfH+SCD1LU
de1xca2Go8QF/Amx1KxBEIEIimuvNu1bLak+gbXU58r1iBKI6lImzdfPz7fHlKgN
IOwqjJi6oN8wbwmteOuOgKF1QgCkBG+6u9YvvTVE3q9AsehDQG9vgSmFY7NoOpyD
fPSTkuY6VkzES0DSgtsBDIiiKL70vj6W7Y3OvN5KcYdBt9/UsTzI+/MvdqDeFdfE
HdA0eBp6lqvZ6Mp9+7DdiXqTDE335ycOFaPaD1clrlXsooP4yFyCVEHuajGypCc9
GMRgjoBhuwXi8V2sd0O9
=tQBn
-----END PGP SIGNATURE-----

--wqqx2x777ffcgx3o--
