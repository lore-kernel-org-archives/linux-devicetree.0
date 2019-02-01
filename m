From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: [PATCH v7 00/23] drm/sun4i: Allwinner A64 MIPI-DSI support
Date: Fri,  1 Feb 2019 21:12:09 +0530
Message-ID: <20190201154232.10505-1-jagan@amarulasolutions.com>
Reply-To: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7MFH7A7EEBB5OR2HRAKGQEH455Q6Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Here is next version changes for Allwinner A64 MIPI-DSI support

This series grouped the changes like previous version[1] with different
sets to support three different panels types that can fit into the DSI
controller.

set:1, for 4-lane, burst mode support
- patch 0001: 0009, DSI controller changes that support burst mode.

set:2, for A64 DSI support
- patch 0010: tcon dclk divider computation based on A64 BSP. 
- patch 0011: 0017, Allwinner A64 DSI controller changes.

set:3, enable 4-lane burst mode panel:
- patch 0018: Overlay patch that enable Feiyang FY07024DI26A30-D
  burst mode panel on Pine64-LTS

set:4, enable 4-lane video mode panel:
- patch 0019: msg type MIPI_DSI_GENERIC_SHORT_WRITE_2_PARAM support
- patch 0020: Overlay patch that enable Bananapi S070WV20-CT16 ICN6211 
  panel on Bananapi M64

set:5, enable 2-lane video mode panel:
- patch 0021, 0022: DSI hfp and hbp timings fixes
- patch 0023: Enable Techstar TS8550B panel on Amarula A64-Relic

Changes for v7:
- moved vcc-dsi binding to required filed.
- drop quotes on fallback dphy bindings.
- drop min_rate clock pll-mipi patches.
- introduce dclk divider computation as like A64 BSP.
- add A64 DSI quark patches.
- fixed A64 DSI pipeline.
- add proper commit messages.
- collect Merlijn Wajer Tested-by credits.
Changes for v6:
- dropped unneeded changes, patches
- fixed all burst mode patches as per previous version comments
- rebase on master
- update proper commit message
- dropped unneeded comments
- order the patches that make review easy
Changes for v5:
- collect Rob, Acked-by
- droped "Fix VBP size calculation" patch
- updated vblk timing calculation.
- droped techstar, bananapi dsi panel drivers which may require
  bridge or other setup. it's under discussion.
Changes for v4:
- droppoed untested CCU_FEATURE_FIXED_POSTDIV check code in
  nkm min, max rate patches
- create two patches for "Add Allwinner A64 MIPI DSI support"
  one for has_mod_clk quirk and other one for A64 support
- use existing driver code construct for hblk computation
- dropped "Increase hfp packet overhead" patch [2], though BSP added
  this but we have no issues as of now.
  (no issues on panel side w/o this change)
- create separate function for vblk computation 
- enable vcc-dsi regulator in dsi_runtime_resume
- collect Rob, Acked-by
- update MAINTAINERS file for panel drivers
- cleanup commit messages
- fixed checkpatch warnings/errors

[1] https://patchwork.kernel.org/cover/10779893/

Any inputs?
Jagan.

Jagan Teki (23):
  drm/sun4i: sun6i_mipi_dsi: Compute burst mode loop N1 instruction
    delay
  drm/sun4i: sun6i_mipi_dsi: Support instruction loop selection
  drm/sun4i: sun6i_mipi_dsi: Setup burst mode timings
  drm/sun4i: sun6i_mipi_dsi: Simplify drq to support all modes
  drm/sun4i: tcon: Export get tcon0 routine
  drm/sun4i: sun6i_mipi_dsi: Probe tcon0 during dsi_bind
  drm/sun4i: sun6i_mipi_dsi: Setup burst mode
  drm/sun4i: sun6i_mipi_dsi: Enable trail_inv and trail_fill controls
  drm/sun4i: sun6i_mipi_dsi: Enable HBP, HSA_HSE for burst mode
  drm/sun4i: tcon: Compute DCLK dividers based on format, lanes
  dt-bindings: sun6i-dsi: Add VCC-DSI supply property
  drm/sun4i: sun6i_mipi_dsi: Add support for VCC-DSI voltage regulator
  dt-bindings: sun6i-dsi: Add A64 MIPI-DSI compatible
  dt-bindings: sun6i-dsi: Add A64 DPHY compatible (w/ A31 fallback)
  drm/sun4i: sun6i_mipi_dsi: Add has_mod_clk quirk
  drm/sun4i: sun6i_mipi_dsi: Add Allwinner A64 MIPI DSI support
  arm64: dts: allwinner: a64: Add MIPI DSI pipeline
  [DO NOT MERGE] arm64: allwinner: a64: pine64-lts: Enable Feiyang FY07024DI26A30-D DSI
    panel
  drm/sun4i: sun6i_mipi_dsi: Add DSI Generic short write 2 param
    transfer
  [DO NOT MERGE] arm64: dts: allwinner: bananapi-m64: Bananapi S070WV20-CT16 DSI panel
  drm/sun4i: sun6i_mipi_dsi: Fix DSI hbp timing value
  drm/sun4i: sun6i_mipi_dsi: Fix DSI hfp timing value
  arm64: dts: allwinner: a64-amarula-relic: Add Techstar TS8550B
    MIPI-DSI panel

 .../bindings/display/sunxi/sun6i-dsi.txt      |   3 +
 .../allwinner/sun50i-a64-amarula-relic.dts    |  39 ++++
 .../dts/allwinner/sun50i-a64-bananapi-m64.dts |  43 ++++
 .../dts/allwinner/sun50i-a64-pine64-lts.dts   |  39 ++++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi |  45 ++++
 drivers/gpu/drm/sun4i/sun4i_tcon.c            |   7 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.h            |   1 +
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c        | 210 +++++++++++++++---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h        |   9 +
 9 files changed, 367 insertions(+), 29 deletions(-)

-- 
2.18.0.321.gffc6fa0e3
