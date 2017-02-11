From: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Subject: [PATCH 0/8] drm/sun4i: Add basic LVDS support for A10
Date: Sat, 11 Feb 2017 19:43:57 +0200
Message-ID: <20170211174405.28395-1-plaes@plaes.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds initial LVDS functionality for A10 SoC and includes
display blocks (TCON, backend and frontend) for A10 dtsi and implements 
of mode property for TCON to allow switching between rgb/lvds output.

This series has been tested on Gemei G9 A10 tablet, but still relies
on u-boot to properly set up LVDS reset controller.

---

Jonathan Liu (1):
  ARM: sunxi_defconfig: Enable simple panel

Priit Laes (7):
  ARM: sun4i: Add display blocks for the sun4i dtsi.
  drm/panel: simple: Add support for LG LP097x02-slq2 panel
  drm/sun4i: Add optional 'mode' property to TCON
  drm/sun4i: Add encoder type argument to sun4i_tcon0_mode_set
  drm/sun4i: Add initial LVDS stub
  drm/sun4i: Add various bits and pieces to enable LVDS support on sun4i
  ARM: dts: sun4i: gemei-g9: Add LVDS display support

 .../bindings/display/sunxi/sun4i-drm.txt           |   3 +
 arch/arm/boot/dts/sun4i-a10-gemei-g9.dts           |  95 ++++++-
 arch/arm/boot/dts/sun4i-a10.dtsi                   | 104 ++++++++
 arch/arm/configs/sunxi_defconfig                   |   4 +
 drivers/gpu/drm/panel/panel-simple.c               |  25 ++
 drivers/gpu/drm/sun4i/Makefile                     |   1 +
 drivers/gpu/drm/sun4i/sun4i_lvds.c                 | 276 +++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun4i_lvds.h                 |  15 ++
 drivers/gpu/drm/sun4i/sun4i_rgb.c                  |   2 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c                 |  57 ++++-
 drivers/gpu/drm/sun4i/sun4i_tcon.h                 |  18 +-
 11 files changed, 580 insertions(+), 20 deletions(-)
 create mode 100644 drivers/gpu/drm/sun4i/sun4i_lvds.c
 create mode 100644 drivers/gpu/drm/sun4i/sun4i_lvds.h

-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
