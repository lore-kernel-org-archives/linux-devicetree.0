Return-Path: <SRS0=BDx3=4U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFBDFC3F2C6
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 09:47:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AFF9420848
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 09:47:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727585AbgCCJrz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Mar 2020 04:47:55 -0500
Received: from lucky1.263xmail.com ([211.157.147.132]:51644 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727818AbgCCJrz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Mar 2020 04:47:55 -0500
Received: from localhost (unknown [192.168.167.13])
        by lucky1.263xmail.com (Postfix) with ESMTP id 515D8A5F65;
        Tue,  3 Mar 2020 17:47:49 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from ubuntu18.lan (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P3521T140169581676288S1583228860405504_;
        Tue, 03 Mar 2020 17:47:49 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <abea5d6f4a28e19e2586b8958abad360>
X-RL-SENDER: yifeng.zhao@rock-chips.com
X-SENDER: zyf@rock-chips.com
X-LOGIN-NAME: yifeng.zhao@rock-chips.com
X-FST-TO: miquel.raynal@bootlin.com
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
From:   Yifeng Zhao <yifeng.zhao@rock-chips.com>
To:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        heiko@sntech.de, linux-rockchip@lists.infradead.org,
        Yifeng Zhao <yifeng.zhao@rock-chips.com>
Subject: [PATCH v3 2/3] dt-bindings: mtd: Describe Rockchip RK3xxx NAND flash controller
Date:   Tue,  3 Mar 2020 17:47:35 +0800
Message-Id: <20200303094736.7490-3-yifeng.zhao@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200303094736.7490-1-yifeng.zhao@rock-chips.com>
References: <20200303094736.7490-1-yifeng.zhao@rock-chips.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Documentation support for Rockchip RK3xxx NAND flash controllers

Signed-off-by: Yifeng Zhao <yifeng.zhao@rock-chips.com>
---

Changes in v3:
-change the title for the dt-bindings

Changes in v2: None

 .../bindings/mtd/rockchip,nand.yaml           | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/rockchip,nand.yaml

diff --git a/Documentation/devicetree/bindings/mtd/rockchip,nand.yaml b/Documentation/devicetree/bindings/mtd/rockchip,nand.yaml
new file mode 100644
index 000000000000..9a81f682ac01
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/rockchip,nand.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/rockchip,nand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip SoCs NAND FLASH Controller (NFC) Device Tree Bindings
+
+allOf:
+  - $ref: "nand-controller.yaml"
+
+maintainers:
+  - Yifeng Zhao <yifeng.zhao@rock-chips.com>
+
+properties:
+  "#address-cells": true
+  "#size-cells": true
+
+  compatible:
+    const: rockchip,nfc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Module Clock
+      - description: Bus Clock
+
+  clock-names:
+    items:
+      - const: clk_nfc
+      - const: clk_ahb
+
+  clock-rates:
+      maximum: 150000000
+
+  pinctrl-names: true
+
+patternProperties:
+  "^pinctrl-[0-9]+$": true
+
+  "^nand@[a-f0-9]$":
+    type: object
+    properties:
+      reg:
+        minimum: 0
+        maximum: 3
+
+      nand-ecc-step-size:
+        const: 1024
+
+      nand-ecc-strength:
+        enum: [16, 24 , 40, 60, 70]
+
+      nand-bus-width:
+        const: 8
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/rk3308-cru.h>
+    nfc: nand-controller@ff4b0000 {
+      compatible = "rockchip,nfc";
+      reg = <0x0 0xff4b0000 0x0 0x4000>;
+      interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&cru SCLK_NANDC>, <&cru HCLK_NANDC>;
+      clock-names = "clk_nfc", "clk_ahb";
+      clock-rates = <150000000>;
+      pinctrl-names = "default";
+      pinctrl-0 = <&flash_csn0 &flash_rdy &flash_ale &flash_cle
+                  &flash_wrn &flash_rdn &flash_bus8>;
+
+      #address-cells = <1>;
+      #size-cells = <0>;
+      nand@0 {
+        reg = <0>;
+        nand-ecc-mode = "hw";
+        nand-ecc-strength = <16>;
+        nand-ecc-step-size = <1024>;
+        nand-bus-width = <8>;
+      };
+    };
+
+...
-- 
2.17.1



