From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 2/5] mfd: lochnagar: Add support for the Cirrus Logic
 Lochnagar
Date: Fri, 26 Oct 2018 16:47:51 +0100
Message-ID: <20181026154751.GA27137@sirena.org.uk>
References: <20181008132542.19775-1-ckeepax@opensource.cirrus.com>
 <20181008132542.19775-2-ckeepax@opensource.cirrus.com>
 <20181025074459.GF4939@dell>
 <20181025082621.GD16508@imbe.wolfsonmicro.main>
 <b2f85f45-cbe9-5a27-e9e8-ad28f2bd9bd6@opensource.cirrus.com>
 <20181025114205.GC4870@dell>
 <20181025124905.GF16508@imbe.wolfsonmicro.main>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181025124905.GF16508@imbe.wolfsonmicro.main>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Lee Jones <lee.jones@linaro.org>, Richard Fitzgerald <rf@opensource.cirrus.com>, mturquette@baylibre.com, sboyd@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 25, 2018 at 01:49:05PM +0100, Charles Keepax wrote:

> I don't think you can sensibly get away with not supplying
> default values. You say most sane register layouts have zero
> values, alas again you may not be the biggest fan of our hardware
> guys. The Lochnagar actually does have mostly zero defaults but
> that is very much not generally the case with our hardware.

There's large classes of hardware where it's just not generally the
default over all manufacturers - things like audio CODECs and regulators
that have to represent continuous ranges of numerical values have to
decide between a helpful representation of numbers with a non-zero
default or having a more complicated representation of numbers which
manage to make zero correspond to whatever the default value is.  It's
also quite common for booleans you want to default on.

> One of the main aims of regmap is to avoid bus accesses when
> possible but I guess on the first write/read to any register you
> could insert a read to pull the default, although I do worry
> there is some corner case/flexibility that is going to cause
> headaches later.

It will actually populate the cache from I/O if you don't provide
defaults but it then can't tell what the physical defaults are, we could
read back from hardware but then we have to sync that with the hardware
being reset and if you read the whole thing back that gets super
expensive with slow buses.

--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlvTNyQACgkQJNaLcl1U
h9AgVgf/XQjp7lDEmVFGgiTZTgLJZyMHMn1vB7lgsxxiFxVBlNiZr7Zg8BiK8cT5
1uTf6Z+Wn344YWwQ/Rx08GaLdcvfRKBPKQi6SGHpZ4pj5BJaOCobq3UlSyA9GXhO
UPyMpdJa3yzXaF0PV7w6kXkYi0fJe9jVe21b06fJweZmCF0fGaF4WIAUDDn3B947
Uj+hZywPa3UuH04sE/PybfrKrGtJz73U6tSo/FcXhKdPEfVy8KL0FgWXQiV5BPUi
xLU92y/gX8mS7L1aVPAoIkTgESA6sS0VKD4YLWjm9/1nWI1mghsTSSYfRqGJurvI
lXhYY+HkMGRV8jaOE4o/LIYmz+ow/A==
=EHBh
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--
