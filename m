From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v2 00/12] R-Car DU: Convert LVDS code to bridge driver
Date: Sat, 13 Jan 2018 01:14:18 +0200
Message-ID: <20180112231430.26943-1-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,

This patch series addresses a design mistake that dates back from the initial
DU support. Support for the LVDS encoders, which are IP cores separate from
the DU, was bundled in the DU driver. Worse, both the DU and LVDS were
described through a single DT node.

To fix the, patches 01/12 and 02/12 define new DT bindings for the LVDS
encoders, and deprecate their description inside the DU bindings. To retain
backward compatibility with existing DT, patch 03/12 then patches the device
tree at runtime to convert the legacy bindings to the new ones.

With the DT side addressed, patch 04/12 then converts the LVDS support code to
a separate bridge driver. After a small fix to the Porter board device tree in
patch 05/12, patches 06/12 to 12/12 then update all the device tree sources to
the new DU and LVDS encoders bindings.

I decided to go for live DT patching in patch 03/12 because implementing
support for both the legacy and new bindings in the driver would have been
very intrusive, and prevented further cleanups. I'm in a way both proud and 
ashamed of that patch that I would call a neat and dirty hack. It was fun to
write perhaps in a similar way that one would enjoy researching and developing
proof-of-concepts for security holes: they're good and bad at the same time.

Anyway, with this philosophical considerations aside, there were a few
shortcomings in the OF API that I worked around with local code in the driver.
If anyone is interested in performing similar live DT patching I think we
could move some of the code to the OF core. For instance I was surprised
to not find a device node lookup by path function that would start at a
given node instead of the root of the live device tree, and had to write
rcar_du_of_find_node_by_path(). Utility functions to add or modify properties
or to rename nodes could similarly be added.

Compared to v1, this series update the r8a7792 and r8a7794 device tree sources
and incorporate review feedback as described by the changelogs of individual
patches.

Laurent Pinchart (12):
  dt-bindings: display: renesas: Add R-Car LVDS encoder DT bindings
  dt-bindings: display: renesas: Deprecate LVDS support in the DU
    bindings
  drm: rcar-du: Fix legacy DT to create LVDS encoder nodes
  drm: rcar-du: Convert LVDS encoder code to bridge driver
  ARM: dts: porter: Fix HDMI output routing
  ARM: dts: r8a7790: Convert to new LVDS DT bindings
  ARM: dts: r8a7791: Convert to new LVDS DT bindings
  ARM: dts: r8a7792: Convert to new DU DT bindings
  ARM: dts: r8a7793: Convert to new LVDS DT bindings
  ARM: dts: r8a7794: Convert to new DU DT bindings
  arm64: dts: renesas: r8a7795: Convert to new LVDS DT bindings
  arm64: dts: renesas: r8a7796: Convert to new LVDS DT bindings

 .../bindings/display/bridge/renesas,lvds.txt       |  56 +++
 .../devicetree/bindings/display/renesas,du.txt     |  31 +-
 MAINTAINERS                                        |   1 +
 arch/arm/boot/dts/r8a7790-lager.dts                |  22 +-
 arch/arm/boot/dts/r8a7790.dtsi                     |  60 ++-
 arch/arm/boot/dts/r8a7791-koelsch.dts              |  10 +-
 arch/arm/boot/dts/r8a7791-porter.dts               |  18 +-
 arch/arm/boot/dts/r8a7791.dtsi                     |  34 +-
 arch/arm/boot/dts/r8a7792.dtsi                     |   1 -
 arch/arm/boot/dts/r8a7793-gose.dts                 |  10 +-
 arch/arm/boot/dts/r8a7793.dtsi                     |  34 +-
 arch/arm/boot/dts/r8a7794.dtsi                     |   1 -
 .../boot/dts/renesas/r8a7795-es1-salvator-x.dts    |   3 +-
 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts     |   3 +-
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts |   3 +-
 .../arm64/boot/dts/renesas/r8a7795-salvator-xs.dts |   3 +-
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           |  34 +-
 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts     |   3 +-
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts |   3 +-
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           |  34 +-
 drivers/gpu/drm/rcar-du/Kconfig                    |   6 +-
 drivers/gpu/drm/rcar-du/Makefile                   |   6 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |  21 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h              |   5 -
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c          | 175 +------
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h          |  12 -
 drivers/gpu/drm/rcar-du/rcar_du_kms.c              |  14 +-
 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c          |  93 ----
 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.h          |  24 -
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c          | 264 ----------
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.h          |  64 ---
 drivers/gpu/drm/rcar-du/rcar_du_of.c               | 451 +++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_of.h               |  16 +
 drivers/gpu/drm/rcar-du/rcar_du_of_lvds.dts        |  82 ++++
 drivers/gpu/drm/rcar-du/rcar_lvds.c                | 546 +++++++++++++++++++++
 35 files changed, 1421 insertions(+), 722 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.h
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.h
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of.h
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds.dts
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_lvds.c

-- 
Regards,

Laurent Pinchart
