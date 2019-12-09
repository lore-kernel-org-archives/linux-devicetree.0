Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A8A3C2D0C2
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 09:36:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4ECC0207FD
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 09:36:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="f0hfiDUJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GWsGXNn6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727497AbfLIJgE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Dec 2019 04:36:04 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:50123 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727501AbfLIJgE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Dec 2019 04:36:04 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 2E33F5EFF;
        Mon,  9 Dec 2019 04:36:03 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 09 Dec 2019 04:36:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=BcpHtNwfeSxqb
        4i6SpcFAtJ3M6r4EJRflXVEnh25aSA=; b=f0hfiDUJPC+7kTs1Ov9o7TXmAihTL
        pGmdna4S+Z7OK4Qfag9lyxWEwT6lM6M89h6mOz/JurlzzNbkRWTVmoszDdGyvZ0e
        jyT+56ARzBzkCI5g5xOvGoaezhAx6rwotD8jiT3fiybCEjOTTkqX9MX3Bga/gdBW
        3VR7/KPPi+bE5KLpxVDhUreMle5Zg0E3u7InX72aDnQrOxFDleROkGJgAykZ7Bg8
        1Vo8ourV5rzHOEpM7VuqTkEbzK42jfKjDw+zwv0A9xQn2X5EKjGGfBZGwsh1Wp0r
        8lRo/nDx7TwTEnOpAACAsCvhVypELLNQP8lJbaLgUfr63PDHslY0VhJkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=BcpHtNwfeSxqb4i6SpcFAtJ3M6r4EJRflXVEnh25aSA=; b=GWsGXNn6
        O05bFcrzKYjTrjlrfs0iPU/GVHeFrtHvJpYHIhGXXhse9KZqzlQmJSLK/K0mZOMf
        T0pswveKssDIJkOKrhde4s7It5CTnl2BaB+QvZmhFxVBTLCX4b/h7vAwwN/WI48r
        m/udZCR/9yQbWQgCnRKKFJushXodOPiB90/X8MVsqd+EJHvIDe6PQOfbMLPetjJh
        fKHKL0mz4ukKAHHb71EpVJoh1pxVOSnjaI3X1dh+obO6xaLetQDFZnhynbAMqFHX
        jwK50i2wqdyxxaQxKoQwjA8fnxaaLk/D4WxIYCliTNt0xDmz5BRy74v3pw8PDfMe
        ZFA5yDzpSFtl1Q==
X-ME-Sender: <xms:gxXuXUmYoeNuD8uCW3uDw07Dap5BCBK5c3W0ZEWR8_PUAZEhFsYeOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeltddgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    govehorghsthgrlhdqhfeguddvqddtvdculdduhedtmdenucfjughrpefhvffufffkofgj
    fhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrg
    igihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinhepuggvvhhitggvthhrvggv
    rdhorhhgnecukfhppeeltddrkeelrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehmrgigihhmvgestggvrhhnohdrthgvtghhnecuvehluhhsthgvrhfuihiivgepud
X-ME-Proxy: <xmx:gxXuXWQnNAADJ1WQO-zq4Tvab-rldFaIeuY30qLXNTLgmQDS8g6xfg>
    <xmx:gxXuXS1jbRkyxmHVfKs1wxDnBhMbl3KPYpVkSObafG3CS2csBvHnAQ>
    <xmx:gxXuXYFZYB0JowscndHw_Qwr1Al1RgG5yKRR0sUDjSZiox_w0qY1Wg>
    <xmx:gxXuXTqWP_PFDx-biJvvUJk8jSuvc3s5Vwm4lDtRVQhjyYUq6H5SYg>
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id C094A30600D4;
        Mon,  9 Dec 2019 04:36:02 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 2/3] dt-bindings: clocks: Convert Allwinner A80 USB clocks to a schema
Date:   Mon,  9 Dec 2019 10:35:57 +0100
Message-Id: <20191209093558.50940-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191209093558.50940-1-maxime@cerno.tech>
References: <20191209093558.50940-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The Allwinner A80 SoC has a USB clocks controller that is supported in
Linux, with a matching Device Tree binding.

Now that we have the DT validation in place, let's convert the device tree
bindings for that controller over to a YAML schemas.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../clock/allwinner,sun9i-a80-usb-clocks.yaml | 59 +++++++++++++++++++
 .../devicetree/bindings/clock/sun9i-usb.txt   | 24 --------
 2 files changed, 59 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/allwinner,sun9i-a80-usb-clocks.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/sun9i-usb.txt

diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun9i-a80-usb-clocks.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun9i-a80-usb-clocks.yaml
new file mode 100644
index 000000000000..fa0ee03a527f
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun9i-a80-usb-clocks.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/allwinner,sun9i-a80-usb-clocks.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A80 USB Clock Controller Device Tree Bindings
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
+    const: allwinner,sun9i-a80-usb-clocks
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Bus Clock
+      - description: High Frequency Oscillator
+
+  clock-names:
+    items:
+      - const: bus
+      - const: hosc
+
+required:
+  - "#clock-cells"
+  - "#reset-cells"
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun9i-a80-ccu.h>
+
+    usb_clocks: clock@a08000 {
+        compatible = "allwinner,sun9i-a80-usb-clks";
+        reg = <0x00a08000 0x8>;
+        clocks = <&ccu CLK_BUS_USB>, <&osc24M>;
+        clock-names = "bus", "hosc";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/clock/sun9i-usb.txt b/Documentation/devicetree/bindings/clock/sun9i-usb.txt
deleted file mode 100644
index 3564bd4f2a20..000000000000
--- a/Documentation/devicetree/bindings/clock/sun9i-usb.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-Allwinner A80 USB Clock Control Binding
----------------------------------------
-
-Required properties :
-- compatible: must contain one of the following compatibles:
-		- "allwinner,sun9i-a80-usb-clocks"
-
-- reg: Must contain the registers base address and length
-- clocks: phandle to the clocks feeding the USB subsystem. Two are needed:
-  - "bus": the bus clock for the whole USB subsystem
-  - "hosc": the high frequency oscillator (usually at 24MHz)
-- clock-names: Must contain the clock names described just above
-- #clock-cells : must contain 1
-- #reset-cells : must contain 1
-
-Example:
-usb_clocks: clock@a08000 {
-	compatible = "allwinner,sun9i-a80-usb-clks";
-	reg = <0x00a08000 0x8>;
-	clocks = <&ccu CLK_BUS_USB>, <&osc24M>;
-	clock-names = "bus", "hosc";
-	#clock-cells = <1>;
-	#reset-cells = <1>;
-};
-- 
2.23.0

