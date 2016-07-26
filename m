From: Jean-Francois Moine <moinejf@free.fr>
Subject: Re: [PATCH 8/9] clk: sunxi-ng: Add A31/A31s clocks
Date: Tue, 26 Jul 2016 10:30:37 +0200
Message-ID: <20160726103037.5a1571dd124f7c29bb8daa88@free.fr>
References: <1469516671-19377-1-git-send-email-wens@csie.org>
	<1469516671-19377-9-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1469516671-19377-9-git-send-email-wens@csie.org>
Sender: linux-clk-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, devicetree@vger.kernel.org, dev@linux-sunxi.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, 26 Jul 2016 15:04:30 +0800
Chen-Yu Tsai <wens@csie.org> wrote:

> +static const struct ccu_mux_fixed_prediv clk_out_predivs[] =3D {
> +	{ .index =3D 0, .div =3D 750, },
> +	{ .index =3D 3, .div =3D 4, },
> +	{ .index =3D 4, .div =3D 4, },
> +};

No end of table.

--=20
Ken ar c'henta=F1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
