From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v9 3/6] kernel/reboot.c: export pm_power_off_prepare
Date: Tue, 11 Sep 2018 16:19:27 +0100
Message-ID: <20180911151927.GB10123@sirena.org.uk>
References: <20180802103425.3053-1-o.rempel@pengutronix.de>
 <20180802103425.3053-4-o.rempel@pengutronix.de>
 <20180802104443.GH9117@sirena.org.uk>
 <94d48ecb-7302-c7ed-e815-730be0426a04@pengutronix.de>
 <20180802113552.GJ9117@sirena.org.uk>
 <20180827014815.GD29208@dragon>
 <20180906101516.GA5360@sirena.org.uk>
 <20180909020021.GA18838@dragon>
 <20180910151926.GA10889@sirena.org.uk>
 <20180911015320.GA25790@dragon>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DBIVS5p969aUjpLe"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180911015320.GA25790@dragon>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, kernel@pengutronix.de, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Liam Girdwood <lgirdwood@gmail.com>, Leonard Crestez <leonard.crestez@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Fabio Estevam <fabio.estevam@nxp.com>, Russell King <linux@armlinux.org.uk>, linux-imx@nxp.com, yibin.gong@nxp.com, "A.s. Dong" <aisheng.dong@nxp.com>
List-Id: devicetree@vger.kernel.org


--DBIVS5p969aUjpLe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 11, 2018 at 09:53:21AM +0800, Shawn Guo wrote:

> There shouldn't be any build or run time regression on either tree, and
> the feature that the series adds will be available when both trees get
> merged together on -next or Linus tree.

The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343ff3:

  Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/pfuze100-poweroff

for you to fetch changes up to c29daffa322ad36978cbce487f8ebcd9c3c3f7c0:

  regulator: pfuze100-regulator: provide pm_power_off_prepare handler (2018-09-11 16:15:57 +0100)

----------------------------------------------------------------
regulator: pfuze100: Power off support

The pfuze100 has some innovative and creative power off support which
requires some cross tree work to handle; this tag is the regualtor bits
of that work.

----------------------------------------------------------------
Oleksij Rempel (3):
      kernel/reboot.c: export pm_power_off_prepare
      regulator: pfuze100: add fsl,pmic-stby-poweroff property
      regulator: pfuze100-regulator: provide pm_power_off_prepare handler

 .../devicetree/bindings/regulator/pfuze100.txt     |  5 ++
 drivers/regulator/pfuze100-regulator.c             | 91 ++++++++++++++++++++++
 kernel/reboot.c                                    |  1 +
 3 files changed, 97 insertions(+)

--DBIVS5p969aUjpLe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAluX3P4ACgkQJNaLcl1U
h9DYcQf/T4B8STe5DVYJ7XcIqMdP9niqyxfDHKXnaV83jPTBEbCXqBjxRlt/3JpU
vTrcDW97YDnUk2iOeq3oPER4svv5ELXiOZSQIAZnR3sQxuDCPLRxVm0HpX12rFLv
Lscfxv6LEbfbSqKG5v7w92wgYZA2ab0PdDGm4C1fbMKnq1Qs5ltpHMwtZDg48YDA
O0gz4OCzTJmcwDICQemWP04xs3XL31dvO3ysdEJNwrqNBuv4MERrRtyljpTCMrVM
gOcnWS4zKT4zTAvr8rnRVojR1kkLupoUgrPfADpYzPgMSSeL5RtuC+Ad8FOD7wDa
rfhRp0nr2va6alTLEny2NghIXdxZTg==
=bf0C
-----END PGP SIGNATURE-----

--DBIVS5p969aUjpLe--
