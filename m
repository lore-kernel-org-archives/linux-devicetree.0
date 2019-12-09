Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2526FC2BD09
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 09:36:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EC4ED207FF
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 09:36:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="m7+uskio";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fmoQxiYV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727482AbfLIJgE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Dec 2019 04:36:04 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:56837 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727497AbfLIJgE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Dec 2019 04:36:04 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id B864E5F44;
        Mon,  9 Dec 2019 04:36:02 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 09 Dec 2019 04:36:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=bzxWMms1/ys+NM2NXDJzLpEmCP
        fZtWlpnJ1KMuDPLu8=; b=m7+uskioOO4fuGEf30v/CWp/5TWSZcDFfwRsppXJUL
        ktqZjOpNc+LzXBRgvw/hYX+08f2g5K6STDlZ381TVcr28khKNTNuUx/w78DZ/uBk
        UwRBPdvqQWy4CSpA3AGkenbFOLnXPtiFvMer8jbyLZ2Hf7QwQr5e4D5ilIVupao0
        J6gXjSnoaAH1P0G+l4BNEJNtmfqtNR6Pqe4oq1+Ed2/xMNMT5S3estF7X5oKwOZu
        9Mk8RUV+fG+5ZvOHwUcqKIK9GSOeHT4WSVPP5QVfxI4GNoItWCrxuh9X2DiQnvSd
        XK5vY8F7EhycDIhXSqlrsSaJ5GWawOog9Y5tKD7uh56A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=bzxWMms1/ys+NM2NX
        DJzLpEmCPfZtWlpnJ1KMuDPLu8=; b=fmoQxiYVV2FPzGniEOgx/ixThX3mXH//p
        zgkvcCFgc2eO/aAgAuY4cFLq6E4W0V/6urpg3RTOSDSZzKCn5zklLGjJbOqNJIrA
        P2/uUHdIThHGzH71qT24aSmSi/JQI2Atz2S73m6G92kZhh3mTu/qf/75sRTEiLB1
        ch0RLPYHVOnaQ5qyuptUnO6zUb6jE3tyFrc86EO3w1CSATLiKV2It4ivTdMsMHNT
        YNGA2llyyShGPp7Q5bv93WSt+H7dsuZP7ij5eI3ZbMn456YFFjaMFwbzd118gqka
        GbDqEENW4+ioMUzFL61kn1KGay+g3PydQWgLVBpLJkYHqNm25gbbw==
X-ME-Sender: <xms:gRXuXUJ6Hbb3sc7yPxFUZZw6NBl5AzS_PtqdDxkE_90O7OWitb-smQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeltddgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    govehorghsthgrlhdqhfeguddvqddtvdculdduhedtmdenucfjughrpefhvffufffkofgg
    gfestdekredtredttdenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrgigih
    hmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinhepuggvvhhitggvthhrvggvrdho
    rhhgnecukfhppeeltddrkeelrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghhnecuvehluhhsthgvrhfuihiivgepvd
X-ME-Proxy: <xmx:gRXuXWjGywCMnpMLDjBR7Nr3wrueJQEXMOsB8r_oZoz-GRMd811g0w>
    <xmx:gRXuXWIlcEvR-9OzkgnCYQlreFgn7fTxUrznB_RVRmFscvr-ZGmiCQ>
    <xmx:gRXuXTEJLE0dIzROVZnom1vCzj3oLUaV6Cj2y2NRCydTVuTFSpRvUg>
    <xmx:ghXuXcPn7Y9fN4Kz-AZUJLP9l7pg7hLPc4I3K1oqXMfHggNhW2Nf3A>
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 0C04F80059;
        Mon,  9 Dec 2019 04:36:00 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 1/3] dt-bindings: clocks: Convert Allwinner DE2 clocks to a schema
Date:   Mon,  9 Dec 2019 10:35:56 +0100
Message-Id: <20191209093558.50940-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The newer Allwinner SoCs have a DE2 clocks controller that is supported in
Linux, with a matching Device Tree binding.

Now that we have the DT validation in place, let's convert the device tree
bindings for that controller over to a YAML schemas.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../clock/allwinner,sun8i-a83t-de2-clk.yaml   | 76 +++++++++++++++++++
 .../devicetree/bindings/clock/sun8i-de2.txt   | 34 ---------
 2 files changed, 76 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/sun8i-de2.txt

diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
new file mode 100644
index 000000000000..3f995d2b30eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: GPL-2.0+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A83t Display Engine 2/3 Clock Controller Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <mripard@kernel.org>
+
+properties:
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+  compatible:
+    oneOf:
+      - const: allwinner,sun8i-a83t-de2-clk
+      - const: allwinner,sun8i-h3-de2-clk
+      - const: allwinner,sun8i-v3s-de2-clk
+      - const: allwinner,sun50i-a64-de2-clk
+      - const: allwinner,sun50i-h5-de2-clk
+      - const: allwinner,sun50i-h6-de2-clk
+      - items:
+          - const: allwinner,sun8i-r40-de2-clk
+          - const: allwinner,sun8i-h3-de2-clk
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Bus Clock
+      - description: Module Clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: mod
+
+  resets:
+    maxItems: 1
+
+required:
+  - "#clock-cells"
+  - "#reset-cells"
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun8i-h3-ccu.h>
+    #include <dt-bindings/reset/sun8i-h3-ccu.h>
+
+    de2_clocks: clock@1000000 {
+        compatible = "allwinner,sun8i-h3-de2-clk";
+        reg = <0x01000000 0x100000>;
+        clocks = <&ccu CLK_BUS_DE>,
+                 <&ccu CLK_DE>;
+        clock-names = "bus",
+                      "mod";
+        resets = <&ccu RST_BUS_DE>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/clock/sun8i-de2.txt b/Documentation/devicetree/bindings/clock/sun8i-de2.txt
deleted file mode 100644
index 41a52c2acffd..000000000000
--- a/Documentation/devicetree/bindings/clock/sun8i-de2.txt
+++ /dev/null
@@ -1,34 +0,0 @@
-Allwinner Display Engine 2.0/3.0 Clock Control Binding
-------------------------------------------------------
-
-Required properties :
-- compatible: must contain one of the following compatibles:
-		- "allwinner,sun8i-a83t-de2-clk"
-		- "allwinner,sun8i-h3-de2-clk"
-		- "allwinner,sun8i-v3s-de2-clk"
-		- "allwinner,sun50i-a64-de2-clk"
-		- "allwinner,sun50i-h5-de2-clk"
-		- "allwinner,sun50i-h6-de3-clk"
-
-- reg: Must contain the registers base address and length
-- clocks: phandle to the clocks feeding the display engine subsystem.
-	  Three are needed:
-  - "mod": the display engine module clock (on A83T it's the DE PLL)
-  - "bus": the bus clock for the whole display engine subsystem
-- clock-names: Must contain the clock names described just above
-- resets: phandle to the reset control for the display engine subsystem.
-- #clock-cells : must contain 1
-- #reset-cells : must contain 1
-
-Example:
-de2_clocks: clock@1000000 {
-	compatible = "allwinner,sun8i-h3-de2-clk";
-	reg = <0x01000000 0x100000>;
-	clocks = <&ccu CLK_BUS_DE>,
-		 <&ccu CLK_DE>;
-	clock-names = "bus",
-		      "mod";
-	resets = <&ccu RST_BUS_DE>;
-	#clock-cells = <1>;
-	#reset-cells = <1>;
-};
-- 
2.23.0

