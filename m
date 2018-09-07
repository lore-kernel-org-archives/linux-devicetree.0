From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v9 3/6] kernel/reboot.c: export pm_power_off_prepare
Date: Fri, 7 Sep 2018 09:35:59 +0200
Message-ID: <20180907073559.ejffdfjy7zpqetzq@pengutronix.de>
References: <20180802103425.3053-1-o.rempel@pengutronix.de>
 <20180802103425.3053-4-o.rempel@pengutronix.de>
 <20180802104443.GH9117@sirena.org.uk>
 <94d48ecb-7302-c7ed-e815-730be0426a04@pengutronix.de>
 <20180802113552.GJ9117@sirena.org.uk>
 <20180827014815.GD29208@dragon>
 <20180906101516.GA5360@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hv37p32vqzzbscv3"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180906101516.GA5360@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, yibin.gong@nxp.com, Michael Turquette <mturquette@baylibre.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-imx@nxp.com, kernel@pengutronix.de, "A.s. Dong" <aisheng.dong@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, Russell King <linux@armlinux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Leonard Crestez <leonard.crestez@nxp.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--hv37p32vqzzbscv3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Thu, Sep 06, 2018 at 11:15:17AM +0100, Mark Brown wrote:
> On Mon, Aug 27, 2018 at 09:48:16AM +0800, Shawn Guo wrote:
>=20
> > Can you ACK on those two regulator patches, so that I can queue this
> > series up on IMX tree?
>=20
> I was expecting to get a pull request with the precursor patches in it -
> the regulator driver seems to get a moderate amount of development so
> there's a reasonable risk of conflicts.

Are there any thing I can or should do?

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--hv37p32vqzzbscv3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEpENFL0P3hvQ7p0DDdQOiSHVI77QFAluSKlwACgkQdQOiSHVI
77SbiAf/Vo61tQX0DvUQYecE1iy7j6lBfvQsrNZrltl+fBM5WCwbqszQiK9ADiyg
1/dLFR3VlCJXlgNTF1wcz1NymDAyStRkDR1670WY6x/qJeBwzNx7OHQuGQJtmj4G
m8+GmT/AApfITmEr4sShF8TmkMu1wtXw4QFVj0hwBjAbAztWMqAlTt9TWOkoykoL
4n2HuWWh7LUdq8A9ggGavw4YBSTA/fVHgpQdzAhK+mCDA7UGOyEf9r2AiG1eXa/q
u+GXp9OQ5UNjbG5PW9v3NNZqsti/YJoN2bmqfmRHCgDARwNiusxa/IA3+CbAucop
mJhmzM0+g7O9CKbs9Wqeag+7fTmhjw==
=ncWt
-----END PGP SIGNATURE-----

--hv37p32vqzzbscv3--
