From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] dt-bindings: drm: rcar-du: Document optional reset properties
Date: Mon,  6 Mar 2017 17:25:56 +0100
Message-ID: <1488817556-21410-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, David Airlie <airlied@linux.ie>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Document the optional properties for describing module resets, to
support resetting display channels and LVDS encoders on R-Car Gen2 and
Gen3.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
See "[v2,1/4] dt-bindings: clock: renesas: cpg-mssr: Document reset control
support" (https://patchwork.kernel.org/patch/9536627/) for the format of
a reset specifier in the Renesas CPG/MSSR case.

E.g. "resets = <&cpg 310>;"

v2:
  - s/phandles/phandle/.
---
 Documentation/devicetree/bindings/display/renesas,du.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
index 1a02f099a0ff0a3a..3db418c827193e82 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.txt
+++ b/Documentation/devicetree/bindings/display/renesas,du.txt
@@ -36,6 +36,16 @@ Required Properties:
       When supplied they must be named "dclkin.x" with "x" being the input
       clock numerical index.
 
+Optional properties:
+  - resets: A list of phandle + reset-specifier pairs, one for each entry in
+    the reset-names property.
+  - reset-names: Names of the resets. This property is model-dependent.
+    - R8A779[0123456] use one reset for a group of one or more successive
+      channels, and one reset per LVDS encoder (if available). The resets
+      must be named "du.x" with "x" being the numerical index of the lowest
+      channel in the group. The LVDS resets must be named "lvds.x" with "x"
+      being the LVDS encoder numerical index.
+
 Required nodes:
 
 The connections to the DU output video ports are modeled using the OF graph
-- 
2.7.4
