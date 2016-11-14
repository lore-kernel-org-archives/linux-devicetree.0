From: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v2 0/3] drm/tilcdc: Add bridge support and sync-lost flood recovery
Date: Mon, 14 Nov 2016 18:54:15 +0200
Message-ID: <cover.1479142062.git.jsarha@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Changes since first version of the series:
- "drm/tilcdc: Recover from sync lost error flood by resetting the LCDC"
  - no change
- "drm/bridge: Add ti-tfp410 DVI transmitter driver"
  - HDMI -> DVI
  - DT Binding document
    - Prepare for tfp410 connected trough i2c by optional reg property
    - Require two port nodes
  - Implementation
    - Implement connector node functionality with in tfp410 bridge
      drive, but follow generic connector binding by pulling the
      ddc-i2c-bus property from the connector node.
- "drm/tilcdc: Add drm bridge support for attaching drm bridge drivers"
  - Remove earlier change in TD binding document. There is no need to
    mention DRM implementation details, like bridge support, in DT
    binding.

The first patch is an independent on and I've been testing it for
quite a while now.

The tfp410 bridge driver and the tilcdc bridge support are tested with
BeagleBone DVI-D Cape Rev A3. The tfp410 bridge driver is missing a
lot of features, because the DVI-D cape does not have too many wires
connected. The missing features can be added later when they are
needed.

Jyri Sarha (3):
  drm/tilcdc: Recover from sync lost error flood by resetting the LCDC
  drm/bridge: Add ti-tfp410 DVI transmitter driver
  drm/tilcdc: Add drm bridge support for attaching drm bridge drivers

 .../bindings/display/bridge/ti,tfp410.txt          |  41 ++++
 drivers/gpu/drm/bridge/Kconfig                     |   7 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/ti-tfp410.c                 | 223 +++++++++++++++++++++
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c               |  26 ++-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |   7 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.h                |   2 +
 drivers/gpu/drm/tilcdc/tilcdc_external.c           | 140 +++++++++++--
 drivers/gpu/drm/tilcdc/tilcdc_external.h           |   1 +
 9 files changed, 428 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,tfp410.txt
 create mode 100644 drivers/gpu/drm/bridge/ti-tfp410.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
