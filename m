From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v9 3/6] kernel/reboot.c: export pm_power_off_prepare
Date: Thu, 6 Sep 2018 11:15:17 +0100
Message-ID: <20180906101516.GA5360@sirena.org.uk>
References: <20180802103425.3053-1-o.rempel@pengutronix.de>
 <20180802103425.3053-4-o.rempel@pengutronix.de>
 <20180802104443.GH9117@sirena.org.uk>
 <94d48ecb-7302-c7ed-e815-730be0426a04@pengutronix.de>
 <20180802113552.GJ9117@sirena.org.uk>
 <20180827014815.GD29208@dragon>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180827014815.GD29208@dragon>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, kernel@pengutronix.de, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Liam Girdwood <lgirdwood@gmail.com>, Leonard Crestez <leonard.crestez@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Fabio Estevam <fabio.estevam@nxp.com>, Russell King <linux@armlinux.org.uk>, linux-imx@nxp.com, yibin.gong@nxp.com, "A.s. Dong" <aisheng.dong@nxp.com>
List-Id: devicetree@vger.kernel.org


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 27, 2018 at 09:48:16AM +0800, Shawn Guo wrote:

> Can you ACK on those two regulator patches, so that I can queue this
> series up on IMX tree?

I was expecting to get a pull request with the precursor patches in it -
the regulator driver seems to get a moderate amount of development so
there's a reasonable risk of conflicts.

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAluQ/jQACgkQJNaLcl1U
h9Dbpwf+MZa+AjERwuP4i++2zvh8VAZqhxPFy+ijMGRaJATDNumhfGA/bycWyDdN
r1Lp0EhBmeGqiMtrhDoqw+4kjF5H03mhTvrjG0U4C8vOUainMOEWSSpBeq9ST42t
wvScVpuLON1EZUt6n23wPMmc4fDlvKbhlY2QRTl3NP6eIAafaym7CzC49rS0PdnI
Pi5qCQrlt9X8eChyKmUkD6oENeFAvUAZLlf8Elxz8Is3bB7lNIzaIrlImSoGRMUQ
TZx37KNyvsEcCrzq47ALMySZe5auC1fc97ghqmIpxIcL2hmmGPYY8U86i6UOsXyq
a0AnQkQOjdWb4Dm+IHQD3tT4vgsIoQ==
=Ytj1
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--
