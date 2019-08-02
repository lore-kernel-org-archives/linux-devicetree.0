From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH/RFC 00/12] Add dual-LVDS panel support to EK874
Date: Fri,  2 Aug 2019 08:33:57 +0100
Message-ID: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Sam Ravnborg <sam@ravnborg.org>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, linux-kernel@vger.kernel.org, ebiharaml@si-linux.co.jp
List-Id: devicetree@vger.kernel.org

Dear All,

this series adds support for dual-LVDS panel IDK-2121WR
from Advantech:
https://buy.advantech.eu/Displays/Embedded-LCD-Kits-High-Brightness/model-IDK-2121WR-K2FHA2E.htm
Dual link support is very recent for R-Car Gen3, and I couldn't
find much on dual link panels in the kernel either, therefore
comments are very welcome to get this right.

The panel doesn't come with the EK874 kit, but it's advertised as
supported, therefore this series adds a new dts file to support
the configuration of the EK874 + IDK-2121WR.

Finally, this series depends on a fix that's still pending:
https://patchwork.kernel.org/patch/11054755/

Thanks,
Fab

Fabrizio Castro (12):
  dt-bindings: display: renesas: lvds: RZ/G2E needs renesas,companion
    too
  dt-bindings: display: renesas: lvds: Document renesas,swap-data
  dt-bindings: panel: lvds: Add dual-link LVDS display support
  dt-bindings: display: Add bindings for Advantech IDK-2121WR
  drm: rcar-du: lvds: Add data swap support
  drm: rcar-du: lvds: Do not look at ports for identifying bridges
  drm: rcar-du: lvds: Add support for dual link panels
  drm: rcar-du: lvds: Fix bridge_to_rcar_lvds
  drm: rcar-du: lvds: Fix companion's mode
  arm64: dts: renesas: r8a774c0: Point LVDS0 to its companion LVDS1
  arm64: dts: renesas: cat874: Add definition for 12V regulator
  arm64: dts: renesas: Add EK874 board with idk-2121wr display support

 .../bindings/display/bridge/renesas,lvds.txt       |  11 +-
 .../display/panel/advantech,idk-2121wr.txt         |  62 ++++++++++++
 .../bindings/display/panel/panel-lvds.txt          |  91 ++++++++++++-----
 arch/arm64/boot/dts/renesas/Makefile               |   3 +-
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts    |   9 ++
 .../boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts | 112 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |   2 +
 drivers/gpu/drm/rcar-du/rcar_lvds.c                |  65 ++++++------
 8 files changed, 291 insertions(+), 64 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.txt
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts

-- 
2.7.4
