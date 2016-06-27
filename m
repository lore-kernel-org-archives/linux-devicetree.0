From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 00/15] clk: sunxi: introduce "modern" clock support
Date: Mon, 27 Jun 2016 22:46:47 +0200
Message-ID: <20160627204647.GZ4000@lukather>
References: <20160607204154.31967-1-maxime.ripard@free-electrons.com>
 <20160621114044.811e2136eca5c1d863d79ac6@free.fr>
 <20160621144752.GR26668@lukather>
 <20160621202919.b9fff30f050cc00c9acb7688@free.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WeojGOqAOUQyw5FN"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160621202919.b9fff30f050cc00c9acb7688@free.fr>
Sender: linux-clk-owner@vger.kernel.org
To: Jean-Francois Moine <moinejf@free.fr>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>, Vishnu Patekar <vishnupatekar0510@gmail.com>, linux-arm-kernel@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--WeojGOqAOUQyw5FN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 21, 2016 at 08:29:19PM +0200, Jean-Francois Moine wrote:
> On Tue, 21 Jun 2016 16:47:52 +0200
> Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
>=20
> > > But I had some problems with some features as the 'mode select' in the
> > > A83T MMC2 clock.
> > > Also, I think that you did not go far enough in the changes.
> >=20
> > At some point, you also have to support what's used out there,
> > otherwise it just becomes an un-maintainable mess. Plus, it really
> > doesn't have to be perfect from day one, it just has to works as it
> > used to, we can always add more stuff later on.
>=20
> I was not thinking about the client interface, but about the sunxi new
> clock driver itself. The way the clocks are declared may be enhanced.

Maybe.

> Then, the particular features of some clocks (as MMC2 mode select) ask
> for a hard re-think of your structures.

And a hard re-think of the clock framework as a whole, for a feature
that we do not need, or care about.

> > At it works way better than what we had.
>=20
> Maybe for the actual drivers of the H3, but not for DDR for example.

Which, let's be reasonable, we won't ever support in Linux (and if
that ever happens, would be trivial to implement).

> > The question also is: is there anyone that we depend on using it
> > (mainline u-boot)? and is it something we need? If both answers are
> > no, then it's just dead code, which shouldn't be here in the first
> > place.
>=20
> I don't understand what you mean.

If a feature is useless to us, and is not used by U-Boot, any support
for it is effictively dead code.

> > > For example, most clock gates as well as most resets could be removed
> > > from the DT and automatically set/de-asserted on clock prepare or clo=
ck
> > > enable.
> >=20
> > No. The semantics are completely different between the bus gates, bus
> > resets and the module clocks. For example, the module clock can be
> > shut down while retaining the register state, while the gate clock
> > can't. And drivers are already using that semantic.
>=20
> A quick look at the H3 drivers showed me that they always do
> reset-deassert, bus gate enable and clock gate enable at probe time.

For the H3, that might be true. That's not true for some other SoCs,
and we plan to use that framework on all the SoCs.

> On the other side, it seems that the order of doing these settings is
> important (Programming Guidelines in the CCU section of the Allwinner's
> doc). So, it seems better to me to centralize these settings in the
> clock driver.

If that ever becomes a problem, we have other ways to deal with it too
(like the clock power domains).

> > Some other problems arise from that as well: this would break the DT
> > ABI, and it deviates way too much from what the other SoCs are doing
> > (which is the whole reason for that rework in the first place).
>=20
> Defining empty reset/bus gate clocks would not imply changes in the
> DTs, nor in the drivers.

Of course it would. If you define an empty clock, that would change
its semantic since either the interface or the functional clock would
be missing while the driver would expect (and drive) both.

Or, if you fix all the drivers, the old DTs would not work anymore,
since they would drive only one clock, instead of both.

> > > So, I am rewriting a generic sunxi clock driver into one file (about
> > > 1000 lines) and I have the full (simpler and clearer) description of
> > > the H3 and the A863T clocks.
> > >=20
> > > Coding is not finished yet. I will submit a RFC as soon as I will have
> > > something working.
> >=20
> > Please don't. I don't want to waste any more time on this, this is way
> > overdue.
>=20
> OK. I need such a new driver for clocks which cannot be handled with
> your structures. I will propose it later, when it will be time...
>=20
> <parenthesis>
> Just have a glimpse at my declaration of the A83T audio PLL.
> Isn't it easier to create and read?
>=20
> /* audio */
> /*	rate =3D 24MHz * n / (d1 + 1) / (d2 + 1) / (p + 1) */
> static struct ccu pll_audio_clk =3D {
> 	CCU_REG(0x008),
> 	CCU_HW("pll-audio", "osc24M", &ccu_pll_ops, 0),
> 	CCU_GATE(0x008, 31),
> 	CCU_LOCK(0x20c, 2),
> 	CCU_N(8, 8), .n_min =3D 12,
> 	CCU_D1(16, 1),
> 	CCU_D2(18, 1),
> 	CCU_M(0, 6),		/* p =3D divider */
> 	.features =3D CCU_FEATURE_N0,
> };
>=20
> </parenthesis>

I don't see what's so different than declaring the structure directly
without using the macros, which is something we can do.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--WeojGOqAOUQyw5FN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXcZC3AAoJEBx+YmzsjxAgJP4P/1T8FxVaQYVZXslvsxKT6gEh
lxg1QjDnpEruW/DCJm1gxtaVcSKVUxIyXSqcyXLQnQdIwFLndJSx5a5rtP+o70tG
uzIhBLV2dNNSXMfrbbebWdSPR13CaR2V+JvtC1sg0u9RKfq0+eXzNrVC0BiIYgTp
gnbv24VpeT3yry8eOhYGhkVWEQYjJKpTBE3gnWjg87cu9kIm1loJls4rJIa/KEaL
z8HnCtO5qBW90o8lqooiLur0OtokbF8GTRP2RNXghnMQKoKlpY3CHNVS2eN+tLF+
Ut4Wp20fcQuw2g2DRrVfxwEN9m5cGNn9DU0IYYDe+aahmCb4CMkf041BSJqcPDTr
6tBvWBuDkL4Bh/KRQnlYviit0uXAjrRaydjcM3xX9o0jvMMua//iKmdwkgDJFURr
Tr/eiiy6ay6+fXCuVt2gEsrSbXZcAwbEnexGFA1piJ89skR+OWvGB8mOp1mWWIGv
7iz44tjgqk+CFkAcDeDoPqiCSJNcYav5r8dnYx8YW1gbQprCgmpVjsVZ7402OB1z
eDe3hDOnmTY6lsYvsyfualTmhml/btxuVvwGgqQIQ+u+e7ddIC8Z2aI5zRDWk1el
BsZ0SIMwRNtv+GjUULbZ+3ojLnhiBr43SvfQYUSicaeV4IAoeznrqAY1KBdPRN2B
dEhOX+J2QuzYubz3CDZn
=2ZQx
-----END PGP SIGNATURE-----

--WeojGOqAOUQyw5FN--
