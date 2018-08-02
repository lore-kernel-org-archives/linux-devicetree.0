From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v9 3/6] kernel/reboot.c: export pm_power_off_prepare
Date: Thu, 2 Aug 2018 12:35:52 +0100
Message-ID: <20180802113552.GJ9117@sirena.org.uk>
References: <20180802103425.3053-1-o.rempel@pengutronix.de>
 <20180802103425.3053-4-o.rempel@pengutronix.de>
 <20180802104443.GH9117@sirena.org.uk>
 <94d48ecb-7302-c7ed-e815-730be0426a04@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="72k7VsmfIboquFwl"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <94d48ecb-7302-c7ed-e815-730be0426a04@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, kernel@pengutronix.de, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Liam Girdwood <lgirdwood@gmail.com>, Leonard Crestez <leonard.crestez@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Fabio Estevam <fabio.estevam@nxp.com>, Russell King <linux@armlinux.org.uk>, linux-imx@nxp.com, yibin.gong@nxp.com, "A.s. Dong" <aisheng.dong@nxp.com>
List-Id: devicetree@vger.kernel.org


--72k7VsmfIboquFwl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 02, 2018 at 12:47:27PM +0200, Oleksij Rempel wrote:
> On 02.08.2018 12:44, Mark Brown wrote:

> > I thought we'd got an ack for this from Raphael on a previous version or
> > am I mistaken?

> No, we got an:
> "Anyway, I have no particular problems with exporting
> pm_power_off_prepare via EXPORT_SYMBOL_GPL()."

> Should i see it as ACK?

It's probably good enough. =20

--72k7VsmfIboquFwl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlti7JgACgkQJNaLcl1U
h9AhdAf/TbZVRZ28YFMBoAatxLryUYP178QUB6AlI/U68p5IlMOnGK/xFGaPJ7G7
bSyJWiVfHFTB2nKwoltQy219TQuUwr0c3RJ3t2kpFm06L5a/f9YyEZCndUxFOrgy
dMSAeU5QaiOmQvGcWNrCmoIJ3K38xDm03FOLnzjUZ2Mk0WIyCuZkuacRDqHPRkgX
t4WI4xTsEHJWybjs8fcfjmnyp8GAwAilOTGT0AeyuXJvTp4s629YzI7njDbcSqxS
GLaE1Lrat9D/H6exC9UqfOSvP4OCjWCXYeSUPUUCgoMlWjYNtT0QVyM60tfizgtE
4vMkCluS9U/eszAJV2Vchh0RIFiw/Q==
=2d1o
-----END PGP SIGNATURE-----

--72k7VsmfIboquFwl--
