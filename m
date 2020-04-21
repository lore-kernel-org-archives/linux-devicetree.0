Return-Path: <SRS0=UCWN=6F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD46AC54FD0
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Apr 2020 16:39:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB85A206D5
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Apr 2020 16:39:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="iKHLzkFk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbgDUQju (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Apr 2020 12:39:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729276AbgDUQjs (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 21 Apr 2020 12:39:48 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E5A8C061A41
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2020 09:39:47 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id j1so11765613wrt.1
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2020 09:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8aYg5TSePWcoqfSXs3+BlnTii633OLXNYyJZUvd9dUU=;
        b=iKHLzkFk23ys6myNxfUChSt8R0nFLYD0+5cSAsdeBO5qipY5erBk9Vf/obzX5XRIsU
         05xYcD+YOtnb/gK6jPk2IG+TAnMmjn7bmxDmyS1jsL64xR2hxQRD0PuAnSrbdJkrGUY2
         A5cdDVJ2Fky9aL8HTMfK4OUWdOp7qg1V46eqprIELFhXLK8zK3dfvOCDuqMx5HRuU2em
         +rprBJyvE+uXBy64zNHYrRaYYLWgdigRQlrqTc9FP003X9bqnZQLy70gsSbS4CBLoNUY
         dlnyrEj3Ttfjv5P9awfpVKIM3nqQK3VNkjLQes6924J8QrjpqMEt8x5yBGwmQpyATJIb
         a65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8aYg5TSePWcoqfSXs3+BlnTii633OLXNYyJZUvd9dUU=;
        b=ZIO5OwVLCDF2aoa4KKCr43I7ZBASmxokfGMcHSeXb8VjmzB4jyhu1RtXvfC8F5ECRX
         1n0BZsf6AT81xaYVX7VuKBnSOs/gfPWgE1q22W1Vyqwaz2DoLh5iTuywzcJa0uOJSzXa
         dDS1MTWTZvhxpCnKkfYcWWGZWpXdbyK3P1kZiE0kWRwV0/C9AZCIG04CmLBNjt9CLwC5
         rLlq5dX3pTVrkTcLZ/ofjhQ6qqB6V1bvQkrB4l4asVmxdMUjDDtGqqLqRi63rF0wCoVA
         65ldg7/AxFoYxufJFsFnoTiKJn+UYsEXHldQcRLsz+AORnYoWNb8uuX2UJfsdDY2sfnZ
         ugpA==
X-Gm-Message-State: AGi0PuZ0wZ0Du6FICt2B/tCEsy08L/kYCP+PcRLaHpj6kqatn7MNliUR
        uccEpIcYebxWWXTn7mRUPkqHqw==
X-Google-Smtp-Source: APiQypI7PwWn5JgXE4NnYqYuMN1qx9NA+drGlVP27ZVaIy20OlB6MLxy0OpO8sZavSt8WIaOQCJsvA==
X-Received: by 2002:a5d:65d2:: with SMTP id e18mr25476538wrw.104.1587487186340;
        Tue, 21 Apr 2020 09:39:46 -0700 (PDT)
Received: from starbuck.lan (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.googlemail.com with ESMTPSA id 33sm4578513wrp.5.2020.04.21.09.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 09:39:45 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] arm64: dts: meson: libretech-pc: add initial audio playback support
Date:   Tue, 21 Apr 2020 18:39:35 +0200
Message-Id: <20200421163935.775935-7-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200421163935.775935-1-jbrunet@baylibre.com>
References: <20200421163935.775935-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add initial audio support limited to HDMI i2s.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../dts/amlogic/meson-gx-libretech-pc.dtsi    | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
index 248b018c83d5..f1dec81d347b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
@@ -8,6 +8,7 @@
 
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	adc-keys {
@@ -175,6 +176,45 @@ vddio_card: regulator-vddio-card {
 		regulator-settling-time-up-us = <200>;
 		regulator-settling-time-down-us = <50000>;
 	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "GXL-LIBRETECH-S9XX-PC";
+		assigned-clocks = <&clkc CLKID_MPLL0>,
+				  <&clkc CLKID_MPLL1>,
+				  <&clkc CLKID_MPLL2>;
+		assigned-clock-parents = <0>, <0>, <0>;
+		assigned-clock-rates = <294912000>,
+				       <270950400>,
+				       <393216000>;
+		status = "okay";
+
+		dai-link-0 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
+		};
+
+		dai-link-1 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
+			dai-format = "i2s";
+			mclk-fs = <256>;
+
+			codec-0 {
+				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
+			};
+		};
+
+		dai-link-2 {
+			sound-dai = <&aiu AIU_HDMI CTRL_OUT>;
+
+			codec-0 {
+				sound-dai = <&hdmi_tx>;
+			};
+		};
+	};
+};
+
+&aiu {
+	status = "okay";
 };
 
 &cec_AO {
-- 
2.25.2

