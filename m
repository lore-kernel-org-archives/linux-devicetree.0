From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 02/10] clk: sunxi-ng: Mark AR100 clocks as critical
Date: Thu, 05 Sep 2019 11:56:03 -0700
Message-ID: <20190905185605.9203A206BA@mail.kernel.org>
References: <20190820032311.6506-1-samuel@sholland.org> <20190820032311.6506-3-samuel@sholland.org> <20190820071142.2bgfsnt75xfeyusp@flea> <3b67534a-eb1b-c1e8-b5e8-e0a74ae85792@sholland.org> <20190821122436.k3s7srhraphfnvgp@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190821122436.k3s7srhraphfnvgp@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jassi Brar <jassisinghbrar@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Corentin Labbe <clabbe.montjoie@gmail.com>, Vasily Khoruzhick <anarsoul@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

Quoting Maxime Ripard (2019-08-21 05:24:36)
> On Tue, Aug 20, 2019 at 08:02:55AM -0500, Samuel Holland wrote:
> > On 8/20/19 2:11 AM, Maxime Ripard wrote:
> > > So I'm not really sure that we should do it statically this way, and
> > > that we should do it at all.
> >
> > Do you have a better way to model "firmware uses this clock behind the =
scenes,
> > so Linux please don't touch it"? It's unfortunate that we have Linux and
> > firmware fighting over the R_CCU, but since we didn't have firmware (e.=
g. SCPI
> > clocks) in the beginning, it's where we are today.
> >
> > The AR100 clock doesn't actually have a gate, and it generally has depe=
ndencies
> > like R_INTC in use. So as I mentioned in the commit message, the clock =
will
> > normally be on anyway. The goal was to model the fact that there are us=
ers of
> > this clock that Linux doesn't/can't know about.
>=20
> Like I said, if that's an option, I'd prefer to have protected-clocks
> work for everyone / for sunxi.
>=20

Yes. Use protected-clocks to indicate what shouldn't be touched by the
kernel. It's not super easy to make it "generic" right now, but I
suppose we can work the flag into the core framework more so that we
still register the clks but otherwise make the 'clk_get()' operation
fail on them somehow and the disable unused operation skip them. I just
took the easy way out for qcom for the time being and didn't register
them from the driver.
