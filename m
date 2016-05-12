From: Priit Laes <plaes@plaes.org>
Subject: Re: [linux-sunxi] Re: [PATCH v4 01/11] clk: sunxi: Add display and
 TCON0 clocks driver
Date: Thu, 12 May 2016 06:39:20 +0300
Message-ID: <1463024360.16747.4.camel@plaes.org>
References: <1461590572-4027-1-git-send-email-maxime.ripard@free-electrons.com>
	 <1461590572-4027-2-git-send-email-maxime.ripard@free-electrons.com>
	 <20160506223002.GE3492@codeaurora.org> <20160508200308.GF6167@lukather>
	 <20160509223238.GW3492@codeaurora.org>
	 <20160509223924.GX3492@codeaurora.org> <1462907459.9981.0.camel@plaes.org>
	 <20160511221541.GG3492@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160511221541.GG3492@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Mike Turquette <mturquette@baylibre.com>, David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, dri-devel@lists.freedesktop.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Alexander Kaplan <alex@nextthing.co>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

On Wed, 2016-05-11 at 15:15 -0700, Stephen Boyd wrote:
> On 05/10, Priit Laes wrote:
> >=20
> > On Mon, 2016-05-09 at 15:39 -0700, Stephen Boyd wrote:
> > >=20
> > > On 05/09, Stephen Boyd wrote:
> > > >=20
> > > >=20
> > > >=20
> > > > Ok I applied this one to clk-next.
> > > >=20
> > > And I squashed this in to silence the following checker warning.
> > >=20
> > > drivers/clk/sunxi/clk-sun4i-display.c:110:33: warning: Variable
> > > length array is used.
> > >=20
> > > ---8<---
> > > diff --git a/drivers/clk/sunxi/clk-sun4i-display.c
> > > b/drivers/clk/sunxi/clk-sun4i-display.c
> > > index f02e250e64ed..f8ff6c4a5633 100644
> > > --- a/drivers/clk/sunxi/clk-sun4i-display.c
> > > +++ b/drivers/clk/sunxi/clk-sun4i-display.c
> > > @@ -107,7 +107,7 @@ static int
> > > sun4i_a10_display_reset_xlate(struct
> > > reset_controller_dev *rcdev,
> > > =C2=A0static void __init sun4i_a10_display_init(struct device_nod=
e
> > > *node,
> > > =C2=A0					=C2=A0=C2=A0const struct
> > > sun4i_a10_display_clk_data *data)
> > > =C2=A0{
> > > -	const char *parents[data->parents];
> > > +	const char *parents[4];
> > This change breaks at least de_[bf]e clocks which have 3 clock
> > parents.

> I just used the largest data->parents number, which was 4. How
> does that break anything?

If you look at the=C2=A0sun4i_a10_display_init, it contains this block:

=C2=A0 =C2=A0 ret =3D of_clk_parent_fill(node, parents, ARRAY_SIZE(pare=
nts));
=C2=A0=C2=A0=C2=A0=C2=A0if (ret !=3D ARRAY_SIZE(parents)) {
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pr_err("%s: Could not r=
etrieve the parents\n", clk_name);
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto unmap;
=C2=A0=C2=A0=C2=A0=C2=A0}

of_clk_parent_fill returns 3 for de_be/de_fe nodes, and
ARRAY_SIZE(parents) is 4.

P=C3=A4ikest,
Priit :)
