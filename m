From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 3/7] mfd: add support for sun6i PRCM
 (Power/Reset/Clock Management) unit
Date: Mon, 19 May 2014 11:27:25 +0200
Message-ID: <20140519092725.GE29466@lukather>
References: <1399633911-7094-1-git-send-email-boris.brezillon@free-electrons.com>
 <1399633911-7094-4-git-send-email-boris.brezillon@free-electrons.com>
 <20140509135251.GY5767@lee--X1>
 <20140515151756.GX29258@lukather>
 <20140519092159.GE4978@lee--X1>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cHMo6Wbp1wrKhbfi"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBIM646NQKGQEIAPLYWY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140519092159.GE4978@lee--X1>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--cHMo6Wbp1wrKhbfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2014 at 10:21:59AM +0100, Lee Jones wrote:
> > > > The PRCM (Power/Reset/Clock Management) block exposes several subde=
vices
> > > > in different subsystems (clk, reset ...)
> > > >=20
> > > > Add basic support for the PRCM unit with clk (AR100, AHB0, and APB0=
 clks)
> > > > and reset controller subdevices.
> > > >=20
> > > > Other subdevices might be added later (if needed).
> > > >=20
> > > > Signed-off-by: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > > > Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > > > ---
> > > >  drivers/mfd/Kconfig      |   8 +++
> > > >  drivers/mfd/Makefile     |   1 +
> > > >  drivers/mfd/sun6i-prcm.c | 134 +++++++++++++++++++++++++++++++++++=
++++++++++++
> > > >  3 files changed, 143 insertions(+)
> > > >  create mode 100644 drivers/mfd/sun6i-prcm.c
> > >=20
> > > [...]
> > >=20
> > > > +/*
> > > > + * Copyright (C) 2014 Free Electrons
> > > > + *
> > > > + * License Terms: GNU General Public License v2
> > > > + * Author: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > > > + *
> > > > + * Allwinner PRCM (Power/Reset/Clock Management) driver
> > > > + *
> > > > + */
> > > > +
> > > > +#include <linux/mfd/core.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/of.h>
> > >=20
> > > Ah, now isn't that better?
> > >=20
> > > Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >=20
> > How do you want to merge this? Do you want me to take it through
> > mach-sunxi tree, or do you want to take it in your tree?
>=20
> If Boris can tell me what needs to go in with this patch (or if it
> can go in on its own), I will create a(n immutable) branch from which
> you can pull into your tree.

We don't have any runtime or compile time dependency on this, so you
can merge it through your tree. Unless something change, I don't have
to pull anything in my tree.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--cHMo6Wbp1wrKhbfi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTec59AAoJEBx+YmzsjxAgNjgP/Rnih10ejkX6sSlRlsCL2Jd8
NwXHVY+uLzsAqQFsDVyw7yQTm4zKyEqjejgzLsskg8nab9jNrAUHnfySuIUmAO0B
97nIvKG8jt8zOxqFhryCLouJOfaadhONwtri8W8bd++zvEjPGKFz/UUi453wEhlO
cVUltXdxdh/Ob8R3yOVOmifHxI948YAms2LqHUJV4lbDQIxds3OydR3PMSmVg4Kc
ZlevJnpsiujWT4g1LVhFdhB840d0CL2HL/F3E3e7Xu6thDatR2guMDC0asfwxCK1
VQQ1SkP/3A95KhuyYJseSlIY2kZPS4bU4a2XP46Sn5vNsOUtztcPAQTZY2i9lbvM
GF15p3KzjJZiuPxRT7sCCi7aHWzk7SX5LnzLB82o5rmc/ayJBClIPx4v6Ad4iaLg
CmEDmLfdbb558Vqnee6nP1JASU2KnigubfDK1qYkHeOknrO99pjlP1i1LijF3GAu
ADdmTWkIdpMYpi/baXiNNh72lOZ3y+gd11BH1duhJU94TrddjLXxvH+GSfPdIVg4
vHYzG+Q2WVOnzPWFMqAG7jLNTztdMK9oMMy3fKNjFZHKZ7eG/Se3PRJxb9AyB5Yu
+OValPg5rTJqikz9mi86VhpNwne1P+OjGRIkel0hj2M4KoQIGbvseVNpnNrSyyCC
nPAEEnLxaKFaP/SHdkqw
=BWEd
-----END PGP SIGNATURE-----

--cHMo6Wbp1wrKhbfi--
