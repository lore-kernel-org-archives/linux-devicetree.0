From: Robert Chiras <robert.chiras@nxp.com>
Subject: [PATCH v2 0/2] Add DSI panel driver for Raydium RM67191
Date: Tue, 18 Jun 2019 16:30:44 +0300
Message-ID: <1560864646-1468-1-git-send-email-robert.chiras@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-imx@nxp.com, Robert Chiras <robert.chiras@nxp.com>
List-Id: devicetree@vger.kernel.org

This patch-set contains the DRM panel driver and dt-bindings documentation
for the DSI driven panel: Raydium RM67191.

Changes since v1:
- Fixed 'reset-gpio' to 'reset-gpios' property naming
- Changed the state of the reset gpio to active low and fixed how it is
  handled in driver
- Fixed copyright statement
- Reordered includes
- Added defines for panel specific color formats
- Removed unnecessary tests in enable and unprepare
- Removed the unnecessary backlight write in enable

Robert Chiras (2):
  dt-bindings: display: panel: Add support for Raydium RM67191 panel
  drm/panel: Add support for Raydium RM67191 panel driver

 .../bindings/display/panel/raydium,rm67191.txt     |  43 ++
 drivers/gpu/drm/panel/Kconfig                      |   9 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-raydium-rm67191.c      | 709 +++++++++++++++++++++
 4 files changed, 762 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/raydium,rm67191.txt
 create mode 100644 drivers/gpu/drm/panel/panel-raydium-rm67191.c

-- 
2.7.4
