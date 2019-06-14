From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH 5/9] ARM: dts: sun8i: r40: Add TCON TOP LCD clocking
Date: Fri, 14 Jun 2019 15:18:40 +0530
Message-ID: <CAMty3ZD0atS2uWJmPB-n1wmy324JEpwt42=_wpKeF-8uxM-GbQ@mail.gmail.com>
References: <20190613185241.22800-1-jagan@amarulasolutions.com>
 <20190613185241.22800-6-jagan@amarulasolutions.com> <CAGb2v654p=HZuXCTJkrbWbFP_kEkpRWHwj-7_Ck_=XbyMFmvFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGb2v654p=HZuXCTJkrbWbFP_kEkpRWHwj-7_Ck_=XbyMFmvFw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>, Michael Trimarchi <michael@amarulasolutions.com>, linux-sunxi <linux-sunxi@googlegroups.com>, linux-amarula <linux-amarula@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 14, 2019 at 9:16 AM Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Fri, Jun 14, 2019 at 2:54 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > According to Fig 7-2. TCON Top Block Diagram in User manual.
> >
> > TCON TOP can have an hierarchy for TCON_LCD0, LCD1 like
> > TCON_TV0, TV1 so, the tcon top would handle the clocks of
> > TCON_LCD0, LCD1 similar like TV0, TV1.
>
> That is not guaranteed. The diagram shows the pixel data path,
> not necessarily the clocks. In addition, the LCD TCONs have an
> internal clock gate for the dot-clock output, which the TV variants
> do not. That might explain the need for the gates in TCON TOP.

Correct, the actual idea about explanation here is to mention the
clocks definition in tcon top level and internal tv and lcd can handle
as you explained.

>
> > But, the current tcon_top node is using dsi clock name with
> > CLK_DSI_DPHY which is ideally handle via dphy which indeed
> > a separate interface block.
> >
> > So, use tcon-lcd0 instead of dsi which would refer the
> > CLK_TCON_LCD0 similar like CLK_TCON_TV0 with tcon-tv0.
> >
> > This way we can refer CLK_TCON_LCD0 from tcon_top clock in
> > tcon_lcd0 node and the actual DSI_DPHY clock node would
> > refer in dphy node.
>
> That doesn't make sense. What about TCON_LCD1?
>
> The CCU already has CLK_TCON_LCD0 and CLK_TCON_LCD1. What makes
> you think that the TCONs don't use them directly?
>
> Or maybe they do go through TCON_TOP, but there's no gate,
> so we don't know about it.
>
> You need to rethink this. What are you trying to deal with?

Yes, I understand what your asking for and indeed this is where I get
confused and tried this way initially and attach the dsi reference in
dphy something like

tcon_lcd0 {
                clocks = <&ccu CLK_BUS_TCON_LCD0>, <&ccu CLK_TCON_LCD0>;
                clock-names = "ahb", "tcon-ch0";
};

dphy {
               clocks = <&ccu CLK_BUS_MIPI_DSI>,
                              <&tcon_top CLK_TCON_TOP_DSI>;
               clock-names = "bus", "mod";
};

This would ended-up, phy wont getting the mod clock keep probing for
-EPROBE-DEFER since tcon top driver might not be loaded at the time
mipi driver. This way we have tv0, tv1 and dsi gates supported as
existed. Does it make sense?
