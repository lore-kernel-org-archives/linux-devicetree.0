From: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: [PATCH v2 00/13] R-Car DU: Add support for LVDS mode selection
Date: Sat, 19 Nov 2016 05:28:00 +0200
Message-ID: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

This patch series adds support for LVDS mode selection in the R-Car DU driver.

Compared to v1, the LVDS panel DT bindings (02/13) have been reworked to
document common panel properties in a common file (01/13), with Mitsubishi
panels bindings now properly documented (03/13). Compared to the existing DPI
panel bindings that are currently abused by the R-Car DU driver for LVDS
panel, these new bindings specify the LVDS more explicitly.

The bindings are based on the relevant standards I have been able to find, as
well as on existing LVDS-related code and DT bindings available in the
mainline kernel. Those include

- the LVDS formats MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
  MEDIA_BUS_FMT_RGB888_1X7X4_SPWG and MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA
  (Documentation/media/uapi/v4l/subdev-formats.rst)
- iMX display DT bindings available in
  (Documentation/devicetree/bindings/display/imx/ldb.txt)
- the drivers/gpu/drm/imx/ driver

In addition to the three modes specified in the LVDS panel DT bindings, the
Renesas R-Car DU also supports the following two modes.

Slot       0       1       2       3       4       5       6
       ________________                         _________________
Clock                  \_______________________/
         ______  ______  ______  ______  ______  ______  ______
DATA0  ><_CTL0_><__R7__><__R6__><__R5__><__R4__><__R3__><__R2__><
DATA1  ><_CTL1_><__G7__><__G6__><__G5__><__G4__><__G3__><__G2__><
DATA2  ><_CTL2_><__B7__><__B6__><__B5__><__B4__><__B3__><__B2__><
DATA3  ><_CTL3_><__B1__><__B0__><__G1__><__G0__><__R1__><__R0__><
         ______  ______  ______  ______  ______  ______  ______
DATA0  ><_CTL0_><__R5__><__R4__><__R3__><__R2__><__R1__><__R0__><
DATA1  ><_CTL1_><__G5__><__G4__><__G3__><__G2__><__G1__><__G0__><
DATA2  ><_CTL2_><__B5__><__B4__><__B3__><__B2__><__B1__><__B0__><
DATA3  ><_CTL3_><__B7__><__B6__><__G7__><__G6__><__R7__><__R6__><

and their mirrored version.

I haven't been able to find any standard defining those data mappings, nor any
panel using them. The control signals positions correspond to DC-balanced LVDS
(see figure 18 on page 19 of http://www.ti.com/lit/ds/symlink/ds90cf388.pdf),
but the R-Car DU doesn't support DC-balanced LVDS as far as I can tell, so
it's not a match. If anyone knows of other devices supporting these data
mappings or of standards defining them I would appreciate the information and
will update the bindings accordingly.

Patches 04/13 to 06/13 add a new DRM panel driver for LVDS panels compatible
with the DT bindings. Patches 07/13 to 09/13 update the device tree of the
R-Car H3 Salvator-X board to add panel backlight support, and patch 10/13
switches two Mitsubishi panels to use the new bindings. This series doesn't
strictly depend on them so they can be merged separately at a later point if
needed.

Patches 11/13 to 13/13 finally move the R-Car DU driver to use the DRM panel
API, and add support for LVDS mode selection.

Laurent Pinchart (13):
  devicetree/bindings: display: Document common panel properties
  devicetree/bindings: display: Add bindings for LVDS panels
  devicetree/bindings: display: Add bindings for two Mitsubishi panels
  drm: Add data mirror bus flag
  drm: panels: Constify device node argument to of_drm_find_panel()
  drm: panels: Add LVDS panel driver
  arm64: dts: r8a7795: Add PWM support
  arm64: dts: r8a7795: salvator-x: Add DU LVDS output endpoint
  arm64: dts: r8a7795: salvator-x: Add panel backlight support
  ARM: shmobile: dts: Switch to panel-lvds bindings for Mitsubishi
    panels
  drm: rcar-du: Switch to encoder .atomic_mode_set() helper function
  drm: rcar-du: Use the DRM panel API
  drm: rcar-du: Add support for LVDS mode selection

 .../display/panel/mitsubishi,aa104xd12.txt         |  47 ++++
 .../display/panel/mitsubishi,aa121td01.txt         |  47 ++++
 .../bindings/display/panel/panel-common.txt        |  91 +++++++
 .../bindings/display/panel/panel-lvds.txt          | 120 +++++++++
 arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi     |   3 +-
 arch/arm/boot/dts/r8a77xx-aa121td01-panel.dtsi     |   3 +-
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts |  26 ++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           |  63 +++++
 drivers/gpu/drm/drm_panel.c                        |   2 +-
 drivers/gpu/drm/panel/Kconfig                      |  10 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-lvds.c                 | 284 +++++++++++++++++++++
 drivers/gpu/drm/rcar-du/Kconfig                    |   1 +
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c          |  50 +++-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h          |   3 +
 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c          |   8 +-
 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c          |  68 ++---
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c          |  11 +-
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.h          |  13 +
 include/drm/drm_connector.h                        |   2 +
 include/drm/drm_panel.h                            |   4 +-
 21 files changed, 798 insertions(+), 59 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-common.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-lvds.txt
 create mode 100644 drivers/gpu/drm/panel/panel-lvds.c

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
