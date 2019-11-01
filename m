Return-Path: <SRS0=9w3Z=YZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE75DCA9ECF
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 Nov 2019 14:39:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 84D44217D9
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 Nov 2019 14:39:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="Fu3RKirp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hrMDNZWx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbfKAOjB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 1 Nov 2019 10:39:01 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:54479 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727027AbfKAOjB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 1 Nov 2019 10:39:01 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id B2E936EA0;
        Fri,  1 Nov 2019 10:38:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 01 Nov 2019 10:38:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=nLHXblFEn0w6PsQb9pnCNOhicB
        izM/LlhwcXBavexy8=; b=Fu3RKirpNX+TMEFQ4wM+k78wGEVG2KTpxcVvyjbzrv
        QiM8b4aoF5rWbcV1IywxYU4yTauSJkdEBt/qCbOsRVSnDzyMwNS4b3RJOHBd56dF
        javmP/AUiE9UnCQjcPezZYKXrjHCld1Sc1qxPVVZ+wrdQFcXUYBaE+wqSqN9T/fn
        /9o43+Gp4vjKL95pv0zDvw7Vg1X2HZGE1chkZK+HQuacSlzmSH+23Luhj87kZw9Q
        JCfg1M6Awh/m2SNMdrWMY/G3nkOK3AwcUjtVBfuwmSNMVrUhIA0edBAeHNHLAPZ2
        PwQFlPckHeSmg/FdpTuNZLO2y+ZzRjLWLCnlTqoZv3rg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=nLHXblFEn0w6PsQb9
        pnCNOhicBizM/LlhwcXBavexy8=; b=hrMDNZWx2uW0GKDASAoLLxmF/xn7ZXxOA
        JUXR5fV9Tyml6j1jvnpvDaYMorjfTBskqNHDlPRkeS1bxi2ZJvbALBJXRXA2Bq37
        +U2FPrGfEdH+9g3Ghhiu9kHt1voL8Asa9OK5+hgqtAa8CtaTn9A+R4Y/ac4z5m4q
        K1GbOEeM+jaZZLSIRj+up3DSJ2H5Y32VtE5XXeGpNRZZj3/pfHPb66fuw5uBHVwd
        ICaGFz2Eesgbs5I0CUSyxOyUqBO2+8ejcp8rl+8/3CL0FkE4PmWkqJ3yH9+uibRX
        13motlBmU7z3o0QE1BFuQVvlbE+bFgNE2gnLsUsf90hvJA6hA7hCg==
X-ME-Sender: <xms:gEO8XcEuPYC_qqgPRVa5QJjK5DongDXr5B--xY54P7pN6IqIET8L0Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddtjedgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    govehorghsthgrlhdqhfeguddvqddtvdculdduhedtmdenucfjughrpefhvffufffkofgg
    gfestdekredtredttdenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrgigih
    hmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinhepuggvvhhitggvthhrvggvrdho
    rhhgnecukfhppeeltddrkeelrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghhnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:gEO8XZlDH6tp4jiukMU-B0Sf9iKHIfZ-Mzaw_QhKZOAvbPUmJ1KgKQ>
    <xmx:gEO8XRIrwrOuE3pszUOo6uUdq9MgXX_VP_bR5mbkIXxtDd-mKC0mhA>
    <xmx:gEO8XSaM9Vt0098nk9afi5LEcniGh9ZW0Glo-awYmGMC3J3ldN1oUg>
    <xmx:g0O8XWfiD29jWhiVAKoBdl8IzeErt30Kk4TTrNv_S9-SC59joW9_lQ>
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 1E4678005B;
        Fri,  1 Nov 2019 10:38:55 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     lee.jones@linaro.org, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] dt-bindings: Add syscon YAML description
Date:   Fri,  1 Nov 2019 15:10:34 +0100
Message-Id: <20191101141034.259906-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The syscon binding is a pretty loose one, with everyone having a bunch of
vendor specific compatibles.

In order to start the effort to describe them using YAML, let's create a
binding that tolerates additional, not listed, compatibles.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../devicetree/bindings/mfd/syscon.txt        | 32 --------
 .../bindings/misc/allwinner,syscon.txt        | 20 -----
 .../devicetree/bindings/misc/syscon.yaml      | 74 +++++++++++++++++++
 3 files changed, 74 insertions(+), 52 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/syscon.txt
 delete mode 100644 Documentation/devicetree/bindings/misc/allwinner,syscon.txt
 create mode 100644 Documentation/devicetree/bindings/misc/syscon.yaml

diff --git a/Documentation/devicetree/bindings/mfd/syscon.txt b/Documentation/devicetree/bindings/mfd/syscon.txt
deleted file mode 100644
index 25d9e9c2fd53..000000000000
--- a/Documentation/devicetree/bindings/mfd/syscon.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-* System Controller Registers R/W driver
-
-System controller node represents a register region containing a set
-of miscellaneous registers. The registers are not cohesive enough to
-represent as any specific type of device. The typical use-case is for
-some other node's driver, or platform-specific code, to acquire a
-reference to the syscon node (e.g. by phandle, node path, or search
-using a specific compatible value), interrogate the node (or associated
-OS driver) to determine the location of the registers, and access the
-registers directly.
-
-Required properties:
-- compatible: Should contain "syscon".
-- reg: the register region can be accessed from syscon
-
-Optional property:
-- reg-io-width: the size (in bytes) of the IO accesses that should be
-  performed on the device.
-- hwlocks: reference to a phandle of a hardware spinlock provider node.
-
-Examples:
-gpr: iomuxc-gpr@20e0000 {
-	compatible = "fsl,imx6q-iomuxc-gpr", "syscon";
-	reg = <0x020e0000 0x38>;
-	hwlocks = <&hwlock1 1>;
-};
-
-hwlock1: hwspinlock@40500000 {
-	...
-	reg = <0x40500000 0x1000>;
-	#hwlock-cells = <1>;
-};
diff --git a/Documentation/devicetree/bindings/misc/allwinner,syscon.txt b/Documentation/devicetree/bindings/misc/allwinner,syscon.txt
deleted file mode 100644
index 31494a24fe69..000000000000
--- a/Documentation/devicetree/bindings/misc/allwinner,syscon.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-* Allwinner sun8i system controller
-
-This file describes the bindings for the system controller present in
-Allwinner SoC H3, A83T and A64.
-The principal function of this syscon is to control EMAC PHY choice and
-config.
-
-Required properties for the system controller:
-- reg: address and length of the register for the device.
-- compatible: should be "syscon" and one of the following string:
-		"allwinner,sun8i-h3-system-controller"
-		"allwinner,sun8i-v3s-system-controller"
-		"allwinner,sun50i-a64-system-controller"
-		"allwinner,sun8i-a83t-system-controller"
-
-Example:
-syscon: syscon@1c00000 {
-	compatible = "allwinner,sun8i-h3-system-controller", "syscon";
-	reg = <0x01c00000 0x1000>;
-};
diff --git a/Documentation/devicetree/bindings/misc/syscon.yaml b/Documentation/devicetree/bindings/misc/syscon.yaml
new file mode 100644
index 000000000000..f2d81bed612f
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/syscon.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/syscon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: System Controller Registers R/W Device Tree Bindings
+
+description: |
+  System controller node represents a register region containing a set
+  of miscellaneous registers. The registers are not cohesive enough to
+  represent as any specific type of device. The typical use-case is
+  for some other node's driver, or platform-specific code, to acquire
+  a reference to the syscon node (e.g. by phandle, node path, or
+  search using a specific compatible value), interrogate the node (or
+  associated OS driver) to determine the location of the registers,
+  and access the registers directly.
+
+maintainers:
+  - Lee Jones <lee.jones@linaro.org>
+
+properties:
+  compatible:
+    anyOf:
+      - items:
+        - enum:
+          - allwinner,sun8i-a83t-system-controller
+          - allwinner,sun8i-h3-system-controller
+          - allwinner,sun8i-v3s-system-controller
+          - allwinner,sun50i-a64-system-controller
+
+        - const: syscon
+
+      - contains:
+          const: syscon
+        additionalItems: true
+
+  reg:
+    maxItems: 1
+
+  reg-io-width:
+    description: |
+      The size (in bytes) of the IO accesses that should be performed
+      on the device.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [ 1, 2, 4, 8 ]
+
+  hwlocks:
+    maxItems: 1
+    description:
+      Reference to a phandle of a hardware spinlock provider node.
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    syscon: syscon@1c00000 {
+        compatible = "allwinner,sun8i-h3-system-controller", "syscon";
+        reg = <0x01c00000 0x1000>;
+    };
+
+  - |
+    gpr: iomuxc-gpr@20e0000 {
+        compatible = "fsl,imx6q-iomuxc-gpr", "syscon";
+        reg = <0x020e0000 0x38>;
+        hwlocks = <&hwlock1 1>;
+    };
+
+...
-- 
2.23.0

