From: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: linux-next: manual merge of the arm-soc tree with the
 i2c-embedded tree
Date: Mon, 16 Jul 2012 12:17:06 +0200
Message-ID: <20120716101706.GB17435@pengutronix.de>
References: <20120710164130.f38e4d1673f925ddb13914c9@canb.auug.org.au>
 <20120712131231.GH2194@pengutronix.de>
 <CACRpkdboeF_G=sTPeSyuZ6KGLCmGSKx_NS=6Rim6HkR2f9=AAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MW5yreqqjyrRcusr"
Return-path: <linux-next-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdboeF_G=sTPeSyuZ6KGLCmGSKx_NS=6Rim6HkR2f9=AAQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Alessandro Rubini <rubini@gnudd.com>, Linus Walleij <linus.walleij@stericsson.com>, Stephen Warren <swarren@wwwdotorg.org>, Deepak Saxena <dsaxena@linaro.org>, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org


--MW5yreqqjyrRcusr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Well I think I ACKed that from the point of view that it will work as
> expected with ux500 with these bindings. What is best from the I2C
> subsystem point of view is another question ...

Okay, thanks for clarifying.

> Overall I think we have this general problem with a lot of DT
> conversion happening right now: the tempo is set very high and
> all chip vendors want DT support RealQuickNowPreferrablyYesterday
> and that makes it hard for subsystem maintainers to hold back,
> and I also fear vendor-specific properties are overused for this
> reason.

Word.

> And about the perpetual nature of device tree bindings it
> appears to me that the modus operandi right now is to not
> regard any of these as written in stone until they are removed
> from the kernel tree. We have plenty of drivers patching
> trees and drivers in one for the moment.

I don't get this one. Yes, they are of perpetual nature, so how could we
remove them from the kernel tree?

What I am afraid of is: tentative solutions tend to stay, because the
need for a proper solution is reduced. Yet, finding proper generic
bindings might take some time which doesn't meet the high pressure
around DT at the moment.

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--MW5yreqqjyrRcusr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlAD6iIACgkQD27XaX1/VRtxEACfZtHvrw1MIgXyO1xqL9gXN3MA
YAIAnjsEPtmTIatHwp4A0OjqtcOed/KL
=+TIl
-----END PGP SIGNATURE-----

--MW5yreqqjyrRcusr--
