From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V2 6/6] regulator: max77620: add regulator driver for
 max77620/max20024
Date: Wed, 13 Jan 2016 11:57:36 +0000
Message-ID: <20160113115736.GJ6588@sirena.org.uk>
References: <1452590273-16421-1-git-send-email-ldewangan@nvidia.com>
 <1452590273-16421-7-git-send-email-ldewangan@nvidia.com>
 <5695A854.60108@samsung.com>
 <5696378B.6070704@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="y23ShSVTng6i3e6h"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5696378B.6070704@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, lee.jones@linaro.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, rtc-linux@googlegroups.com, swarren@nvidia.com, treding@nvidia.com, Mallikarjun Kasoju <mkasoju@nvidia.com>
List-Id: devicetree@vger.kernel.org


--y23ShSVTng6i3e6h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 13, 2016 at 05:09:55PM +0530, Laxman Dewangan wrote:

> Yaah, this is something new and I think Mark also wanted to do this cleanup
> on his comment. I did not understand it previously. Looks cool now.

I did, please don't just ignore review comments.

> However, I have requirement to configure PMIC with some inital setting based
> on init_data (parsed) before regulator registration happened. Once I move to
> this new mecahinsm, the inti_data parsing and regulator init happen in the
> same function. So I need to have one callback from regulator_register to
> driver.
> Something below. This will do the pre configuration before
> regulator_register happena dn machine constraint sets.

> I can not use the init_data->regulator_init() as I need to have the init
> data passed to the driver.

Why do you have this requirement?

--y23ShSVTng6i3e6h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWljuvAAoJECTWi3JdVIfQ8wgH/1cr0ePAjPu5Hqbfs3MHF++o
yPxHIje7M4w3vA1WPCTVBAYrzy9HAM63VdMNph3w4K82TLArajbY+zzz3VRs9+/+
QUAqyPrMEZ5+r/mg66MPwLVLfyoYvBmv0w93AP64Ik/9a8NmLN4usmzJIdfJAGl1
wcYNQG/V2lTvRcJ/ypUZX3mEVQo34Sb+b5BkBU+ViugQ7jO87aAsvc3dGT0Srpsd
iYujuh74ZJZp//936UEKBFj/5m0sG6w0cLZ/o2MVO8Uk1kRQWYJEvomcJte/yEZM
oC0V65tUXqBWdKwVEVvQ6jGHzbwQkgTe38GElzbqR/Gbj03RjRkZJWrYSKOEMxY=
=nZQW
-----END PGP SIGNATURE-----

--y23ShSVTng6i3e6h--
