From: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: linux-next: manual merge of the arm-soc tree with the
 i2c-embedded tree
Date: Mon, 16 Jul 2012 15:00:15 +0200
Message-ID: <20120716130015.GF17435@pengutronix.de>
References: <20120710164130.f38e4d1673f925ddb13914c9@canb.auug.org.au>
 <20120712131231.GH2194@pengutronix.de>
 <CACRpkdboeF_G=sTPeSyuZ6KGLCmGSKx_NS=6Rim6HkR2f9=AAQ@mail.gmail.com>
 <20120716101706.GB17435@pengutronix.de>
 <5003FB7C.4030509@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Wb5NtZlyOqqy58h0"
Return-path: <linux-next-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5003FB7C.4030509@linaro.org>
Sender: linux-next-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alessandro Rubini <rubini@gnudd.com>, Linus Walleij <linus.walleij@stericsson.com>, Stephen Warren <swarren@wwwdotorg.org>, Deepak Saxena <dsaxena@linaro.org>, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org


--Wb5NtZlyOqqy58h0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> >What I am afraid of is: tentative solutions tend to stay, because the
> >need for a proper solution is reduced. Yet, finding proper generic
> >bindings might take some time which doesn't meet the high pressure
> >around DT at the moment.
>=20
> I agree with what you say to some extent, but I believe that it is
> more important to have a working solution now than to ensure that
> each bindings are as unique as possible. After any suggestion of
> consolidation, a move from vendor specific to generically defined
> Device Tree bindings is trivial. Especially in the current stage
> where adaptions and definitions are still fluid.

See my response to Linus. I do understand your view and where it comes
=66rom. As a maintainer, I have other priorities. No offence involved,
it needs some settlement.

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--Wb5NtZlyOqqy58h0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlAEEF8ACgkQD27XaX1/VRsWNgCfe0+JZ2Rxhzcwt/MRWuszihvN
hXIAnRzaYpdnveXY261g/nCxzlYhMXT+
=uOx2
-----END PGP SIGNATURE-----

--Wb5NtZlyOqqy58h0--
