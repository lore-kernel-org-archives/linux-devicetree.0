Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5695C43603
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 09:32:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 897B42075B
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 09:32:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="LNYFzsgg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YxJK44y8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbfLIJc4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Dec 2019 04:32:56 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:44417 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727299AbfLIJc4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Dec 2019 04:32:56 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 9AC8222788;
        Mon,  9 Dec 2019 04:32:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 09 Dec 2019 04:32:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=QuUJ41Gws/3C9/zblvje8nu6dO
        iRmYHvnK83utZ89ck=; b=LNYFzsggjBRIkj1GRKZwq0SUbPgxSs1Hep7qVx/FlY
        bTA+0uLr2shibzciIc2qhVdVVXDCzoS6DCtONt4wEH0t4VSQSKPhskHY9HkjlYZH
        tTSZ6AG24JJIRPH6McG6hFsLrqoOYgy7YwU5GQBJK+mxiFSZal5yWlKNLYFwB9WI
        L5ZGNKuV+HAzmnC7ZpXM58GukvzbzFVYju+MVu3Neq0oJifnnVeC49BwYMgpwZ0W
        c+L+9k/Ym6+Snbl0PFTMfilXbgBmdPp9zurlgrG11BWp8iAl1vi99pRPGmFXqRgI
        UTd06BNUieDrRu3ghPtdzEKibMpiJ5/3rsZUUMo9mmMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=QuUJ41Gws/3C9/zbl
        vje8nu6dOiRmYHvnK83utZ89ck=; b=YxJK44y8wezRBkjJGIAqOFVyuLRDrI6Fu
        3e87MxJaZ8DAD1J5IZxpcArnMcuhFlcjv3Dstg7c071e7Z2Y+6L0se47/JxNfo6J
        Z3GBpAoQRg+OMmNi0ogGck6pCAGt9KExm7R3it9Bn45YDy+Xh04jWTZd9AAd14oH
        3R/f1epPp1dNEyr9T/M02nWB9DFh0i7I6xG416nqKNOik9MuN8yxEHHfUKn8CaDL
        bZQaTzAC2uBLfxGd4X/eNZppmqtHrA5O298g845n1xgCzFaJUdhuyIG8C3Rnx1QB
        Lu0kLnoXtFppjFSGLYoT5RhdMD3VA5konfrB4drofKlMWzb5HaKDA==
X-ME-Sender: <xms:xRTuXa0aKO3eotYMCA7TDsvQZGPD-w0d_WTq_ijlL0m7hfik1bsCHA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeltddgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcu
    tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuffhomhgrihhnpe
    guvghvihgtvghtrhgvvgdrohhrghenucfkphepledtrdekledrieekrdejieenucfrrghr
    rghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthhenucevlhhush
    htvghrufhiiigvpedt
X-ME-Proxy: <xmx:xRTuXSE0nGxgRyhB1wJ0sXFvxpMO3B6BfB2YWwK86H5a--wniXsJUw>
    <xmx:xRTuXawlmn4dD1CgjKWSehQCH65YMn0_e-2h4FaV8CkHX8ggIHQyGw>
    <xmx:xRTuXZrmDdX16tkLsqviu7sTmxXyomJrftsvLtZML962yFgy1spBMA>
    <xmx:xRTuXXJOWYyHwshm0n2WxHg-IOWGoluQ-kB-qBsk7QMMSe9ta_EhCw>
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 8AD7280061;
        Mon,  9 Dec 2019 04:32:52 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
        devicetree@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] dt-bindings: Change maintainer address
Date:   Mon,  9 Dec 2019 10:32:48 +0100
Message-Id: <20191209093248.50454-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

While my email address has changed for a while, all the schemas I
contributed still have the old one unfortunately. Update it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml                | 2 +-
 .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml       | 2 +-
 .../devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml        | 2 +-
 .../devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml      | 2 +-
 .../devicetree/bindings/crypto/allwinner,sun4i-a10-crypto.yaml  | 2 +-
 .../bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml          | 2 +-
 .../devicetree/bindings/display/panel/ronbo,rb070d30.yaml       | 2 +-
 .../devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml        | 2 +-
 .../devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml       | 2 +-
 .../devicetree/bindings/dma/allwinner,sun6i-a31-dma.yaml        | 2 +-
 .../devicetree/bindings/i2c/allwinner,sun6i-a31-p2wi.yaml       | 2 +-
 .../devicetree/bindings/iio/adc/allwinner,sun8i-a33-ths.yaml    | 2 +-
 .../bindings/input/allwinner,sun4i-a10-lradc-keys.yaml          | 2 +-
 .../bindings/interrupt-controller/allwinner,sun4i-a10-ic.yaml   | 2 +-
 .../interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml        | 2 +-
 .../devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml      | 2 +-
 .../devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml       | 2 +-
 .../devicetree/bindings/mfd/allwinner,sun4i-a10-ts.yaml         | 2 +-
 .../devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml        | 2 +-
 .../devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml       | 2 +-
 .../devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml       | 2 +-
 .../devicetree/bindings/net/allwinner,sun4i-a10-mdio.yaml       | 2 +-
 .../devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml       | 2 +-
 .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml      | 2 +-
 .../devicetree/bindings/net/can/allwinner,sun4i-a10-can.yaml    | 2 +-
 .../devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml      | 2 +-
 .../devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml  | 2 +-
 .../bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml           | 2 +-
 .../devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml        | 2 +-
 .../devicetree/bindings/rtc/allwinner,sun4i-a10-rtc.yaml        | 2 +-
 .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml        | 2 +-
 .../devicetree/bindings/serio/allwinner,sun4i-a10-ps2.yaml      | 2 +-
 .../devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml    | 2 +-
 .../devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml      | 2 +-
 .../devicetree/bindings/sound/allwinner,sun4i-a10-spdif.yaml    | 2 +-
 .../bindings/sound/allwinner,sun50i-a64-codec-analog.yaml       | 2 +-
 .../bindings/sound/allwinner,sun8i-a23-codec-analog.yaml        | 2 +-
 .../devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml    | 2 +-
 .../devicetree/bindings/spi/allwinner,sun4i-a10-spi.yaml        | 2 +-
 .../devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml        | 2 +-
 .../devicetree/bindings/timer/allwinner,sun4i-a10-timer.yaml    | 2 +-
 .../devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml  | 2 +-
 .../devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml       | 2 +-
 .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 2 +-
 44 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 8a1e38a1d7ab..cffe8bb0bad1 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -8,7 +8,7 @@ title: Allwinner platforms device tree bindings
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 properties:
   $nodename:
diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
index d2a872286437..f0b3d30fbb76 100644
--- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
+++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
@@ -8,7 +8,7 @@ title: Allwinner A64 Display Engine Bus Device Tree Bindings
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 properties:
   $nodename:
diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml
index be32f087c529..9fe11ceecdba 100644
--- a/Documentation/devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml
+++ b/Documentation/devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml
@@ -8,7 +8,7 @@ title: Allwinner A23 RSB Device Tree Bindings
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 properties:
   "#address-cells":
diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
index 64938fdaea55..4d382128b711 100644
--- a/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
@@ -8,7 +8,7 @@ title: Allwinner Clock Control Unit Device Tree Bindings
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 properties:
   "#clock-cells":
diff --git a/Documentation/devicetree/bindings/crypto/allwinner,sun4i-a10-crypto.yaml b/Documentation/devicetree/bindings/crypto/allwinner,sun4i-a10-crypto.yaml
index 80b3e7350a73..33c7842917f6 100644
--- a/Documentation/devicetree/bindings/crypto/allwinner,sun4i-a10-crypto.yaml
+++ b/Documentation/devicetree/bindings/crypto/allwinner,sun4i-a10-crypto.yaml
@@ -8,7 +8,7 @@ title: Allwinner A10 Security System Device Tree Bindings
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
index dafc0980c4fa..0f7074977c04 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
@@ -8,7 +8,7 @@ title: Allwinner A31 MIPI-DSI Controller Device Tree Bindings
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 properties:
   "#address-cells": true
diff --git a/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml b/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
index 0e7987f1cdb7..d67617f6f74a 100644
--- a/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Ronbo RB070D30 DSI Display Panel
 
 maintainers:
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml b/Documentation/devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml
index 15abc0f9429f..83808199657b 100644
--- a/Documentation/devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml
@@ -8,7 +8,7 @@ title: Allwinner A10 DMA Controller Device Tree Bindings
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 allOf:
   - $ref: "dma-controller.yaml#"
diff --git a/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml b/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
index 387d599522c7..9e53472be194 100644
--- a/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
@@ -8,7 +8,7 @@ title: Allwinner A64 DMA Controller Device Tree Bindings
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 allOf:
   - $ref: "dma-controller.yaml#"
diff --git a/Documentation/devicetree/bindings/dma/allwinner,sun6i-a31-dma.yaml b/Documentation/devicetree/bindings/dma/allwinner,sun6i-a31-dma.yaml
index 740b7f9b535b..c1676b96daac 100644
--- a/Documentation/devicetree/bindings/dma/allwinner,sun6i-a31-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/allwinner,sun6i-a31-dma.yaml
@@ -8,7 +8,7 @@ title: Allwinner A31 DMA Controller Device Tree Bindings
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 allOf:
   - $ref: "dma-controller.yaml#"
diff --git a/Documentation/devicetree/bindings/i2c/allwinner,sun6i-a31-p2wi.yaml b/Documentation/devicetree/bindings/i2c/allwinner,sun6i-a31-p2wi.yaml
index 9346ef6ba61b..6097e8ac46c1 100644
--- a/Documentation/devicetree/bindings/i2c/allwinner,sun6i-a31-p2wi.yaml
+++ b/Documentation/devicetree/bindings/i2c/allwinner,sun6i-a31-p2wi.yaml
@@ -8,7 +8,7 @@ title: Allwinner A31 P2WI (Push/Pull 2 Wires Interface) Device Tree Bindings
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 allOf:
   - $ref: /schemas/i2c/i2c-controller.yaml#
diff --git a/Documentation/devicetree/bindings/iio/adc/allwinner,sun8i-a33-ths.yaml b/Documentation/devicetree/bindings/iio/adc/allwinner,sun8i-a33-ths.yaml
index d74962c0f5ae..15c514b83583 100644
--- a/Documentation/devicetree/bindings/iio/adc/allwinner,sun8i-a33-ths.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/allwinner,sun8i-a33-ths.yaml
@@ -8,7 +8,7 @@ title: Allwinner A33 Thermal Sensor Device Tree Bindings
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 properties:
   "#io-channel-cells":
diff --git a/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml b/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
index b3bd8ef7fbd6..5b3b71c9c018 100644
--- a/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
+++ b/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
@@ -8,7 +8,7 @@ title: Allwinner A10 LRADC Device Tree Bindings
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun4i-a10-ic.yaml b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun4i-a10-ic.yaml
index 23a202d24e43..953d875b5e74 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun4i-a10-ic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun4i-a10-ic.yaml
@@ -8,7 +8,7 @@ title: Allwinner A10 Interrupt Controller Device Tree Bindings
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 allOf:
   - $ref: /schemas/interrupt-controller.yaml#
diff --git a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
index 8cd08cfb25be..cf09055da78b 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
@@ -8,7 +8,7 @@ title: Allwinner A20 Non-Maskable Interrupt Controller Device Tree Bindings
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 allOf:
   - $ref: /schemas/interrupt-controller.yaml#
diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
index d3e423fcb6c2..0f6374ceaa69 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
@@ -8,7 +8,7 @@ title: Allwinner A10 CMOS Sensor Interface (CSI) Device Tree Bindings
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 description: |-
   The Allwinner A10 and later has a CMOS Sensor Interface to retrieve
diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
index dea36d68cdbe..7838804700d6 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
@@ -8,7 +8,7 @@ title: Allwinner A10 Infrared Controller Device Tree Bindings
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 allOf:
   - $ref: "rc.yaml#"
diff --git a/Documentation/devicetree/bindings/mfd/allwinner,sun4i-a10-ts.yaml b/Documentation/devicetree/bindings/mfd/allwinner,sun4i-a10-ts.yaml
index 4b1a09acb98b..39afacc447b2 100644
--- a/Documentation/devicetree/bindings/mfd/allwinner,sun4i-a10-ts.yaml
+++ b/Documentation/devicetree/bindings/mfd/allwinner,sun4i-a10-ts.yaml
@@ -8,7 +8,7 @@ title: Allwinner A10 Resistive Touchscreen Controller Device Tree Bindings
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 properties:
   "#thermal-sensor-cells":
diff --git a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
index 64bca41031d5..e82c9a07b6fb 100644
--- a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
@@ -11,7 +11,7 @@ allOf:
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 properties:
   "#address-cells": true
diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index b5b3cf5b1ac2..5d3fa412aabd 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -11,7 +11,7 @@ allOf:
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 properties:
   "#address-cells": true
diff --git a/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml
index ae4796ec50a0..8d8560a67abf 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml
@@ -11,7 +11,7 @@ allOf:
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-mdio.yaml b/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-mdio.yaml
index e5562c525ed9..767193ec1d32 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-mdio.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-mdio.yaml
@@ -8,7 +8,7 @@ title: Allwinner A10 MDIO Controller Device Tree Bindings
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 allOf:
   - $ref: "mdio.yaml#"
diff --git a/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml
index f683b7104e3e..703d0d886884 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml
@@ -11,7 +11,7 @@ allOf:
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
index 11654d4b80fb..db36b4d86484 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
@@ -8,7 +8,7 @@ title: Allwinner A83t EMAC Device Tree Bindings
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/net/can/allwinner,sun4i-a10-can.yaml b/Documentation/devicetree/bindings/net/can/allwinner,sun4i-a10-can.yaml
index 770af7c46114..a95960ee3feb 100644
--- a/Documentation/devicetree/bindings/net/can/allwinner,sun4i-a10-can.yaml
+++ b/Documentation/devicetree/bindings/net/can/allwinner,sun4i-a10-can.yaml
@@ -8,7 +8,7 @@ title: Allwinner A10 CAN Controller Device Tree Bindings
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
index 659b02002a35..daf1321d76ad 100644
--- a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
+++ b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
@@ -8,7 +8,7 @@ title: Allwinner A10 Security ID Device Tree Bindings
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 allOf:
   - $ref: "nvmem.yaml#"
diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
index fa46670de299..230d74f22136 100644
--- a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
+++ b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
@@ -8,7 +8,7 @@ title: Allwinner A31 MIPI D-PHY Controller Device Tree Bindings
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 properties:
   "#phy-cells":
diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
index cd0503b6fe36..bfefd09d8c1e 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
@@ -8,7 +8,7 @@ title: Allwinner A10 Pin Controller Device Tree Bindings
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 properties:
   "#gpio-cells":
diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
index 0ac52f83a58c..4a21fe77ee1d 100644
--- a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
@@ -8,7 +8,7 @@ title: Allwinner A10 PWM Device Tree Bindings
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 properties:
   "#pwm-cells":
diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun4i-a10-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun4i-a10-rtc.yaml
index 46d69c32b89b..478b0234e8fa 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun4i-a10-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun4i-a10-rtc.yaml
@@ -11,7 +11,7 @@ allOf:
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index d7a57ec4a640..37c2a601c3fa 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -8,7 +8,7 @@ title: Allwinner A31 RTC Device Tree Bindings
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 properties:
   "#clock-cells":
diff --git a/Documentation/devicetree/bindings/serio/allwinner,sun4i-a10-ps2.yaml b/Documentation/devicetree/bindings/serio/allwinner,sun4i-a10-ps2.yaml
index ee9712f1c97d..2ecab8ed702a 100644
--- a/Documentation/devicetree/bindings/serio/allwinner,sun4i-a10-ps2.yaml
+++ b/Documentation/devicetree/bindings/serio/allwinner,sun4i-a10-ps2.yaml
@@ -8,7 +8,7 @@ title: Allwinner A10 PS2 Host Controller Device Tree Bindings
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 description:
   A20 PS2 is dual role controller (PS2 host and PS2 device). These
diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
index b8f89c7258eb..ea1d2efb2aaa 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
@@ -8,7 +8,7 @@ title: Allwinner A10 Codec Device Tree Bindings
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 properties:
   "#sound-dai-cells":
diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
index eb3992138eec..112ae00d63c1 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
@@ -8,7 +8,7 @@ title: Allwinner A10 I2S Controller Device Tree Bindings
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 properties:
   "#sound-dai-cells":
diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-spdif.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-spdif.yaml
index 38d4cede0860..444a432912bb 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-spdif.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-spdif.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Chen-Yu Tsai <wens@csie.org>
   - Liam Girdwood <lgirdwood@gmail.com>
   - Mark Brown <broonie@kernel.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 properties:
   "#sound-dai-cells":
diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun50i-a64-codec-analog.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun50i-a64-codec-analog.yaml
index f290eb72a878..3b764415c9ab 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun50i-a64-codec-analog.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun50i-a64-codec-analog.yaml
@@ -8,7 +8,7 @@ title: Allwinner A64 Analog Codec Device Tree Bindings
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun8i-a23-codec-analog.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun8i-a23-codec-analog.yaml
index 85305b4c2729..9718358826ab 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun8i-a23-codec-analog.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun8i-a23-codec-analog.yaml
@@ -8,7 +8,7 @@ title: Allwinner A23 Analog Codec Device Tree Bindings
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml
index 5e7cc05bbff1..55d28268d2f4 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml
@@ -8,7 +8,7 @@ title: Allwinner A33 Codec Device Tree Bindings
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 properties:
   "#sound-dai-cells":
diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun4i-a10-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun4i-a10-spi.yaml
index 6d1329c28170..8036499112f5 100644
--- a/Documentation/devicetree/bindings/spi/allwinner,sun4i-a10-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/allwinner,sun4i-a10-spi.yaml
@@ -11,7 +11,7 @@ allOf:
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 properties:
   "#address-cells": true
diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
index f36c46d236d7..0565dc49e449 100644
--- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
@@ -11,7 +11,7 @@ allOf:
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 properties:
   "#address-cells": true
diff --git a/Documentation/devicetree/bindings/timer/allwinner,sun4i-a10-timer.yaml b/Documentation/devicetree/bindings/timer/allwinner,sun4i-a10-timer.yaml
index 20adc1c8e9cc..23e989e09766 100644
--- a/Documentation/devicetree/bindings/timer/allwinner,sun4i-a10-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/allwinner,sun4i-a10-timer.yaml
@@ -8,7 +8,7 @@ title: Allwinner A10 Timer Device Tree Bindings
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml b/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml
index dfa0c41fd261..40fc4bcb3145 100644
--- a/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml
+++ b/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml
@@ -8,7 +8,7 @@ title: Allwinner A13 High-Speed Timer Device Tree Bindings
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml b/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
index 0af70fc8de5a..d9207bf9d894 100644
--- a/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
+++ b/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
@@ -8,7 +8,7 @@ title: Allwinner A10 mUSB OTG Controller Device Tree Bindings
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
index 3a54f58683a0..e8f226376108 100644
--- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
@@ -11,7 +11,7 @@ allOf:
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-  - Maxime Ripard <maxime.ripard@bootlin.com>
+  - Maxime Ripard <mripard@kernel.org>
 
 properties:
   compatible:
-- 
2.23.0

