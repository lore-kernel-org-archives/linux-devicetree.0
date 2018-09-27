From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: [PATCH 00/12] drm/sun4i: Allwinner A64 MIPI-DSI support
Date: Thu, 27 Sep 2018 17:18:38 +0530
Message-ID: <20180927114850.24565-1-jagan@amarulasolutions.com>
Reply-To: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7MFH7A7EEBBPEHWPOQKGQEQ2VOA4I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series add MIPI-DSI support on Allwinner A64. The same A31 controller
is reused and tweaked for A64 since the register space for both SoC's look same.

The current clock rate (270MHz) with nkm (5,2,11) from PLL_MIPI is unable to work
with A64 DSI block. I've tested with few changes to verify desired nkm divider
values (1, 2, 5) but with existing nkm divider logic(ccu_nkm_find_best) I'm unable 
to figure out the desired clock rate, anyone suggestion please let me know here.

Bananapi S070WV20-CT16 DSI panel with BPI-M64 board works fine,
but will figure out and fix the clock logic in next versions.

Thanks,
Jagan.

Jagan Teki (12):
  clk: sunxi-ng: a64: Fix gate bit of DSI DPHY
  drm/sun4i: sun6i_mipi_dsi: Add Allwinner A64 MIPI DSI support
  dt-bindings: sun6i-dsi: Add compatible for A64 MIPI DSI
  drm/sun4i: sun6i_mipi_dsi: Enable missing DSI bus clock
  drm/sun4i: sun6i_mipi_dsi: Add DSI Generic short write 2 param
    transfer
  drm/sun4i: sun6i_mipi_dsi: Fix VBP size calculation
  drm/sun4i: sun6i_mipi_dsi: Fix TCON DRQ set bits
  drm/sun4i: sun6i_mipi_dsi: Refactor vertical video start delay
  dt-bindings: panel: Add Bananapi S070WV20-CT16 MIPI-DSI panel bindings
  drm/panel: Add Bananapi S070WV20-CT16 MIPI-DSI panel driver
  arm64: dts: allwinner: a64: Add DSI pipeline
  arm64: dts: allwinner: bananapi-m64: Bananapi S070WV20-CT16 DSI panel

 .../panel/bananapi,s070wv20-ct16-dsi.txt      |  21 ++
 .../bindings/display/sunxi/sun6i-dsi.txt      |   1 +
 .../dts/allwinner/sun50i-a64-bananapi-m64.dts |  42 +++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi |  44 +++
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c         |   2 +-
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-bananapi-s070wv20.c   | 336 ++++++++++++++++++
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c        |  78 +++-
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h        |   5 +
 10 files changed, 522 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16-dsi.txt
 create mode 100644 drivers/gpu/drm/panel/panel-bananapi-s070wv20.c

-- 
2.18.0.321.gffc6fa0e3
