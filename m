From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v2 0/9] R-Car DU: Use drm bridge API
Date: Sat, 19 Nov 2016 05:48:13 +0200
Message-ID: <1479527302-7674-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,

This patch series replaces the custom external encoders support implementation
in the R-Car DU driver with code based on the DRM bridge API.

While the overall diffstat isn't impressive, the rcar-du-drm driver gets
notably thinner in the process:

	9 files changed, 57 insertions(+), 374 deletions(-)

This is offset by a reusable driver for LVDS encoders along with the
corresponding DT bindings (+ 204 lines).

Patches 1/9 and 2/9 add DT bindings for LVDS encoders with a corresponding
driver. It supports "dumb" LVDS encoders only, similarly to the dumb-vga-dac
driver. One notable difference, though, is that LVDS encoders can't be purely
passive, and thus require at least one power supply (and usually multiple of
them) and have a few control GPIOs (most notably to control reset, power down,
clock polarity and/or LVDS slew rate). However, on many systems those encoders
are integrated in such a way that the control pins are pulled up or down
appropriately and the power supplies are either always on or shared with other
display components that make them operate as if they were always on. For that
reason a common drivers for those systems is useful, with simple DT bindings
that don't try to cover any device-specific control pin or power supply.

To ensure backward compatibility most LVDS encoders should *not* use the
common simple "lvds-encoder" compatible string, but should instead define a
device-specific compatible string that can then be added to the lvds-encoder
driver (patch 4/9). This way, when the need to control pins or supplies will
arise, a new driver can be developed matching on the device-specific
compatible string, which will then be removed from the simple driver. Existing
systems will migrate transparently without requiring a change to their device
tree.

A similar reasoning applies to VGA DACs, leading to the addition of the
"adi,adv7123" compatible string to the dumb-vga-dac driver's OF match table in
patch 3/9.

Patch 5/9 adds a new type field to the drm_bridge structure to inform bridge
users of the bridge type. This is useful for display driver to create a DRM
encoder of the appropriate type without having to resort to heuristics.
Patches 6/9 and 7/9 update all bridge drivers to initialize the new field to
the appropriate value.

Patches 8/9 and 9/9 finally migrate the rcar-du-drm driver to the DRM bridge
API, removing the custom VGA DAC implementation in patch 8/9 and the table of
bridge compatible strings used to find the encoder type in patch 9/9.

Compared to v1,

- The patches have been rebased on top of the "[PATCH v2 00/13] R-Car DU: Add
  support for LVDS mode selection" series.
- The LVDS encoder DT bindings have been split from the LVDS encoder driver
  into a separate patch.
- The wording of the DRM bridge documentation new property has been updated.

Laurent Pinchart (9):
  drm: bridge: Add LVDS encoder DT bindings
  drm: bridge: Add LVDS encoder driver
  drm: bridge: vga-dac: Add adi,adv7123 compatible string
  drm: bridge: lvds-encoder: Add thine,thc63lvdm83d compatible string
  drm: Add encoder_type field to the drm_bridge structure
  drm: bridge: Set bridges' encoder type
  drm: Set on-chip bridges' encoder type
  drm: rcar-du: Replace manual bridge implementation with DRM bridge
  drm: rcar-du: Initialize encoder's type based on the bridge's type

 .../bindings/display/bridge/lvds-transmitter.txt   |  64 +++++++
 drivers/gpu/drm/bridge/Kconfig                     |   8 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |   1 +
 drivers/gpu/drm/bridge/analogix-anx78xx.c          |   1 +
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |   1 +
 drivers/gpu/drm/bridge/dumb-vga-dac.c              |   2 +
 drivers/gpu/drm/bridge/dw-hdmi.c                   |   2 +
 drivers/gpu/drm/bridge/lvds-encoder.c              | 204 +++++++++++++++++++++
 drivers/gpu/drm/bridge/nxp-ptn3460.c               |   2 +
 drivers/gpu/drm/bridge/parade-ps8622.c             |   2 +
 drivers/gpu/drm/bridge/sii902x.c                   |   2 +
 drivers/gpu/drm/bridge/tc358767.c                  |   2 +
 drivers/gpu/drm/exynos/exynos_drm_mic.c            |   2 +
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |   2 +
 drivers/gpu/drm/rcar-du/Kconfig                    |   6 -
 drivers/gpu/drm/rcar-du/Makefile                   |   5 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c          | 103 ++++++-----
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h          |   3 -
 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c          | 137 --------------
 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.h          |  35 ----
 drivers/gpu/drm/rcar-du/rcar_du_kms.c              |  37 +---
 drivers/gpu/drm/rcar-du/rcar_du_vgacon.c           |  82 ---------
 drivers/gpu/drm/rcar-du/rcar_du_vgacon.h           |  23 ---
 drivers/gpu/drm/sti/sti_dvo.c                      |   2 +
 include/drm/drm_bridge.h                           |   8 +
 26 files changed, 363 insertions(+), 374 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
 create mode 100644 drivers/gpu/drm/bridge/lvds-encoder.c
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.h
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vgacon.c
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vgacon.h

-- 
Regards,

Laurent Pinchart
