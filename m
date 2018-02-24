From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH 00/15] Implement H3/H5 HDMI driver
Date: Sat, 24 Feb 2018 22:45:30 +0100
Message-ID: <20180224214545.3740-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBL52Y7KAKGQEUAFJKAY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: jernej.skrabec-gGgVlfcn5nU@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series implements H3/H5 HDMI driver. It was tested on OrangePi 2 (H3),
OrangePi Plus2e (H3) and OrangePi PC2 (H5) with many resolutions and it
works well, except in some not yet determined cases, when there is a crash
at boot if HDMI monitor is connected. If it is connected later, everything
works as expected. Hopefully, with driver merged in drm-misc more people
could review the code and find solution.

Code is based on drm-misc-next, since some required commits are not yet
present in linux-next.

Best regards,
Jernej

Jernej Skrabec (15):
  clk: sunxi-ng: Add check for minimal rate to NM PLLs
  clk: sunxi-ng: h3: h5: Add minimal rate for video PLL
  clk: sunxi-ng: h3: h5: Allow some clocks to set parent rate
  clk: sunxi-ng: h3: h5: export CLK_PLL_VIDEO
  dt-bindings: display: sun4i-drm: Add compatibles for H3 HDMI pipeline
  drm/sun4i: Add support for H3 display engine
  drm/sun4i: Add support for H3 mixer 0
  drm/sun4i: Fix polarity configuration for DW HDMI PHY
  drm/sun4i: Add support for variants to DW HDMI PHY
  drm/sun4i: Move and expand DW HDMI PHY register macros
  drm/sun4i: Add support for H3 HDMI PHY variant
  drm/sun4i: Allow building on arm64
  ARM: dts: sunxi: h3/h5: Add HDMI pipeline
  ARM: dts: sun8i: h3: Enable HDMI output on H3 boards
  ARM64: dts: sun50i: h5: Enable HDMI output on H5 boards

 .../bindings/display/sunxi/sun4i-drm.txt           |   6 +
 arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts    |  25 ++
 arch/arm/boot/dts/sun8i-h3-beelink-x2.dts          |  25 ++
 arch/arm/boot/dts/sun8i-h3-libretech-all-h3-cc.dts |  25 ++
 arch/arm/boot/dts/sun8i-h3-nanopi-m1.dts           |  25 ++
 arch/arm/boot/dts/sun8i-h3-orangepi-2.dts          |  25 ++
 arch/arm/boot/dts/sun8i-h3-orangepi-lite.dts       |  25 ++
 arch/arm/boot/dts/sun8i-h3-orangepi-one.dts        |  24 ++
 arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts         |  25 ++
 arch/arm/boot/dts/sunxi-h3-h5.dtsi                 | 108 ++++++
 .../boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts  |  25 ++
 .../dts/allwinner/sun50i-h5-orangepi-prime.dts     |  25 ++
 .../allwinner/sun50i-h5-orangepi-zero-plus2.dts    |  25 ++
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c                |  32 +-
 drivers/clk/sunxi-ng/ccu-sun8i-h3.h                |   4 +-
 drivers/clk/sunxi-ng/ccu_nm.c                      |  11 +-
 drivers/clk/sunxi-ng/ccu_nm.h                      |  27 ++
 drivers/gpu/drm/sun4i/Kconfig                      |   2 +-
 drivers/gpu/drm/sun4i/Makefile                     |   1 +
 drivers/gpu/drm/sun4i/sun4i_drv.c                  |   1 +
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h              | 156 ++++++++-
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c             | 369 ++++++++++++++++++---
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c         | 130 ++++++++
 drivers/gpu/drm/sun4i/sun8i_mixer.c                |  12 +
 include/dt-bindings/clock/sun8i-h3-ccu.h           |   2 +
 25 files changed, 1063 insertions(+), 72 deletions(-)
 create mode 100644 drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c

-- 
2.16.2
