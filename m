From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH v3 00/12] drm/sun4i: Add A83T HDMI support
Date: Wed, 17 Jan 2018 21:14:09 +0100
Message-ID: <20180117201421.25954-1-jernej.skrabec@siol.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, jernej.skrabec-gGgVlfcn5nU@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch series implements support for A83T DW HDMI and PHY. Contrary to
v1 series, this one is based on latest linux-next, since all needed patches
were merged.

While exactly this combination of HDMI controller and PHY is not common in
Allwinner SoCs, this patch series nevertheless makes groundwork for other
SoCs, which have same DW HDMI IP block, but different PHYs, like H3 and H5.

Please take a look.

Best regards,
Jernej

Changes from v2:
- Collected ACKs and Review-by tags
- patch for deinit callback was replaced with the one which gives control
  of drvdata to driver
- fixed meson driver (renamed reset function)
- prototypes for newly exported functions in dw_hdmi.h were reordered

Changes from v1:
- Collected ACKs
- Separated bindings for controller and PHY
- Split driver into two parts - controller and PHY
- HDMI PHY driver now uses regmap for writes
- added defines for PHY registers and bits
- updated DT entries to accomodate new bindings
- removed already merged clock patch
- reworked first clock patch according to comments
- added new clock patch which changes NKMP formula
- split TCON patch in two, one for quirk and one for new compatible
- reworked patch which exports DW HDMI PHY functions:
  - remove "gen2" from some function names
  - removed parameter from dw_hdmi_phy_reset()
  - added address parameter to dw_hdmi_phy_i2c_set_addr()
- updated most of commit messages

Jernej Skrabec (12):
  clk: sunxi-ng: Mask nkmp factors when setting register
  clk: sunxi-ng: Change formula for NKMP PLLs
  drm/bridge/synopsys: dw-hdmi: Enable workaround for v1.32a
  drm/bridge/synopsys: dw-hdmi: Export some PHY related functions
  drm/bridge/synopsys: dw-hdmi: don't clobber drvdata
  dt-bindings: display: sun4i-drm: Add A83T HDMI pipeline
  drm/sun4i: Add has_channel_0 TCON quirk
  drm/sun4i: Add support for A83T second TCON
  drm/sun4i: Add support for A83T second DE2 mixer
  drm/sun4i: Implement A83T HDMI driver
  ARM: dts: sun8i: a83t: Add HDMI display pipeline
  ARM: dts: sun8i: a83t: Enable HDMI on BananaPi M3

 .../bindings/display/sunxi/sun4i-drm.txt           | 197 +++++++++++++-
 arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts       |  25 ++
 arch/arm/boot/dts/sun8i-a83t.dtsi                  | 119 +++++++-
 drivers/clk/sunxi-ng/ccu_nkmp.c                    |  27 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |  83 +++---
 drivers/gpu/drm/imx/dw_hdmi-imx.c                  |  13 +-
 drivers/gpu/drm/meson/meson_dw_hdmi.c              |  22 +-
 drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c             |  12 +-
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |  13 +-
 drivers/gpu/drm/sun4i/Kconfig                      |   9 +
 drivers/gpu/drm/sun4i/Makefile                     |   4 +
 drivers/gpu/drm/sun4i/sun4i_tcon.c                 |  46 +++-
 drivers/gpu/drm/sun4i/sun4i_tcon.h                 |   1 +
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c              | 181 ++++++++++++
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h              |  46 ++++
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c             | 302 +++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun8i_mixer.c                |  11 +
 include/drm/bridge/dw_hdmi.h                       |  24 +-
 18 files changed, 1046 insertions(+), 89 deletions(-)
 create mode 100644 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
 create mode 100644 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
 create mode 100644 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c

-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
