From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC 2/3] regulator: rk808: Add support for rk818
Date: Sun, 10 Apr 2016 20:04:41 +0100
Message-ID: <20160410190441.GC18319@sirena.org.uk>
References: <1460108861-32818-1-git-send-email-w.egorov@phytec.de>
 <1460108861-32818-3-git-send-email-w.egorov@phytec.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1SQmhf2mF2YjsYvc"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1460108861-32818-3-git-send-email-w.egorov@phytec.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Wadim Egorov <w.egorov@phytec.de>
Cc: linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, lee.jones@linaro.org, lgirdwood@gmail.com, dianders@chromium.org, zyw@rock-chips.com
List-Id: devicetree@vger.kernel.org


--1SQmhf2mF2YjsYvc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 08, 2016 at 11:47:40AM +0200, Wadim Egorov wrote:

> +static const struct regulator_linear_range rk818_buck4_voltage_ranges[] = {
> +	REGULATOR_LINEAR_RANGE(1800000, 0, 18, 100000),
> +};
> +
> +static const struct regulator_linear_range rk818_boost_voltage_ranges[] = {
> +	REGULATOR_LINEAR_RANGE(4700000, 0, 7, 100000),
> +};

Why are these done as linear ranges when there's only one range?  This
just adds overhead, just specify the one range directly in the desc and
use the appropriate ops.

> +	if (rk808->variant == RK808_ID)
> +		ret = of_regulator_match(dev, np, rk808_reg_matches,
> +					 RK808_NUM_REGULATORS);
> +	else if (rk808->variant == RK818_ID)
> +		ret = of_regulator_match(dev, np, rk818_reg_matches,
> +					RK818_NUM_REGULATORS);

Don't use of_regulator_match, just specify the DT names for the
regulator in the desc.  Also it looks like you're trying to write a
switch statement with ifs here, just write a switch statement.  It's
clearer and less error prone.

--1SQmhf2mF2YjsYvc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXCqPIAAoJECTWi3JdVIfQPGYH/A/ZgJZAnQYrDnJ+wHU8PzK7
aaPM3HoGSJ2bsY5f4NXBd7JeKirjBSrehLNXxKzgGjcVT644msQ88je5Pdu5OH6L
jyqOrW24TUv8eUA1xLh4/RRUSoIjTtVdGJOz3IdTZ88WJGYkXu7dhnR/8hejd3pk
uU5lL0RSlD/1pM0mH9bfZSjqYcQZnzuNCZF29Cx/QbzaPeSgwcduBE6xLveeiIaQ
Xb32MLaajRz+P4XrIRlabIXx5LiL0WWFbhRkFmJ47dCz0xutbQNgwnYq5WFwCOJE
lMZRiH8uO93BGqkTobY9KoOBw8RklpIy3+2eSRNxwcdZdUaU5xls7NQ0cUW31x0=
=FpIx
-----END PGP SIGNATURE-----

--1SQmhf2mF2YjsYvc--
