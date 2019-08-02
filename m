From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH/RFC 02/12] dt-bindings: display: renesas: lvds: Document renesas,swap-data
Date: Fri,  2 Aug 2019 08:33:59 +0100
Message-ID: <1564731249-22671-3-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

R-Car D3, R-Car E3, and RZ/G2E support dual-link mode.
In such a mode, the first LVDS encoder emits even data, and the
second LVDS encoder emits odd data. This patch documents property
renesas,swap-data, used to swap even and odd data around.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
index dece79e..8980179 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
@@ -52,6 +52,11 @@ Optional properties:
   mandatory for the first LVDS encoder on R-Car D3, R-Car E3, and RZ/G2E SoCs,
   and shall point to the second encoder to be used as a companion in dual-link
   mode. It shall not be set for any other LVDS encoder.
+- renesas,swap-data : when in dual-link mode, the first LVDS encoder normally
+  emits even data, and the second LVDS encoder emits odd data. When property
+  renesas,swap-data is specified, the data emitted by the two encoders will be
+  swapped around. This property can only be used in conjunction with property
+  renesas,companion.
 
 
 Example:
-- 
2.7.4
