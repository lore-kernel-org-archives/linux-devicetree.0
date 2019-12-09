Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3190DC43603
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 09:34:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E42B620828
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 09:34:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="fT7HjQSL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="i/kS+G/+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727454AbfLIJe5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Dec 2019 04:34:57 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:49853 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727485AbfLIJe5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Dec 2019 04:34:57 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 2E7ED22863;
        Mon,  9 Dec 2019 04:34:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 09 Dec 2019 04:34:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=yTH6IxfLwKQnj
        Wesdxju2O/Lpoy9o7wfPHciAdpkLcI=; b=fT7HjQSLolmWwchRpkPTiIHtqyZ1o
        ZxkKGzE1FumtTHDTEs5GBgcSE4GzPUwfOP+u2R+Tx761yc56YcaFaFu76t4y0ZR1
        n1DA0MrAchXOa+2lyZ2hDqyT43AxTVu6QMoat8X3xE3kuuMQ8Uv9GB71o7dEkE9X
        +/soNnNJbwkqaA1R3njaURHtQafUUh0sKZRBEWgnSxsRhQyRL6lQx8i+DnqcAGdI
        SRuJdNNNHlaV4mh/nkpoVX1X/VtSjtHd8ODa3WIEAlpkpKlpc9VM7+bGelACnOcW
        /OO5BxhXeRP99tu7VBd/fgBU5cIR0uRgvVDGlY+2M6USoNs2WjGqRxO3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=yTH6IxfLwKQnjWesdxju2O/Lpoy9o7wfPHciAdpkLcI=; b=i/kS+G/+
        saXr/dJg42j/23ulqyrcfqeWIAy5NBlSKEfTH9iWaC/a51ECcb3vDWJ+bJg2dTzR
        fnr4rEF2X1nGgURnkXE6bZFldYmS7Tv+Gcib+5uRPmaInNhX4jWpD6ag588B2BFv
        rYKNmFQ7SyyGRM0JfdeZ75FqDYC1IzMKTlGqsVAlBgZ2y29Ltt5ZunOipcYzDClT
        oHImkyyLsKG7+CbHigofqicc5JfXNlPQBl3jkhcSVTBzt3Q3n0qKN+dltZQ8SZAL
        6VzP0ixuijve0IBRZt1bIaQgJKpjSo9bjshkdslxp4Qljk+WhAhrcc491ofUeZ8T
        6Xh9PvoFv0ysdw==
X-ME-Sender: <xms:PxXuXSDvmmiD_GYa3kJNBCPU0_6U7pnisDAI_Zn2vYSSVagBKgm_Vw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeltddgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuffhomhgrih
    hnpeguvghvihgtvghtrhgvvgdrohhrghenucfkphepledtrdekledrieekrdejieenucfr
    rghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthhenucevlh
    hushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:PxXuXfkm-G3rup2WVn-2d0eL4swPRwc3-FPl-nuttsKmrv1m-ByqFA>
    <xmx:PxXuXU0U1WT2e1nFUpQJYuQ0vlF70w_03kppVmMlf7ksr_VXl8ritg>
    <xmx:PxXuXecpJ53sryU-1lZbwPxdy1e-67rE5tqh1GmITrmc-JRfzQUENg>
    <xmx:PxXuXcjVPY_S7geJh9aJgJdEK6JHdmH0eh3tN7SzxBfOZCTmF0Jupg>
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id C3C1F30600D4;
        Mon,  9 Dec 2019 04:34:54 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        krzk@kernel.org, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 4/4] dt-bindings: sram: Convert Allwinner A10 system controller to a schema
Date:   Mon,  9 Dec 2019 10:34:41 +0100
Message-Id: <20191209093441.50694-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191209093441.50694-1-maxime@cerno.tech>
References: <20191209093441.50694-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The older Allwinner SoCs have a system controller that is supported in
Linux, with a matching Device Tree binding.

Now that we have the DT validation in place, let's convert the device tree
bindings for that controller over to a YAML schemas.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../allwinner,sun4i-a10-system-control.yaml   | 140 ++++++++++++++++++
 .../devicetree/bindings/sram/sunxi-sram.txt   | 113 --------------
 2 files changed, 140 insertions(+), 113 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
 delete mode 100644 Documentation/devicetree/bindings/sram/sunxi-sram.txt

diff --git a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
new file mode 100644
index 000000000000..3a368fbdff58
--- /dev/null
+++ b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
@@ -0,0 +1,140 @@
+# SPDX-License-Identifier: GPL-2.0+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sram/allwinner,sun4i-a10-system-control.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A10 System Control Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <mripard@kernel.org>
+
+description:
+  The SRAM controller found on most Allwinner devices is represented
+  by a regular node for the SRAM controller itself, with sub-nodes
+  representing the SRAM handled by the SRAM controller.
+
+properties:
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  compatible:
+    oneOf:
+      - const: allwinner,sun4i-a10-sram-controller
+        deprecated: true
+      - const: allwinner,sun4i-a10-system-control
+      - const: allwinner,sun5i-a13-system-control
+      - items:
+        - const: allwinner,sun7i-a20-system-control
+        - const: allwinner,sun4i-a10-system-control
+      - const: allwinner,sun8i-a23-system-control
+      - const: allwinner,sun8i-h3-system-control
+      - const: allwinner,sun50i-a64-sram-controller
+        deprecated: true
+      - const: allwinner,sun50i-a64-system-control
+      - const: allwinner,sun50i-h5-system-control
+      - items:
+        - const: allwinner,sun50i-h6-system-control
+        - const: allwinner,sun50i-a64-system-control
+      - items:
+        - const: allwinner,suniv-f1c100s-system-control
+        - const: allwinner,sun4i-a10-system-control
+
+  reg:
+    maxItems: 1
+
+  ranges: true
+
+patternProperties:
+  "^sram@[a-z0-9]+":
+    type: object
+
+    properties:
+      compatible:
+        const: mmio-sram
+
+    patternProperties:
+      "^sram-section?@[a-f0-9]+$":
+        type: object
+
+        compatible:
+          oneOf:
+            - const: allwinner,sun4i-a10-sram-a3-a4
+            - const: allwinner,sun4i-a10-sram-c1
+            - const: allwinner,sun4i-a10-sram-d
+            - const: allwinner,sun50i-a64-sram-c
+            - items:
+              - const: allwinner,sun5i-a13-sram-a3-a4
+              - const: allwinner,sun4i-a10-sram-a3-a4
+            - items:
+              - const: allwinner,sun7i-a20-sram-a3-a4
+              - const: allwinner,sun4i-a10-sram-a3-a4
+            - items:
+              - const: allwinner,sun5i-a13-sram-c1
+              - const: allwinner,sun4i-a10-sram-c1
+            - items:
+              - const: allwinner,sun7i-a20-sram-c1
+              - const: allwinner,sun4i-a10-sram-c1
+            - items:
+              - const: allwinner,sun8i-a23-sram-c1
+              - const: allwinner,sun4i-a10-sram-c1
+            - items:
+              - const: allwinner,sun8i-h3-sram-c1
+              - const: allwinner,sun4i-a10-sram-c1
+            - items:
+              - const: allwinner,sun50i-a64-sram-c1
+              - const: allwinner,sun4i-a10-sram-c1
+            - items:
+              - const: allwinner,sun50i-h5-sram-c1
+              - const: allwinner,sun4i-a10-sram-c1
+            - items:
+              - const: allwinner,sun50i-h6-sram-c1
+              - const: allwinner,sun4i-a10-sram-c1
+            - items:
+              - const: allwinner,sun5i-a13-sram-d
+              - const: allwinner,sun4i-a10-sram-d
+            - items:
+              - const: allwinner,sun7i-a20-sram-d
+              - const: allwinner,sun4i-a10-sram-d
+            - items:
+              - const: allwinner,suniv-f1c100s-sram-d
+              - const: allwinner,sun4i-a10-sram-d
+            - items:
+              - const: allwinner,sun50i-h6-sram-c
+              - const: allwinner,sun50i-a64-sram-c
+
+
+required:
+  - "#address-cells"
+  - "#size-cells"
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    system-control@1c00000 {
+      compatible = "allwinner,sun4i-a10-system-control";
+      reg = <0x01c00000 0x30>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+
+      sram_a: sram@00000000 {
+        compatible = "mmio-sram";
+        reg = <0x00000000 0xc000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0 0x00000000 0xc000>;
+
+        emac_sram: sram-section@8000 {
+          compatible = "allwinner,sun4i-a10-sram-a3-a4";
+          reg = <0x8000 0x4000>;
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/sram/sunxi-sram.txt b/Documentation/devicetree/bindings/sram/sunxi-sram.txt
deleted file mode 100644
index 380246a805f2..000000000000
--- a/Documentation/devicetree/bindings/sram/sunxi-sram.txt
+++ /dev/null
@@ -1,113 +0,0 @@
-Allwinnner SoC SRAM controllers
------------------------------------------------------
-
-The SRAM controller found on most Allwinner devices is represented by
-a regular node for the SRAM controller itself, with sub-nodes
-reprensenting the SRAM handled by the SRAM controller.
-
-Controller Node
----------------
-
-Required properties:
-- compatible : should be:
-    - "allwinner,sun4i-a10-sram-controller" (deprecated)
-    - "allwinner,sun4i-a10-system-control"
-    - "allwinner,sun5i-a13-system-control"
-    - "allwinner,sun7i-a20-system-control", "allwinner,sun4i-a10-system-control"
-    - "allwinner,sun8i-a23-system-control"
-    - "allwinner,sun8i-h3-system-control"
-    - "allwinner,sun50i-a64-sram-controller" (deprecated)
-    - "allwinner,sun50i-a64-system-control"
-    - "allwinner,sun50i-h5-system-control"
-    - "allwinner,sun50i-h6-system-control", "allwinner,sun50i-a64-system-control"
-    - "allwinner,suniv-f1c100s-system-control", "allwinner,sun4i-a10-system-control"
-- reg : sram controller register offset + length
-
-SRAM nodes
-----------
-
-Each SRAM is described using the mmio-sram bindings documented in
-Documentation/devicetree/bindings/sram/sram.txt
-
-Each SRAM will have SRAM sections that are going to be handled by the
-SRAM controller as subnodes. These sections are represented following
-once again the representation described in the mmio-sram binding.
-
-The valid sections compatible for A10 are:
-    - allwinner,sun4i-a10-sram-a3-a4
-    - allwinner,sun4i-a10-sram-c1
-    - allwinner,sun4i-a10-sram-d
-
-The valid sections compatible for A13 are:
-    - allwinner,sun5i-a13-sram-a3-a4, allwinner,sun4i-a10-sram-a3-a4
-    - allwinner,sun5i-a13-sram-c1, allwinner,sun4i-a10-sram-c1
-    - allwinner,sun5i-a13-sram-d, allwinner,sun4i-a10-sram-d
-
-The valid sections compatible for A20 are:
-    - allwinner,sun7i-a20-sram-a3-a4, allwinner,sun4i-a10-sram-a3-a4
-    - allwinner,sun7i-a20-sram-c1, allwinner,sun4i-a10-sram-c1
-    - allwinner,sun7i-a20-sram-d, allwinner,sun4i-a10-sram-d
-
-The valid sections compatible for A23/A33 are:
-    - allwinner,sun8i-a23-sram-c1, allwinner,sun4i-a10-sram-c1
-
-The valid sections compatible for H3 are:
-    - allwinner,sun8i-h3-sram-c1, allwinner,sun4i-a10-sram-c1
-
-The valid sections compatible for A64 are:
-    - allwinner,sun50i-a64-sram-c
-    - allwinner,sun50i-a64-sram-c1, allwinner,sun4i-a10-sram-c1
-
-The valid sections compatible for H5 are:
-    - allwinner,sun50i-h5-sram-c1, allwinner,sun4i-a10-sram-c1
-
-The valid sections compatible for H6 are:
-    - allwinner,sun50i-h6-sram-c, allwinner,sun50i-a64-sram-c
-    - allwinner,sun50i-h6-sram-c1, allwinner,sun4i-a10-sram-c1
-
-The valid sections compatible for F1C100s are:
-    - allwinner,suniv-f1c100s-sram-d, allwinner,sun4i-a10-sram-d
-
-Devices using SRAM sections
----------------------------
-
-Some devices need to request to the SRAM controller to map an SRAM for
-their exclusive use.
-
-The relationship between such a device and an SRAM section is
-expressed through the allwinner,sram property, that will take a
-phandle and an argument.
-
-This valid values for this argument are:
-  - 0: CPU
-  - 1: Device
-
-Example
--------
-system-control@1c00000 {
-	compatible = "allwinner,sun4i-a10-system-control";
-	reg = <0x01c00000 0x30>;
-	#address-cells = <1>;
-	#size-cells = <1>;
-	ranges;
-
-	sram_a: sram@00000000 {
-		compatible = "mmio-sram";
-		reg = <0x00000000 0xc000>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0 0x00000000 0xc000>;
-
-		emac_sram: sram-section@8000 {
-			compatible = "allwinner,sun4i-a10-sram-a3-a4";
-			reg = <0x8000 0x4000>;
-		};
-	};
-};
-
-emac: ethernet@1c0b000 {
-	compatible = "allwinner,sun4i-a10-emac";
-	...
-
-	allwinner,sram = <&emac_sram 1>;
-};
-- 
2.23.0

