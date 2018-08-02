From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v9 3/6] kernel/reboot.c: export pm_power_off_prepare
Date: Thu, 2 Aug 2018 11:44:43 +0100
Message-ID: <20180802104443.GH9117@sirena.org.uk>
References: <20180802103425.3053-1-o.rempel@pengutronix.de>
 <20180802103425.3053-4-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0841732461816941856=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180802103425.3053-4-o.rempel@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, yibin.gong@nxp.com, Michael Turquette <mturquette@baylibre.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-imx@nxp.com, kernel@pengutronix.de, "A.s. Dong" <aisheng.dong@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, Russell King <linux@armlinux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Leonard Crestez <leonard.crestez@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0841732461816941856==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2oox5VnwalALFvA7"
Content-Disposition: inline


--2oox5VnwalALFvA7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 02, 2018 at 12:34:22PM +0200, Oleksij Rempel wrote:
> Export pm_power_off_prepare. It is needed to implement power off on
> Freescale/NXP iMX6 based boards with external power management
> integrated circuit (PMIC).

I thought we'd got an ack for this from Raphael on a previous version or
am I mistaken?

--2oox5VnwalALFvA7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlti4JoACgkQJNaLcl1U
h9DRVggAgz0AKW33j9seRp5nJB5gGs1Gi5SjZMd7GKJLj7Fk6GOZEj4vBxZV+AWc
9F3COPoOWo7sFq2OVhmDw2UgfGWLqI3atHUkkqmk31mrAsHcts6+6AIlGK0z2sii
QrxzJoVm+7vn7ft6OcXu8Z73I5pWvzAHxOA16GNDoJDMxYgXFNjaetpntWq/z0XG
AlgagvG+Tn3ibAP5UxWR2hbfNP9gVxOMz+W784ssF02puTjU/4oY+ZQkDJYuE+Km
gbvLWq6E77+S6cF0CxuKYcqUVv4xcmMsHz0jRJWBSgJBuRG6jQiVCFxzGFy0TFx5
BgMtR9r3+Fze77Wb4fjJURqe0dykNQ==
=YEMF
-----END PGP SIGNATURE-----

--2oox5VnwalALFvA7--


--===============0841732461816941856==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0841732461816941856==--
