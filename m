Return-Path: <SRS0=UWh6=XB=vger.kernel.org=devicetree-owner@kernel.org>
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:33195 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393354AbfIFNmj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 6 Sep 2019 09:42:39 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v4 1/9] dt-bindings: display: renesas,cmm: Add R-Car CMM documentation
Date: Fri,  6 Sep 2019 15:43:33 +0200
Message-Id: <20190906134341.9879-2-jacopo+renesas@jmondi.org>
In-Reply-To: <20190906134341.9879-1-jacopo+renesas@jmondi.org>
References: <20190906134341.9879-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org, horms@verge.net.au, uli@fpond.eu, VenkataRajesh.Kalakodima@in.bosch.com
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
List-ID: <devicetree@vger.kernel.org>

Add device tree bindings documentation for the Renesas R-Car Display
Unit Color Management Module.

CMM is the image enhancement module available on each R-Car DU video
channel on R-Car Gen2 and Gen3 SoCs (V3H and V3M excluded).

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../bindings/display/renesas,cmm.yaml         | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/renesas,cmm.yaml

diff --git a/Documentation/devicetree/bindings/display/renesas,cmm.yaml b/Documentation/devicetree/bindings/display/renesas,cmm.yaml
new file mode 100644
index 000000000000..9e5922689cd7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/renesas,cmm.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/renesas,cmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Car Color Management Module (CMM)
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+  - Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
+  - Jacopo Mondi <jacopo+renesas@jmondi.org>
+
+description: |+
+  Renesas R-Car color management module connected to R-Car DU video channels.
+  It provides image enhancement functions such as 1-D look-up tables (LUT),
+  3-D look-up tables (CMU), 1D-histogram generation (HGO), and color
+  space conversion (CSC).
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - renesas,r8a7795-cmm
+        - renesas,r8a7796-cmm
+        - renesas,r8a77965-cmm
+        - renesas,r8a77990-cmm
+        - renesas,r8a77995-cmm
+      - enum:
+        - renesas,rcar-gen3-cmm
+        - renesas,rcar-gen2-cmm
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a7796-cpg-mssr.h>
+    #include <dt-bindings/power/r8a7796-sysc.h>
+
+    cmm0: cmm@fea40000 {
+         compatible = "renesas,r8a7796-cmm";
+         reg = <0 0xfea40000 0 0x1000>;
+         power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+         clocks = <&cpg CPG_MOD 711>;
+         resets = <&cpg 711>;
+    };
--
2.23.0
