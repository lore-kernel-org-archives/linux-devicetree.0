From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCHv2] ARM: dts: sun8i-h3: Add dts for the Mapleboard MP130
Date: Mon, 5 Nov 2018 10:05:47 +0100
Message-ID: <20181105090547.yuiblwnnpffykilg@flea>
References: <20181030221430.wu5cxicyf4ub2boa@earth.li>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="k2b2il23thni6h4h"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181030221430.wu5cxicyf4ub2boa@earth.li>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan McDowell <noodles@earth.li>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>
List-Id: devicetree@vger.kernel.org


--k2b2il23thni6h4h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 30, 2018 at 10:14:30PM +0000, Jonathan McDowell wrote:
> +	r_gpio_keys {
> +		compatible =3D "gpio-keys";
> +		pinctrl-names =3D "default";
> +
> +		power {
> +			label =3D "mp130:power";

That was my mistake, but it was correct in your first version.

> +&pio {
> +	leds_pio: led_pins {
> +		pins =3D "PA15";
> +		function =3D "gpio_out";
> +	};
> +};
> +
> +&r_pio {
> +	leds_r_pio: led_pins {
> +		pins =3D "PL10";
> +		function =3D "gpio_out";
> +	};
> +
> +	sw_r_pio: key_pins {
> +		pins =3D "PL3", "PL4";
> +		function =3D "gpio_in";
> +	};
> +};

You don't need these nodes at all.

I've fixed both issues and applied your patch for 4.21

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--k2b2il23thni6h4h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCW+AH6wAKCRDj7w1vZxhR
xZ1pAP99wHV8qJxv2Oqx5ONDlA3iBdyvnogejYVSfpKcT4j84gEAgAdQrQHd+Ghm
wnTwRrnoU5bumSWH4LV7xz5EV4iq0gI=
=TqgV
-----END PGP SIGNATURE-----

--k2b2il23thni6h4h--
