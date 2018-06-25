From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH v3 00/24] Add support for R40 HDMI pipeline
Date: Mon, 25 Jun 2018 14:02:40 +0200
Message-ID: <20180625120304.7543-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBWFUYPMQKGQENN7WDTY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: airlied-cv59FeDIM0c@public.gmane.org, gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org, maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series adds support for R40 HDMI pipeline. It is a bit special
than other already supported pipelines because it has additional unit
called TCON TOP responsible for relationship configuration between
mixers, TCONs and HDMI. Additionally, it has additional gates for DSI
and TV TCONs, TV encoder clock settings and pin muxing between LCD
and TV encoders.

However, it seems that TCON TOP will become a norm, since newer
Allwinner SoCs like H6 also have this unit.

I tested different possible configurations:
- mixer0 <> TCON-TV0 <> HDMI
- mixer0 <> TCON-TV1 <> HDMI
- mixer1 <> TCON-TV0 <> HDMI
- mixer1 <> TCON-TV1 <> HDMI

Please review.

Best regards,
Jernej

Changes from v2:
- Collected tags
- Exported drm_crtc_port_mask() symbol
- Removed TCON TOP reset name
- TCON TOP gates have now right parents
- updated TCON TOP bindings
- dropped new TCON quirk due TCON TOP rework

Changes from v1:
- Split DT bindings patch and updated description
- Split HDMI PHY patch
- Move header file from TCON TOP patch to dt bindings patch
- Added Rob reviewed-by tag
- Used clk_hw_register_gate() instead of custom gate registration code
- Reworked TCON TOP to be part of of-graph. Because of that, a lot of
  new patches were added.
- Droped mixer index quirk patch
- Reworked TCON support for TCON TOP
- Updated commit messages

Jernej Skrabec (24):
  clk: sunxi-ng: r40: Add minimal rate for video PLLs
  clk: sunxi-ng: r40: Allow setting parent rate to display related
    clocks
  clk: sunxi-ng: r40: Export video PLLs
  dt-bindings: display: sunxi-drm: Add TCON TOP description
  drm/sun4i: Add TCON TOP driver
  drm/sun4i: Fix releasing node when enumerating enpoints
  drm/sun4i: Split out code for enumerating endpoints in output port
  drm/sun4i: Add support for traversing graph with TCON TOP
  drm/sun4i: Don't skip TCONs if they don't have channel 0
  drm/sun4i: tcon: Generalize engine search algorithm
  drm/sun4i: Don't check for LVDS and RGB when TCON has only ch1
  drm/sun4i: Don't check for panel or bridge on TV TCONs
  dt-bindings: display: sun4i-drm: Add R40 mixer compatibles
  drm/sun4i: Add support for R40 mixers
  dt-bindings: display: sun4i-drm: Add description of A64 HDMI PHY
  drm/sun4i: Enable DW HDMI PHY clock
  drm/sun4i: Don't change clock bits in DW HDMI PHY driver
  drm/sun4i: DW HDMI PHY: Add support for second PLL
  drm/sun4i: Add support for second clock parent to DW HDMI PHY clk
    driver
  drm/sun4i: Add support for A64 HDMI PHY
  drm: of: Export drm_crtc_port_mask()
  drm/sun4i: DW HDMI: Expand algorithm for possible crtcs
  ARM: dts: sun8i: r40: Add HDMI pipeline
  ARM: dts: sun8i: r40: Enable HDMI output on BananaPi M2 Ultra

 .../bindings/display/sunxi/sun4i-drm.txt      |  62 +++-
 .../boot/dts/sun8i-r40-bananapi-m2-ultra.dts  |  45 +++
 arch/arm/boot/dts/sun8i-r40.dtsi              | 269 ++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-r40.c          |  58 ++--
 drivers/clk/sunxi-ng/ccu-sun8i-r40.h          |   8 +-
 drivers/gpu/drm/drm_of.c                      |   5 +-
 drivers/gpu/drm/sun4i/Makefile                |   3 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c             | 121 +++++--
 drivers/gpu/drm/sun4i/sun4i_tcon.c            |  66 ++--
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c         |  46 ++-
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h         |   8 +-
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c        |  54 +++-
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c    |  90 ++++--
 drivers/gpu/drm/sun4i/sun8i_mixer.c           |  24 ++
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c        | 300 ++++++++++++++++++
 drivers/gpu/drm/sun4i/sun8i_tcon_top.h        |  40 +++
 include/drm/drm_of.h                          |   8 +
 include/dt-bindings/clock/sun8i-r40-ccu.h     |   4 +
 include/dt-bindings/clock/sun8i-tcon-top.h    |  11 +
 19 files changed, 1100 insertions(+), 122 deletions(-)
 create mode 100644 drivers/gpu/drm/sun4i/sun8i_tcon_top.c
 create mode 100644 drivers/gpu/drm/sun4i/sun8i_tcon_top.h
 create mode 100644 include/dt-bindings/clock/sun8i-tcon-top.h

-- 
2.18.0
