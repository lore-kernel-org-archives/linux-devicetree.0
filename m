From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH/RFC 01/12] dt-bindings: display: renesas: lvds: RZ/G2E needs renesas,companion too
Date: Fri,  2 Aug 2019 08:33:58 +0100
Message-ID: <1564731249-22671-2-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

Document RZ/G2E support for property renesas,companion.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
index c6a196d..dece79e 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
@@ -49,9 +49,9 @@ Each port shall have a single endpoint.
 Optional properties:
 
 - renesas,companion : phandle to the companion LVDS encoder. This property is
-  mandatory for the first LVDS encoder on D3 and E3 SoCs, and shall point to
-  the second encoder to be used as a companion in dual-link mode. It shall not
-  be set for any other LVDS encoder.
+  mandatory for the first LVDS encoder on R-Car D3, R-Car E3, and RZ/G2E SoCs,
+  and shall point to the second encoder to be used as a companion in dual-link
+  mode. It shall not be set for any other LVDS encoder.
 
 
 Example:
-- 
2.7.4
