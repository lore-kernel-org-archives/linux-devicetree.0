From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v2 1/7] dt-bindings: display: renesas: Add R-Car M3-W HDMI TX DT bindings
Date: Wed, 21 Jun 2017 12:31:27 +0300
Message-ID: <20170621093133.5677-2-laurent.pinchart+renesas@ideasonboard.com>
References: <20170621093133.5677-1-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170621093133.5677-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

The M3-W HDMI TX controller seems to be compatible for the H3. No
extension to the DT bindings are needed, add an SoC-specific compatible
string in case differences between the IP versions are found later and
require model-specific handling.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
index f6b3f36d422b..c93a3858a98a 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
@@ -13,6 +13,7 @@ Required properties:
 
 - compatible : Shall contain one or more of
   - "renesas,r8a7795-hdmi" for R8A7795 (R-Car H3) compatible HDMI TX
+  - "renesas,r8a7796-hdmi" for R8A7796 (R-Car M3-W) compatible HDMI TX
   - "renesas,rcar-gen3-hdmi" for the generic R-Car Gen3 compatible HDMI TX
 
     When compatible with generic versions, nodes must list the SoC-specific
-- 
Regards,

Laurent Pinchart
