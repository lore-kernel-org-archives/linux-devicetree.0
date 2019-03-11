From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v8 02/15] drm/sun4i: tcon: Compute DCLK dividers based on
 format, lanes
Date: Mon, 11 Mar 2019 21:36:27 +0530
Message-ID: <CAMty3ZChz=s7gdQyX9KnsAp1t5FrpouXGK74-r0SKJ89yJN67Q@mail.gmail.com>
References: <20190311133637.18334-1-jagan@amarulasolutions.com>
 <20190311133637.18334-3-jagan@amarulasolutions.com> <20190311153847.oz6ruqmptaq2befn@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190311153847.oz6ruqmptaq2befn@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree <devicetree@vger.kernel.org>, Michael Trimarchi <michael@amarulasolutions.com>, linux-amarula@amarulasolutions.com, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 11, 2019 at 9:08 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Mon, Mar 11, 2019 at 07:06:24PM +0530, Jagan Teki wrote:
> > pll-video => pll-mipi => tcon0 => tcon0-pixel-clock is the typical
> > MIPI clock topology in Allwinner DSI controller.
> >
> > TCON dotclock driver is computing the desired DCLK divider based on
> > panel pixel clock along with input DCLK min, max divider values from
> > tcon driver and that would eventually set the pll-mipi clock rate.
> >
> > The current code allows the TCON clock divider to have a default 4
> > for min, max ranges that would fail to compute the desired pll-mipi
> > rate while supporting new panels.
> >
> > So, add the computation logic 'format/lanes' to dclk min and max dividers
> > and instead of default 4. This computation logic align with Allwinner A64
> > BSP, hoping that would work even for A33.
>
> Last time we discussed this, we found out that this wasn't the case,
> even in the BSP.

This was the case for BSP to compute pll-mipi not for TCON_DSI clock
register, SUN4I_TCON0_DCLK_REG, which marked the divider 4 by default.

>
> What compelling evidence have you found that makes you say otherwise?

divider 4 isn't worked, this I would mentioned before as well.

Tested this on 4 different panels, and below are the desired divider values
and pll-mipi clock rate with respect to pixel clock frequency.

- 55MHz pixel clock with 4-lane panel, and the desired DSI clock divider
  is 6 with the output parent clock rate of 330MHz.
- 30MHz pixel clock with 4-lane panel, and the desired DSI clock divider
  is 6 with parent clock rate of 180MHz.
- 27.5Mhz pixel clock with 2-lane pane, and the desired DSI clock divider
  is 12 with the output parent clock rate of 330MHz.
- 147MHz pixel clock with 4-lane panel, and the desired DSI clock divider
  is 6 with the output parent clock rate of 882MHz.

BSP trying to use this format/lane to compute dsi divider that in-turn
using pll-mipi set_rate but TCON0_DCLK_REG keep constant 4.
