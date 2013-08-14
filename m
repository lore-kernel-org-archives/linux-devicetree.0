From: Sean Paul <seanpaul@chromium.org>
Subject: [PATCH v2 0/2]  drm: Add drm_bridge and PTN3460 bridge driver
Date: Wed, 14 Aug 2013 16:47:36 -0400
Message-ID: <1376513258-25703-1-git-send-email-seanpaul@chromium.org>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, robdclark@gmail.com, daniel@ffwll.ch, airlied@linux.ie, marcheu@chromium.org
Cc: Sean Paul <seanpaul@chromium.org>
List-Id: devicetree@vger.kernel.org

This patchset adds the drm_bridge abstraction as well as the PTN3460
DisplayPort to LVDS bridge driver (using drm_bridge, of course).

Changed in v2:
 - Added PTN3460 driver to show drm_bridge usage
 - Removed connector detect() re-route in favor of implementing the connector
   in the bridge driver
 - Removed the drm_bridge_helper_funcs and stuck everything in drm_bridge_funcs
 - Added driver_private to drm_bridge

Sean Paul (2):
  drm: Add drm_bridge
  drm/bridge: Add PTN3460 bridge driver

 .../devicetree/bindings/drm/bridge/ptn3460.txt     |  27 ++
 drivers/gpu/drm/Kconfig                            |   2 +
 drivers/gpu/drm/Makefile                           |   1 +
 drivers/gpu/drm/bridge/Kconfig                     |   5 +
 drivers/gpu/drm/bridge/Makefile                    |   3 +
 drivers/gpu/drm/bridge/ptn3460.c                   | 349 +++++++++++++++++++++
 drivers/gpu/drm/drm_crtc.c                         |  50 +++
 drivers/gpu/drm/drm_crtc_helper.c                  |  89 ++++--
 include/drm/bridge/ptn3460.h                       |  36 +++
 include/drm/drm_crtc.h                             |  55 ++++
 10 files changed, 598 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/drm/bridge/ptn3460.txt
 create mode 100644 drivers/gpu/drm/bridge/Kconfig
 create mode 100644 drivers/gpu/drm/bridge/Makefile
 create mode 100644 drivers/gpu/drm/bridge/ptn3460.c
 create mode 100644 include/drm/bridge/ptn3460.h

-- 
1.8.3

