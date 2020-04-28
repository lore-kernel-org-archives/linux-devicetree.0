Return-Path: <SRS0=DpSr=6M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73ECDC83000
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 09:21:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F9C8206D6
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 09:21:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727082AbgD1JVT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Apr 2020 05:21:19 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47510 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726840AbgD1JVT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 28 Apr 2020 05:21:19 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: rcn)
        with ESMTPSA id E9CE82A15C3
From:   =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     robh+dt@kernel.org
Cc:     kernel@collabora.com, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, jason@lakedaemon.net,
        tomi.valkeinen@ti.com
Subject: [RFC PATCH] dt-bindings: display: ti,tfp410.txt: convert to yaml
Date:   Tue, 28 Apr 2020 11:20:48 +0200
Message-Id: <20200428092048.14939-1-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Convert the DT binding documentation for the TI TFP410 DPI-to-DVI
encoder to json-schema.

Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
---
Hi all,

I found some issues while converting this binding and I'd like to know
your opinions on how to tackle them.

1) dtbs_check fails for arch/arm/boot/dts/dove-sbc-a510.dts

  This board uses the TFP410 encoder but it doesn't define any ports for
  it. I can't find any suitable remote endpoints in its description
  either. Maybe this board description should be reworked? The current
  driver won't handle the device if it doesn't define any ports or
  endpoints anyway.

  It also uses the 'powerdown-gpio' property instead of
  'powerdown-gpios'. AFAICT this shouldn't be a problem from the driver
  point of view, but the general standard in DT bindings is to use the
  plural. This is trivial to fix.

2) The definition of ti,deskew in the original binding seems to be
tailored to the current driver and the way it's defined may not be very
DT-friendly.

  This parameter maps to a 3-bit field in a hardware register that takes
  a value from 0 to 7, so the [-4, 3] range described for this would map
  to [000, 111]: -4 -> 000, -3 -> 001, -2 -> 010, ... 3 -> 111.

  Then, the driver parses the parameter (unsigned) and casts it to a
  signed integer to get a number in the [-4, 3] range.

  A vendor-specific property must have a type definition in json-schema,
  so if I translate the original bindings semantics directly, I should
  define ti,deskew as an int32, but this makes dt_binding_check fail if
  the property has a negative value in the example because of the
  internal representation of cells as unsigned integers:

     ti,deskew:0:0: 4294967293 is greater than the maximum of 2147483647

  So I can think of two solutions to this:

  a) Keep the ti,deskew property as an uint32 and document the valid
  range ([-4, 3]) in the property description (this is what this patch
  does currently).

  b) Redefine this property to be closer to the datasheet description
  (ie. unsigned integers from 0 to 7) and adapt the driver accordingly.
  This would also let us define its range properly using minimum and
  maximum properties for it.

  I think (b) is the right thing to do but I want to know your
  opinion. Besides, I don't have this hardware at hand and if I updated
  the driver I wouldn't be able to test it.

Thanks.

Patch tested with:

make dt_binding_check ARCH=arm DT_SCHEMA_FILES=<.../ti,tfp410.yaml>
make dtbs_check ARCH=arm DT_SCHEMA_FILES=<.../ti,tfp410.yaml>

 .../bindings/display/bridge/ti,tfp410.txt     |  66 ----------
 .../bindings/display/bridge/ti,tfp410.yaml    | 121 ++++++++++++++++++
 2 files changed, 121 insertions(+), 66 deletions(-)
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
index 000000000000..79666ee540f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
@@ -0,0 +1,121 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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
+    const: "ti,tfp410"
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
+      Data de-skew in 350ps increments, from -4 to +3, as configured
+      through the DK[3:1] pins. This property shall be present only if
+      the TFP410 is not connected through I2C.
+    maxItems: 1
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
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
+                description: Endpoint sampling edge.
+                enum:
+                  - 0  # Falling edge
+                  - 1  # Rising edge
+
+              bus-width:
+                description: Endpoint bus width.
+                enum: [ 12, 24 ]
+
+        required:
+          - endpoint
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
+        required:
+          - endpoint
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

