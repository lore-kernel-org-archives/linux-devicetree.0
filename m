From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: [PATCH v4 00/26] drm/sun4i: Allwinner A64 MIPI-DSI support
Date: Tue, 13 Nov 2018 16:46:07 +0530
Message-ID: <20181113111633.20189-1-jagan@amarulasolutions.com>
Reply-To: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7MFH7A7EEBBI7FVLPQKGQE3FITOLY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Cc: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series fixed the issues related to work DSI on 2-lane panel
which is reported on previous version[1].

This supposed to be a clean series, where it support Allwinner A64 MIPI-DSI
support for 4-lane, 2-lane DSI panels.

This series fixed all previous series comments along with checkpatch
warnings/error.

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

[2] https://patchwork.kernel.org/patch/10657541/
[1] https://patchwork.kernel.org/patch/10657619/

Jagan Teki (26):
  clk: sunxi-ng: a64: Fix gate bit of DSI DPHY
  clk: sunxi-ng: Add check for minimal rate to NKM PLLs
  clk: sunxi-ng: Add check for maximum rate to NKM PLLs
  drm/sun4i: sun6i_mipi_dsi: Add has_mod_clk quirk
  drm/sun4i: sun6i_mipi_dsi: Add Allwinner A64 MIPI DSI support
  dt-bindings: sun6i-dsi: Add compatible for A64 MIPI DSI
  drm/sun4i: sun6i_mipi_dsi: Add DSI Generic short write 2 param
    transfer
  drm/sun4i: sun6i_mipi_dsi: Fix VBP size calculation
  drm/sun4i: sun6i_mipi_dsi: Fix TCON DRQ set bits
  drm/sun4i: sun6i_mipi_dsi: Refactor vertical video start delay
  drm/sun4i: sun6i_mipi_dsi: Fix DSI hbp timing value
  drm/sun4i: sun6i_mipi_dsi: Fix DSI hblk timing calculation
  drm/sun4i: sun6i_mipi_dsi: Add DSI hblk packet overhead
  drm/sun4i: sun6i_mipi_dsi: Fix DSI hfp timing value
  drm/sun4i: sun6i_mipi_dsi: Set proper vblk timing calculation
  drm/sun4i: sun6i_mipi_dsi: Add support for VCC-DSI voltage regulator
  dt-bindings: sun6i-dsi: Add VCC-DSI supply property
  dt-bindings: panel: Add Bananapi S070WV20-CT16 ICN6211 MIPI-DSI to RGB
    bridge
  drm/panel: Add Bananapi S070WV20-CT16 ICN6211 MIPI-DSI to RGB bridge
  dt-bindings: panel: Add Techstar TS8550B MIPI-DSI panel
  drm/panel: Add Techstar TS8550B MIPI-DSI LCD panel
  clk: sunxi-ng: a64: Add min and max rate for PLL_MIPI
  dt-bindings: sun6i-dsi: Add compatible for A64 DPHY
  arm64: dts: allwinner: a64: Add DSI pipeline
  [DO NOT MERGE] arm64: dts: allwinner: bananapi-m64: Bananapi S070WV20-CT16 DSI panel
  arm64: dts: allwinner: a64-amarula-relic: Enable Techstar TS8550B
    MIPI-DSI panel

 .../display/panel/bananapi,s070wv20-ct16.txt  |  31 +-
 .../display/panel/techstar,ts8550b.txt        |  22 ++
 .../bindings/display/sunxi/sun6i-dsi.txt      |   5 +
 MAINTAINERS                                   |  12 +
 .../allwinner/sun50i-a64-amarula-relic.dts    |  46 +++
 .../dts/allwinner/sun50i-a64-bananapi-m64.dts |  42 +++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi |  45 +++
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c         |   4 +-
 drivers/clk/sunxi-ng/ccu_nkm.c                |   6 +
 drivers/clk/sunxi-ng/ccu_nkm.h                |   2 +
 drivers/gpu/drm/panel/Kconfig                 |  18 +
 drivers/gpu/drm/panel/Makefile                |   2 +
 .../panel/panel-bananapi-s070wv20-icn6211.c   | 298 ++++++++++++++++
 .../gpu/drm/panel/panel-techstar-ts8550b.c    | 324 ++++++++++++++++++
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c        | 125 +++++--
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h        |   8 +
 16 files changed, 961 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/techstar,ts8550b.txt
 create mode 100644 drivers/gpu/drm/panel/panel-bananapi-s070wv20-icn6211.c
 create mode 100644 drivers/gpu/drm/panel/panel-techstar-ts8550b.c

-- 
2.18.0.321.gffc6fa0e3
