Return-Path: <SRS0=mas4=6P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B35C4724C
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 May 2020 08:33:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 885A92166E
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 May 2020 08:33:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728363AbgEAIdV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 1 May 2020 04:33:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728345AbgEAIdU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 1 May 2020 04:33:20 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E32E7C035494
        for <devicetree@vger.kernel.org>; Fri,  1 May 2020 01:33:19 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: rcn)
        with ESMTPSA id 455592A2D1E
From:   =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     laurent.pinchart@ideasonboard.com
Cc:     kernel@collabora.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, geert+renesas@glider.be,
        robh+dt@kernel.org, xuwei5@hisilicon.com
Subject: [RFT PATCH 5/5] dt-bindings: drm: bridge: adi,adv7511.txt: convert to yaml
Date:   Fri,  1 May 2020 10:32:27 +0200
Message-Id: <20200501083227.10886-6-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200501083227.10886-1-ricardo.canuelo@collabora.com>
References: <20200501083227.10886-1-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Convert the ADV7511/11w/13/33/35 DT bindings to json-schema.

Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
---
 .../bindings/display/bridge/adi,adv7511.txt   | 143 ---------
 .../bindings/display/bridge/adi,adv7511.yaml  | 293 ++++++++++++++++++
 2 files changed, 293 insertions(+), 143 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/adi,adv7511.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
deleted file mode 100644
index 659523f538bf..000000000000
--- a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
+++ /dev/null
@@ -1,143 +0,0 @@
-Analog Devices ADV7511(W)/13/33/35 HDMI Encoders
-------------------------------------------------
-
-The ADV7511, ADV7511W, ADV7513, ADV7533 and ADV7535 are HDMI audio and video
-transmitters compatible with HDMI 1.4 and DVI 1.0. They support color space
-conversion, S/PDIF, CEC and HDCP. ADV7533/5 supports the DSI interface for input
-pixels, while the others support RGB interface.
-
-Required properties:
-
-- compatible: Should be one of:
-		"adi,adv7511"
-		"adi,adv7511w"
-		"adi,adv7513"
-		"adi,adv7533"
-		"adi,adv7535"
-
-- reg: I2C slave addresses
-  The ADV7511 internal registers are split into four pages exposed through
-  different I2C addresses, creating four register maps. Each map has it own
-  I2C address and acts as a standard slave device on the I2C bus. The main
-  address is mandatory, others are optional and revert to defaults if not
-  specified.
-
-
-The ADV7511 supports a large number of input data formats that differ by their
-color depth, color format, clock mode, bit justification and random
-arrangement of components on the data bus. The combination of the following
-properties describe the input and map directly to the video input tables of the
-ADV7511 datasheet that document all the supported combinations.
-
-- adi,input-depth: Number of bits per color component at the input (8, 10 or
-  12).
-- adi,input-colorspace: The input color space, one of "rgb", "yuv422" or
-  "yuv444".
-- adi,input-clock: The input clock type, one of "1x" (one clock cycle per
-  pixel), "2x" (two clock cycles per pixel), "ddr" (one clock cycle per pixel,
-  data driven on both edges).
-
-The following input format properties are required except in "rgb 1x" and
-"yuv444 1x" modes, in which case they must not be specified.
-
-- adi,input-style: The input components arrangement variant (1, 2 or 3), as
-  listed in the input format tables in the datasheet.
-- adi,input-justification: The input bit justification ("left", "evenly",
-  "right").
-
-- avdd-supply: A 1.8V supply that powers up the AVDD pin on the chip.
-- dvdd-supply: A 1.8V supply that powers up the DVDD pin on the chip.
-- pvdd-supply: A 1.8V supply that powers up the PVDD pin on the chip.
-- dvdd-3v-supply: A 3.3V supply that powers up the pin called DVDD_3V
-  on the chip.
-- bgvdd-supply: A 1.8V supply that powers up the BGVDD pin. This is
-  needed only for ADV7511.
-
-The following properties are required for ADV7533 and ADV7535:
-
-- adi,dsi-lanes: Number of DSI data lanes connected to the DSI host. It should
-  be one of 1, 2, 3 or 4.
-- a2vdd-supply: 1.8V supply that powers up the A2VDD pin on the chip.
-- v3p3-supply: A 3.3V supply that powers up the V3P3 pin on the chip.
-- v1p2-supply: A supply that powers up the V1P2 pin on the chip. It can be
-  either 1.2V or 1.8V for ADV7533 but only 1.8V for ADV7535.
-
-Optional properties:
-
-- interrupts: Specifier for the ADV7511 interrupt
-- pd-gpios: Specifier for the GPIO connected to the power down signal
-
-- adi,clock-delay: Video data clock delay relative to the pixel clock, in ps
-  (-1200 ps .. 1600 ps). Defaults to no delay.
-- adi,embedded-sync: The input uses synchronization signals embedded in the
-  data stream (similar to BT.656). Defaults to separate H/V synchronization
-  signals.
-- adi,disable-timing-generator: Only for ADV7533 and ADV7535. Disables the
-  internal timing generator. The chip will rely on the sync signals in the
-  DSI data lanes, rather than generate its own timings for HDMI output.
-- clocks: from common clock binding: reference to the CEC clock.
-- clock-names: from common clock binding: must be "cec".
-- reg-names : Names of maps with programmable addresses.
-	It can contain any map needing a non-default address.
-	Possible maps names are : "main", "edid", "cec", "packet"
-
-Required nodes:
-
-The ADV7511 has two video ports. Their connections are modelled using the OF
-graph bindings specified in Documentation/devicetree/bindings/graph.txt.
-
-- Video port 0 for the RGB, YUV or DSI input. In the case of ADV7533/5, the
-  remote endpoint phandle should be a reference to a valid mipi_dsi_host device
-  node.
-- Video port 1 for the HDMI output
-- Audio port 2 for the HDMI audio input
-
-
-Example
--------
-
-	adv7511w: hdmi@39 {
-		compatible = "adi,adv7511w";
-		/*
-		 * The EDID page will be accessible on address 0x66 on the I2C
-		 * bus. All other maps continue to use their default addresses.
-		 */
-		reg = <0x39>, <0x66>;
-		reg-names = "main", "edid";
-		interrupt-parent = <&gpio3>;
-		interrupts = <29 IRQ_TYPE_EDGE_FALLING>;
-		clocks = <&cec_clock>;
-		clock-names = "cec";
-
-		adi,input-depth = <8>;
-		adi,input-colorspace = "rgb";
-		adi,input-clock = "1x";
-		adi,input-style = <1>;
-		adi,input-justification = "evenly";
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-				adv7511w_in: endpoint {
-					remote-endpoint = <&dpi_out>;
-				};
-			};
-
-			port@1 {
-				reg = <1>;
-				adv7511_out: endpoint {
-					remote-endpoint = <&hdmi_connector_in>;
-				};
-			};
-
-			port@2 {
-				reg = <2>;
-				codec_endpoint: endpoint {
-					remote-endpoint = <&i2s0_cpu_endpoint>;
-				};
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.yaml b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.yaml
new file mode 100644
index 000000000000..0654c3a35281
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.yaml
@@ -0,0 +1,293 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices ADV7511(W)/13/33/35 HDMI Encoders
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+
+description: |
+  The ADV7511, ADV7511W, ADV7513, ADV7533 and ADV7535 are HDMI audio and
+  video transmitters compatible with HDMI 1.4 and DVI 1.0. They support
+  color space conversion, S/PDIF, CEC and HDCP. ADV7533/5 supports the
+  DSI interface for input pixels, while the others support RGB
+  interface.
+
+properties:
+  compatible:
+    enum:
+      - adi,adv7511
+      - adi,adv7511w
+      - adi,adv7513
+      - adi,adv7533
+      - adi,adv7535
+
+  reg:
+    description: |
+      I2C slave addresses.
+
+      The ADV7511 internal registers are split into four pages exposed
+      through different I2C addresses, creating four register maps. Each
+      map has it own I2C address and acts as a standard slave device on
+      the I2C bus. The main address is mandatory, others are optional
+      and revert to defaults if not specified.
+    minItems: 1
+    maxItems: 4
+
+  clocks:
+    description: Reference to the CEC clock.
+    maxItems: 1
+
+  clock-names:
+    const: cec
+
+  reg-names:
+    description:
+      Names of maps with programmable addresses. It can contain any map
+      needing a non-default address.
+    minItems: 1
+    items:
+      - const: main
+      - const: edid
+      - const: cec
+      - const: packet
+
+  interrupts:
+    maxItems: 1
+
+  pd-gpios:
+    description: GPIO connected to the power down signal.
+    maxItems: 1
+
+  avdd-supply:
+    description: A 1.8V supply that powers up the AVDD pin.
+    maxItems: 1
+
+  dvdd-supply:
+    description: A 1.8V supply that powers up the DVDD pin.
+    maxItems: 1
+
+  pvdd-supply:
+    description: A 1.8V supply that powers up the PVDD pin.
+    maxItems: 1
+
+  ports:
+    description:
+      The ADV7511 has two video ports and one audio port. This node
+      models their connections as documented in
+      Documentation/devicetree/bindings/media/video-interfaces.txt
+      Documentation/devicetree/bindings/graph.txt
+    type: object
+    properties:
+      port@0:
+        description:
+          Video port for the RGB, YUV or DSI input. In the case of
+          ADV7533/5, the remote endpoint phandle should be a reference
+          to a valid mipi_dsi_host_device.
+        type: object
+
+      port@1:
+        description: Video port for the HDMI output.
+        type: object
+
+      port@2:
+        description: Audio port for the HDMI output.
+        type: object
+
+
+allOf:
+  # ADV7511/11w/13-specific parameters
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - adi,adv7511
+              - adi,adv7511w
+              - adi,adv7513
+
+    then:
+      properties:
+        dvdd-3v-supply:
+          description: A 3.3V supply that powers up the DVDD_3V pin.
+          maxItems: 1
+
+        bgvdd-supply:
+          description: A 1.8V supply that powers up the BGVDD pin.
+          maxItems: 1
+
+        adi,input-depth:
+          description: Number of bits per color component at the input.
+          allOf:
+            - $ref: /schemas/types.yaml#/definitions/uint32
+            - enum: [ 8, 10, 12 ]
+
+        adi,input-colorspace:
+          description: Input color space.
+          allOf:
+            - $ref: /schemas/types.yaml#/definitions/string
+            - enum: [ rgb, yuv422, yuv444 ]
+
+        adi,input-clock:
+          description: |
+            Input clock type.
+              "1x": one clock cycle per pixel
+              "2x": two clock cycles per pixel
+              "dd": one clock cycle per pixel, data driven on both edges
+          allOf:
+            - $ref: /schemas/types.yaml#/definitions/string
+            - enum: [ 1x, 2x, dd ]
+
+        adi,clock-delay:
+          description:
+            Video data clock delay relative to the pixel clock, in ps
+            (-1200ps .. 1600 ps).
+          allOf:
+            - $ref: /schemas/types.yaml#/definitions/uint32
+            - default: 0
+
+        adi,embedded-sync:
+          description:
+            The input uses synchronization signals embedded in the data
+            stream (similar to BT.656). Defaults to 0 (separate H/V
+            synchronization signals).
+          allOf:
+            - $ref: /schemas/types.yaml#/definitions/uint32
+            - enum: [ 0, 1 ]
+            - default: 0
+
+      required:
+        - adi,input-depth
+        - adi,input-colorspace
+        - adi,input-clock
+
+  # adi,input-style and adi,input-justification are required except in
+  # "rgb 1x" and "yuv444 1x" modes.
+  - if:
+      not:
+        properties:
+          adi,input-colorspace:
+            contains:
+              enum: [ rgb, yuv444 ]
+          adi,input-clock:
+            contains:
+              const: 1x
+
+    then:
+      properties:
+        adi,input-style:
+          description:
+            Input components arrangement variant as listed in the input
+            format tables in the datasheet.
+          allOf:
+            - $ref: /schemas/types.yaml#/definitions/uint32
+            - enum: [ 1, 2, 3 ]
+
+        adi,input-justification:
+          description: Input bit justification.
+          allOf:
+            - $ref: /schemas/types.yaml#/definitions/string
+            - enum: [ left, evenly, right ]
+
+      required:
+        - adi,input-style
+        - adi,input-justification
+
+  # ADV7533/35-specific parameters
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - adi,adv7533
+              - adi,adv7535
+
+    then:
+      properties:
+        adi,disable-timing-generator:
+          description:
+            Disables the interal timing generator. The chip will rely on
+            the sync signals in the DSI data lanes, rather than generate
+            its own timings for HDMI output.
+          type: boolean
+
+        adi,dsi-lanes:
+          description: Number of DSI data lanes connected to the DSI host.
+          allOf:
+            - $ref: /schemas/types.yaml#/definitions/uint32
+            - enum: [ 1, 2, 3, 4 ]
+
+        a2vdd-supply:
+          description: A 1.8V supply that powers up the A2VDD pin.
+          maxItems: 1
+
+        v3p3-supply:
+          description: A 3.3V supply that powers up the V3P3 pin.
+          maxItems: 1
+
+        v1p2-supply:
+          description:
+            A supply that powers up the V1P2 pin. It can be either 1.2V
+            or 1.8V for ADV7533 but only 1.8V for ADV7535.
+          maxItems: 1
+
+      required:
+        - adi,dsi-lanes
+
+required:
+  - compatible
+  - reg
+  - ports
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    adv7511w: hdmi@39 {
+        compatible = "adi,adv7511w";
+        /*
+         * The EDID page will be accessible on address 0x66 on the I2C
+         * bus. All other maps continue to use their default addresses.
+         */
+        reg = <0x39>, <0x66>;
+        reg-names = "main", "edid";
+        interrupt-parent = <&gpio3>;
+        interrupts = <29 IRQ_TYPE_EDGE_FALLING>;
+        clocks = <&cec_clock>;
+        clock-names = "cec";
+
+        adi,input-depth = <8>;
+        adi,input-colorspace = "rgb";
+        adi,input-clock = "1x";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                adv7511w_in: endpoint {
+                    remote-endpoint = <&dpi_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                adv7511_out: endpoint {
+                    remote-endpoint = <&hdmi_connector_in>;
+                };
+            };
+
+            port@2 {
+                reg = <2>;
+                codec_endpoint: endpoint {
+                    remote-endpoint = <&i2s0_cpu_endpoint>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.18.0

