From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v2 0/2] drm: LogiCVC display controller support
Date: Wed, 25 Sep 2019 10:49:30 +0200
Message-ID: <20190925084932.147971-1-paul.kocialkowski@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
List-Id: devicetree@vger.kernel.org

This series introduces support for the LogiCVC display controller.
The controller is a bit unusual since it is usually loaded as
programmable logic on Xilinx FPGAs or Zynq-7000 SoCs.
More details are presented on the main commit for the driver.

More information about the controller is available on the dedicated
web page: https://www.logicbricks.com/Products/logiCVC-ML.aspx

Changes since v1:
- Switched dt bindings documentation to dt schema;
- Described more possible dt parameters;
- Added support for the lvds-3bit interface;
- Added support for grabbing syscon regmap from parent node;
- Removed layers count property and count layers child nodes instead.

Cheers!

Paul Kocialkowski (2):
  dt-bindings: display: Document the Xylon LogiCVC display controller
  drm: Add support for the LogiCVC display controller

 .../display/xylon,logicvc-display.yaml        | 314 +++++++++
 drivers/gpu/drm/Kconfig                       |   2 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/logicvc/Kconfig               |   8 +
 drivers/gpu/drm/logicvc/Makefile              |   4 +
 drivers/gpu/drm/logicvc/logicvc_crtc.c        | 272 ++++++++
 drivers/gpu/drm/logicvc/logicvc_crtc.h        |  25 +
 drivers/gpu/drm/logicvc/logicvc_drm.c         | 467 ++++++++++++++
 drivers/gpu/drm/logicvc/logicvc_drm.h         |  60 ++
 drivers/gpu/drm/logicvc/logicvc_interface.c   | 235 +++++++
 drivers/gpu/drm/logicvc/logicvc_interface.h   |  32 +
 drivers/gpu/drm/logicvc/logicvc_layer.c       | 594 ++++++++++++++++++
 drivers/gpu/drm/logicvc/logicvc_layer.h       |  65 ++
 drivers/gpu/drm/logicvc/logicvc_mode.c        | 103 +++
 drivers/gpu/drm/logicvc/logicvc_mode.h        |  15 +
 drivers/gpu/drm/logicvc/logicvc_of.c          | 205 ++++++
 drivers/gpu/drm/logicvc/logicvc_of.h          |  28 +
 drivers/gpu/drm/logicvc/logicvc_regs.h        |  88 +++
 18 files changed, 2518 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/xylon,logicvc-display.yaml
 create mode 100644 drivers/gpu/drm/logicvc/Kconfig
 create mode 100644 drivers/gpu/drm/logicvc/Makefile
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_crtc.c
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_crtc.h
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_drm.c
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_drm.h
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_interface.c
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_interface.h
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_layer.c
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_layer.h
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_mode.c
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_mode.h
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_of.c
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_of.h
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_regs.h

-- 
2.23.0
