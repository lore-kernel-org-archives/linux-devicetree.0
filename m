From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v2 00/15] clk: sunxi: introduce "modern" clock support
Date: Tue, 21 Jun 2016 20:29:19 +0200
Message-ID: <20160621202919.b9fff30f050cc00c9acb7688@free.fr>
References: <20160607204154.31967-1-maxime.ripard@free-electrons.com>
	<20160621114044.811e2136eca5c1d863d79ac6@free.fr>
	<20160621144752.GR26668@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160621144752.GR26668@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 21 Jun 2016 16:47:52 +0200
Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> > But I had some problems with some features as the 'mode select' in =
the
> > A83T MMC2 clock.
> > Also, I think that you did not go far enough in the changes.
>=20
> At some point, you also have to support what's used out there,
> otherwise it just becomes an un-maintainable mess. Plus, it really
> doesn't have to be perfect from day one, it just has to works as it
> used to, we can always add more stuff later on.

I was not thinking about the client interface, but about the sunxi new
clock driver itself. The way the clocks are declared may be enhanced.
Then, the particular features of some clocks (as MMC2 mode select) ask
for a hard re-think of your structures.

> At it works way better than what we had.

Maybe for the actual drivers of the H3, but not for DDR for example.

> The question also is: is there anyone that we depend on using it
> (mainline u-boot)? and is it something we need? If both answers are
> no, then it's just dead code, which shouldn't be here in the first
> place.

I don't understand what you mean.

> > For example, most clock gates as well as most resets could be remov=
ed
> > from the DT and automatically set/de-asserted on clock prepare or c=
lock
> > enable.
>=20
> No. The semantics are completely different between the bus gates, bus
> resets and the module clocks. For example, the module clock can be
> shut down while retaining the register state, while the gate clock
> can't. And drivers are already using that semantic.

A quick look at the H3 drivers showed me that they always do
reset-deassert, bus gate enable and clock gate enable at probe time.
On the other side, it seems that the order of doing these settings is
important (Programming Guidelines in the CCU section of the Allwinner's
doc). So, it seems better to me to centralize these settings in the
clock driver.

> Some other problems arise from that as well: this would break the DT
> ABI, and it deviates way too much from what the other SoCs are doing
> (which is the whole reason for that rework in the first place).

Defining empty reset/bus gate clocks would not imply changes in the
DTs, nor in the drivers.

> > So, I am rewriting a generic sunxi clock driver into one file (abou=
t
> > 1000 lines) and I have the full (simpler and clearer) description o=
f
> > the H3 and the A863T clocks.
> >=20
> > Coding is not finished yet. I will submit a RFC as soon as I will h=
ave
> > something working.
>=20
> Please don't. I don't want to waste any more time on this, this is wa=
y
> overdue.

OK. I need such a new driver for clocks which cannot be handled with
your structures. I will propose it later, when it will be time...

<parenthesis>
Just have a glimpse at my declaration of the A83T audio PLL.
Isn't it easier to create and read?

/* audio */
/*	rate =3D 24MHz * n / (d1 + 1) / (d2 + 1) / (p + 1) */
static struct ccu pll_audio_clk =3D {
	CCU_REG(0x008),
	CCU_HW("pll-audio", "osc24M", &ccu_pll_ops, 0),
	CCU_GATE(0x008, 31),
	CCU_LOCK(0x20c, 2),
	CCU_N(8, 8), .n_min =3D 12,
	CCU_D1(16, 1),
	CCU_D2(18, 1),
	CCU_M(0, 6),		/* p =3D divider */
	.features =3D CCU_FEATURE_N0,
};

</parenthesis>

--=20
Ken ar c'henta=F1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
