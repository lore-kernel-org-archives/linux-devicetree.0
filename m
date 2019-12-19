Return-Path: <SRS0=R1yt=2J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B6BAC43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 08:43:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C6D2624650
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 08:43:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="ep1/B5rX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JuY9JT3Q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbfLSIni (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Dec 2019 03:43:38 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:46681 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726498AbfLSInh (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 19 Dec 2019 03:43:37 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 9FE1D22274;
        Thu, 19 Dec 2019 03:43:36 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 19 Dec 2019 03:43:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=FTto9Tv40P+Z8q6l5JjRjiu0is
        j0dkVrGrUHdja8PwE=; b=ep1/B5rXYPYDAoHvbGmrMpvc66qnm2uS/052UsDSDu
        5MAtYt9ZowmF1VuzpLYltDW/ULhtLvHN7ns6fHRtTAytSEikChls/Cz4Kt9YC0m5
        OHEsQGbyap/xY/J4WDzAJDfrDSGo+7VgdBRQHWNztv3nVc8wJKboh8fkDgxh0roW
        55Cq/Qid+8OFttL64vrU8M83xvlV8A4gZG24xzBsyqDTgOJXDNaWOddoHA3utqzw
        34l43a/FnH+wSh154rtFth0S7jsjiBxZm99RMr16Z6SouCWzR+NpcNO/SdEj/yYG
        V1CnENFHsukFdbJBupaHQGvo+v8EnaVquXw8Sa/x5kdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=FTto9Tv40P+Z8q6l5
        JjRjiu0isj0dkVrGrUHdja8PwE=; b=JuY9JT3Qbmu8FqNoW6QcIYTzn5EmjA9pk
        d5eQxvEZUrWrCMjiUs7BPCLhcpMdrT2k+iUAS7ln/ziaC+ZbU2Be4JRZ/cQiLGgb
        dnBbeQ7GNx9dpzMoZ1pZkjxk2Xch6EOglvb6vUpfgGzIhnspbabheFvaiYXgZTwZ
        ZLr5VRLwBePmjOa5h8eugeBxVVsb7SBKTkqbVMQ0e2XHA0c2IltzXWL34PA0mBPD
        1RBRYxPyTuU8PkBM5MyUMBXCEFUtwcG4J8nluDBU7PeMXFMwA8I101r/hpJc5oms
        adxKiRbTZXNM4er0lYY/1EJ2LRnwia/v5eBYHggbjIDH441vRGq8Q==
X-ME-Sender: <xms:Nzj7XQPa_g4zcvzjgiGcZZlEjMpPEM5w97nUdSjQ8spejnEUOAsg7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddutddguddvvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enogevohgrshhtrghlqdfhgeduvddqtddvucdludehtddmnecujfgurhephffvufffkffo
    ggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgi
    himhgvsegtvghrnhhordhtvggthheqnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdr
    ohhrghenucfkphepledtrdekledrieekrdejieenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:Nzj7XeBRt3Af9JrOzmT_L80J1Ib7dxjxxoKcymkrxNjq-OOihLf1Lg>
    <xmx:Nzj7XfRkUrtzLgN9bKCitiBCzJnkAEdd_LGjPKiH5uheT-mtSJhRsA>
    <xmx:Nzj7XaZAGPL2Tv67nksUTQm0SqyJSbs3Yr0c-kX0a51JGEkGShGV7w>
    <xmx:ODj7XfdJHyaJNZkshcnP-jLqDXhe4Q0vh3BG1kwLRDqdsx5UYTGemg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id DE5C130609C5;
        Thu, 19 Dec 2019 03:43:34 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     kishon@ti.com
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] dt-bindings: usb: Convert Allwinner A80 USB PHY controller to a schema
Date:   Thu, 19 Dec 2019 09:43:32 +0100
Message-Id: <20191219084332.944123-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The Allwinner A80 SoCs have a USB PHY controller that is used by Linux,
with a matching Device Tree binding.

Now that we have the DT validation in place, let's convert the device tree
bindings for that controller over to a YAML schemas.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../phy/allwinner,sun9i-a80-usb-phy.yaml      | 135 ++++++++++++++++++
 .../devicetree/bindings/phy/sun9i-usb-phy.txt |  37 -----
 2 files changed, 135 insertions(+), 37 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/allwinner,sun9i-a80-usb-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/sun9i-usb-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun9i-a80-usb-phy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun9i-a80-usb-phy.yaml
new file mode 100644
index 000000000000..ded7d6f0a119
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/allwinner,sun9i-a80-usb-phy.yaml
@@ -0,0 +1,135 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/allwinner,sun9i-a80-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A80 USB PHY Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <mripard@kernel.org>
+
+properties:
+  "#phy-cells":
+    const: 0
+
+  compatible:
+    const: allwinner,sun9i-a80-usb-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    anyOf:
+      - description: Main PHY Clock
+
+      - items:
+          - description: Main PHY clock
+          - description: HSIC 12MHz clock
+          - description: HSIC 480MHz clock
+
+  clock-names:
+    oneOf:
+      - const: phy
+
+      - items:
+          - const: phy
+          - const: hsic_12M
+          - const: hsic_480M
+
+  resets:
+    anyOf:
+      - description: Normal USB PHY reset
+
+      - items:
+          - description: Normal USB PHY reset
+          - description: HSIC Reset
+
+  reset-names:
+    oneOf:
+      - const: phy
+
+      - items:
+          - const: phy
+          - const: hsic
+
+  phy_type:
+    const: hsic
+    description:
+      When absent, the PHY type will be assumed to be normal USB.
+
+  phy-supply:
+    description:
+      Regulator that powers VBUS
+
+required:
+  - "#phy-cells"
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+
+additionalProperties: false
+
+if:
+  properties:
+    phy_type:
+      const: hsic
+
+  required:
+    - phy_type
+
+then:
+  properties:
+    clocks:
+      maxItems: 3
+
+    clock-names:
+      maxItems: 3
+
+    resets:
+      maxItems: 2
+
+    reset-names:
+      maxItems: 2
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun9i-a80-usb.h>
+    #include <dt-bindings/reset/sun9i-a80-usb.h>
+
+    usbphy1: phy@a00800 {
+        compatible = "allwinner,sun9i-a80-usb-phy";
+        reg = <0x00a00800 0x4>;
+        clocks = <&usb_clocks CLK_USB0_PHY>;
+        clock-names = "phy";
+        resets = <&usb_clocks RST_USB0_PHY>;
+        reset-names = "phy";
+        phy-supply = <&reg_usb1_vbus>;
+        #phy-cells = <0>;
+    };
+
+  - |
+    #include <dt-bindings/clock/sun9i-a80-usb.h>
+    #include <dt-bindings/reset/sun9i-a80-usb.h>
+
+    usbphy3: phy@a02800 {
+        compatible = "allwinner,sun9i-a80-usb-phy";
+        reg = <0x00a02800 0x4>;
+        clocks = <&usb_clocks CLK_USB2_PHY>,
+                 <&usb_clocks CLK_USB_HSIC>,
+                 <&usb_clocks CLK_USB2_HSIC>;
+        clock-names = "phy",
+                      "hsic_12M",
+                      "hsic_480M";
+        resets = <&usb_clocks RST_USB2_PHY>,
+                 <&usb_clocks RST_USB2_HSIC>;
+        reset-names = "phy",
+                      "hsic";
+        phy_type = "hsic";
+        phy-supply = <&reg_usb3_vbus>;
+        #phy-cells = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/phy/sun9i-usb-phy.txt b/Documentation/devicetree/bindings/phy/sun9i-usb-phy.txt
deleted file mode 100644
index 64f7109aea1f..000000000000
--- a/Documentation/devicetree/bindings/phy/sun9i-usb-phy.txt
+++ /dev/null
@@ -1,37 +0,0 @@
-Allwinner sun9i USB PHY
------------------------
-
-Required properties:
-- compatible : should be one of
-  * allwinner,sun9i-a80-usb-phy
-- reg : a list of offset + length pairs
-- #phy-cells : from the generic phy bindings, must be 0
-- phy_type : "hsic" for HSIC usage;
-	     other values or absence of this property indicates normal USB
-- clocks : phandle + clock specifier for the phy clocks
-- clock-names : depending on the "phy_type" property,
-  * "phy" for normal USB
-  * "hsic_480M", "hsic_12M" for HSIC
-- resets : a list of phandle + reset specifier pairs
-- reset-names : depending on the "phy_type" property,
-  * "phy" for normal USB
-  * "hsic" for HSIC
-
-Optional Properties:
-- phy-supply : from the generic phy bindings, a phandle to a regulator that
-	       provides power to VBUS.
-
-It is recommended to list all clocks and resets available.
-The driver will only use those matching the phy_type.
-
-Example:
-	usbphy1: phy@a01800 {
-		compatible = "allwinner,sun9i-a80-usb-phy";
-		reg = <0x00a01800 0x4>;
-		clocks = <&usb_phy_clk 2>, <&usb_phy_clk 10>,
-		       <&usb_phy_clk 3>;
-		clock-names = "hsic_480M", "hsic_12M", "phy";
-		resets = <&usb_phy_clk 18>, <&usb_phy_clk 19>;
-		reset-names = "hsic", "phy";
-		#phy-cells = <0>;
-	};
-- 
2.23.0

