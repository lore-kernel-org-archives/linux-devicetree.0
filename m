From: Jean-Francois Moine <moinejf@free.fr>
Subject: Re: [PATCH 4/9] clk: sunxi-ng: mux: Add support for mux tables
Date: Tue, 26 Jul 2016 19:43:06 +0200
Message-ID: <20160726194306.9b6aadd3d1669bd6f5a54d99@free.fr>
References: <1469516671-19377-1-git-send-email-wens@csie.org>
	<1469516671-19377-5-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1469516671-19377-5-git-send-email-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, devicetree@vger.kernel.org, dev@linux-sunxi.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, 26 Jul 2016 15:04:26 +0800
Chen-Yu Tsai <wens@csie.org> wrote:

> Some clock muxes have holes, i.e. invalid or unconnected inputs,
> between parent mux values.
>=20
> Add support for specifying a mux table to map clock parents to
> mux values.

Putting empty strings in the holes should work. No?
Ex:

static const char * const csi_mclk_parents[] =3D
	{ "pll-video0", "pll-video1", "", "", "", "osc24M" };

--=20
Ken ar c'henta=F1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
