From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/2] clk: add 74aup1g157gw 2-input multiplexer as clock driver
Date: Fri, 12 Oct 2018 09:06:42 -0700
Message-ID: <153936040246.5275.14492857755273657122@swboyd.mtv.corp.google.com>
References: <87efcy1rm4.wl-kuninori.morimoto.gx@renesas.com>
 <87bm821rkf.wl-kuninori.morimoto.gx@renesas.com>
 <153923999820.207691.114282732524143268@swboyd.mtv.corp.google.com>
 <87woqoaty1.wl-kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87woqoaty1.wl-kuninori.morimoto.gx@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Kuninori Morimoto (2018-10-11 17:37:30)
> > > +       .recalc_rate    =3D clk74_recalc_rate,
> > > +       .get_parent     =3D clk74_get_parent,
> > > +};
> > =

> > Can this all be handled by the 'gpio-mux-clock' compatible/driver? I
> > suppose it may need an update to add the rounding policy that you want
> > via some sort of DT property, but otherwise it would be fine?
> =

> Hmm.. not sure.
> If we can add new feature (=3D .round_rate ?) on gpio-mux-clock,
> I can consider it.

Yes that would be the idea. Extend gpio-mux-clock driver to have what
you want with rounding. I'm not really sure why there is a rounding
policy needed though. Is it a static configuration at boot, or does the
code using this gpio clk need to search the parent rate space somehow
and mux it over?
