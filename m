From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v8 00/15] drm/sun4i: Allwinner A64 MIPI-DSI support
Date: Mon, 11 Mar 2019 19:06:22 +0530
Message-ID: <20190311133637.18334-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, Michael Trimarchi <michael@amarulasolutions.com>, linux-amarula@amarulasolutions.com, linux-sunxi@googlegroups.com, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Here is next version, v8 changes for Allwinner A64 MIPI-DSI support.
It depends on DSI fixes/update series [1]

Changes for v8:
- rebased on drm-misc change along with linux-next
- reworked video start delay patch
- tested on 4 different dsi panels
- reworked commit messages
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

[1] https://patchwork.kernel.org/cover/10837163/

Any inputs?
Jagan.

Jagan Teki (15):
  drm/sun4i: dsi: Fix video start delay computation
  drm/sun4i: tcon: Compute DCLK dividers based on format, lanes
  drm/sun4i: tcon: Export get tcon0 routine
  drm/sun4i: dsi: Probe tcon0 during dsi_bind
  drm/sun4i: dsi: Get tcon0_div at runtime
  dt-bindings: sun6i-dsi: Add VCC-DSI supply property
  dt-bindings: sun6i-dsi: Add A64 MIPI-DSI compatible
  dt-bindings: sun6i-dsi: Add A64 DPHY compatible (w/ A31 fallback)
  drm/sun4i: sun6i_mipi_dsi: Add has_mod_clk quirk
  drm/sun4i: sun6i_mipi_dsi: Add has_mod_clk quirk
  drm/sun4i: sun6i_mipi_dsi: Add Allwinner A64 MIPI DSI support
  arm64: dts: allwinner: a64: Add MIPI DSI pipeline
  arm64: dts: allwinner: a64-amarula-relic: Add Techstar TS8550B
    MIPI-DSI panel
  [DO NOT MERGE] arm64: dts: allwinner: a64-pine64-lts: Enable Feiyang FY07024DI26A30-D
    DSI panel
  [DO NOT MERGE] arm64: dts: allwinner: bananapi-m64: Enable Bananapi S070WV20-CT16 DSI
    panel

 .../bindings/display/sunxi/sun6i-dsi.txt      |  3 +
 .../allwinner/sun50i-a64-amarula-relic.dts    | 39 +++++++++
 .../dts/allwinner/sun50i-a64-bananapi-m64.dts | 44 ++++++++++
 .../dts/allwinner/sun50i-a64-pine64-lts.dts   | 39 +++++++++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 45 ++++++++++
 drivers/gpu/drm/sun4i/sun4i_tcon.c            |  7 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.h            |  1 +
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c        | 83 +++++++++++++++----
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h        |  9 +-
 9 files changed, 252 insertions(+), 18 deletions(-)

-- 
2.18.0.321.gffc6fa0e3
