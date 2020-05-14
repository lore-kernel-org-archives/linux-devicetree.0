Return-Path: <SRS0=mbMJ=64=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DF8AC433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 10:13:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D10B2065D
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 10:13:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbgENKNE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 May 2020 06:13:04 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58394 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbgENKNE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 14 May 2020 06:13:04 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: rcn)
        with ESMTPSA id E62C62A2C39
From:   =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     devicetree@vger.kernel.org
Cc:     kernel@collabora.com, dri-devel@lists.freedesktop.org,
        robh+dt@kernel.org, enric.balletbo@collabora.com
Subject: [PATCH v4] dt-bindings: display: anx7814.txt: convert to yaml
Date:   Thu, 14 May 2020 12:12:35 +0200
Message-Id: <20200514101235.7290-1-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This converts the Analogix ANX7814 bridge DT binding to yaml. Port
definitions and descriptions were expanded, apart from that it's a
direct translation from the original binding.

Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
Changes in v4:
  - Make interrupts and gpios optional (Enric Balletbo)
  - Make hpd-gpios deprecated (Rob Herring)
  - Remove maxItems from dvdd10-supply

Changes in v3 (suggested by Sam Ravnborg):
  - Rename example node i2c0 to i2c.

Changes in v2 (suggested by Enric Balletbo):
  - File name change: use full compatible string.
  - Binding description removed.
  - #address-cells and #size-cells properties removed from ports node.
  - Example node renamed: anx7814 -> bridge.

Tested with:
make dt_binding_check ARCH=arm64 DT_SCHEMA_FILES=<.../analogix,anx7814.yaml>
make dtbs_check ARCH=arm64 DT_SCHEMA_FILES=<.../analogix,anx7814.yaml>

 .../display/bridge/analogix,anx7814.yaml      | 119 ++++++++++++++++++
 .../bindings/display/bridge/anx7814.txt       |  42 -------
 2 files changed, 119 insertions(+), 42 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/anx7814.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml
new file mode 100644
index 000000000000..3ba477aefdd7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/analogix,anx7814.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analogix ANX7814 SlimPort (Full-HD Transmitter)
+
+maintainers:
+  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
+
+properties:
+  compatible:
+    enum:
+      - analogix,anx7808
+      - analogix,anx7812
+      - analogix,anx7814
+      - analogix,anx7818
+
+  reg:
+    maxItems: 1
+    description: I2C address of the device.
+
+  interrupts:
+    maxItems: 1
+    description: Should contain the INTP interrupt.
+
+  hpd-gpios:
+    deprecated: true
+    maxItems: 1
+    description: Which GPIO to use for hpd.
+
+  pd-gpios:
+    maxItems: 1
+    description: Which GPIO to use for power down.
+
+  reset-gpios:
+    maxItems: 1
+    description: Which GPIO to use for reset.
+
+  dvdd10-supply:
+    description: Regulator for 1.0V digital core power.
+
+  ports:
+    type: object
+    description:
+      A node containing input and output port nodes with endpoint
+      definitions as documented in
+      Documentation/devicetree/bindings/media/video-interfaces.txt
+      Documentation/devicetree/bindings/graph.txt
+
+    properties:
+      port@0:
+        type: object
+        description: Video port for HDMI input.
+
+        properties:
+          reg:
+            const: 0
+
+      port@1:
+        type: object
+        description:
+          Video port for SlimPort, DisplayPort, eDP or MyDP output.
+
+        properties:
+          reg:
+            const: 1
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        anx7814: bridge@38 {
+            compatible = "analogix,anx7814";
+            reg = <0x38>;
+            interrupt-parent = <&gpio0>;
+            interrupts = <99 IRQ_TYPE_LEVEL_LOW>;   /* INTP */
+            pd-gpios = <&pio 33 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&pio 98 GPIO_ACTIVE_HIGH>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    anx7814_in: endpoint {
+                        remote-endpoint = <&hdmi0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    anx7814_out: endpoint {
+                        remote-endpoint = <&edp_out>;
+                    };
+                };
+            };
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/bridge/anx7814.txt b/Documentation/devicetree/bindings/display/bridge/anx7814.txt
deleted file mode 100644
index 17258747fff6..000000000000
--- a/Documentation/devicetree/bindings/display/bridge/anx7814.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-Analogix ANX7814 SlimPort (Full-HD Transmitter)
------------------------------------------------
-
-The ANX7814 is an ultra-low power Full-HD (1080p60) SlimPort transmitter
-designed for portable devices.
-
-Required properties:
-
- - compatible		: Must be one of:
-			  "analogix,anx7808"
-			  "analogix,anx7812"
-			  "analogix,anx7814"
-			  "analogix,anx7818"
- - reg			: I2C address of the device
- - interrupts		: Should contain the INTP interrupt
- - hpd-gpios		: Which GPIO to use for hpd
- - pd-gpios		: Which GPIO to use for power down
- - reset-gpios		: Which GPIO to use for reset
-
-Optional properties:
-
- - dvdd10-supply	: Regulator for 1.0V digital core power.
- - Video port for HDMI input, using the DT bindings defined in [1].
-
-[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
-
-Example:
-
-	anx7814: anx7814@38 {
-		compatible = "analogix,anx7814";
-		reg = <0x38>;
-		interrupt-parent = <&gpio0>;
-		interrupts = <99 IRQ_TYPE_LEVEL_LOW>;   /* INTP */
-		hpd-gpios = <&pio 36 GPIO_ACTIVE_HIGH>;
-		pd-gpios = <&pio 33 GPIO_ACTIVE_HIGH>;
-		reset-gpios = <&pio 98 GPIO_ACTIVE_HIGH>;
-		port {
-			anx7814_in: endpoint {
-				remote-endpoint = <&hdmi0_out>;
-			};
-		};
-	};
-- 
2.18.0

