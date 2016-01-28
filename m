From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V6 7/8] DT: regulator: add DT binding doc for regulator
 of PMIC max77620/max20024
Date: Fri, 29 Jan 2016 00:28:17 +0100
Message-ID: <20160128232817.GH4130@sirena.org.uk>
References: <1453988274-28052-1-git-send-email-ldewangan@nvidia.com>
 <1453988274-28052-8-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2oox5VnwalALFvA7"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1453988274-28052-8-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, lee.jones@linaro.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, rtc-linux@googlegroups.com, swarren@nvidia.com, treding@nvidia.com, k.kozlowski@samsung.com
List-Id: devicetree@vger.kernel.org


--2oox5VnwalALFvA7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 28, 2016 at 07:07:53PM +0530, Laxman Dewangan wrote:
> Maxim Semiconductor's PMIC MAX77620/MAX20024 has multiple
> DCDCs and LDOs.

Please use subject lines matching the style for the subsystem.  I'm
fairly sure I've mentioned this before and really if your subject lines
don't visually resemble anything else in the directory that ought to be
a warning sign.

> +- maxim,disable-active-discharge:    boolean, Disable active discharge.

That's something I've seen other regulators do, can we make it a
standard property with an op?

> +max77620@3c {
> +	regulators {
> +		in-ldo0-1-supply = <&max77620_sd2>;
> +		in-ldo7-8-supply = <&max77620_sd2>;

I'd expect any supplies for the device to be at the device level,
including supplies used by regulators.

--2oox5VnwalALFvA7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWqqQQAAoJECTWi3JdVIfQ7wQIAIYk6ZkTOPNOCsbPz8ruY17f
hTnw2UWK1JXkW8rcR0d//LER/ATrYfF6bv+CjwUf8DYUVx2UD/o6WQKH67cItf/p
rDJEpFOXedtBBO2sLVm+nzbjJwSuya1aM4lAJ0hmv8Nq0s0DwYDd95pp2vai807j
XEUg9M4+uX4aTzN15bDPyPDKfu36zs5NF+MZ3bTwIuwwpDihpfYPt/F1P54J2m31
OuxyRi3992+hMj9I2F3JMB7nG1fXO3vX02xcX4cUwYXffaJgJ8aAwk5OX25WDnBM
u2KIo09vfKyRKWD6GyuIbWiAVbtNqQSy9xK3J9gM6YqWb4eDK+kmuziJtH+QToA=
=S+ho
-----END PGP SIGNATURE-----

--2oox5VnwalALFvA7--
