From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 4/5] regulator: tps65912: Add regulator driver for the
 TPS65912 PMIC
Date: Thu, 5 Nov 2015 10:14:17 +0000
Message-ID: <20151105101417.GM1717@sirena.org.uk>
References: <1443731874-21362-1-git-send-email-afd@ti.com>
 <1443731874-21362-5-git-send-email-afd@ti.com>
 <20151022164724.GZ8232@sirena.org.uk>
 <563A25BE.90609@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0+35XlDF45POFHfm"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <563A25BE.90609@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--0+35XlDF45POFHfm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 04, 2015 at 09:35:26AM -0600, Andrew F. Davis wrote:

> Something I just noticed, when I remove this table, module loading stops
> working, even with 'MODULE_ALIAS("platform:tps65912-regulator");'. It
> looks like when DT is enabled platform_uevent (drivers/base/platform.c:787)
> only sends out the OF MODALIAS event then returns, not sending out the
> platform event, is this desired behavior? If so then I will need this
> table even though I still create the device and match it on platform
> name as you suggested.

That sounds like a bug to me, it'll have broken a bunch of existing
devices.

--0+35XlDF45POFHfm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWOyv2AAoJECTWi3JdVIfQ0GIH/RNLKXR7B1GMWbbWittiHiuW
KNOcpsPUZ3dQe12rVozIofs8Wt3oGJ6HrB/b/AgEwNNHggMZmiA1BDnQvN/VcYd/
I7ezShtl86o5mM1Bk3IGPuzS9W3q2aITv5pY88LG390ffJS6sh18Tx/c8dZ26ckw
QoWWHilLmymfVnmzZ72GBz2KLx5JJN0IgAEDwU5GBq1v4ppKtXymyBVu00vzWx6G
xoGJ4bbou3Ja5+jA94NXbKfeV1f33YedxN4rpxgds9WA7uAM7KiS/rKZQAsx8HYQ
cWeu1CuN+xZ1rFS66LV0SehCsIQhr73BNMnsoZj+tujwzwYbtlS7wxdTwRWgiJI=
=ueN1
-----END PGP SIGNATURE-----

--0+35XlDF45POFHfm--
