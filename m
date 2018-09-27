From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH 05/12] drm/sun4i: sun6i_mipi_dsi: Add DSI Generic short
 write 2 param transfer
Date: Thu, 27 Sep 2018 23:06:50 +0530
Message-ID: <CAMty3ZCD4ArjhPJYxv3ztWXdnby8YXQ73QqoVNoHFBc-DAxx_w@mail.gmail.com>
References: <20180927114850.24565-1-jagan@amarulasolutions.com>
 <20180927114850.24565-6-jagan@amarulasolutions.com> <20180927171831.2nfybgn2xmc4vrgt@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180927171831.2nfybgn2xmc4vrgt@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jernej Skrabec <jernej.skrabec@siol.net>, Vasily Khoruzhick <anarsoul@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk <linux-clk@vger.kernel.org>, Michael Trimarchi <michael@amarulasolutions.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 27, 2018 at 10:48 PM Maxime Ripard
<maxime.ripard@bootlin.com> wrote:
>
> On Thu, Sep 27, 2018 at 05:18:43PM +0530, Jagan Teki wrote:
> > Short transfer write support for DCS and Generic transfer types
> > share similar way to process command sequence in DSI block so
> > add generic write 2 param transfer type macro so-that the panels
> > which are requesting similar transfer type may process properly.
> >
> > Also added error check for unsupporting transfer types this make
> > debugging easy for new transfer types.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > index 156b371243c6..1c7e42015645 100644
> > --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > @@ -869,6 +869,7 @@ static ssize_t sun6i_dsi_transfer(struct mipi_dsi_host *host,
> >                    SUN6I_DSI_CMD_CTL_TX_FLAG);
> >
> >       switch (msg->type) {
> > +     case MIPI_DSI_GENERIC_SHORT_WRITE_2_PARAM:
> >       case MIPI_DSI_DCS_SHORT_WRITE:
> >       case MIPI_DSI_DCS_SHORT_WRITE_PARAM:
>
> You should order them by alphabetical order.

I just placed it with transfer code, ok will add it alphabetical

>
> >               ret = sun6i_dsi_dcs_write_short(dsi, msg);
> > @@ -885,6 +886,8 @@ static ssize_t sun6i_dsi_transfer(struct mipi_dsi_host *host,
> >               }
> >
> >       default:
> > +             dev_err(dsi->dev, "unsupported message type 0x%02x\n",
> > +                     msg->type);
>
> And this isn't an error check.

But unsupported message type by sun6i_dsi should be an error
eventually isn't it? and we can easily figure out where the error
trigger.
