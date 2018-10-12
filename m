From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 3/5] clk: lochnagar: Add support for the Cirrus Logic
 Lochnagar
Date: Fri, 12 Oct 2018 18:52:41 +0200
Message-ID: <20181012165241.GH2340@sirena.org.uk>
References: <20181008132542.19775-1-ckeepax@opensource.cirrus.com>
 <20181008132542.19775-3-ckeepax@opensource.cirrus.com>
 <153924124658.207691.10370075148426001371@swboyd.mtv.corp.google.com>
 <20181011145422.GG25351@sirena.org.uk>
 <153928658292.5275.11321177725702156165@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YrlhzR9YrZtruaFS"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <153928658292.5275.11321177725702156165@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, lee.jones@linaro.org, linus.walleij@linaro.org, mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--YrlhzR9YrZtruaFS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 11, 2018 at 12:36:22PM -0700, Stephen Boyd wrote:
> Quoting Mark Brown (2018-10-11 07:54:22)
> > On Thu, Oct 11, 2018 at 12:00:46AM -0700, Stephen Boyd wrote:

> > > Is this used for anything besides getting the regmap? Can you get the
> > > pointer to the parent in probe and use that to get the regmap pointer
> > > from dev_get_remap() and also use the of_node of the parent to register

> > dev_get_regmap() is pretty expensive, I'd not advise using it in
> > anything that might approximate a fast path.  It's kind of debatable
> > when I2C gets involved but still feels wrong.

> I'm suggesting the regmap is acquired in probe and a pointer is stored
> here in this structure. That is not a fastpath as far as I know.

Ah, great - that's the intended usage.

--YrlhzR9YrZtruaFS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlvA0VgACgkQJNaLcl1U
h9AWSAf/bRb9XA4nmyIZXZ01LsvCh9qzzhBcZK8rnMdHUgpTfEHzByErkofBCbu9
pkNZlcYzcBiyf4P+0zMHXJMzEXhX8OZzz4TQOZvTojgfo/UzhJFOJ3wFiuzJbqZK
FTbHUNcVPEOPE+kWkHhM40+ZxGG9ETD9sRWlnQjcMLlwoQLPIIv7vhmgljUJ+BM/
ZibZx7kvxYVEc11sPvkJ6WmMWJninFFRG9obj/R/Hsy/9OqNMVM1IUvSxFIWWPAu
0joXz/xBHyvhGx1U79Fcb5f+hMc5Yuvr3YzEaQjX+cxf1KZkS2qhnGc4v9EnCRkW
l14g4c+0bp32wQ57TsgcDZs0aDXKdw==
=zUtC
-----END PGP SIGNATURE-----

--YrlhzR9YrZtruaFS--
