From: Jean-Francois Moine <moinejf@free.fr>
Subject: Re: [PATCH v2 06/14] ARM: sun8i: clk: Add clk-factor rate
 application method
Date: Fri, 1 Jul 2016 07:37:10 +0200
Message-ID: <20160701073710.1a1fc684ae448577bad5b0db@free.fr>
References: <20160625034511.7966-1-megous@megous.com>
	<20160625034511.7966-7-megous@megous.com>
	<20160630204001.GC5485@lukather>
	<0b71ed7e-98c9-109e-85e6-ceb95131d88a@megous.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0b71ed7e-98c9-109e-85e6-ceb95131d88a@megous.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?T25kxZllag==?= Jirman <megous@megous.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, dev@linux-sunxi.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, open list <linux-kernel@vger.kernel.org>, Emilio =?UTF-8?B?TMOzcGV6?= <emilio@elopez.com.ar>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, 1 Jul 2016 02:50:57 +0200
Ond=C5=99ej Jirman <megous@megous.com> wrote:

> > Since this is really specific, I guess you could simply make the
> > clk_ops for the nkmp clocks public, and just re-implement set_rate
> > using that logic.
>=20
> I would argue that this may be necessary for other PLL clocks too, if
> you can get out of bounds output frequency, by changing the dividers =
too
> early or too late. So perhaps this code should be generalized for oth=
er
> PLL clocks too, instead.

The documentation says that only the CPU and DDR PLLs can be dynamicall=
y
changed after boot.

--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
