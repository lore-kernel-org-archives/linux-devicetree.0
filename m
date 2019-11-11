Return-Path: <SRS0=QTuQ=ZD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE424C43331
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 Nov 2019 13:35:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 99687222D3
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 Nov 2019 13:35:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="SgFVWIHo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dpbdM4EK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbfKKNfG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 11 Nov 2019 08:35:06 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:52891 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726879AbfKKNfF (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 11 Nov 2019 08:35:05 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id C2CA35870;
        Mon, 11 Nov 2019 08:35:04 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 11 Nov 2019 08:35:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=Zlhvqxx2p0HUpT7xA2m1adLF4x
        vde1djMpIP8JqoGAM=; b=SgFVWIHo+46nyBGlApbRAW4bbl8/kepA7lWSt305Lb
        OZ6W7V/B73YwOKjJwa5xHxy65kicMqp6OD8jwbZcy1sFycgwvjAiECdxQpHtJD31
        iHGUwo3nzdmbh4IokMZ2tf2M07Yy6CEB/Sij5OujRPzcLLX2OkEcdlElL3latj8h
        GjINyshPsm2Yesm7a53qGYeSoTG/2evww86X8Ms90MpS7G5Z4bCdaWDJfQjbCFz6
        CrGpSa0KTC0hYXV1cO86Np0NJ2/JnNIg13ABm5FIbBnqYIECEsJbhoAHmbN28Y4y
        wGZtWdFgcY8VbRQ2BXt2wVfmfYRFtANksd3NcvENbwmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Zlhvqxx2p0HUpT7xA
        2m1adLF4xvde1djMpIP8JqoGAM=; b=dpbdM4EK45ekX8nrN0NCVGzrThtsxgVse
        4EHPFxexYzpoOiw0y3jeuoz/aonL5CTpx8PnigzudJ0ritdfSK1hbjFxDOthuo8c
        0+jnVSW8I6bA51gf3k72aOvjoqwvi8oQPNZGfs++WZ4LbRaPaVCsurW2Nk5Mra/m
        KLRu/aJeeYFcdaTFchDwmP2tx0TAjXkSPw9mSW1+TVQH1fJG2pq6TNoyjTndzZBh
        9dnFTkhj/K7SX/i0e6/U5jbzJK6PvADmJ/oOFVxF2SE/r/ILytn4imeMmcTbPDtZ
        Rzad4waQ9WzhjZeQTukgUu4wCoheAdYPdbYO2nUT3Bn5tQnl8yxBQ==
X-ME-Sender: <xms:h2PJXc5nd38CG7DY6KU1-CFWD6Hengay8VIqUwGmnHrEgHRqVI5y5Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddvjedgheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    govehorghsthgrlhdqhfeguddvqddtvdculdduhedtmdenucfjughrpefhvffufffkofgg
    gfestdekredtredttdenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrgigih
    hmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinhepuggvvhhitggvthhrvggvrdho
    rhhgnecukfhppeeltddrkeelrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghhnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:h2PJXQiG93aHI9v7Jh2uuECz5Y5p71HVI8zR0KNjrYULpfPj1Rk_zQ>
    <xmx:h2PJXa_vSOOqcrNejU57Jszf3oai5N_otB7IXF8Xw0xQQGrCGQ2npg>
    <xmx:h2PJXSc7P7Q8L2JfPpQ5L-LwG0DR6L1H6IPNgNE7LnyaGCJBsV1zuA>
    <xmx:iGPJXSjg2t18WyqfvS4eaHV6oU0IRkkNg6nUZX4ddQZT1U_FY2f0Wg>
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 1F69C80061;
        Mon, 11 Nov 2019 08:35:03 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>, lee.jones@linaro.org
Cc:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2] dt-bindings: Add syscon YAML description
Date:   Mon, 11 Nov 2019 14:35:00 +0100
Message-Id: <20191111133500.135306-1-maxime@cerno.tech>
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

Changes from v1:
  - Move syscon binding from misc to mfd
  - Add a select statement
---
 .../devicetree/bindings/mfd/syscon.txt        | 32 -------
 .../devicetree/bindings/mfd/syscon.yaml       | 84 +++++++++++++++++++
 .../bindings/misc/allwinner,syscon.txt        | 20 -----
 3 files changed, 84 insertions(+), 52 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/syscon.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/syscon.yaml
 delete mode 100644 Documentation/devicetree/bindings/misc/allwinner,syscon.txt

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
diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
new file mode 100644
index 000000000000..39375e4313d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/syscon.yaml#
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
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - syscon
+
+  required:
+    - compatible
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
-- 
2.23.0

