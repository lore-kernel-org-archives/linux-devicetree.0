From: Philippe CORNU <philippe.cornu-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v4 0/6] STM32 DSI HOST
Date: Mon, 19 Jun 2017 18:27:59 +0200
Message-ID: <1497889685-27349-1-git-send-email-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Xinliang Liu <xinliang.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, zourongrong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Xinwei Kong <kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Mark Yao <mark.yao>
Cc: Philippe Cornu <philippe.cornu-qxv4g6HH51o@public.gmane.org>, Mickael Reulier <mickael.reulier-qxv4g6HH51o@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Fabien Dessenne <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Version 4:
- bridge/synopsis/dw-mipi-dsi.c: Add panel-bridge support (-45 lines,
  but no so easy to do) and is_panel_bridge for a better clean up, add
  stm copyright/remove dpms_mode/remove drm_of.h/improve clk
  management/add mode_valid (thanks to comments of Archit Taneja), use
  "DesignWare" instead of "Designware (thanks to comments of Neil
  Armstrong)
- bridge/synopsis/Kconfig: Remove help section to hide it in menuconfig
  (thanks to comments of Archit Taneja)
- include/drm/bridge/dw_mipi_dsi.h: Remove drmP.h (thanks to comments
  of Archit Taneja)
- bindings/display/bridge/dw_mipi_dsi.txt: Improve optional property
  explanations (thanks to comments of Neil Armstrong)
- stm/ltdc.c: Add is_panel_bridge for a better clean up/remove
  drm_encoder_helper_add() (thanks to comments of Eric Anholt)
- stm/dw_mipi_dsi-stm.c: remove math64.h/use DRM_WARN/remove warnings
  (thanks to comments of Archit Taneja), minor alignment fix (thanks to
  comments of Neil Armstrong)
- bindings/display/st,stm32-ltdc.txt: use graph binding in the 
  example/improve ports usage doc (thanks to comments of Rob Herring),
  use "DSI" instead of "dsi" where relevant (thanks to comments of Neil
  Armstrong)

Version 3:
- stm/ltdc: Use panel-bridge (-170 lines), thanks to comments of Eric Anholt,
  Boris Brezillon, Archit Taneja & Andrzej Hajda.
- Synopsys dsi: Add dw_mipi_dsi.h (forgotten in v2), thanks to comments of
  Neil Armstrong.
- Synopsys dsi/dw-mipi-dsi.c: add dw_mipi_dsi_dphy_init() &
  dw_mipi_dsi_dphy_enable() to better manage DW phy-dedicated regs, remove
  dw_mipi_dsi_mode enum, remove stm32 patch for lpm, remove pllref (manage in
  the vendor phy) thanks to comments of Archit Taneja. Add mode_flags to phy
  parameters to better adjust lane mbps according to dsi burst and non burst
  modes todos in caps.
- stm/dw_mipi_dsi-stm.c: Add pllref management.
- dt-bindings/display/stm: Split dt-bindings patch in two (parent node
  removal/ dsi), add required nodes (port & panel/bridge), updates thanks to
  comments of Rob Herring.
- dt-bindings/display/Synopsys dsi: remove port as part of the vendor
  documentation, add panel/bridge node, update dt-bindings thanks to comments
  of Rob Herring.
- Add more people from Hisilicon & Rockchip.

Version 2:
- Add a generic Synopsys DesignWare MIPI DSI bridge driver following
  comments from Neil Armstrong & Archit Taneja.
- Use drm_of_find_panel_or_bridge() thanks to Eric Anholt comments
- Update dt-bindings thanks to Rob Herring comments

Version 1:
- Initial commit

The purpose of this set of patches is to add the mipi dsi host driver
to the stm32 family.

This mipi dsi host driver is based on the Rockchip version of the
Synopsys Designware mipi dsi driver (rockchip/dw-mipi-dsi.c)
modified for the stm32 family:
    - replace Rockchip digital & phy specific extensions with stm32's ones.
    - add a bridge

Philippe CORNU (6):
  drm/stm: ltdc: Add panel-bridge support
  dt-bindings: display: Add Synopsys DW MIPI DSI DRM bridge driver
  drm/bridge/synopsys: Add MIPI DSI host controller bridge
  dt-bindings: display: stm32: remove st-display-subsystem parent node
    requirement
  dt-bindings: display: stm32: Add DSI host driver
  drm/stm: Add STM32 DSI host driver

 .../bindings/display/bridge/dw_mipi_dsi.txt        |  30 +
 .../devicetree/bindings/display/st,stm32-ltdc.txt  | 105 ++-
 drivers/gpu/drm/bridge/synopsys/Kconfig            |   6 +
 drivers/gpu/drm/bridge/synopsys/Makefile           |   2 +
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      | 976 +++++++++++++++++++++
 drivers/gpu/drm/stm/Kconfig                        |   9 +-
 drivers/gpu/drm/stm/Makefile                       |   2 +
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c              | 352 ++++++++
 drivers/gpu/drm/stm/ltdc.c                         | 211 +----
 drivers/gpu/drm/stm/ltdc.h                         |   3 +-
 include/drm/bridge/dw_mipi_dsi.h                   |  39 +
 11 files changed, 1555 insertions(+), 180 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt
 create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
 create mode 100644 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
 create mode 100644 include/drm/bridge/dw_mipi_dsi.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
