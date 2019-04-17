From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V1 3/3] regulator: slg51000: add slg51000 regulator driver
Date: Wed, 17 Apr 2019 16:49:05 +0100
Message-ID: <20190417154905.GD5703@sirena.org.uk>
References: <cover.1555389447.git.eric.jeong.opensource@diasemi.com>
 <5e4a6a007e45feac6d35203305cafd865be48755.1555389447.git.eric.jeong.opensource@diasemi.com>
 <20190416152448.GC4834@sirena.org.uk>
 <VE1PR10MB288069C2FC4B6F79AE8F26A891250@VE1PR10MB2880.EURPRD10.PROD.OUTLOOK.COM>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="11Y7aswkeuHtSBEs"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <VE1PR10MB288069C2FC4B6F79AE8F26A891250@VE1PR10MB2880.EURPRD10.PROD.OUTLOOK.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Hyeung Dong Jeong <eric.jeong.opensource@diasemi.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, DEVICETREE <devicetree@vger.kernel.org>, LINUX-KERNEL <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Support Opensource <Support.Opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org


--11Y7aswkeuHtSBEs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2019 at 11:25:29AM +0000, Eric Hyeung Dong Jeong wrote:
> On Wednesday, April 17, 2019 12:25 AM +0900, Mark Brown wrote:

> > This looks like it should be a get_status() operation as it's reading
> > status bits rather than the command we sent to the device - for that
> > just use regulator_is_enabled_regmap().

> I thought that it needs to return current status of a regulator when the =
function is called.
> I am wondering that the *is_enabled()* function is just to check=20
> If a regulator has been turned on or not rather than getting current stat=
us of the regulator.

It should say if we told the hardware to enable the regulator so the
former - basically, is the hardware in the same state it'd be in after
we called _enable() or _disable().  If there's a fault then that should
only affect is_enabled() if it resets the enable bit that _enable() set.

--11Y7aswkeuHtSBEs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAly3SvAACgkQJNaLcl1U
h9Crhwf9H312wObjFKX5Rz+Mwx7XZg7FSv06VMhCQ9BkLOva1gyLRu9r6ZTFM5XP
5cxvKfVvZkoqgH9gxa6Rciqsq/sui+JcVQc5wYgUOkJWEOq31rlF3CnVm3k7tCCI
U8B6o5j2QKK+yUfX1EOG3DshTe8vyZ0h8zEGDPB266jDjaIi8xg+PItqL8BUl7Nw
9g342bLs4nUBQTopToy+xuGJ//QRE1M0+vm+BSwknSN+N9hH6nFRf2ijTJhFUWWi
DEK/vBmKmwd+/eFFU+djUmP/UDzfVVXvD7iLaY/Lw4C/3JUC6xi7qjtQ+lEsOE4i
ERqzG670pPBpTc4/q0j/03br7Ckmdw==
=GfsX
-----END PGP SIGNATURE-----

--11Y7aswkeuHtSBEs--
