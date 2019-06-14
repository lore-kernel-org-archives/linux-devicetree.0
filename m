From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 5/9] ARM: dts: sun8i: r40: Add TCON TOP LCD clocking
Date: Fri, 14 Jun 2019 11:46:36 +0800
Message-ID: <CAGb2v654p=HZuXCTJkrbWbFP_kEkpRWHwj-7_Ck_=XbyMFmvFw@mail.gmail.com>
References: <20190613185241.22800-1-jagan@amarulasolutions.com> <20190613185241.22800-6-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190613185241.22800-6-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>, Michael Trimarchi <michael@amarulasolutions.com>, linux-sunxi <linux-sunxi@googlegroups.com>, linux-amarula@amarulasolutions.com
List-Id: devicetree@vger.kernel.org

On Fri, Jun 14, 2019 at 2:54 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> According to Fig 7-2. TCON Top Block Diagram in User manual.
>
> TCON TOP can have an hierarchy for TCON_LCD0, LCD1 like
> TCON_TV0, TV1 so, the tcon top would handle the clocks of
> TCON_LCD0, LCD1 similar like TV0, TV1.

That is not guaranteed. The diagram shows the pixel data path,
not necessarily the clocks. In addition, the LCD TCONs have an
internal clock gate for the dot-clock output, which the TV variants
do not. That might explain the need for the gates in TCON TOP.

> But, the current tcon_top node is using dsi clock name with
> CLK_DSI_DPHY which is ideally handle via dphy which indeed
> a separate interface block.
>
> So, use tcon-lcd0 instead of dsi which would refer the
> CLK_TCON_LCD0 similar like CLK_TCON_TV0 with tcon-tv0.
>
> This way we can refer CLK_TCON_LCD0 from tcon_top clock in
> tcon_lcd0 node and the actual DSI_DPHY clock node would
> refer in dphy node.

That doesn't make sense. What about TCON_LCD1?

The CCU already has CLK_TCON_LCD0 and CLK_TCON_LCD1. What makes
you think that the TCONs don't use them directly?

Or maybe they do go through TCON_TOP, but there's no gate,
so we don't know about it.

You need to rethink this. What are you trying to deal with?

> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  arch/arm/boot/dts/sun8i-r40.dtsi           | 6 +++---
>  drivers/gpu/drm/sun4i/sun8i_tcon_top.c     | 6 +++---
>  include/dt-bindings/clock/sun8i-tcon-top.h | 2 +-

This is going to be a pain to merge.

First, you need to split the driver parts from the DT parts.

Second, you might need to revert CLK_DSI_DPHY back to a raw
number for now, so that when the patches get merged through
different trees, nothing breaks.

Third, you'll come back after everything is merged, and change
the raw number to the new macro.

ChenYu
