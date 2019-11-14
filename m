Return-Path: <SRS0=7KoJ=ZG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79463C432C3
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 Nov 2019 15:47:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4B0FC20718
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 Nov 2019 15:47:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="AjtNRjgA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbfKNPrm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 Nov 2019 10:47:42 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37858 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726516AbfKNPrm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 14 Nov 2019 10:47:42 -0500
Received: by mail-wm1-f66.google.com with SMTP id b17so6449056wmj.2
        for <devicetree@vger.kernel.org>; Thu, 14 Nov 2019 07:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FMdwb0GkjN/863eB8ydpcDF4O7vjdrP7/MP3jMy+gok=;
        b=AjtNRjgAlMo9NwMvoyE91i/RISmCP0kW2oZO3LUiDdUrCzpMG8yma/pdy6EKqplZXh
         YGwHQ4/MBxL8vl3bHK0CJsB0vo1yFA0YYtIhzhju0m91Coo7SnMSwLCH5r0nbmwiaZb+
         yLc/oJ8DRLMqsTvMhqrMZf1aBKOFOU98vaUEkjyXWN2ckJbjCKp2IVoU6Ki3gIUsgFAH
         abQ0T/dCSNuw8BZ7zwuiEypeqnwrM3zgqMlTSyAAngRYHPk5jfxgvc4lWlu0VUPpEC/b
         Z7mCpACj/apQabM0Mha7Umbnmo4eN7YzYaDXit3YJt4nexXzwBbaf4g5smXn6Bc0Rerh
         HiRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FMdwb0GkjN/863eB8ydpcDF4O7vjdrP7/MP3jMy+gok=;
        b=T54wCuwLt+fUO6FSP6JZt1ZmiE5D6C029ZKbQtP1kKqrE0jj02eKwqQeSH6tJ8lfTw
         uwUWWn+IucjoiPnIQBkEhQxV2+fi3bHNWIz7CdxR/b6KIzkbjG9VNc1TqqbZdXJfOnz5
         h3QEa29XGdRdLYdyx41p99A/nZJ20CmiEToGBEaKZvkGv6NK7NMxj4iZfUEpYjqWEh6S
         U8fT4cMm3+I+50wIfM7ZPuxklAj0uRT208W2d/bwqXRWW/eTIsEqUFs4cVo568iFGKMz
         LjQs4HXwTVLVNIEnhHkAlOkg7ZzxXltY3rTjX135xsk5hTy3CRdA7MdB8F8mPosG/BK4
         ldyA==
X-Gm-Message-State: APjAAAUmKU2pe9bT+aUm9pvwSySKIzJ4t8vTcsUUNlBYIKt6P4PqFHOT
        rvfN+B8EwZW/OAsVhbZibBSgbA==
X-Google-Smtp-Source: APXvYqxqX2fAfGozzDH9BZRJk9u9wwr6e1Y5LVZg92H6oDy/60I/ofmvxOf/13b2qzXGGVs+7XGM2w==
X-Received: by 2002:a1c:2342:: with SMTP id j63mr8181168wmj.56.1573746460880;
        Thu, 14 Nov 2019 07:47:40 -0800 (PST)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id l4sm6428629wml.33.2019.11.14.07.47.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 14 Nov 2019 07:47:40 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     mark.rutland@arm.com, mripard@kernel.org, robh+dt@kernel.org,
        wens@csie.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v5 1/2] ARM64: dts: sun50i-h6-pine-h64: state that the DT supports the modelA
Date:   Thu, 14 Nov 2019 15:47:32 +0000
Message-Id: <1573746453-5123-2-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573746453-5123-1-git-send-email-clabbe@baylibre.com>
References: <1573746453-5123-1-git-send-email-clabbe@baylibre.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The current sun50i-h6-pine-h64 DT does not specify which model (A or B)
it supports.
When this file was created, only modelA was existing, but now both model
exists and with the time, this DT drifted to support the model B since it is
the most common one.
Furtheremore, some part of the model A does not work with it like ethernet and
HDMI connector (as confirmed by Jernej on IRC).

So it is time to settle the issue, and the easiest way was to state that
this DT is for model B.
Easiest since only a small name changes is required.
Doing the opposite (stating this file is for model A) will add changes (for
ethernet and HDMI) and so, will break too many setup.

But as asked by the maintainer this patch state this file is for model A.
In the process this patch adds the missing compoments to made it work on
model A.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 .../devicetree/bindings/arm/sunxi.yaml          |  2 +-
 .../boot/dts/allwinner/sun50i-h6-pine-h64.dts   | 17 ++++++++++++++---
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 8a1e38a1d7ab..a02baa374adc 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -599,7 +599,7 @@ properties:
           - const: pine64,pine64-plus
           - const: allwinner,sun50i-a64
 
-      - description: Pine64 PineH64
+      - description: Pine64 PineH64 model A
         items:
           - const: pine64,pine-h64
           - const: allwinner,sun50i-h6
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
index 74899ede00fb..4fcda71f1688 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
@@ -10,7 +10,7 @@
 #include <dt-bindings/gpio/gpio.h>
 
 / {
-	model = "Pine H64";
+	model = "Pine H64 model A";
 	compatible = "pine64,pine-h64", "allwinner,sun50i-h6";
 
 	aliases {
@@ -22,9 +22,10 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	connector {
+	hdmi_connector: connector {
 		compatible = "hdmi-connector";
 		type = "a";
+		ddc-en-gpios = <&pio 7 2 GPIO_ACTIVE_HIGH>; /* PH2 */
 
 		port {
 			hdmi_con_in: endpoint {
@@ -52,6 +53,16 @@
 		};
 	};
 
+	reg_gmac_3v3: gmac-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-gmac-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us = <100000>;
+		gpio = <&pio 2 16 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	reg_usb_vbus: vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "usb-vbus";
@@ -68,7 +79,7 @@
 	pinctrl-0 = <&ext_rgmii_pins>;
 	phy-mode = "rgmii";
 	phy-handle = <&ext_rgmii_phy>;
-	phy-supply = <&reg_aldo2>;
+	phy-supply = <&reg_gmac_3v3>;
 	allwinner,rx-delay-ps = <200>;
 	allwinner,tx-delay-ps = <200>;
 	status = "okay";
-- 
2.23.0

