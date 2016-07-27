From: Jean-Francois Moine <moinejf@free.fr>
Subject: Re: [PATCH 4/9] clk: sunxi-ng: mux: Add support for mux tables
Date: Wed, 27 Jul 2016 09:18:27 +0200
Message-ID: <20160727091827.e26f72701ce5758fa29aff7a@free.fr>
References: <1469516671-19377-1-git-send-email-wens@csie.org>
	<1469516671-19377-5-git-send-email-wens@csie.org>
	<20160726194306.9b6aadd3d1669bd6f5a54d99@free.fr>
	<20160727065934.GD6560@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160727065934.GD6560@lukather>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, dev@linux-sunxi.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, 27 Jul 2016 08:59:34 +0200
Maxime Ripard <maxime.ripard@free-electrons.com> wrote:

> On Tue, Jul 26, 2016 at 07:43:06PM +0200, Jean-Francois Moine wrote:
> > On Tue, 26 Jul 2016 15:04:26 +0800
> > Chen-Yu Tsai <wens@csie.org> wrote:
> >=20
> > > Some clock muxes have holes, i.e. invalid or unconnected inputs,
> > > between parent mux values.
> > >=20
> > > Add support for specifying a mux table to map clock parents to
> > > mux values.
> >=20
> > Putting empty strings in the holes should work. No?
> > Ex:
> >=20
> > static const char * const csi_mclk_parents[] =3D
> > 	{ "pll-video0", "pll-video1", "", "", "", "osc24M" };
>=20
> Not really. The clock would be declared as orphan, while it's really
> not.
>=20
> Parenting functions would also not work as expected,
> clk_hw_get_parent_by_index being the obvious example, in that case
> returning the empty string for an invalid parent, while it should
> really return NULL.

I don't see why the clock should be orphan.
Then, when a parent is "", clk_hw_get_parent_by_index() returns NULL.

--=20
Ken ar c'henta=F1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
