From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/4] Documentation: tps65086: Add DT bindings for the
 TPS65086 PMIC
Date: Wed, 21 Oct 2015 11:29:52 +0100
Message-ID: <20151021102952.GJ32054@sirena.org.uk>
References: <1445014753-15450-1-git-send-email-afd@ti.com>
 <1445014753-15450-2-git-send-email-afd@ti.com>
 <20151019091311.GH31804@x1>
 <5625095F.5080204@ti.com>
 <20151019152100.GK31804@x1>
 <56250AF9.3030907@ti.com>
 <20151020113128.GN31804@x1>
 <56264990.8050501@ti.com>
 <20151021084633.GB3270@x1>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/SgVJVxFudH2R+XP"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151021084633.GB3270@x1>
Sender: linux-gpio-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: "Andrew F. Davis" <afd@ti.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--/SgVJVxFudH2R+XP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 21, 2015 at 09:46:33AM +0100, Lee Jones wrote:
> On Tue, 20 Oct 2015, Andrew F. Davis wrote:

> > I could change the core to be "tps65086-pmic", then call the regulator
> > driver "tps65086-regulator" if this works for you, this seems to be the
> > way new drivers name the regulator driver (max77843.c).

> Yes, this is what I was thinking of.

> ti,tps65086 is uninformative/undescriptive and tells me nothing.

It is however the normal way we write compatible strings - the class
information would normaly go in the node name (ie, i2c@7000c000 or
whatever).

--/SgVJVxFudH2R+XP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWJ2kfAAoJECTWi3JdVIfQo/cH/j5KlJx4UxQiDSFQlB+K6K9T
cPkKwYYsNeNmJR8H2vhU+9frSVvWxjDZ3AF409a5xWaWjdSEx/xI2k67RavRa3Qx
G9t5STcFBdq/fXGvYvhvbcaV78rKsSM/8fyOqrkk2PCmS9YGF+ip/WiZsJYfw8u1
gKXKGJZM45gRI19fmAgwdlgWyXFzonTcH/nPv305h00MKzvcQrdlmKl4Hqa6lJkn
Oxb3MDQ8jOlBtjVAQzom8vDvso8e2DvPy3uAYfSox2/rZP0rYsFl3ynD5Uoe9aJA
4rwrtgp3VJqM8MI9iJL8D4F93WM8btcTkGz2soetGoW8WU8d/YoDv7e4oBJIimk=
=fw83
-----END PGP SIGNATURE-----

--/SgVJVxFudH2R+XP--
