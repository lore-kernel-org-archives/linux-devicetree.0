From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v9 3/6] kernel/reboot.c: export pm_power_off_prepare
Date: Mon, 10 Sep 2018 16:19:26 +0100
Message-ID: <20180910151926.GA10889@sirena.org.uk>
References: <20180802103425.3053-1-o.rempel@pengutronix.de>
 <20180802103425.3053-4-o.rempel@pengutronix.de>
 <20180802104443.GH9117@sirena.org.uk>
 <94d48ecb-7302-c7ed-e815-730be0426a04@pengutronix.de>
 <20180802113552.GJ9117@sirena.org.uk>
 <20180827014815.GD29208@dragon>
 <20180906101516.GA5360@sirena.org.uk>
 <20180909020021.GA18838@dragon>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180909020021.GA18838@dragon>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, kernel@pengutronix.de, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Liam Girdwood <lgirdwood@gmail.com>, Leonard Crestez <leonard.crestez@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Fabio Estevam <fabio.estevam@nxp.com>, Russell King <linux@armlinux.org.uk>, linux-imx@nxp.com, yibin.gong@nxp.com, "A.s. Dong" <aisheng.dong@nxp.com>
List-Id: devicetree@vger.kernel.org


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 09, 2018 at 10:00:23AM +0800, Shawn Guo wrote:
> On Thu, Sep 06, 2018 at 11:15:17AM +0100, Mark Brown wrote:

> > I was expecting to get a pull request with the precursor patches in it -
> > the regulator driver seems to get a moderate amount of development so
> > there's a reasonable risk of conflicts.

> What about you create a stable topic branch for regulator patches and I
> pull it into IMX tree?

Sure, I can send a pull request back but the first two patches in the
series are ARM ones - are you OK with me just applying them and sending
them in the pull request or do you want to apply them first?

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAluWi30ACgkQJNaLcl1U
h9DfjQf+Mzg14+HDipidgPh6Bdg+IJD1Nj7k+nkPf1Swd7eZoS05uU8JnDGs2EPD
xNvyzY4s12YQUOt5PwoTsQqa78Qi4VlkyQ64alwucoTZAqr49ohIThUfst/igMXP
7GydiWcdwcGyxgecT45qT9AU/sULkb0ygCdTgUL4Jnhcy5D2YZGeWOc7PFQ2kI4j
GDyXyQGJTGq4kSmKLtZPyyshFYcfjc/ICzU9gt8e0SerwSD5HcK/ZAleF/9HRK22
QqSg/Z4BPi1Q1dWXJcwD4QdHC+0FRLQPCOIQx20GPgOuW0hNavALc55scwkdmMgg
9t9K8G+F9Y9TjZvYapu910gdzOriJA==
=y7uB
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--
