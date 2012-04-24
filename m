From: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH v2 3/3] ARM: imx6q: switch to use pinctrl driver
Date: Tue, 24 Apr 2012 11:08:41 +0200
Message-ID: <20120424090841.GA6987@pengutronix.de>
References: <1334933916-12971-1-git-send-email-b29396@freescale.com>
 <1334933916-12971-3-git-send-email-b29396@freescale.com>
 <CACRpkdbbdkhN-hVF6vP4j6bP-Nsdft5UjjpAVhcKn6KSpEbcuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbbdkhN-hVF6vP4j6bP-Nsdft5UjjpAVhcKn6KSpEbcuQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Dong Aisheng <b29396@freescale.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, linus.walleij@stericsson.com, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Chris Ball <cjb@laptop.org>
List-Id: devicetree@vger.kernel.org


--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 24, 2012 at 10:56:43AM +0200, Linus Walleij wrote:
> On Fri, Apr 20, 2012 at 4:58 PM, Dong Aisheng <b29396@freescale.com> wrot=
e:
>=20
> > From: Dong Aisheng <dong.aisheng@linaro.org>
> >
> > Signed-off-by: Dong Aisheng <dong.aisheng@linaro.org>
> >
> > ---
> > This is not a formal patch and is only used for test
> > since before the pinctrl core handle dummy state is in,
> > enable pinctrl in driver will break other platforms.
> >
> > ChangeLog v1->v2:
> > * using updated binding
> > ---
> > =A0arch/arm/boot/dts/imx6q-arm2.dts =A0 | =A0 =A02 ++
> > =A0arch/arm/boot/dts/imx6q.dtsi =A0 =A0 =A0 | =A0 17 +++++++++++++++++
> > =A0arch/arm/mach-imx/Kconfig =A0 =A0 =A0 =A0 =A0| =A0 =A02 ++
> > =A0drivers/mmc/host/sdhci-esdhc-imx.c | =A0 12 ++++++++++++
> > =A04 files changed, 33 insertions(+), 0 deletions(-)
>=20
> Since this touches the MMC driver I'd like an ACK from the
> maintainer, but no maintainer is set for this subdriver, still
> it feels like Sascha and/or Wolfram should be involved.

Can we have a more descriptive name for the pinctrl member?

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk+WbZkACgkQD27XaX1/VRvYxgCfeEur/kVCceTqiUhSyUnOZeip
B4sAoIVZHias3IB14NQKOxLNLciHL2F/
=b0Fu
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--
