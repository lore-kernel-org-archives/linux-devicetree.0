From: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Subject: Re: Re: [PATCH v2 1/6] clk: sunxi-ng: Add sun4i/sun7i
 CCU driver
Date: Thu, 20 Apr 2017 19:59:17 +0000
Message-ID: <20170420195917.GA16113@plaes.org>
References: <cover.a58841efb571d44013658505f3fa140536a89d1c.1490545262.git-series.plaes@plaes.org>
 <ac8c4dab4f160ec605d52120517774bf1de87c2e.1490545262.git-series.plaes@plaes.org>
 <20170327075438.cw3d6s7zyeemenwr@lukather>
 <20170404200919.GA22159@plaes.org>
 <20170407133805.aiythp3hdvuyhcrc@lukather>
Reply-To: plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDJLTBEBXENBBF5G4TDQKGQER7OQHXY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170407133805.aiythp3hdvuyhcrc@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 07, 2017 at 03:38:05PM +0200, Maxime Ripard wrote:
> Hi Priit,
>=20
> On Tue, Apr 04, 2017 at 08:09:19PM +0000, Priit Laes wrote:
> > > > +/* Not documented on A10 */
> > > > +static SUNXI_CCU_GATE(pll_periph_sata_clk, "pll-periph-sata", "pll=
-periph",
> > > > +		      0x028, BIT(14), 0);
> > >=20
> > > The rate doesn't come from pll-periph directly, does it?
> >=20
> > So it uses hosc (24MHz parent clock) instead of pll-periph?
>=20
> I never looked too much at this, but it looks more like the input is
> pll-periph-sata itself.

OK, I think I have now fixed most of the issues thanks to Maxime and Chen-Y=
u
and I'm almost ready to send out V3.

>From my side there is only single issue remaining - how to create "sata-ext=
"
clock?

[snip]
static struct ccu_div pll_periph_sata_clk =3D {
	.enable		=3D BIT(14),
	.div		=3D _SUNXI_CCU_DIV(0, 2),
	.common		=3D {
		.prediv		=3D 6,
		.reg		=3D 0x028,
		.features	=3D CCU_FEATURE_ALL_PREDIV,
		.hw.init	=3D CLK_HW_INIT("pll-periph-sata",
					      "pll-periph-base",
					      &ccu_nk_ops, 0),
	},
};

static const char* const sata_parents[] =3D {"pll-periph-sata", "sata-ext"}=
;
static SUNXI_CCU_MUX_WITH_GATE(sata_clk, "sata", sata_parents,
			       0x0c8, 24, 1, BIT(31), 0);
[/snip]

Should I create a fixed-clock node in the dtsi:

sata-ext: clk@0 {
	#clock-cells =3D <0>;
	compatible =3D "fixed-clock";
	clock-frequency =3D <200000000>;
	clock-output-names =3D "sata-ext";
};

And would it also need pio definition?

P=C3=A4ikest,
Priit :)

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
