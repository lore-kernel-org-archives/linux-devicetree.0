Return-Path: <SRS0=2ZKK=7K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3989C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 20:49:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B44D5208A7
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 20:49:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kynetics-com.20150623.gappssmtp.com header.i=@kynetics-com.20150623.gappssmtp.com header.b="YIYCtIqH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407343AbgE1UtD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 May 2020 16:49:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407391AbgE1UtB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 May 2020 16:49:01 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BB45C08C5CA
        for <devicetree@vger.kernel.org>; Thu, 28 May 2020 13:49:00 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id l11so830925wru.0
        for <devicetree@vger.kernel.org>; Thu, 28 May 2020 13:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynetics-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9NI5oITF3sur5up7exzC9ZwtSgcG5SfGWcxVBeWbrEk=;
        b=YIYCtIqHdfGvz+bp/GYBuOno2ziXPiDMbn/A2C6efWe0GlUnF3/yB6gC75n4H+TEJH
         axNE8iiu3suwzy791TcLkaM4wUDEz1LOGM7dmc+v/zsdWR4YPaRQdPYdidQ14Q0cdOxP
         fXRBtTCDtBGuK4Hz7vv1O2xtn3SbCUSZfJcLtNobdcb5vlK8fsK582Glx9sw1PjrSXTR
         YDYGjlBK0VSYqTIIsOM3qTh0NIJloBX0drnL2sMfJiDfa5HaxmaZk099HsR5ykIuDl3t
         3r/xBUa6SkAi9773WuXIXGpr3oja8O5oAoZrkzgZ5PLRP563+zeipN3A+Dzb4T3LCOPO
         V3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9NI5oITF3sur5up7exzC9ZwtSgcG5SfGWcxVBeWbrEk=;
        b=AqHrgrcOJVTYrGVR8/lrH6GrpAoQItozB00tv4MHtobgfZl1qeieDWokjTyKeeSFKN
         0iY1vaa0s3Z6t4CMk5uJKxKWFb7QSB0YGBzs9VOsxc15TUCGcBE/KBprMtllZeFvDQvv
         imnJoI9Y2eJl4jZ/1fhO1VyBS+qzFOM0kCOOqcYmY1+pZa3bDmksbNRQTd8VsHGyGcsJ
         nhiASzi3MWUvORlc6zrEyQ2z7BJAKkc5QiIb/yTG8MhG+KcYahew5QZAzzpU96CjGXrc
         uBlIvmTFF6MNulLGYjOx8eS3x2dpWrN9z0wt9uxWLRvZa/QxmfOVZ1DqP5o9HDUkxyVY
         tNaA==
X-Gm-Message-State: AOAM532+307pQ9KspJ0Yx/3p2vZ9VSSiE2v2eeytWyfN7U/pvbvK6rKd
        im7cvNCatAGYajnsYWzCo5ar1A==
X-Google-Smtp-Source: ABdhPJz/iGMq6FoO6oFdT/+8B+caaHgzgf4nNbD2c5b9TxzV8Ex09SkSVsjO3fDnHZCj/9mURqHdFA==
X-Received: by 2002:adf:f790:: with SMTP id q16mr5260464wrp.399.1590698939287;
        Thu, 28 May 2020 13:48:59 -0700 (PDT)
Received: from localhost.lan (mob-2-41-210-190.net.vodafone.it. [2.41.210.190])
        by smtp.gmail.com with ESMTPSA id a15sm7632782wra.86.2020.05.28.13.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 13:48:58 -0700 (PDT)
From:   Diego Rondini <diego.rondini@kynetics.com>
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        Diego Rondini <diego.rondini@kynetics.com>
Subject: [PATCH 2/2] ARM: dts: orange-pi-zero-plus2: add leds configuration
Date:   Thu, 28 May 2020 22:47:12 +0200
Message-Id: <20200528204712.552964-2-diego.rondini@kynetics.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200528204712.552964-1-diego.rondini@kynetics.com>
References: <20200528204712.552964-1-diego.rondini@kynetics.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add pwr and status leds configuration and turn on pwr led by default for Orange
Pi Zero Plus 2 (both H3 and H5 variants).

Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
---
 .../boot/dts/sun8i-h3-orangepi-zero-plus2.dts    | 16 ++++++++++++++++
 .../allwinner/sun50i-h5-orangepi-zero-plus2.dts  | 16 ++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-zero-plus2.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-zero-plus2.dts
index 4376767699a47..4cd0ac706bd2c 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-zero-plus2.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-zero-plus2.dts
@@ -82,6 +82,22 @@ wifi_pwrseq: wifi_pwrseq {
 		reset-gpios = <&pio 0 9 GPIO_ACTIVE_LOW>; /* PA9 */
 		post-power-on-delay-ms = <200>;
 	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		pwr_led {
+			label = "orangepi:green:pwr";
+			gpios = <&r_pio 0 10 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+
+		status_led {
+			label = "orangepi:red:status";
+			gpios = <&pio 0 17 GPIO_ACTIVE_HIGH>;
+		};
+
+	};
 };
 
 &de {
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
index d8192a7483e9e..517d53e1b0ff1 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
@@ -42,6 +42,22 @@ wifi_pwrseq: wifi_pwrseq {
 		reset-gpios = <&pio 0 9 GPIO_ACTIVE_LOW>; /* PA9 */
 		post-power-on-delay-ms = <200>;
 	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		pwr_led {
+			label = "orangepi:green:pwr";
+			gpios = <&r_pio 0 10 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+
+		status_led {
+			label = "orangepi:red:status";
+			gpios = <&pio 0 17 GPIO_ACTIVE_HIGH>;
+		};
+
+	};
 };
 
 &de {
-- 
2.25.4

