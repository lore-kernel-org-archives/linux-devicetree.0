From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 14/15] clk: sunxi-ng: Add H3 clocks
Date: Tue, 28 Jun 2016 10:32:41 +0200
Message-ID: <20160628083241.GA5550@lukather>
References: <20160607204154.31967-1-maxime.ripard@free-electrons.com>
 <20160607204154.31967-15-maxime.ripard@free-electrons.com>
 <146681451703.35033.17009542256505173233@resonance>
 <20160626123409.GK4000@lukather>
 <146707521689.89261.8354851392822550901@resonance>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <146707521689.89261.8354851392822550901@resonance>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>, Vishnu Patekar <vishnupatekar0510@gmail.com>, linux-arm-kernel@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Jean-Francois Moine <moinejf@free.fr>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 27, 2016 at 05:53:37PM -0700, Michael Turquette wrote:
> > > The nice thing about struct ccu_common is that you don't have to walk
> > > the list of clocks for each separate clock type like the above probe
> > > function does. I'm still thinking of the best way to solve this
> > > generically. Maybe add a .base member struct clk_hw? I dunno, and I've
> > > resisted the urge to add stuff to struct clk_hw in the past... But I
> > > really want to minimize this .probe as much as possible, and I do not
> > > want every clock provider driver to be forced to invent something like
> > > struct ccu_common every time.
> >=20
> > We'd need a few more things (in this case) at least: the register
> > offset and a private field to store our flags.
>=20
> A bit of mumbling to myself below:
>=20
> Hmm, upon further reflection, walking the list of ccu clocks is rather
> identical to walking the list of each clock type, as I do in the gxbb
> driver, where ccu_common is the one and only clock type.
>=20
> So that in itself is not a big deal and isn't a problem that needs
> solving.
>=20
> What needs solving is a way to populate base addresses for each clock at
> runtime in a way that does not *force* you to invent something like
> ccu_common if you do not need it.
>=20
> You would hit this issue if you broke your common gate or divider clocks
> out and did not wrap them in the ccu_common structure. I solved this by
> overloading the ->reg value of each of the common types as static data,
> and then did the following when registering them:
>=20
> 	/* Populate base address for gates */
> 	for (i =3D 0; i < ARRAY_SIZE(gxbb_clk_gates); i++)
> 		gxbb_clk_gates[i]->reg =3D clk_base +
> 			(u64)gxbb_clk_gates[i]->reg;
>=20
> Any thoughts on how to fix this for other common gate types that need
> their base addresses populated from an OF node at runtime?

One obvious way to work around it would be to allow to store a regmap
directly in the clk_hw structure, and then you'll only need to keep
the register offset in your clock type, which is fine (I think?).

> > > > diff --git a/include/dt-bindings/clock/sun8i-h3.h b/include/dt-bind=
ings/clock/sun8i-h3.h
> > > > new file mode 100644
> > > > index 000000000000..96eced56e7a2
> > > > --- /dev/null
> > > > +++ b/include/dt-bindings/clock/sun8i-h3.h
> > > > @@ -0,0 +1,162 @@
> > > > +#ifndef _DT_BINDINGS_CLK_SUN8I_H3_H_
> > > > +#define _DT_BINDINGS_CLK_SUN8I_H3_H_
> > > > +
> > > > +#define CLK_PLL_CPUX           0
> > > > +#define CLK_PLL_AUDIO_BASE     1
> > > > +#define CLK_PLL_AUDIO          2
> > > > +#define CLK_PLL_AUDIO_2X       3
> > > > +#define CLK_PLL_AUDIO_4X       4
> > >=20
> > > Are you sure you want to expose all of these clocks as part of the AB=
I?
> > > I exposed the bare minimum clocks for the gxbb driver in the DT shared
> > > header (we can always add more later) and kept the rest internal to t=
he
> > > kernel source.
> >=20
> > I thought about it, but that would require a third array with
> > basically the same clocks:
> >=20
> >   * the ccu_common array to patch to set the lock and base pointers,
> >   * the list of clocks to register
> >   * the clk_hw_onecell_data to deal with the dt binding.
>=20
> "the list of clocks to register" and "the clk_hw_onecell_data to deal
> with the dt binding" are the same array.
>=20
> You only need two arrays:
>=20
> 1) the ccu_common init data
> 2) the clk_hw_onecell_data array of clk_hw pointers that points to
> clk_hw statically defined in the ccu_common array

Ah, so you're still exposing them (anyone could be free to access of
the hidden clocks if it knows what value to use), but you're hiding
them (the ID is not public).

That could work, I'll change that.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXcjYpAAoJEBx+YmzsjxAgacQP/A+tKZYKPMzk1Hj2AoCOfZDo
wVA0WVzw+yBFqDw7V/7IEXIhr+22ZJLTxc4QwBP/0sRmicKz3KINqf2hpVR5DEMn
b0B/SMoFX8nPTSnnT0hFGLZ36UCIZ8ejXS6XQUBVzl0DDKpVZ4IOchkOD4gry15S
X4gmTMzIAjjBz9g4DozzjYwAJlR/iZxksCtyZPPa0UCjT1Sq6olGZtuLXnSVeV9V
6f23z6gzMWgi6yAVffDF5mM5bT0O9S7jYcyMNcTJQSCcNanXas7nXOrSaFl/aYH2
oRNPaGJXAiBcQwhZYriWW6TbF3O3i5wq1TA4oViLicNqkZ7f1CpH5y/gJ8gAm4Eo
nDhYg+Lh1TK7npNcVImsx4k4NlYjIGJY5puaYThg5FTmZoI7spIRd2gF0UNsuOmk
2YADedaRpM3JXy1858mM9PK3cunF4RSFlHSgGPLWgyqLb1e3OkH5d6a/5q6rI0Hf
9tGdMkvPWT43fIuxCe6eJGd6O/kn5ilxDjQVf8VvRYMATZ7WDfKW7S5dSwZfO8GX
fmrC0cmNNyIB1sa3AfMgaQ0a5+28wgHK04kPIFd4PvQGSxLohzZFCRctvTJ7v/AT
mDotoEql+M7caoWbimt4Tp97Oc9mJjOg94345oTExihGKhldYtitv7rAI8sLBPbr
vk5ot5mpCjRyGZQJUfRD
=J39w
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
