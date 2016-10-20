From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 1/8] drm/bridge: rgb-to-vga: Support an enable GPIO
Date: Thu, 20 Oct 2016 15:00:56 +0200
Message-ID: <20161020130056.6tf4uuqsxiphqzx4@lukather>
References: <20161020034344.14154-1-wens@csie.org>
 <20161020034344.14154-2-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="egmwreqrenan6oqn"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161020034344.14154-2-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--egmwreqrenan6oqn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2016 at 11:43:37AM +0800, Chen-Yu Tsai wrote:
> Some rgb-to-vga bridges have an enable GPIO, either directly tied to
> an enable pin on the bridge IC, or indirectly controlling a power
> switch.
>=20
> Add support for it.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--egmwreqrenan6oqn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYCMAIAAoJEBx+YmzsjxAg7RsQAJ0VkkducTjuCJsByzmW2opx
qVxub4KPFYhduA/eiK48Snzlsmfzql5pZUSfAL1c3olxLmO4IJOeMrIrREOZOE1m
mI7YJhuuecgzE2/WVwHeeFbnNJtUZ/EoSPLv9MJMDmTzuxgtAU/HfCyUoMiBXwnQ
5up1x1/D4f6egTSe8vlpDJ7vOBWwOGg6B1lossuhPzO5LlpRP73/hKmxRy5wq/oN
p+LEA4s59PMLp1GTc2xQME4BTkFbeIMMjqyA7HK/+UHZldOm8bIIYvQcQklg54+x
ZDQB0k1lSgPDNf/aziAdiTktH9OY1eol5JZRsovot9sbrQs9b4/seoU53YwdcI/u
bGjZAg/92b48+8ReE/92F0gKlauGtQJop0Dnf2nJWGfqGv4Q25Cy45NdoKmmSitj
PEqSj/RLXeCGuIwcXi8pakQDUvyvtmD2GJN54BWor5aPxlBKUKQPMypBtS1dI5qD
qTqP5NsBSVTFrbTIHB4Gr1odK8xb0TDuDauvslCIKT3W2Mb6xvOfScRVzCtdeKKR
+agpKAPPs7EpOMCB+yfbL/7ncUaAOZZDp6+DN1HVHUK5hkIaYEvd6q0FGlr8r/OD
U02S3zHdIDP1AwGl2pMdSwvB7C+TiIA9GRaZITyoSJh4CZDdUQuf+7KgQqSM2IUS
NsVd5l1ir+qwj7wNLYx2
=ScbW
-----END PGP SIGNATURE-----

--egmwreqrenan6oqn--
