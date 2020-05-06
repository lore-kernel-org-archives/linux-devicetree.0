Return-Path: <SRS0=1UAq=6U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C40AC28CBC
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 22:17:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18E6420753
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 22:17:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="G0NdJSCy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728851AbgEFWRZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 May 2020 18:17:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729675AbgEFWRL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 May 2020 18:17:11 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DC75C061A0F
        for <devicetree@vger.kernel.org>; Wed,  6 May 2020 15:17:10 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id k1so4016482wrx.4
        for <devicetree@vger.kernel.org>; Wed, 06 May 2020 15:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XTiLbnU+bbYcNina6WdSi4nhXwiJzisYjraHaG7nzCI=;
        b=G0NdJSCyn+58VpBj4IgiHTWg9VW/e1APCHxcqDdBgExXPBA5t00NZsCa5PwhQlsSR6
         32SaRv7bI9+tDwOKdFpJMKnk2342nKJASZWaiendmZxg/FmZ1e9plF4lYtddv89InDSe
         L4ZG9d53G15j2gNCSHFjxNDsKk190EmA7Cmy30mgJjVKuMktYBWUrZNHJ3bT6lHSF0DC
         p5LpbPVPUMHTuHuQRgG8HfoKi8ZBeX1c1KM4UR4T1WJA+8F1Az0FX3V39VY4Z+h+qXSU
         FjoZfdxOZQJNOQ9fvlVzMz4Q8DLGBz9xUvCO2mqAq5oV6pYUsKqvEOhSjOK9JELqCLj8
         RbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XTiLbnU+bbYcNina6WdSi4nhXwiJzisYjraHaG7nzCI=;
        b=m7bPwb5kr0CMO4PSjlr7Z3JKNxnqFYnCHZ1F4O6/YDyO05j3z14HAQymn3Z3xxds2g
         Snzmdt81SI6NPWWb7J3DlSEB6UZQCZh7Qxkr5X38NWsDFNAWZ2zMjxWciiHTDteDlRQ0
         cFxQN5C9mGhAc+OQapcZ6SPfSJPVuUB+laqadGZtmQla+IvTCCtQyA80cZbyiukDo4DH
         2Ug+Tql7ksuE3j/izoLD9Q3bc5G2WT5h/jj2DkZucoX/7dAd3zDK3gAuqZ0mbEUHqcB+
         T2MBHS26d4Ldlpii5cF3CnDKfCoct9CAp5BxFLL7lFkJh3Ygy5AAQd+Z3VyxujDRR+fT
         r6nw==
X-Gm-Message-State: AGi0PuYFIH/hGR1vnfqEDBxsz/WlxRNNds/W1G4Qr41uJXI8ptw4FZ6F
        CZDZRzlURUTpjCl3lNysbLwYpg==
X-Google-Smtp-Source: APiQypLxQ4m4rLedaNsN99CEE6SO6iXRQQK2EGYB3T20jnsH6wn7Fc1IP+aEJEkAKpF15Cw5zD3HgA==
X-Received: by 2002:a5d:6ac1:: with SMTP id u1mr11618638wrw.319.1588803429114;
        Wed, 06 May 2020 15:17:09 -0700 (PDT)
Received: from starbuck.lan (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.googlemail.com with ESMTPSA id f5sm4760671wrp.70.2020.05.06.15.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 15:17:08 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] arm64: dts: meson: libretech-pc: add internal DAC support
Date:   Thu,  7 May 2020 00:16:54 +0200
Message-Id: <20200506221656.477379-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200506221656.477379-1-jbrunet@baylibre.com>
References: <20200506221656.477379-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add the internal DAC support on the libretech CC. The output of this
DAC is provided on the 9J4 connector.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../dts/amlogic/meson-gx-libretech-pc.dtsi    | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
index 514fed57a5ce..c2480bab8d33 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
@@ -30,6 +30,13 @@ aliases {
 		spi0 = &spifc;
 	};
 
+	dio2133: analog-amplifier {
+		compatible = "simple-audio-amplifier";
+		sound-name-prefix = "AU2";
+		VCC-supply = <&vcc5v>;
+		enable-gpios = <&gpio GPIOH_5 GPIO_ACTIVE_HIGH>;
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
@@ -180,6 +187,13 @@ vddio_card: regulator-vddio-card {
 	sound {
 		compatible = "amlogic,gx-sound-card";
 		model = "GXL-LIBRETECH-S9XX-PC";
+		audio-aux-devs = <&dio2133>;
+		audio-widgets = "Speaker", "7J4-14 LEFT",
+				"Speaker", "7J4-11 RIGHT";
+		audio-routing = "AU2 INL", "ACODEC LOLN",
+				"AU2 INR", "ACODEC LORN",
+				"7J4-14 LEFT", "AU2 OUTL",
+				"7J4-11 RIGHT", "AU2 OUTR";
 		assigned-clocks = <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>,
 				  <&clkc CLKID_MPLL2>;
@@ -201,6 +215,10 @@ dai-link-1 {
 			codec-0 {
 				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
 			};
+
+			codec-1 {
+				sound-dai = <&aiu AIU_ACODEC CTRL_I2S>;
+			};
 		};
 
 		dai-link-2 {
@@ -210,9 +228,22 @@ codec-0 {
 				sound-dai = <&hdmi_tx>;
 			};
 		};
+
+		dai-link-3 {
+			sound-dai = <&aiu AIU_ACODEC CTRL_OUT>;
+
+			codec-0 {
+				sound-dai = <&acodec>;
+			};
+		};
 	};
 };
 
+&acodec {
+	AVDD-supply = <&vddio_ao18>;
+	status = "okay";
+};
+
 &aiu {
 	status = "okay";
 };
-- 
2.25.4

