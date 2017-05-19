From: Philippe CORNU <philippe.cornu-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v2 0/5] STM32 DSI HOST
Date: Fri, 19 May 2017 17:20:13 +0200
Message-ID: <1495207218-11372-1-git-send-email-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Philippe Cornu <philippe.cornu-qxv4g6HH51o@public.gmane.org>, Mickael Reulier <mickael.reulier-qxv4g6HH51o@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Fabien Dessenne <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

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

Philippe CORNU (5):
  drm/stm: ltdc: Add bridge support
  dt-bindings: display: Add Synopsys DW MIPI DSI DRM bridge driver
  drm/bridge/synopsys: Add MIPI DSI host controller bridge
  dt-bindings: display: Add STM32 DSI host driver
  drm/stm: Add STM32 DSI host driver

 .../bindings/display/bridge/dw_mipi_dsi.txt        |   36 +
 .../devicetree/bindings/display/st,stm32-ltdc.txt  |  102 +-
 drivers/gpu/drm/bridge/synopsys/Kconfig            |    9 +
 drivers/gpu/drm/bridge/synopsys/Makefile           |    2 +
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      | 1024 ++++++++++++++++++++
 drivers/gpu/drm/stm/Kconfig                        |    8 +
 drivers/gpu/drm/stm/Makefile                       |    2 +
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c              |  328 +++++++
 drivers/gpu/drm/stm/ltdc.c                         |   74 +-
 drivers/gpu/drm/stm/ltdc.h                         |    1 +
 10 files changed, 1565 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt
 create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
 create mode 100644 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
