Return-Path: <SRS0=sT6Z=YP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8899CCA9EA0
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 16:19:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5BAD521A4A
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 16:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571761197;
	bh=DQF9Hp8z/WVu5AKT2YcHYod3pgOyWQnl03sIJ94C5NU=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=LJEoouzQt83+lvPIxA1V1c7BOXAF2di/r8ZOx2Qc87Ws1k5SgoVM2ufHSrvOZM9r2
	 BNKlqU7Gmmfzdoyfysxs2Jqi2r9W5DZVH7lvUblP4gTkXORsjThFZ8CEE5Dly/sc5Y
	 /3RKiOprA/ASMjh2lB1s3JTAW25NTTtoC4iZ9kig=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388081AbfJVQT4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 22 Oct 2019 12:19:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:56626 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726847AbfJVQT4 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 22 Oct 2019 12:19:56 -0400
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B71C52084B;
        Tue, 22 Oct 2019 16:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571761195;
        bh=DQF9Hp8z/WVu5AKT2YcHYod3pgOyWQnl03sIJ94C5NU=;
        h=From:To:Cc:Subject:Date:From;
        b=F65+8XoNPDW2X39qA8wF0MIRpBQr6j0BW5Ekl2E4OgyyWNfxpzkcf+n1kXtTC5j86
         ZrfXRkbxRUXY9A2H5FQl+PxnUtc874PjDrHu/fJ3fLujQNvGYl/cEQOEVKpr0jlA2w
         GvSbpPGOSjmwYRjxSUlAt8+4KefaSXJU6l2HVWRw=
From:   Maxime Ripard <mripard@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Subject: [PATCH] dt-bindings: usb: Convert Allwinner A10 mUSB controller to a schema
Date:   Tue, 22 Oct 2019 18:19:51 +0200
Message-Id: <20191022161951.43567-1-mripard@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The Allwinner SoCs have an mUSB controller that is supported in Linux, with
a matching Device Tree binding.

Now that we have the DT validation in place, let's convert the device tree
bindings for that controller over to a YAML schemas.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 .../bindings/usb/allwinner,sun4i-a10-musb.txt |  28 -----
 .../usb/allwinner,sun4i-a10-musb.yaml         | 101 ++++++++++++++++++
 2 files changed, 101 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.txt
 create mode 100644 Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml

diff --git a/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.txt b/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.txt
deleted file mode 100644
index 50abb20fe319..000000000000
--- a/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-Allwinner sun4i A10 musb DRC/OTG controller
--------------------------------------------
-
-Required properties:
- - compatible      : "allwinner,sun4i-a10-musb", "allwinner,sun6i-a31-musb",
-                     "allwinner,sun8i-a33-musb" or "allwinner,sun8i-h3-musb"
- - reg             : mmio address range of the musb controller
- - clocks          : clock specifier for the musb controller ahb gate clock
- - reset           : reset specifier for the ahb reset (A31 and newer only)
- - interrupts      : interrupt to which the musb controller is connected
- - interrupt-names : must be "mc"
- - phys            : phy specifier for the otg phy
- - phy-names       : must be "usb"
- - dr_mode         : Dual-Role mode must be "host" or "otg"
- - extcon          : extcon specifier for the otg phy
-
-Example:
-
-	usb_otg: usb@1c13000 {
-		compatible = "allwinner,sun4i-a10-musb";
-		reg = <0x01c13000 0x0400>;
-		clocks = <&ahb_gates 0>;
-		interrupts = <38>;
-		interrupt-names = "mc";
-		phys = <&usbphy 0>;
-		phy-names = "usb";
-		extcon = <&usbphy 0>;
-	};
diff --git a/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml b/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
new file mode 100644
index 000000000000..81d0189ed5c8
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/allwinner,sun4i-a10-musb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A10 mUSB OTG Controller Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <maxime.ripard@bootlin.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: allwinner,sun4i-a10-musb
+      - const: allwinner,sun6i-a31-musb
+      - const: allwinner,sun8i-a33-musb
+      - items:
+          - const: allwinner,sun8i-a83t-musb
+          - const: allwinner,sun8i-a33-musb
+      - const: allwinner,sun8i-h3-musb
+      - items:
+          - const: allwinner,sun50i-h6-musb
+          - const: allwinner,sun8i-a33-musb
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    const: mc
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  phys:
+    description: PHY specifier for the OTG PHY
+
+  phy-names:
+    const: usb
+
+  extcon:
+    description: Extcon specifier for the OTG PHY
+
+  dr_mode:
+    enum:
+      - host
+      - otg
+      - peripheral
+
+  allwinner,sram:
+    description: Phandle to the device SRAM
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - phys
+  - phy-names
+  - dr_mode
+  - extcon
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - allwinner,sun6i-a31-musb
+          - allwinner,sun8i-a33-musb
+          - allwinner,sun8i-h3-musb
+
+then:
+  required:
+    - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    usb_otg: usb@1c13000 {
+      compatible = "allwinner,sun4i-a10-musb";
+      reg = <0x01c13000 0x0400>;
+      clocks = <&ahb_gates 0>;
+      interrupts = <38>;
+      interrupt-names = "mc";
+      phys = <&usbphy 0>;
+      phy-names = "usb";
+      extcon = <&usbphy 0>;
+      dr_mode = "peripheral";
+    };
+
+...
-- 
2.23.0

