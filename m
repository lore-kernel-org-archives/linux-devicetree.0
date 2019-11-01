Return-Path: <SRS0=9w3Z=YZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBD14CA9ED1
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 Nov 2019 14:21:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5FD2F21734
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 Nov 2019 14:21:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="ED9IcbV/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="E87daGXO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbfKAOVu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 1 Nov 2019 10:21:50 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:42231 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726229AbfKAOVt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 1 Nov 2019 10:21:49 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 2D24A43B8;
        Fri,  1 Nov 2019 10:21:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 01 Nov 2019 10:21:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=/vA5rSOkS5mFShcyUSZGmOIQfH
        z63Wl99qJ40KPRpp0=; b=ED9IcbV/CCuAYb5jbwVaaubyIpibJ4qKhxhxtyGooT
        Qan8qwgxViNpJDsLUiYEDOvol4fVwEDKEh9M+u6xOjJC5O6Q1gV8SpkDmkpOA7y9
        0/IuMQZeX+C0bMx2a86w1VnBwu6nRomIObFuBkreOizn31U08lpg9Omqh32J2L1U
        6UIwUDx/fP6U9QDRcmaRf1dqxKx5lCZJKdEXXrkwjjwFFWWXJYdhkWmsyy6Y2Dt1
        DGmVEacWD0AlAx1miOl8SYSiX1w6HYq4JjE6mPdDRyEArMQ7VZw67s5CBiXG+AiN
        oAt0bhXVyoGwRAKyB646yVI7IkpdOuxRWauhlNqv7/Gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=/vA5rSOkS5mFShcyU
        SZGmOIQfHz63Wl99qJ40KPRpp0=; b=E87daGXO2wrolnfbqC/kaOW1Ra0TjzwGs
        5kedHJw0F6boaUrj/ymo3LdobVwaucwnrY5Rrsh35DV9bdDLK4keZ0oP444IhTM5
        x1iR5Apfl/MdWFUxm5Qz0ERWnDMIv8t1huhywjC3wPmUVuryWWjNWUPW8obfoKDg
        xqHLbd6zH10u4uoIzQl7gOQj8wKq9X0tk+bdqlYODIpoChIjYSTHDeXTJOGPO+Jw
        nzSEqTGhzegW9izOdRO08z4EYc3jl/smSHPrx+bWbGwnPaiSX6/Z1flhArcjWbYL
        DKBFrFMzE+6qrUaxgWQ1uySum7YWafcnJTn1KbEKwy1uA38ZLJFqw==
X-ME-Sender: <xms:ej-8XQRQQCIverQ8EW-q-X0BDRmDZsdVTUkcUjDOKhtMf7kAHSajDg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddtjedgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcu
    tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrke
    elrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhn
    ohdrthgvtghhnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:ej-8XYBHMVNIfyWkg22sdzFOJpLN9f6sK_bnI1sO6WuW-IeioS_H5Q>
    <xmx:ej-8Xfk_OolLAFWd4V9ciA2LRYNlGg6DtRIRzsHTh2PIGoJZMpznvQ>
    <xmx:ej-8XYk4-ZVcBTdA0ZPPpfC-GsY4o_zTJUPj_DVg4uSK3RFPlje5Cg>
    <xmx:ez-8Xadh2q6wON56ymqf5bzbUg3Ja_QCVQRnb4NJbhUs56mCtaPNSQ>
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id D5C2E8005C;
        Fri,  1 Nov 2019 10:21:45 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] dt-bindings: Remove FIXME in yaml bindings
Date:   Fri,  1 Nov 2019 14:58:08 +0100
Message-Id: <20191101135808.259371-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Some binding that were introduced early on got a comment to enable
additionalProperties, but we couldn't due to the generic properties being
reported as errors.

The way we're dealing with this now is to use the draft-08's
unevaluatedProperties (even though the tools doesn't do anything with it
yet).

Let's convert those old bindings to it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml   | 4 +---
 .../devicetree/bindings/i2c/allwinner,sun6i-a31-p2wi.yaml   | 4 +---
 .../devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml        | 4 +---
 .../interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml    | 4 +---
 .../devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml   | 4 +---
 .../devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml    | 6 ++----
 .../devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml   | 6 ++----
 .../devicetree/bindings/net/allwinner,sun4i-a10-mdio.yaml   | 6 ++----
 .../devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml   | 6 ++----
 .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml  | 6 ++----
 .../devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml  | 4 +---
 11 files changed, 16 insertions(+), 38 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml b/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
index 4cb9d6b93138..387d599522c7 100644
--- a/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
@@ -68,9 +68,7 @@ else:
     clocks:
       maxItems: 1
 
-# FIXME: We should set it, but it would report all the generic
-# properties as additional properties.
-# additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/i2c/allwinner,sun6i-a31-p2wi.yaml b/Documentation/devicetree/bindings/i2c/allwinner,sun6i-a31-p2wi.yaml
index f9d526b7da01..9346ef6ba61b 100644
--- a/Documentation/devicetree/bindings/i2c/allwinner,sun6i-a31-p2wi.yaml
+++ b/Documentation/devicetree/bindings/i2c/allwinner,sun6i-a31-p2wi.yaml
@@ -40,9 +40,7 @@ required:
   - clocks
   - resets
 
-# FIXME: We should set it, but it would report all the generic
-# properties as additional properties.
-# additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
index c779000515d6..2ceb05ba2df5 100644
--- a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
@@ -93,9 +93,7 @@ allOf:
       required:
         - resets
 
-# FIXME: We should set it, but it would report all the generic
-# properties as additional properties.
-# additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
index 0eccf5551786..8cd08cfb25be 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
@@ -52,9 +52,7 @@ required:
   - interrupts
   - interrupt-controller
 
-# FIXME: We should set it, but it would report all the generic
-# properties as additional properties.
-# additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
index 98c1bdde9a86..dea36d68cdbe 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
@@ -60,9 +60,7 @@ required:
   - clocks
   - clock-names
 
-# FIXME: We should set it, but it would report all the generic
-# properties as additional properties.
-# additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
index d2d4308596b8..64bca41031d5 100644
--- a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
@@ -85,6 +85,8 @@ required:
   - clocks
   - clock-names
 
+unevaluatedProperties: false
+
 examples:
   - |
     mmc0: mmc@1c0f000 {
@@ -97,8 +99,4 @@ examples:
         cd-gpios = <&pio 7 1 0>;
     };
 
-# FIXME: We should set it, but it would report all the generic
-# properties as additional properties.
-# additionalProperties: false
-
 ...
diff --git a/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml
index 792196bf4abd..ae4796ec50a0 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml
@@ -38,6 +38,8 @@ required:
   - phy-handle
   - allwinner,sram
 
+unevaluatedProperties: false
+
 examples:
   - |
     emac: ethernet@1c0b000 {
@@ -49,8 +51,4 @@ examples:
         allwinner,sram = <&emac_sram 1>;
     };
 
-# FIXME: We should set it, but it would report all the generic
-# properties as additional properties.
-# additionalProperties: false
-
 ...
diff --git a/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-mdio.yaml b/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-mdio.yaml
index df24d9d969f7..e5562c525ed9 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-mdio.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-mdio.yaml
@@ -49,6 +49,8 @@ required:
   - compatible
   - reg
 
+unevaluatedProperties: false
+
 examples:
   - |
     mdio@1c0b080 {
@@ -63,8 +65,4 @@ examples:
         };
     };
 
-# FIXME: We should set it, but it would report all the generic
-# properties as additional properties.
-# additionalProperties: false
-
 ...
diff --git a/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml
index ef446ae166f3..f683b7104e3e 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml
@@ -49,6 +49,8 @@ required:
   - clock-names
   - phy-mode
 
+unevaluatedProperties: false
+
 examples:
   - |
     gmac: ethernet@1c50000 {
@@ -61,8 +63,4 @@ examples:
         phy-mode = "mii";
     };
 
-# FIXME: We should set it, but it would report all the generic
-# properties as additional properties.
-# additionalProperties: false
-
 ...
diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
index 3fb0714e761e..11654d4b80fb 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
@@ -184,6 +184,8 @@ allOf:
             - mdio-parent-bus
             - mdio@1
 
+unevaluatedProperties: false
+
 examples:
   - |
     ethernet@1c0b000 {
@@ -314,8 +316,4 @@ examples:
         };
     };
 
-# FIXME: We should set it, but it would report all the generic
-# properties as additional properties.
-# additionalProperties: false
-
 ...
diff --git a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
index 1084e9d2917d..659b02002a35 100644
--- a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
+++ b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
@@ -31,9 +31,7 @@ required:
   - compatible
   - reg
 
-# FIXME: We should set it, but it would report all the generic
-# properties as additional properties.
-# additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.23.0

