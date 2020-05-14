Return-Path: <SRS0=mbMJ=64=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E23AC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 14:36:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67D6120727
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 14:36:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbgENOgi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 May 2020 10:36:38 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60770 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727926AbgENOgh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 14 May 2020 10:36:37 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: rcn)
        with ESMTPSA id 0FB972A2EF2
From:   =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     Laurent.pinchart@ideasonboard.com
Cc:     kernel@collabora.com, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, jason@lakedaemon.net,
        tomi.valkeinen@ti.com, robh+dt@kernel.org, airlied@linux.ie,
        shawnguo@kernel.org
Subject: [PATCH v2 3/4] dt-bindings: display: ti,tfp410.txt: convert to yaml
Date:   Thu, 14 May 2020 16:36:11 +0200
Message-Id: <20200514143612.2094-4-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200514143612.2094-1-ricardo.canuelo@collabora.com>
References: <20200514143612.2094-1-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Convert the DT binding documentation for the TI TFP410 DPI-to-DVI
encoder to json-schema.

The 'ti,deskew' is now an unsigned value from 0 to 7 instead of a signed
value from -4 to 3. The rest of the binding is a direct translation from
the old one.

Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
---
 .../bindings/display/bridge/ti,tfp410.txt     |  66 ----------
 .../bindings/display/bridge/ti,tfp410.yaml    | 124 ++++++++++++++++++
 2 files changed, 124 insertions(+), 66 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/ti,tfp410.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tfp410.txt b/Documentation/devicetree/bindings/display/bridge/ti,tfp410.txt
deleted file mode 100644
index 5ff4f64ef8e8..000000000000
--- a/Documentation/devicetree/bindings/display/bridge/ti,tfp410.txt
+++ /dev/null
@@ -1,66 +0,0 @@
-TFP410 DPI to DVI encoder
-=========================
-
-Required properties:
-- compatible: "ti,tfp410"
-
-Optional properties:
-- powerdown-gpios: power-down gpio
-- reg: I2C address. If and only if present the device node should be placed
-  into the I2C controller node where the TFP410 I2C is connected to.
-- ti,deskew: data de-skew in 350ps increments, from -4 to +3, as configured
-  through th DK[3:1] pins. This property shall be present only if the TFP410
-  is not connected through I2C.
-
-Required nodes:
-
-This device has two video ports. Their connections are modeled using the OF
-graph bindings specified in [1]. Each port node shall have a single endpoint.
-
-- Port 0 is the DPI input port. Its endpoint subnode shall contain a
-  pclk-sample and bus-width property and a remote-endpoint property as specified
-  in [1].
-  - If pclk-sample is not defined, pclk-sample = 0 should be assumed for
-    backward compatibility.
-  - If bus-width is not defined then bus-width = 24 should be assumed for
-    backward compatibility.
-    bus-width = 24: 24 data lines are connected and single-edge mode
-    bus-width = 12: 12 data lines are connected and dual-edge mode
-
-- Port 1 is the DVI output port. Its endpoint subnode shall contain a
-  remote-endpoint property is specified in [1].
-
-[1] Documentation/devicetree/bindings/media/video-interfaces.txt
-
-
-Example
--------
-
-tfp410: encoder@0 {
-	compatible = "ti,tfp410";
-	powerdown-gpios = <&twl_gpio 2 GPIO_ACTIVE_LOW>;
-	ti,deskew = <4>;
-
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@0 {
-			reg = <0>;
-
-			tfp410_in: endpoint@0 {
-				pclk-sample = <1>;
-				bus-width = <24>;
-				remote-endpoint = <&dpi_out>;
-			};
-		};
-
-		port@1 {
-			reg = <1>;
-
-			tfp410_out: endpoint@0 {
-				remote-endpoint = <&dvi_connector_in>;
-			};
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
new file mode 100644
index 000000000000..a9f4fd8ea621
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/ti,tfp410.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TFP410 DPI to DVI encoder
+
+maintainers:
+  - Tomi Valkeinen <tomi.valkeinen@ti.com>
+  - Jyri Sarha <jsarha@ti.com>
+
+properties:
+  compatible:
+    const: ti,tfp410
+
+  reg:
+    description: I2C address of the device.
+    maxItems: 1
+
+  powerdown-gpios:
+    maxItems: 1
+
+  ti,deskew:
+    description:
+      Data de-skew value in 350ps increments, from 0 to 7, as configured
+      through the DK[3:1] pins. The de-skew multiplier is computed as
+      (DK[3:1] - 4), so it ranges from -4 to 3. This property shall be
+      present only if the TFP410 is not connected through I2C.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 7
+
+  ports:
+    description:
+      A node containing input and output port nodes with endpoint
+      definitions as documented in
+      Documentation/devicetree/bindings/media/video-interfaces.txt
+    type: object
+
+    properties:
+      port@0:
+        description: DPI input port.
+        type: object
+
+        properties:
+          reg:
+            const: 0
+
+          endpoint:
+            type: object
+
+            properties:
+              pclk-sample:
+                description:
+                  Endpoint sampling edge. If not defined, pclk-sample =
+                  0 should be assumed for backwards compatibility.
+                enum:
+                  - 0  # Falling edge
+                  - 1  # Rising edge
+                default: 0
+
+              bus-width:
+                description:
+                  Endpoint bus width. If not defined, bus-width = 24
+                  should be assumed for backwards compatibility.
+                enum:
+                  - 12  # 12 data lines connected and dual-edge mode
+                  - 24  # 24 data lines connected and single-edge mode
+                default: 24
+
+      port@1:
+        description: DVI output port.
+        type: object
+
+        properties:
+          reg:
+            const: 1
+
+          endpoint:
+            type: object
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    tfp410: encoder {
+        compatible = "ti,tfp410";
+        powerdown-gpios = <&twl_gpio 2 GPIO_ACTIVE_LOW>;
+        ti,deskew = <3>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                tfp410_in: endpoint {
+                    pclk-sample = <1>;
+                    bus-width = <24>;
+                    remote-endpoint = <&dpi_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                tfp410_out: endpoint {
+                    remote-endpoint = <&dvi_connector_in>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.18.0

