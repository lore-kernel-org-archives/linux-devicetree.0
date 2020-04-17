Return-Path: <SRS0=b/Hz=6B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB6A3C38A2D
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Apr 2020 08:07:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4E8E20644
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Apr 2020 08:07:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729653AbgDQIHR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Apr 2020 04:07:17 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:14228 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729647AbgDQIHR (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 17 Apr 2020 04:07:17 -0400
X-IronPort-AV: E=Sophos;i="5.72,394,1580742000"; 
   d="scan'208";a="44991440"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 17 Apr 2020 17:07:14 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 50C0A41F211C;
        Fri, 17 Apr 2020 17:07:14 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     vkoul@kernel.org, robh+dt@kernel.org
Cc:     dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 2/2] dt-bindings: dma: renesas,usb-dmac: convert bindings to json-schema
Date:   Fri, 17 Apr 2020 17:07:09 +0900
Message-Id: <1587110829-26609-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587110829-26609-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1587110829-26609-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Convert Renesas R-Car USB-DMA Controller bindings documentation
to json-schema.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 .../devicetree/bindings/dma/renesas,usb-dmac.txt   |  55 -----------
 .../devicetree/bindings/dma/renesas,usb-dmac.yaml  | 102 +++++++++++++++++++++
 2 files changed, 102 insertions(+), 55 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
 create mode 100644 Documentation/devicetree/bindings/dma/renesas,usb-dmac.yaml

diff --git a/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt b/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
deleted file mode 100644
index e8f6c42..00000000
--- a/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
+++ /dev/null
@@ -1,55 +0,0 @@
-* Renesas USB DMA Controller Device Tree bindings
-
-Required Properties:
--compatible: "renesas,<soctype>-usb-dmac", "renesas,usb-dmac" as fallback.
-	Examples with soctypes are:
-	  - "renesas,r8a7743-usb-dmac" (RZ/G1M)
-	  - "renesas,r8a7744-usb-dmac" (RZ/G1N)
-	  - "renesas,r8a7745-usb-dmac" (RZ/G1E)
-	  - "renesas,r8a77470-usb-dmac" (RZ/G1C)
-	  - "renesas,r8a774a1-usb-dmac" (RZ/G2M)
-	  - "renesas,r8a774b1-usb-dmac" (RZ/G2N)
-	  - "renesas,r8a774c0-usb-dmac" (RZ/G2E)
-	  - "renesas,r8a7790-usb-dmac" (R-Car H2)
-	  - "renesas,r8a7791-usb-dmac" (R-Car M2-W)
-	  - "renesas,r8a7793-usb-dmac" (R-Car M2-N)
-	  - "renesas,r8a7794-usb-dmac" (R-Car E2)
-	  - "renesas,r8a7795-usb-dmac" (R-Car H3)
-	  - "renesas,r8a7796-usb-dmac" (R-Car M3-W)
-	  - "renesas,r8a77961-usb-dmac" (R-Car M3-W+)
-	  - "renesas,r8a77965-usb-dmac" (R-Car M3-N)
-	  - "renesas,r8a77990-usb-dmac" (R-Car E3)
-	  - "renesas,r8a77995-usb-dmac" (R-Car D3)
-- reg: base address and length of the registers block for the DMAC
-- interrupts: interrupt specifiers for the DMAC, one for each entry in
-  interrupt-names.
-- interrupt-names: one entry per channel, named "ch%u", where %u is the
-  channel number ranging from zero to the number of channels minus one.
-- clocks: a list of phandle + clock-specifier pairs.
-- #dma-cells: must be <1>, the cell specifies the channel number of the DMAC
-  port connected to the DMA client.
-- dma-channels: number of DMA channels
-
-Example: R8A7790 (R-Car H2) USB-DMACs
-
-	usb_dmac0: dma-controller@e65a0000 {
-		compatible = "renesas,r8a7790-usb-dmac", "renesas,usb-dmac";
-		reg = <0 0xe65a0000 0 0x100>;
-		interrupts = <0 109 IRQ_TYPE_LEVEL_HIGH
-			      0 109 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "ch0", "ch1";
-		clocks = <&mstp3_clks R8A7790_CLK_USBDMAC0>;
-		#dma-cells = <1>;
-		dma-channels = <2>;
-	};
-
-	usb_dmac1: dma-controller@e65b0000 {
-		compatible = "renesas,usb-dmac";
-		reg = <0 0xe65b0000 0 0x100>;
-		interrupts = <0 110 IRQ_TYPE_LEVEL_HIGH
-			      0 110 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "ch0", "ch1";
-		clocks = <&mstp3_clks R8A7790_CLK_USBDMAC1>;
-		#dma-cells = <1>;
-		dma-channels = <2>;
-	};
diff --git a/Documentation/devicetree/bindings/dma/renesas,usb-dmac.yaml b/Documentation/devicetree/bindings/dma/renesas,usb-dmac.yaml
new file mode 100644
index 00000000..9ca6d8d
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/renesas,usb-dmac.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/renesas,usb-dmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas USB DMA Controller
+
+maintainers:
+  - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
+
+allOf:
+  - $ref: "dma-controller.yaml#"
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r8a7743-usb-dmac  # RZ/G1M
+          - renesas,r8a7744-usb-dmac  # RZ/G1N
+          - renesas,r8a7745-usb-dmac  # RZ/G1E
+          - renesas,r8a77470-usb-dmac # RZ/G1C
+          - renesas,r8a774a1-usb-dmac # RZ/G2M
+          - renesas,r8a774b1-usb-dmac # RZ/G2N
+          - renesas,r8a774c0-usb-dmac # RZ/G2E
+          - renesas,r8a7790-usb-dmac  # R-Car H2
+          - renesas,r8a7791-usb-dmac  # R-Car M2-W
+          - renesas,r8a7793-usb-dmac  # R-Car M2-N
+          - renesas,r8a7794-usb-dmac  # R-Car E2
+          - renesas,r8a7795-usb-dmac  # R-Car H3
+          - renesas,r8a7796-usb-dmac  # R-Car M3-W
+          - renesas,r8a77961-usb-dmac # R-Car M3-W+
+          - renesas,r8a77965-usb-dmac # R-Car M3-N
+          - renesas,r8a77990-usb-dmac # R-Car E3
+          - renesas,r8a77995-usb-dmac # R-Car D3
+      - const: renesas,usb-dmac
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 2
+    maxItems: 2
+
+  interrupt-names:
+    items:
+      - pattern: ch0
+      - pattern: ch1
+
+  clocks:
+    maxItems: 1
+
+  '#dma-cells':
+    const: 1
+    description:
+      The cell specifies the channel number of the DMAC port connected to
+      the DMA client.
+
+  dma-channels:
+    const: 2
+
+  iommus:
+    minItems: 2
+    maxItems: 2
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - '#dma-cells'
+  - dma-channels
+  - power-domains
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a7790-cpg-mssr.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/r8a7790-sysc.h>
+
+    usb_dmac0: dma-controller@e65a0000 {
+        compatible = "renesas,r8a7790-usb-dmac", "renesas,usb-dmac";
+        reg = <0xe65a0000 0x100>;
+        interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "ch0", "ch1";
+        clocks = <&cpg CPG_MOD 330>;
+        power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+        resets = <&cpg 330>;
+        #dma-cells = <1>;
+        dma-channels = <2>;
+    };
-- 
2.7.4

