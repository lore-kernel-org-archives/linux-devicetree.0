From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V2 3/4] regulator: pv88080: Update Regulator driver for
 MFD support
Date: Thu, 27 Oct 2016 12:03:37 +0100
Message-ID: <20161027110337.GJ25322@sirena.org.uk>
References: <cover.1477530195.git.eric.jeong@diasemi.com>
 <711afefe3e65c166111473024bf9b54f3d4cc8b6.1477530195.git.eric.jeong@diasemi.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GvznHscUikHnwW2p"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <711afefe3e65c166111473024bf9b54f3d4cc8b6.1477530195.git.eric.jeong@diasemi.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Eric Jeong <eric.jeong.opensource@diasemi.com>
Cc: LINUX-KERNEL <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, DEVICETREE <devicetree@vger.kernel.org>, LINUX-GPIO <linux-gpio@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Support Opensource <support.opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org


--GvznHscUikHnwW2p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 27, 2016 at 10:03:14AM +0900, Eric Jeong wrote:

>  config REGULATOR_PV88080
> -	tristate "Powerventure Semiconductor PV88080 regulator"
> -	depends on I2C
> -	select REGMAP_I2C
> +	bool "Powerventure Semiconductor PV88080 regulator"
> +	depends on MFD_PV88080

Forcing the driver to be built in looks like a regression, why would we
want to do that?

> +	irq = platform_get_irq_byname(pdev, "regulator-irq");
> +	if (irq < 0) {
> +		dev_err(&pdev->dev, "Failed to get IRQ.\n");
> +		return irq;
>  	}

What's the _byname() adding here given that the name is so generic?  It
feels like if the name ever becomes important then this particular name
is going to be a problem.

> -module_i2c_driver(pv88080_regulator_driver);
> +static int __init pv88080_regulator_init(void)
> +{
> +	return platform_driver_register(&pv88080_regulator_driver);
> +}
> +subsys_initcall(pv88080_regulator_init);

Why are you converting this to subsys_initcall()?  This looks like
another regression.

--GvznHscUikHnwW2p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJYEd8IAAoJECTWi3JdVIfQGFwH/0jfun16dBlNGmSdpd984XFb
utH1FhCk/e3yCTiOBtDP+W3zyKEByEKaDWejsuhmKIpwpBPL8QfOgMqdzpExghey
CURflgekA44Ml9SzxMwZA5c7WYuM0kfeN7eBP2J61dYJjPgrstXx8bUiZBBRqRIq
G3At81wj0aQMuXYC64Y1QqQvU+zjdzim37Vanl04Z2kKLl046xubPePmxgoejiy1
V4z6J3SLAYSq4JnXv58fLfHwmiNwOjESyfib2FfrpmrXds/4x44jGG3oqu7rzS3J
AYNnuH6KC6rJYuUW0m7XY6leCAWyBJXZy4YJQM+aFUt+qGcCzVF0GL8znxI81Ec=
=o0id
-----END PGP SIGNATURE-----

--GvznHscUikHnwW2p--
