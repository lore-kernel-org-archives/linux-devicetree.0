Return-Path: <SRS0=UCWN=6F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36563C54FD0
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Apr 2020 16:40:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 12BCA206D5
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Apr 2020 16:40:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="scFSd6kR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728371AbgDUQkA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Apr 2020 12:40:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729258AbgDUQjr (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 21 Apr 2020 12:39:47 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA772C0610D5
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2020 09:39:45 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id b11so17173868wrs.6
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2020 09:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xKmLK36D5ePOofNh2z9LJJY0hW0yXIObsbFpgPZ4stA=;
        b=scFSd6kR22NbefgQCOOBhngvbiZ0c31M3dTEIx5F3Sk7pmhEHNgXb0e4EY/+qdEVZb
         LSd4lsTRzs61FMxbJXUeLO8lrgMcTLBhS4S3shrg4R3iX8mK2WsW8kWw4CAjaVV0pu+g
         JBP9z2wAGV1MAp3XFBoFkqadch7J5IaEGeMRp3yKO4kSElsCV/RmnWrlFYvZS5YYCRzZ
         RMYFL1qkQfaz0kR+F1qVI7G2Ehxh02OSL1puncdK6tYCctggrG5oQXU32trYEwrFmOd+
         95hFn2JTWb2LbGvo/STySUHpMhGmer+53SB2HYv9toAW/M7+wRAJuSelYriub74Iw/G7
         m2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xKmLK36D5ePOofNh2z9LJJY0hW0yXIObsbFpgPZ4stA=;
        b=Rp0roB45LB/XA3zvujoeXsWUNg55gal5VfTJOCL3JNNiMgLFGA3oAc2TTN/DOyGxqz
         7ebMvqY+/GLJa7M6efIlWnZcrycilyjWcyou9xgYGVLVrSaxh04EphrYU1X7WZ48n6FM
         Ty1s1IHWdf7McVhTMyOKsifpRZFmgcXbtS8/vH1soq6FcRq8kTwLhJ4cqUT7+v/aD4ax
         UqAeYpDJeeM5g5vPuw7sTX/BsgrWZmNl4I0EnYUjxMsv/E91Q4j20SqCgQM1PfJ4XIeg
         m/8sO2b4RFZfQsD2SnAcOQWwbceum9MLq8doeHDCuHYV55ZEshlvgy1EFEBAQCG26Dct
         /ycQ==
X-Gm-Message-State: AGi0PuZScPTDtu7k0ZyJjZAqcFIrtLW7vw2nBg1CEXQ/8NG82PEhSn/q
        KB9uVH3IYP3M0Z0vrc48obiy0g==
X-Google-Smtp-Source: APiQypKHfmUFprFdhBnn15JljJ7ABZ+0AZ4k8oC4dbcrvuMDjJGGxwmN08jYLL77CoC8E5twQzp7fQ==
X-Received: by 2002:adf:84c1:: with SMTP id 59mr25438014wrg.350.1587487184369;
        Tue, 21 Apr 2020 09:39:44 -0700 (PDT)
Received: from starbuck.lan (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.googlemail.com with ESMTPSA id 33sm4578513wrp.5.2020.04.21.09.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 09:39:43 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] arm64: dts: meson: libretech-cc: add initial audio playback support
Date:   Tue, 21 Apr 2020 18:39:33 +0200
Message-Id: <20200421163935.775935-5-jbrunet@baylibre.com>
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
 .../amlogic/meson-gxl-s905x-libretech-cc.dts  | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
index e8348b2728db..4c9dded836e2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/sound/meson-aiu.h>
 
 #include "meson-gxl-s905x.dtsi"
 
@@ -124,6 +125,45 @@ vddio_boot: regulator-vddio_boot {
 		regulator-max-microvolt = <1800000>;
 		vin-supply = <&vcc_3v3>;
 	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "GXL-LIBRETECH-S905X-CC";
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

