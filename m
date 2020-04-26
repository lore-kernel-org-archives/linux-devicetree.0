Return-Path: <SRS0=vHNE=6K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9297DC55199
	for <linux-devicetree@archiver.kernel.org>; Sun, 26 Apr 2020 10:03:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E2242071C
	for <linux-devicetree@archiver.kernel.org>; Sun, 26 Apr 2020 10:03:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbgDZKDU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 26 Apr 2020 06:03:20 -0400
Received: from lucky1.263xmail.com ([211.157.147.133]:33290 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgDZKDT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 26 Apr 2020 06:03:19 -0400
Received: from localhost (unknown [192.168.167.16])
        by lucky1.263xmail.com (Postfix) with ESMTP id 66C13B1F18;
        Sun, 26 Apr 2020 18:03:08 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from ubuntu18.lan (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P19267T139854424778496S1587895377527434_;
        Sun, 26 Apr 2020 18:03:09 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <27386b14338b6a8453d62f2c607b9551>
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
Subject: [PATCH v5 1/7] dt-bindings: mtd: Describe Rockchip RK3xxx NAND flash controller
Date:   Sun, 26 Apr 2020 18:02:44 +0800
Message-Id: <20200426100250.14678-2-yifeng.zhao@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200426100250.14678-1-yifeng.zhao@rock-chips.com>
References: <20200426100250.14678-1-yifeng.zhao@rock-chips.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Documentation support for Rockchip RK3xxx NAND flash controllers

Signed-off-by: Yifeng Zhao <yifeng.zhao@rock-chips.com>
---

Changes in v5:
- Fix some wrong define
- Add boot-medium define
- Remove some compatible define

Changes in v4:
- The compatible define with rkxx_nfc
- Add assigned-clocks
- Fix some wrong define

Changes in v3:
- Change the title for the dt-bindings

Changes in v2: None

 .../mtd/rockchip,nand-controller.yaml         | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml

diff --git a/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml b/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
new file mode 100644
index 000000000000..12354c79d275
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/rockchip,nand-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip SoCs NAND FLASH Controller (NFC)
+
+allOf:
+  - $ref: "nand-controller.yaml#"
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+
+properties:
+  compatible:
+    enum:
+      - rockchip,px30_nfc
+      - rockchip,rk3xxx_nfc
+      - rockchip,rk3308_nfc
+      - rockchip,rv1108_nfc
+
+  reg:
+    minItems: 1
+
+  interrupts:
+    minItems: 1
+
+  clocks:
+    minItems: 1
+    items:
+      - description: Bus Clock
+      - description: Module Clock
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: ahb
+      - const: nfc
+
+patternProperties:
+  "^nand@[0-3]$":
+    type: object
+    properties:
+      reg:
+        minimum: 0
+        maximum: 3
+
+      nand-ecc-mode:
+        const: hw
+
+      nand-ecc-step-size:
+        const: 1024
+
+      nand-ecc-strength:
+        enum: [16,24,40,60,70]
+
+      nand-bus-width:
+        const: 8
+
+      nand-is-boot-medium: true
+
+      rockchip-boot-blks:
+        minimum: 2
+        default: 16
+        allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          For legacy devices where the bootrom can only handle 16/24 bit
+          BCH/ECC, and for some other devices where the bootrom can support
+          60/70 bit BCH/ECC.
+          In addition, when programming the loader, a linked list needs to
+          be written in oob for Bootrom to read the correct data sequence.
+          If specified it indicates the number of erase blocks in use by
+          the bootloader that need a different BCH/ECC setting.
+          Only used in combination with 'nand-is-boot-medium'.
+
+      rockchip-boot-ecc-strength:
+        enum: [16,24,40,60,70]
+        description:
+          If specified it indicates that use a different BCH/ECC setting for
+          bootrom.
+          Only used in combination with 'nand-is-boot-medium'.
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
+    #include <dt-bindings/clock/rk3308-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    nfc: nand-controller@ff4b0000 {
+      compatible = "rockchip,rk3308_nfc";
+      reg = <0x0 0xff4b0000 0x0 0x4000>;
+      interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&cru HCLK_NANDC>, <&cru SCLK_NANDC>;
+      clock-names = "ahb", "nfc";
+      assigned-clocks = <&clks SCLK_NANDC>;
+      assigned-clock-rates = <150000000>;
+
+      pinctrl-0 = <&flash_ale &flash_bus8 &flash_cle &flash_csn0
+                   &flash_rdn &flash_rdy &flash_wrn>;
+      pinctrl-names = "default";
+
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      nand@0 {
+        reg = <0>;
+        nand-bus-width = <8>;
+        nand-ecc-mode = "hw";
+        nand-ecc-strength = <16>;
+        nand-ecc-step-size = <1024>;
+        nand-is-boot-medium;
+        rockchip-boot-blks = <8>;
+        rockchip-boot-ecc-strength = <16>;
+      };
+    };
+
+...
-- 
2.17.1



