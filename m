Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AEEFC2D0C4
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 09:36:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D5A6E2077B
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 09:36:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="ebc4BVy1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JM++kkpq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727510AbfLIJgG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Dec 2019 04:36:06 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:49187 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727501AbfLIJgG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Dec 2019 04:36:06 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id AF1DD5F7C;
        Mon,  9 Dec 2019 04:36:04 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 09 Dec 2019 04:36:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=Jh8NtE/kdWCNk
        PnIe2/VhCIXHHqhZ+e1urdP1oG1D9Q=; b=ebc4BVy1DXViVZHWJsyxPe/RL9v46
        1phStb/x4Bym5ZQGIWageJyMhlUH6RKujl+CshDCLRrApaK6rsGALMq7J9cVIIZR
        2VeT9GYLivgw03DS11Chmg8YtYAzyiuIhV8Whg3aYBM7+u/6MqVyMV26YNJGx1Dq
        LF/3iYX26M9tN+/YsvTRCeSgKkWNn676Ge+9oMY1r0Rqm7XSkjH7yBRQk5tfzmGu
        /1KxfXshwfAb7Z49skFjikP0Pu4WVjrqQkEH+zMUjfB9vEB44z4YDDcPfcQc7LtJ
        7V39aU0MEG5ayjYDYjjTfr+ZJNhHtAdrXIMrFO+pIDNO4tlaD+AT93x6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=Jh8NtE/kdWCNkPnIe2/VhCIXHHqhZ+e1urdP1oG1D9Q=; b=JM++kkpq
        i0pluyxPg4ghPDTd9xzf0ZKZV6QIMVPPiwx5i/8cZo6h1+y3qpYftPXYv3FawBr+
        +DgsODOMjZxJr+DFvs7mUpKLMlinJPEDXkl2JRV1/wNXDsU1zTwCxnt3xZL2BEV4
        hT+Zd21E3ilRAwDNEdIw78kli6P/m9n6+NJqvS7ZzfVakw6/LbwDBceJetpiANT5
        f+C2xwNmk4xKlYl14si8J4itmQ48w0UyPA3jrCoTfo2tSnlnZGWoz6lPkM94so3N
        cDJVOilMJUMPjCLjcfChQgjpI0MlaS77OLd7r7wI8xZEf1XGDuoTxZdxP44YOBW+
        zPcQzws05QmduA==
X-ME-Sender: <xms:hBXuXS6orOA7UtxGhrxrB4ao4APGLCabkGqBhonLAcIStwjKtF4buA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeltddgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    govehorghsthgrlhdqhfeguddvqddtvdculdduhedtmdenucfjughrpefhvffufffkofgj
    fhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrg
    igihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinhepuggvvhhitggvthhrvggv
    rdhorhhgnecukfhppeeltddrkeelrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehmrgigihhmvgestggvrhhnohdrthgvtghhnecuvehluhhsthgvrhfuihiivgepud
X-ME-Proxy: <xmx:hBXuXbMdLthlR_lCuzWOMnl4OCbh3msqGVmBxf33_hZm9XPBrbNz1w>
    <xmx:hBXuXYYxnknGJskpDz1qNq5R8XSWB5V7pxanzGBZRwOX5f1LeXibMQ>
    <xmx:hBXuXac_BnT8pesfQLpiGxtdvlNfijPJrxtWF-t3Xa-fyCWOySBeAA>
    <xmx:hBXuXYPz5r0N_5IWbbAe4nhEMIluxfnbXw1YbZg_36m9daYoczROCg>
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 4685380059;
        Mon,  9 Dec 2019 04:36:04 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 3/3] dt-bindings: clocks: Convert Allwinner A80 DE clocks to a schema
Date:   Mon,  9 Dec 2019 10:35:58 +0100
Message-Id: <20191209093558.50940-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191209093558.50940-1-maxime@cerno.tech>
References: <20191209093558.50940-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The Allwinner A80 SoC has a display clocks controller that is supported in
Linux, with a matching Device Tree binding.

Now that we have the DT validation in place, let's convert the device tree
bindings for that controller over to a YAML schemas.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../clock/allwinner,sun9i-a80-de-clks.yaml    | 67 +++++++++++++++++++
 .../devicetree/bindings/clock/sun9i-de.txt    | 28 --------
 2 files changed, 67 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/allwinner,sun9i-a80-de-clks.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/sun9i-de.txt

diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun9i-a80-de-clks.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun9i-a80-de-clks.yaml
new file mode 100644
index 000000000000..a82c7c7e942b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun9i-a80-de-clks.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: GPL-2.0+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/allwinner,sun9i-a80-de-clks.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A80 Display Engine Clock Controller Device Tree Bindings
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
+    const: allwinner,sun9i-a80-de-clks
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Bus Clock
+      - description: RAM Bus Clock
+      - description: Module Clock
+
+  clock-names:
+    items:
+      - const: mod
+      - const: dram
+      - const: bus
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
+    #include <dt-bindings/clock/sun9i-a80-ccu.h>
+    #include <dt-bindings/reset/sun9i-a80-ccu.h>
+
+    de_clocks: clock@3000000 {
+        compatible = "allwinner,sun9i-a80-de-clks";
+        reg = <0x03000000 0x30>;
+        clocks = <&ccu CLK_DE>, <&ccu CLK_SDRAM>, <&ccu CLK_BUS_DE>;
+        clock-names = "mod", "dram", "bus";
+        resets = <&ccu RST_BUS_DE>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/clock/sun9i-de.txt b/Documentation/devicetree/bindings/clock/sun9i-de.txt
deleted file mode 100644
index fb18f327b97a..000000000000
--- a/Documentation/devicetree/bindings/clock/sun9i-de.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-Allwinner A80 Display Engine Clock Control Binding
---------------------------------------------------
-
-Required properties :
-- compatible: must contain one of the following compatibles:
-		- "allwinner,sun9i-a80-de-clks"
-
-- reg: Must contain the registers base address and length
-- clocks: phandle to the clocks feeding the display engine subsystem.
-	  Three are needed:
-  - "mod": the display engine module clock
-  - "dram": the DRAM bus clock for the system
-  - "bus": the bus clock for the whole display engine subsystem
-- clock-names: Must contain the clock names described just above
-- resets: phandle to the reset control for the display engine subsystem.
-- #clock-cells : must contain 1
-- #reset-cells : must contain 1
-
-Example:
-de_clocks: clock@3000000 {
-	compatible = "allwinner,sun9i-a80-de-clks";
-	reg = <0x03000000 0x30>;
-	clocks = <&ccu CLK_DE>, <&ccu CLK_SDRAM>, <&ccu CLK_BUS_DE>;
-	clock-names = "mod", "dram", "bus";
-	resets = <&ccu RST_BUS_DE>;
-	#clock-cells = <1>;
-	#reset-cells = <1>;
-};
-- 
2.23.0

