From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v4 02/10] pinctrl: axp209: add pinctrl features
Date: Fri, 1 Dec 2017 16:57:02 +0100
Message-ID: <20171201155702.irfox7vf3kfjvpjx@flea.lan>
References: <cover.3ff63fdf302c6bda02ea7d160ad2aa5afee0899d.1512135804.git-series.quentin.schulz@free-electrons.com>
 <71c9da94df2a5938cb8c092e40f8e36eec0b01c3.1512135804.git-series.quentin.schulz@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qvcxxhgedzncheee"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <71c9da94df2a5938cb8c092e40f8e36eec0b01c3.1512135804.git-series.quentin.schulz@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@free-electrons.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org, linux@armlinux.org.uk, lee.jones@linaro.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, thomas.petazzoni@free-electrons.com, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--qvcxxhgedzncheee
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 01, 2017 at 02:44:43PM +0100, Quentin Schulz wrote:
> +static void axp20x_gpio_set(struct gpio_chip *chip, unsigned offset,
> +			    int value)
> +{

checkpatch output:
WARNING: Prefer 'unsigned int' to bare use of 'unsigned'

> +static int axp20x_pmx_set_mux(struct pinctrl_dev *pctldev,
> +			      unsigned int function, unsigned int group)
> +{
> +	struct axp20x_gpio *gpio =3D pinctrl_dev_get_drvdata(pctldev);
> +	unsigned int mask;
> +
> +	/* Every pin supports GPIO_OUT and GPIO_IN functions */
> +	if (function <=3D AXP20X_FUNC_GPIO_IN)
> +		return axp20x_pmx_set(pctldev, group,
> +				      gpio->funcs[function].muxval);
> +
> +	if (function =3D=3D AXP20X_FUNC_LDO)
> +		mask =3D gpio->desc->ldo_mask;
> +	else
> +		mask =3D gpio->desc->adc_mask;

What is the point of this test...

> +	if (!(BIT(group) & mask))
> +		return -EINVAL;
> +
> +	/*
> +	 * We let the regulator framework handle the LDO muxing as muxing bits
> +	 * are basically also regulators on/off bits. It's better not to enforce
> +	 * any state of the regulator when selecting LDO mux so that we don't
> +	 * interfere with the regulator driver.
> +	 */
> +	if (function =3D=3D AXP20X_FUNC_LDO)
> +		return 0;

=2E.. if you know that you're not going to do anything with one of the
outcomes. It would be better to just move that part above, instead of
doing the same test twice.

It looks good otherwise, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--qvcxxhgedzncheee
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlohe7wACgkQ0rTAlCFN
r3RTug/7B9/2YVyKXRuUEy3ydimMEwWroviPTBTalRNWLWrVHDebbJmUoK4iSx4S
7yLEM0Fi4MBzwMW0fHy0hTr6A1o63tu8bxkE2BHHY8WMV8GIgKt03zbLb80Y5zOe
bHeGLeVnq6iJda45XRX8bGygYmRDRs3dorQl+5aj38GM9cTAr3fCiCkUNSf9DQBe
GNMnwg2EOjL/+JDBlqAQpZjj73nEv0ESEKhMAC9fAL4Vu/24XoW5wnjp4Gh4PmfC
EAuQ5B2Q2yFXdcjp+LB6KJBapjTSTKw6ijYkCAEWuNANrssoBslifKeX+ui9nWvG
GV3VPJXKjFBW/hb7soZw2uWCgnBP55Xauts4Fx1SmiYmSAzqx/UsjW5ga4PNDLWa
VLSnHjWtWhWEHOcgL45u2uqoowraPIGn6VVxRpvyzmnmufKypa3nEx4pOz8luu8b
1yMttuBL98HCSsjzdKRLXYwcvOLXehiUqTm2abr0eVZ9uqNBuyfLeW0w303BhUeT
bJNV4Q+jRa+0DBDeC3sGYck7+K98DFXWCztdYG7LaQJIGVURrQM248LZxYTqOoUF
9UgfyplxEeH1CukazqYv6kI0GUTHVvOAuCHmcAu+7Xi7LHHOqSeAn/mte49XxSgT
5oiCXBwzIalid68uQlkA4srw/v0VpLxjiLc00eB40lqLOvwFr/g=
=FHM2
-----END PGP SIGNATURE-----

--qvcxxhgedzncheee--
