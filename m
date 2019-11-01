Return-Path: <SRS0=9w3Z=YZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C053CC47E49
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 Nov 2019 15:05:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 97B47217D9
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 Nov 2019 15:05:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="gi3lySwP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vSEijQZm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727812AbfKAPFO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 1 Nov 2019 11:05:14 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:40319 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727555AbfKAPFO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 1 Nov 2019 11:05:14 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 07BEA6A85;
        Fri,  1 Nov 2019 11:05:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 01 Nov 2019 11:05:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=YDxjSNOMKcpTouvXVfD+yOz3Ma
        AE9Piluf+18PUN7Fg=; b=gi3lySwP/nMqMuJ9sxDDFp1fYzrQYaqL5TH0BI/hkO
        XYBNkC3+VB8yNzua5usfVTz1hoEz/zpidPtWiGVsR+J7ltBnnDzwjGTxoBf68gNp
        fTy50pQ2oN5zeRCzJcqTlQpQrDQIhQ758TskQMRb3iB86EI3Diy4JSlt4vidSyL8
        xiF680w/NEamIw2xoy7/8kO2Tm7BOhhOu1Jx+lA/Ew5umpFEFYjzjzQ+Z1IQpNHI
        TIE3aMcrcMx6wD5OWTvgn1/X3zlXzC26axjF6VG5bjAIyqJwcuEtDqZf1xyY/ZB8
        naKELbtFBWQUO8KTVzXXc44QXtj5GbU0DhlFigsT4FLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=YDxjSNOMKcpTouvXV
        fD+yOz3MaAE9Piluf+18PUN7Fg=; b=vSEijQZmhtlv9Ijiqys3BtDurrWipYFpd
        p9lByMnBqW+quQUNeG6jMIBMYKSy/8hiUJYLyjHP47tOpwvWyua+svr7lrHY+C07
        mf1YHwq3yCRze6LtPKHH80By5fGj1B33kQFD28jLpsZoQSPvqidEEQ0xT8MaOv5s
        uuqz01+bctjX0h5D1TAnAl/jHBque6gBQ2LCfATJdJKwJK2779TwC4mUEAPF10m0
        WhNnr0fpLMSvjMlCRx/vpBB2JkSFjPeqf/H4CqQs6KXte6ClOWCzui+Tk3ezxfl0
        7WKmJoDseXn6TOuwVv2kCKm8xN9lZ5w+zoQLwoAxCXAYLK7O9LaCA==
X-ME-Sender: <xms:pUm8XbUZRDYF5EFmNMhPMrpRKhS5zd9RocnQGDqULORClBQDuRs-jA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddtjedgjeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    govehorghsthgrlhdqhfeguddvqddtvdculdduhedtmdenucfjughrpefhvffufffkofgg
    gfestdekredtredttdenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrgigih
    hmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinhepuggvvhhitggvthhrvggvrdho
    rhhgnecukfhppeeltddrkeelrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghhnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:pUm8XbCHxaQS7o7SQpOikZhl4r_MQ_CMeIzqaHxipzc53LNUIbBbHg>
    <xmx:pUm8XUzuwIpLE0J33La4OK6Bga86jPSiUDlIkJNI6KkqLkQqOMzYww>
    <xmx:pUm8XQBCGOk7_07zrVNWIQyspRAFGVjRAKBsgKCQTfclcQBMhmY6PQ>
    <xmx:p0m8XWCf5n64vM_c5giyeqYgT6HpMM1MyJeD0gsX8bHO3aQ07pyQUA>
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 3569080061;
        Fri,  1 Nov 2019 11:05:09 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     gregkh@linuxfoundation.org, Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2] dt-bindings: usb: Convert Allwinner A10 mUSB controller to a schema
Date:   Fri,  1 Nov 2019 15:32:16 +0100
Message-Id: <20191101143216.260890-1-maxime@cerno.tech>
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

Changes from v1:
  - Merged compatible entries together
---
 .../bindings/usb/allwinner,sun4i-a10-musb.txt |  28 -----
 .../usb/allwinner,sun4i-a10-musb.yaml         | 100 ++++++++++++++++++
 2 files changed, 100 insertions(+), 28 deletions(-)
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
index 000000000000..0af70fc8de5a
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
@@ -0,0 +1,100 @@
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
+      - const: allwinner,sun8i-h3-musb
+      - items:
+          - enum:
+              - allwinner,sun8i-a83t-musb
+              - allwinner,sun50i-h6-musb
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

