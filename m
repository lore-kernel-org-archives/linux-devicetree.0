From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v2 0/2] R-Car H3 ES2.0 Salvator-X: Enable DU support in DT
Date: Mon, 26 Jun 2017 19:29:28 +0300
Message-ID: <20170626162930.30240-1-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,

This patch series enable DU support in DT for the R-Car H3 ES2.0 Salvator-X
board. Patch 1/2 extends the DT bindings as needed, and patch 2/2 then enables
DU in the SoC DT.

The patches are based on top of Simon's arm64-dt-for-v4.14 branch.

Compared to v1

- the VSP DT bindings have been extended in patch 1/2
- patch 2/2 has been updated accordingly
- patch "arm64: dts: r8a7795: salvator-x: Unify DU node between ES1.x and
  ES2.0" has been dropped

Laurent Pinchart (2):
  drm: rcar-du: Add a VSP channel index to the vsps DT property
  arm64: dts: r8a7795: Add support for the DU

 .../devicetree/bindings/display/renesas,du.txt     | 51 +++++++++++++---------
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi       |  1 -
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           |  2 +
 3 files changed, 32 insertions(+), 22 deletions(-)

-- 
Regards,

Laurent Pinchart
