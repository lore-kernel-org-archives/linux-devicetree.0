From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v2 0/6] drm/bridge: Add ICN6211 MIPI-DSI/RGB bridge
Date: Fri, 24 May 2019 16:11:09 +0530
Message-ID: <20190524104115.20161-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Michael Trimarchi <michael@amarulasolutions.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com, linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

drm/bridge: Add ICN6211 MIPI-DSI/RGB bridge

This is v2 series for supporting Chipone ICN6211 DSI/RGB bridge,
here is the previous version set[1]

The overlay patch, has Bananapi panel which would depends on,
previous MIPI DSI fixes series[2] to make the panel works.

Changes for v2:
- use panel_or_bridge for finding panel and bridge
- add panel overlay dts patch for port based panel enablement
- update the bridge sequence dynamically, by getting mode
  timings from panel-simple
- correct the brinding compatible
- add more information in binding example
- replace the bridge detach with proper ops
- add bridge overlay dts patch for port based panel enablement

[2] https://patchwork.freedesktop.org/series/60847/
[1] https://patchwork.freedesktop.org/series/58060/

Any inputs?
Jagan.

Jagan Teki (6):
  drm/sun4i: dsi: Use drm panel_or_bridge call
  [DO NOT MERGE] ARM: dts: sun8i: bananapi-m2m: Enable Bananapi S070WV20-CT16 DSI panel
  drm/sun4i: dsi: Add bridge support
  dt-bindings: display: bridge: Add ICN6211 MIPI-DSI to RGB converter bridge
  drm/bridge: Add Chipone ICN6211 MIPI-DSI/RGB converter bridge
  [DO NOT MERGE] ARM: dts: sun8i: bananapi-m2m: Enable Bananapi S070WV20-CT16 DSI panel

 .../display/bridge/chipone,icn6211.txt        |  78 ++++
 MAINTAINERS                                   |   6 +
 arch/arm/boot/dts/sun8i-r16-bananapi-m2m.dts  |  86 +++++
 drivers/gpu/drm/bridge/Kconfig                |  10 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/chipone-icn6211.c      | 344 ++++++++++++++++++
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c        |  67 +++-
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h        |   1 +
 8 files changed, 575 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/chipone,icn6211.txt
 create mode 100644 drivers/gpu/drm/bridge/chipone-icn6211.c

-- 
2.18.0.321.gffc6fa0e3
