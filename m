From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 11/15] clk: sunxi-ng: Add N-M-factor clock support
Date: Mon, 27 Jun 2016 22:29:37 +0200
Message-ID: <20160627202937.GY4000@lukather>
References: <20160607204154.31967-1-maxime.ripard@free-electrons.com>
 <20160607204154.31967-12-maxime.ripard@free-electrons.com>
 <20160609094101.426a13c4c61aa6cb11df16fc@free.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0786ZyFfTSxuegBe"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160609094101.426a13c4c61aa6cb11df16fc@free.fr>
Sender: linux-clk-owner@vger.kernel.org
To: Jean-Francois Moine <moinejf@free.fr>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>, Vishnu Patekar <vishnupatekar0510@gmail.com>, linux-arm-kernel@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--0786ZyFfTSxuegBe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jun 09, 2016 at 09:41:01AM +0200, Jean-Francois Moine wrote:
> On Tue,  7 Jun 2016 22:41:50 +0200
> Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
>=20
> > Introduce support for clocks that multiply and divide using linear fact=
ors.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> >=20
> > ---
> > Changes from v1:
> >   - Fixed the maximums for both factors passed to the rational factor
> >     computation.
> > ---
> >  drivers/clk/sunxi-ng/Makefile |   1 +
> >  drivers/clk/sunxi-ng/ccu_nm.c | 114 ++++++++++++++++++++++++++++++++++=
++++++++
> >  drivers/clk/sunxi-ng/ccu_nm.h |  95 +++++++++++++++++++++++++++++++++++
> >  3 files changed, 210 insertions(+)
> >  create mode 100644 drivers/clk/sunxi-ng/ccu_nm.c
> >  create mode 100644 drivers/clk/sunxi-ng/ccu_nm.h
> >=20
> > diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makef=
ile
> > index a201fad6b11d..5c7ae1ad1082 100644
> > --- a/drivers/clk/sunxi-ng/Makefile
> > +++ b/drivers/clk/sunxi-ng/Makefile
> > @@ -9,4 +9,5 @@ obj-y +=3D ccu_gate.o
> >  obj-y +=3D ccu_mp.o
> >  obj-y +=3D ccu_mux.o
> >  obj-y +=3D ccu_nk.o
> > +obj-y +=3D ccu_nm.o
> >  obj-y +=3D ccu_phase.o
> > diff --git a/drivers/clk/sunxi-ng/ccu_nm.c b/drivers/clk/sunxi-ng/ccu_n=
m.c
> > new file mode 100644
> > index 000000000000..e35ddd8eec8b
> > --- /dev/null
> > +++ b/drivers/clk/sunxi-ng/ccu_nm.c
> > @@ -0,0 +1,114 @@
> > +/*
> > + * Copyright (C) 2016 Maxime Ripard
> > + * Maxime Ripard <maxime.ripard@free-electrons.com>
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License as
> > + * published by the Free Software Foundation; either version 2 of
> > + * the License, or (at your option) any later version.
> > + */
> > +
> > +#include <linux/clk-provider.h>
> > +#include <linux/rational.h>
> > +
> > +#include "ccu_frac.h"
> > +#include "ccu_gate.h"
> > +#include "ccu_nm.h"
> 	[snip]
> > +static unsigned long ccu_nm_recalc_rate(struct clk_hw *hw,
> > +					unsigned long parent_rate)
> > +{
> > +	struct ccu_nm *nm =3D hw_to_ccu_nm(hw);
> > +	unsigned long n, m;
> > +	u32 reg;
> > +
> > +	if (ccu_frac_helper_is_enabled(&nm->common, &nm->frac))
> > +		return ccu_frac_helper_read_rate(&nm->common, &nm->frac);
> > +
> > +	reg =3D readl(nm->common.base + nm->common.reg);
> > +
> > +	n =3D reg >> nm->n.shift;
> > +	n &=3D (1 << nm->n.width) - 1;
> > +
> > +	m =3D reg >> nm->m.shift;
> > +	m &=3D (1 << nm->m.width) - 1;
> > +
> > +	return parent_rate * (n + 1) / (m + 1);
>=20
> In the H3, 'm' is a pre-divider (audio and video PLLs):
>=20
> 	return parent_rate / (m + 1) * (n + 1);

That's true, but the "true" N-M clocks exist and are using this
formula (like the Audio PLL on A10's).

If (and when) that causes some rounding issues, we can always add
pre-divider support to N-Clocks that we are going to need anyway for
the older SoCs.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--0786ZyFfTSxuegBe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXcYyxAAoJEBx+YmzsjxAgy8IQAK3ieSbN2byn5uWey4B5e6F0
49phxN9nF9xGWWeiIW9bHNgC18t/v0+5/JhtpxWyq0W+R4YQnPcNSbS4MZStUXES
dJCo4ycNCAiyrlgljXRhFbE3heZIz4Ot8u9VEpbnmFRWqUYksmNYFVvcfqNspXH6
iyRExzBfvMAcc5wRGTd/eezlcb+LzUN7LSAEP7kGB2mjZSooJWu8J/w/cHQjxOVZ
N51s417w3xxTLEoHWn3GEuD6y5GHnddHD0eqAyzSX2f+ubb+D8BJkMa7ths93Ok5
qr7W95YEQNbjHP6W+q/AOrvF4fKRtSFC4eScE9ux+vFfYXA2CWmuelmbTz324RDU
sPuoKXt02ma9lYKtFZyerbbICbFsCAKS3VYUKfa9trZne4VC9IXvwq6TTQg2E1TG
vucz0TixnVQ2ru1VXv/qrxV1LqOMem9NReRY+VBrR9kdnoi0wMqEk5THTL0Dwivv
SAcBOuiV54f7HHU7EA5VvjTI6ilxjL2CTqgavXMidQYUSkd+V0Xj1cPoGqieSP2V
h94IKJ26XRnFQn+nq08RlW9fjwoxrKE/4WyafihP/2gXJ+RFWiA+EOPJnC9+o5Sr
Ey0oSxR5eofwUGLVztw+tAdmOApHL0W3UhepzoKJVC1uS/2FOiKT3WQkbVhuU2X0
Oo2xm5Er57DS5EJ/oP1O
=6ZjI
-----END PGP SIGNATURE-----

--0786ZyFfTSxuegBe--
