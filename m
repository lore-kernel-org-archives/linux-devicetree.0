From: Jean-Francois Moine <moinejf@free.fr>
Subject: Re: [PATCH v3 1/2] clk: sunxi: Add sun6i/8i video support
Date: Tue, 2 Feb 2016 19:13:52 +0100
Message-ID: <20160202191352.2b21ae1c5de288e008841b1f@free.fr>
References: <cover.1454427223.git.moinejf@free.fr>
	<8fdfe5fe7715f19416d654964e55721b30237b38.1454427224.git.moinejf@free.fr>
	<CACvgo53f8Sr_dEAx_mcvjXciK01mY7TUDguOJ-HzNur-PpmMZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <CACvgo53f8Sr_dEAx_mcvjXciK01mY7TUDguOJ-HzNur-PpmMZw@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Dave Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>, Emilio Lopez <emilio@elopez.com.ar>, Maxime Ripard <maxime.ripard@free-electrons.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, devicetree <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 2 Feb 2016 17:19:15 +0000
Emil Velikov <emil.l.velikov@gmail.com> wrote:

> > ---
> >  Documentation/devicetree/bindings/clock/sunxi.txt |   2 +
> >  drivers/clk/sunxi/clk-sun6i-display.c             | 106 ++++++++++=
+++
> >  drivers/clk/sunxi/clk-sun6i-pll3.c                | 174 ++++++++++=
++++++++++++
> >  3 files changed, 282 insertions(+)
> >  create mode 100644 drivers/clk/sunxi/clk-sun6i-display.c
> >  create mode 100644 drivers/clk/sunxi/clk-sun6i-pll3.c
> >
> Something is missing here - namely the changes to the Makefile. Does
> this series work or did you simply forget git add ?

Yes, the series works. I just forgot the Makefile which contains other
changes for my kernel (thermal clock).

Thanks. I sent an new request.

--=20
Ken ar c'henta=F1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/

