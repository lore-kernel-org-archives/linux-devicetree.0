From: Robert Chiras <robert.chiras@nxp.com>
Subject: [PATCH 0/2] Add DSI panel driver for Raydium RM67191
Date: Fri, 14 Jun 2019 14:51:01 +0300
Message-ID: <1560513063-24995-1-git-send-email-robert.chiras@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-imx@nxp.com, Robert Chiras <robert.chiras@nxp.com>
List-Id: devicetree@vger.kernel.org

This patch-set contains the DRM panel driver and dt-bindings documentation
for the DSI driven panel: Raydium RM67191.

Robert Chiras (2):
  dt-bindings: display: panel: Add support for Raydium RM67191 panel
  drm/panel: Add support for Raydium RM67191 panel driver

 .../bindings/display/panel/raydium,rm67191.txt     |  42 ++
 drivers/gpu/drm/panel/Kconfig                      |   9 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-raydium-rm67191.c      | 730 +++++++++++++++++++++
 4 files changed, 782 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/raydium,rm67191.txt
 create mode 100644 drivers/gpu/drm/panel/panel-raydium-rm67191.c

-- 
2.7.4
