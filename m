From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [linux-sunxi] [PATCH 2/9] drm/sun4i: tcon: Add TCON LCD support
 for R40
Date: Fri, 14 Jun 2019 19:02:18 +0800
Message-ID: <CAGb2v6466QSF1wJ_wJsVwAgHsnLXD9GAwbPQtXcTDq4aqAeEfQ@mail.gmail.com>
References: <20190613185241.22800-1-jagan@amarulasolutions.com>
 <20190613185241.22800-3-jagan@amarulasolutions.com> <CAGb2v65xuXc4C1jOyM1GbEFVDam5P-6NN0ZhtzwzA7qU5F3nJQ@mail.gmail.com>
 <CAGb2v67DY534hXrx2H4jnZXA7jJS7sq2UwYCqw1iAgyLKdNzgA@mail.gmail.com> <CAMty3ZBc-AqbNGZCxRhOPw46iMvEZxoq1oATA46=K29gRYi4Sg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMty3ZBc-AqbNGZCxRhOPw46iMvEZxoq1oATA46=K29gRYi4Sg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>, Michael Trimarchi <michael@amarulasolutions.com>, linux-sunxi <linux-sunxi@googlegroups.com>, linux-amarula <linux-amarula@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 14, 2019 at 6:56 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> On Fri, Jun 14, 2019 at 9:05 AM Chen-Yu Tsai <wens@csie.org> wrote:
> >
> > On Fri, Jun 14, 2019 at 11:19 AM Chen-Yu Tsai <wens@csie.org> wrote:
> > >
> > > On Fri, Jun 14, 2019 at 2:53 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > > >
> > > > TCON LCD0, LCD1 in allwinner R40, are used for managing
> > > > LCD interfaces like RGB, LVDS and DSI.
> > > >
> > > > Like TCON TV0, TV1 these LCD0, LCD1 are also managed via
> > > > tcon top.
> > > >
> > > > Add support for it, in tcon driver.
> > > >
> > > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > >
> > > Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> >
> > I take that back.
> >
> > The TCON output muxing (which selects whether TCON LCD or TCON TV
> > outputs to the GPIO pins)
> > is not supported yet. Please at least add TODO notes, or ideally,
>
> Are you referring about port selection? it is support in
> sun8i_tcon_top_de_config.

No. That's supported as you already pointed out. That only selects
which mixer outputs to which TCON.

I'm talking about the GPIOD and GPIOH bits, which select which of
LCD or TV TCON outputs to the LCD function pins. Keep in mind that
the TV TCON's H/V SYNC signals are used in combination with the
TV encoder RGB outputs for VGA.

ChenYu
