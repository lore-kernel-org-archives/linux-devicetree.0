Return-Path: <SRS0=zwrU=BO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 222DCC433E0
	for <linux-devicetree@archiver.kernel.org>; Tue,  4 Aug 2020 17:35:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B328207FC
	for <linux-devicetree@archiver.kernel.org>; Tue,  4 Aug 2020 17:35:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="mLUSCaU7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729388AbgHDRfO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 4 Aug 2020 13:35:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728256AbgHDRfO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 4 Aug 2020 13:35:14 -0400
X-Greylist: delayed 566 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 04 Aug 2020 10:35:13 PDT
Received: from mxwww.masterlogin.de (mxwww.masterlogin.de [IPv6:2a03:2900:1:1::b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A72DEC06174A
        for <devicetree@vger.kernel.org>; Tue,  4 Aug 2020 10:35:13 -0700 (PDT)
Received: from mxout3.routing.net (unknown [192.168.10.111])
        by forward.mxwww.masterlogin.de (Postfix) with ESMTPS id 941DF960FA;
        Tue,  4 Aug 2020 17:25:45 +0000 (UTC)
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
        by mxout3.routing.net (Postfix) with ESMTP id 6943B60476;
        Tue,  4 Aug 2020 17:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
        s=20200217; t=1596561945;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=XkgThRAVpPtz1ZWnGAEsicIAfDtuzTwIFrPq7RcJCpI=;
        b=mLUSCaU7gPOweS9dgStbxgxUFgXUH7ODucjQFoYr7L/LD4c/m8ejPmqw1gpOT4MJre639T
        gKSMKqqrf2kIY8XWVSLOtoeK+F+NbfBnYDjkuIfAUlWtqgPDcJZp4c9Jx6HnljjSc9E80l
        yooRII58twpHd4cqsz183Rgxog/W2PQ=
Received: from localhost.localdomain (fttx-pool-217.61.144.119.bambit.de [217.61.144.119])
        by mxbox3.masterlogin.de (Postfix) with ESMTPSA id DE6293603C2;
        Tue,  4 Aug 2020 17:25:44 +0000 (UTC)
From:   Frank Wunderlich <linux@fw-web.de>
To:     Rob Herring <robh@kernel.org>
Cc:     Frank Wunderlich <frank-w@public-files.de>,
        devicetree@vger.kernel.org
Subject: [RESEND PATCH v4 1/6] dt-bindings: mediatek: add mt7623 display-nodes
Date:   Tue,  4 Aug 2020 19:25:35 +0200
Message-Id: <20200804172535.75581-1-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Frank Wunderlich <frank-w@public-files.de>

mt7623 uses mt2701/mt8173 for drm, but have own compatibles

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/display/mediatek/mediatek,disp.txt    | 2 +-
 .../devicetree/bindings/display/mediatek/mediatek,dpi.txt     | 2 +-
 .../devicetree/bindings/display/mediatek/mediatek,dsi.txt     | 4 ++--
 .../devicetree/bindings/display/mediatek/mediatek,hdmi.txt    | 4 ++++
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
index b91e709db7a4..121220745d46 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
@@ -43,7 +43,7 @@ Required properties (all function blocks):
 	"mediatek,<chip>-dpi"        		- DPI controller, see mediatek,dpi.txt
 	"mediatek,<chip>-disp-mutex" 		- display mutex
 	"mediatek,<chip>-disp-od"    		- overdrive
-  the supported chips are mt2701, mt2712 and mt8173.
+  the supported chips are mt2701, mt7623, mt2712 and mt8173.
 - reg: Physical base address and length of the function block register space
 - interrupts: The interrupt signal from the function block (required, except for
   merge and split function blocks).
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
index 77def4456706..dc1ebd13cc88 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
@@ -7,7 +7,7 @@ output bus.
 
 Required properties:
 - compatible: "mediatek,<chip>-dpi"
-  the supported chips are mt2701 , mt8173 and mt8183.
+  the supported chips are mt2701, mt7623, mt8173 and mt8183.
 - reg: Physical base address and length of the controller's registers
 - interrupts: The interrupt signal from the function block.
 - clocks: device clocks
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
index 8e4729de8c85..f06f24d405a5 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
@@ -7,7 +7,7 @@ channel output.
 
 Required properties:
 - compatible: "mediatek,<chip>-dsi"
-  the supported chips are mt2701, mt8173 and mt8183.
+- the supported chips are mt2701, mt7623, mt8173 and mt8183.
 - reg: Physical base address and length of the controller's registers
 - interrupts: The interrupt signal from the function block.
 - clocks: device clocks
@@ -26,7 +26,7 @@ The MIPI TX configuration module controls the MIPI D-PHY.
 
 Required properties:
 - compatible: "mediatek,<chip>-mipi-tx"
-  the supported chips are mt2701, mt8173 and mt8183.
+- the supported chips are mt2701, 7623, mt8173 and mt8183.
 - reg: Physical base address and length of the controller's registers
 - clocks: PLL reference clock
 - clock-output-names: name of the output clock line to the DSI encoder
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
index 7b124242b0c5..6b1c586403e4 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
@@ -6,6 +6,7 @@ its parallel input.
 
 Required properties:
 - compatible: Should be "mediatek,<chip>-hdmi".
+- the supported chips are mt2701, mt7623 and mt8173
 - reg: Physical base address and length of the controller's registers
 - interrupts: The interrupt signal from the function block.
 - clocks: device clocks
@@ -32,6 +33,7 @@ The HDMI CEC controller handles hotplug detection and CEC communication.
 
 Required properties:
 - compatible: Should be "mediatek,<chip>-cec"
+- the supported chips are mt7623 and mt8173
 - reg: Physical base address and length of the controller's registers
 - interrupts: The interrupt signal from the function block.
 - clocks: device clock
@@ -44,6 +46,7 @@ The Mediatek's I2C controller is used to interface with I2C devices.
 
 Required properties:
 - compatible: Should be "mediatek,<chip>-hdmi-ddc"
+- the supported chips are mt7623 and mt8173
 - reg: Physical base address and length of the controller's registers
 - clocks: device clock
 - clock-names: Should be "ddc-i2c".
@@ -56,6 +59,7 @@ output and drives the HDMI pads.
 
 Required properties:
 - compatible: "mediatek,<chip>-hdmi-phy"
+- the supported chips are mt2701, mt7623 and mt8173
 - reg: Physical base address and length of the module's registers
 - clocks: PLL reference clock
 - clock-names: must contain "pll_ref"
-- 
2.25.1

