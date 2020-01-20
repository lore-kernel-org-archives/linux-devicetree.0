Return-Path: <SRS0=m/NK=3J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA16CC32771
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 21:02:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B741E22525
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 21:02:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="X49s9d9t"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbgATVCo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jan 2020 16:02:44 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:60812 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727047AbgATVCo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Jan 2020 16:02:44 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00KL2aIV098626;
        Mon, 20 Jan 2020 15:02:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579554156;
        bh=gJMUVkolaz4dNaEJkqhMPNiDq8iys8jbhh4jInUgzmU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=X49s9d9t5Z51+1EjnPLsYJZUFsNbSbBRJkYOMFWOCKblqWsiA3cdNNvU8q77HLVcG
         r0M7Iv0+lkHlakbsQqP+S/NapJkITsATADhZVUGRh4sabYXPS2ylmRNPWqY4qJJlNt
         kJrP+VpL5NjfbwVgLjF7RMvQDoakvd04gLE1bqaE=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00KL2ajb006031;
        Mon, 20 Jan 2020 15:02:36 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 20
 Jan 2020 15:02:35 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 20 Jan 2020 15:02:35 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00KL2PYa079658;
        Mon, 20 Jan 2020 15:02:33 -0600
From:   Jyri Sarha <jsarha@ti.com>
To:     <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>
CC:     <tomi.valkeinen@ti.com>, <laurent.pinchart@ideasonboard.com>,
        <peter.ujfalusi@ti.com>, <bparrot@ti.com>, <subhajit_paul@ti.com>,
        <praneeth@ti.com>, <yamonkar@cadence.com>, <sjakhade@cadence.com>,
        <sam@ravnborg.org>, <jsarha@ti.com>
Subject: [PATCH v8 3/5] dt-bindings: display: ti,j721e-dss: Add dt-schema yaml binding
Date:   Mon, 20 Jan 2020 23:02:22 +0200
Message-ID: <df84640a120495b34f6e672c286b7e18ae434de7.1579553817.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579553817.git.jsarha@ti.com>
References: <cover.1579553817.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add dt-schema yaml bindig for J721E DSS, J721E version TI Keystone
Display SubSystem.

Version history:

v2: no change

v3: - reg-names: "wp" -> "wb"
    - Add ports node
    - Add includes to dts example
    - reindent dts example

v4: - Add descriptions to reg, clocks, and interrupts properties
    - Remove minItems when its value is the same as maxItems value

v5: - itemize reg, clocks and interrupts properties' descriptions
    - there is no "vp" reg-name, only "wb" for write back

v6: - Add Reviewed-by: from Rob Herring <robh@kernel.org> and
      Benoit Parrot <bparrot@ti.com>

v7: no change

v8: no change

Signed-off-by: Jyri Sarha <jsarha@ti.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 .../bindings/display/ti/ti,j721e-dss.yaml     | 208 ++++++++++++++++++
 1 file changed, 208 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml

diff --git a/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
new file mode 100644
index 000000000000..ade9b2f513f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
@@ -0,0 +1,208 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 Texas Instruments Incorporated
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/display/ti/ti,j721e-dss.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Texas Instruments J721E Display Subsystem
+
+maintainers:
+  - Jyri Sarha <jsarha@ti.com>
+  - Tomi Valkeinen <tomi.valkeinen@ti.com>
+
+description: |
+  The J721E TI Keystone Display SubSystem with four output ports and
+  four video planes. There is two full video planes and two "lite
+  planes" without scaling support. The video ports can be connected to
+  the SoC's DPI pins or to integrated display bridges on the SoC.
+
+properties:
+  compatible:
+    const: ti,j721e-dss
+
+  reg:
+    items:
+      - description: common_m DSS Master common
+      - description: common_s0 DSS Shared common 0
+      - description: common_s1 DSS Shared common 1
+      - description: common_s2 DSS Shared common 2
+      - description: VIDL1 light video plane 1
+      - description: VIDL2 light video plane 2
+      - description: VID1 video plane 1
+      - description: VID1 video plane 2
+      - description: OVR1 overlay manager for vp1
+      - description: OVR2 overlay manager for vp2
+      - description: OVR3 overlay manager for vp3
+      - description: OVR4 overlay manager for vp4
+      - description: VP1 video port 1
+      - description: VP2 video port 2
+      - description: VP3 video port 3
+      - description: VP4 video port 4
+      - description: WB Write Back
+
+  reg-names:
+    items:
+      - const: common_m
+      - const: common_s0
+      - const: common_s1
+      - const: common_s2
+      - const: vidl1
+      - const: vidl2
+      - const: vid1
+      - const: vid2
+      - const: ovr1
+      - const: ovr2
+      - const: ovr3
+      - const: ovr4
+      - const: vp1
+      - const: vp2
+      - const: vp3
+      - const: vp4
+      - const: wb
+
+  clocks:
+    items:
+      - description: fck DSS functional clock
+      - description: vp1 Video Port 1 pixel clock
+      - description: vp2 Video Port 2 pixel clock
+      - description: vp3 Video Port 3 pixel clock
+      - description: vp4 Video Port 4 pixel clock
+
+  clock-names:
+    items:
+      - const: fck
+      - const: vp1
+      - const: vp2
+      - const: vp3
+      - const: vp4
+
+  interrupts:
+     items:
+      - description: common_m DSS Master common
+      - description: common_s0 DSS Shared common 0
+      - description: common_s1 DSS Shared common 1
+      - description: common_s2 DSS Shared common 2
+
+  interrupt-names:
+    items:
+      - const: common_m
+      - const: common_s0
+      - const: common_s1
+      - const: common_s2
+
+  power-domains:
+    maxItems: 1
+    description: phandle to the associated power domain
+
+  ports:
+    type: object
+    description:
+      Ports as described in Documentation/devictree/bindings/graph.txt
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      port@0:
+        type: object
+        description:
+          The output port node form video port 1
+
+      port@1:
+        type: object
+        description:
+          The output port node from video port 2
+
+      port@2:
+        type: object
+        description:
+          The output port node from video port 3
+
+      port@3:
+        type: object
+        description:
+          The output port node from video port 4
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+
+  max-memory-bandwidth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Input memory (from main memory to dispc) bandwidth limit in
+      bytes per second
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/soc/ti,sci_pm_domain.h>
+
+    dss: dss@04a00000 {
+            compatible = "ti,j721e-dss";
+            reg =   <0x00 0x04a00000 0x00 0x10000>, /* common_m */
+                    <0x00 0x04a10000 0x00 0x10000>, /* common_s0*/
+                    <0x00 0x04b00000 0x00 0x10000>, /* common_s1*/
+                    <0x00 0x04b10000 0x00 0x10000>, /* common_s2*/
+                    <0x00 0x04a20000 0x00 0x10000>, /* vidl1 */
+                    <0x00 0x04a30000 0x00 0x10000>, /* vidl2 */
+                    <0x00 0x04a50000 0x00 0x10000>, /* vid1 */
+                    <0x00 0x04a60000 0x00 0x10000>, /* vid2 */
+                    <0x00 0x04a70000 0x00 0x10000>, /* ovr1 */
+                    <0x00 0x04a90000 0x00 0x10000>, /* ovr2 */
+                    <0x00 0x04ab0000 0x00 0x10000>, /* ovr3 */
+                    <0x00 0x04ad0000 0x00 0x10000>, /* ovr4 */
+                    <0x00 0x04a80000 0x00 0x10000>, /* vp1 */
+                    <0x00 0x04aa0000 0x00 0x10000>, /* vp2 */
+                    <0x00 0x04ac0000 0x00 0x10000>, /* vp3 */
+                    <0x00 0x04ae0000 0x00 0x10000>, /* vp4 */
+                    <0x00 0x04af0000 0x00 0x10000>; /* wb */
+            reg-names = "common_m", "common_s0",
+                    "common_s1", "common_s2",
+                    "vidl1", "vidl2","vid1","vid2",
+                    "ovr1", "ovr2", "ovr3", "ovr4",
+                    "vp1", "vp2", "vp3", "vp4",
+                    "wb";
+            clocks =        <&k3_clks 152 0>,
+                            <&k3_clks 152 1>,
+                            <&k3_clks 152 4>,
+                            <&k3_clks 152 9>,
+                            <&k3_clks 152 13>;
+            clock-names = "fck", "vp1", "vp2", "vp3", "vp4";
+            power-domains = <&k3_pds 152 TI_SCI_PD_EXCLUSIVE>;
+            interrupts =    <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>,
+                            <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>,
+                            <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>,
+                            <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names =       "common_m",
+                                    "common_s0",
+                                    "common_s1",
+                                    "common_s2";
+            ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    port@0 {
+                            reg = <0>;
+
+                            dpi_out_0: endpoint {
+                                    remote-endpoint = <&dp_bridge_input>;
+                            };
+                    };
+            };
+    };
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

