From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v7 00/23] drm/sun4i: Allwinner A64 MIPI-DSI support
Date: Thu, 14 Feb 2019 22:11:43 +0530
Message-ID: <CAMty3ZAUL8TWOec=VpJvBzPL1LE13XVMCWj6t-Gycmny38st_A@mail.gmail.com>
References: <20190201154232.10505-1-jagan@amarulasolutions.com>
 <CAMty3ZBspvP=qZEK9vaowVq4f5W3Qx2qHkwcuAnCOOjV29=Y_Q@mail.gmail.com>
 <20190213090308.dlcwgcrhg264k2cu@flea> <CAMty3ZCSMRm-0suApB4Zb+kE1M2sWn3F7ugPBFWaL4ap7cJejQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMty3ZCSMRm-0suApB4Zb+kE1M2sWn3F7ugPBFWaL4ap7cJejQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree <devicetree@vger.kernel.org>, Michael Trimarchi <michael@amarulasolutions.com>, linux-amarula@amarulasolutions.com, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 13, 2019 at 2:49 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> On Wed, Feb 13, 2019 at 2:33 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> >
> > On Tue, Feb 12, 2019 at 03:16:02PM +0530, Jagan Teki wrote:
> > > On Fri, Feb 1, 2019 at 9:12 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > > >
> > > > Here is next version changes for Allwinner A64 MIPI-DSI support
> > > >
> > > > This series grouped the changes like previous version[1] with different
> > > > sets to support three different panels types that can fit into the DSI
> > > > controller.
> > > >
> > > > set:1, for 4-lane, burst mode support
> > > > - patch 0001: 0009, DSI controller changes that support burst mode.
> > > >
> > > > set:2, for A64 DSI support
> > > > - patch 0010: tcon dclk divider computation based on A64 BSP.
> > > > - patch 0011: 0017, Allwinner A64 DSI controller changes.
> > > >
> > > > set:3, enable 4-lane burst mode panel:
> > > > - patch 0018: Overlay patch that enable Feiyang FY07024DI26A30-D
> > > >   burst mode panel on Pine64-LTS
> > > >
> > > > set:4, enable 4-lane video mode panel:
> > > > - patch 0019: msg type MIPI_DSI_GENERIC_SHORT_WRITE_2_PARAM support
> > > > - patch 0020: Overlay patch that enable Bananapi S070WV20-CT16 ICN6211
> > > >   panel on Bananapi M64
> > > >
> > > > set:5, enable 2-lane video mode panel:
> > > > - patch 0021, 0022: DSI hfp and hbp timings fixes
> > > > - patch 0023: Enable Techstar TS8550B panel on Amarula A64-Relic
> > > >
> > > > Changes for v7:
> > > > - moved vcc-dsi binding to required filed.
> > > > - drop quotes on fallback dphy bindings.
> > > > - drop min_rate clock pll-mipi patches.
> > > > - introduce dclk divider computation as like A64 BSP.
> > > > - add A64 DSI quark patches.
> > > > - fixed A64 DSI pipeline.
> > > > - add proper commit messages.
> > > > - collect Merlijn Wajer Tested-by credits.
> > > > Changes for v6:
> > > > - dropped unneeded changes, patches
> > > > - fixed all burst mode patches as per previous version comments
> > > > - rebase on master
> > > > - update proper commit message
> > > > - dropped unneeded comments
> > > > - order the patches that make review easy
> > > > Changes for v5:
> > > > - collect Rob, Acked-by
> > > > - droped "Fix VBP size calculation" patch
> > > > - updated vblk timing calculation.
> > > > - droped techstar, bananapi dsi panel drivers which may require
> > > >   bridge or other setup. it's under discussion.
> > > > Changes for v4:
> > > > - droppoed untested CCU_FEATURE_FIXED_POSTDIV check code in
> > > >   nkm min, max rate patches
> > > > - create two patches for "Add Allwinner A64 MIPI DSI support"
> > > >   one for has_mod_clk quirk and other one for A64 support
> > > > - use existing driver code construct for hblk computation
> > > > - dropped "Increase hfp packet overhead" patch [2], though BSP added
> > > >   this but we have no issues as of now.
> > > >   (no issues on panel side w/o this change)
> > > > - create separate function for vblk computation
> > > > - enable vcc-dsi regulator in dsi_runtime_resume
> > > > - collect Rob, Acked-by
> > > > - update MAINTAINERS file for panel drivers
> > > > - cleanup commit messages
> > > > - fixed checkpatch warnings/errors
> > > >
> > > > [1] https://patchwork.kernel.org/cover/10779893/
> > > >
> > > > Any inputs?
> > > > Jagan.
> > > >
> > > > Jagan Teki (23):
> > > >   drm/sun4i: sun6i_mipi_dsi: Compute burst mode loop N1 instruction
> > > >     delay
> > > >   drm/sun4i: sun6i_mipi_dsi: Support instruction loop selection
> > > >   drm/sun4i: sun6i_mipi_dsi: Setup burst mode timings
> > > >   drm/sun4i: sun6i_mipi_dsi: Simplify drq to support all modes
> > > >   drm/sun4i: tcon: Export get tcon0 routine
> > > >   drm/sun4i: sun6i_mipi_dsi: Probe tcon0 during dsi_bind
> > > >   drm/sun4i: sun6i_mipi_dsi: Setup burst mode
> > > >   drm/sun4i: sun6i_mipi_dsi: Enable trail_inv and trail_fill controls
> > > >   drm/sun4i: sun6i_mipi_dsi: Enable HBP, HSA_HSE for burst mode
> > >
> > > Can you pick these burst changes which are generic to all SoCs. and
> > > reset will send once we decide the tcon clock.
> >
> > These patches don't implement what we discussed last week, and as I
> > told you already, most of them really need some work on the commit log
> > and their explanations.
>
> If I'm not wrong, we discussed about tcon_dclk (PLL_MIPI) last week
> [1] and these burst changes between 01/23 to 09/23 which are generic
> changes to DSI and not related to clock. Apart from that I made few
> changes on commit logs between the versions (which I was mentioned on
> the cover-letter patch). If any issues issues on commit message,
> please let me know so-that I can rework.

Look like the same discussion rounding since from months. In fact I
have grouped all changes by 'sets of patches' in this series which I
was thinking of having more feasibility to review and merge, but seems
like it ended-up fusing which patches are more prior and which are
fixes. So, let me send it by breaking into different series based on
the issues and generic changes.
