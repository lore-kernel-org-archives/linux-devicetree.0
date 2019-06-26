From: Robert Chiras <robert.chiras@nxp.com>
Subject: [PATCH v6 0/2] Add DSI panel driver for Raydium RM67191
Date: Wed, 26 Jun 2019 15:08:25 +0300
Message-ID: <1561550907-9733-1-git-send-email-robert.chiras@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-imx@nxp.com, Robert Chiras <robert.chiras@nxp.com>
List-Id: devicetree@vger.kernel.org

This patch-set contains the DRM panel driver and dt-bindings documentation
for the DSI driven panel: Raydium RM67191.

v6:
- Collected Reviewed-by from Fabio
- Removed unused variables (sam)

v5:
- Removed unnecessary debug messages (fabio)
- Handled error case for gpio pin (fabio)

v4:
- Changed default_timing structure type from 'struct display_timing' to
  'struct drm_display_mode' (fabio)
- Replaced devm_gpiod_get with devm_gpiod_get_optional (fabio)
- Added power regulators (fabio)
- Removed pm_ops (fabio)

v3:
- Added myself to MAINTAINERS for this driver (sam)
- Removed display-timings property (fabio)
- Fixed dt description (sam)
- Re-arranged calls inside get_modes function (sam)
- Changed ifdefs with _maybe_unused for suspend/resume functions (sam)
- Collected Reviewed-by from Sam

v2:
- Fixed 'reset-gpio' to 'reset-gpios' property naming (fabio)
- Changed the state of the reset gpio to active low and fixed how it is
  handled in driver (fabio)
- Fixed copyright statement (daniel)
- Reordered includes (sam)
- Added defines for panel specific color formats (fabio)
- Removed unnecessary tests in enable and unprepare (sam)
- Removed the unnecessary backlight write in enable (sam)
*** SUBJECT HERE ***

*** BLURB HERE ***

Robert Chiras (2):
  dt-bindings: display: panel: Add support for Raydium RM67191 panel
  drm/panel: Add support for Raydium RM67191 panel driver

 .../bindings/display/panel/raydium,rm67191.txt     |  41 ++
 MAINTAINERS                                        |   6 +
 drivers/gpu/drm/panel/Kconfig                      |   9 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-raydium-rm67191.c      | 668 +++++++++++++++++++++
 5 files changed, 725 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/raydium,rm67191.txt
 create mode 100644 drivers/gpu/drm/panel/panel-raydium-rm67191.c

-- 
2.7.4
