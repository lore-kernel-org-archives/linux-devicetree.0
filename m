From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V2 6/6] regulator: max77620: add regulator driver for
 max77620/max20024
Date: Wed, 13 Jan 2016 12:31:33 +0000
Message-ID: <20160113123133.GK6588@sirena.org.uk>
References: <1452590273-16421-1-git-send-email-ldewangan@nvidia.com>
 <1452590273-16421-7-git-send-email-ldewangan@nvidia.com>
 <5695A854.60108@samsung.com>
 <5696378B.6070704@nvidia.com>
 <20160113115736.GJ6588@sirena.org.uk>
 <56963D8D.9060908@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AC4h36899OtEuhrO"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56963D8D.9060908@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, lee.jones@linaro.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, rtc-linux@googlegroups.com, swarren@nvidia.com, treding@nvidia.com, Mallikarjun Kasoju <mkasoju@nvidia.com>
List-Id: devicetree@vger.kernel.org


--AC4h36899OtEuhrO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 13, 2016 at 05:35:33PM +0530, Laxman Dewangan wrote:
> On Wednesday 13 January 2016 05:27 PM, Mark Brown wrote:

> >>Something below. This will do the pre configuration before
> >>regulator_register happena dn machine constraint sets.
> >>I can not use the init_data->regulator_init() as I need to have the init
> >>data passed to the driver.

> >Why do you have this requirement?

> This is require to
> - configure FPS_SRC based on platform data for each rail,
>     - If FPS_SRC enabled then enable it always.
>     - If FPS_SRC is disabled (NONE) then based on init data constraint,
>       set it to desired state.

What is FPS_SRC and why is it set from init_data?  A driver should never
be looking at init_data.

> - Power mode and slew rate init based on default configuration from the
> register if platform does not want to set it.

Same here, why is init_data needed here?

--AC4h36899OtEuhrO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWlkOlAAoJECTWi3JdVIfQsmcH/A2kZO2AMtyRc04tc5ijA0kJ
q0+Ky136KnvM4WjRCQu7dJZ2SvUK92m2E50KBdQ8fZOvn5lAc5dVelriuxjgzw8Z
1X7CabcprWF7g3Y+TPg5X+V5Sej4qZqPWoVncaE1eBkkijAJbW4eK++VqY9HQihT
9R4jdK3GmxyPuXRY2fU4+9HDMN3DmSWOXo86m2e/gPNQ7BXk0Z+D/5bjOry/yv6h
5up9LTCoRiEd880F3UDziwwqA7HERmFmK7eDz3lLi8fzdepAi/c3JwxEegfxnDTt
u5WIpL3CHy5HjbV+7XkKx3mnLi+wHAA/9aI/F9s4TGyaAfCml771C5zYDHIq1U0=
=5pwb
-----END PGP SIGNATURE-----

--AC4h36899OtEuhrO--
