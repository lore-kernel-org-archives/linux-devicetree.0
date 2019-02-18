Return-Path: <SRS0=m5NJ=QZ=sirena.org.uk=broonie@kernel.org>
Date: Mon, 18 Feb 2019 17:54:30 +0000
From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: gpio: Reword the binding document
Message-ID: <20190218175430.GC10794@sirena.org.uk>
References: <20190216174859.15738-1-marek.vasut@gmail.com>
 <E1gv6SG-0000Jv-KB@stardust.g4.wien.funkfeuer.at>
 <83550921-b0ec-fa34-b120-2dd159f256d8@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Sr1nOIr3CvdE5hEN"
Content-Disposition: inline
In-Reply-To: <83550921-b0ec-fa34-b120-2dd159f256d8@gmail.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Harald Geyer <harald@ccbib.org>, devicetree@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--Sr1nOIr3CvdE5hEN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 16, 2019 at 10:37:37PM +0100, Marek Vasut wrote:
> On 2/16/19 9:20 PM, Harald Geyer wrote:
> >> From: Marek Vasut <marek.vasut+renesas@gmail.com>

> >>  - startup-delay-us	: Startup time in microseconds.

> > Not relevant for your patch, but I wonder why this is not in the
> > generic regulator binding.

> Presumably because it's implemented only be the gpio regulator driver,
> however it could be moved into the core (?)

The core can do the ramping but for most regulators it should know any
ramp rate restrictions just from knowing which regulator is being used
(and possibly some device specific configuration like the values of some
passives), there should be no requirement to manually configure the
required delay in the DT.

--Sr1nOIr3CvdE5hEN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlxq8VUACgkQJNaLcl1U
h9A7VAf+O+oj58O66vu3vZQB2/eZxCV8Qkpgg52G6Q0K81pabAVQF9E+vHU9wzg4
tmW9ZMrZ8tXAJZyL1FVq75g++O/3NjDswO0Xi5MH4m9Kwe4LRrGD3/i2GYG056Gf
0PqiSrIsG8XpZ/Vpnr+172rX49Dxv2MngHyrC+XzRldTrbeTatBhDcI8IHv4ZO1A
ZJvRnip+YenNvK1tcU3dhoetyRFO8HWFvEHdLj19rHc+YE00xnsKZtmrl4Dmu6f2
AuH90NXTEHKxDjso0o2I8Xqt7eKZtCBO4jk/Pc7Ce3RZG8hCwFOXirGAm3F2xAFt
cfvP1klU4WWJNuAia3QR1lGay1Sw5A==
=i6SP
-----END PGP SIGNATURE-----

--Sr1nOIr3CvdE5hEN--
