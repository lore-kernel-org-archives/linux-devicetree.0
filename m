Return-Path: <SRS0=1UAq=6U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0FB3C28CBC
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 22:17:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8ADA32078C
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 22:17:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="w03sGqIz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729873AbgEFWRK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 May 2020 18:17:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728621AbgEFWRJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 May 2020 18:17:09 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E735FC061A10
        for <devicetree@vger.kernel.org>; Wed,  6 May 2020 15:17:08 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id u16so4474349wmc.5
        for <devicetree@vger.kernel.org>; Wed, 06 May 2020 15:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=izmMGovSSBuc6fozUgZUKC9IOfopD7QjXO+LOgTqnQw=;
        b=w03sGqIzokibbMuTFXMCesOUMu9VLIM+THhfVeY5bOqZIfEsQoCfnc56BM0p+Ie7c0
         NO5KdGF8bUW85+o9cUBNdBvvLbFEcLVCDAzbTPatJpYtTPptCSnKewAbdhMLApuzeaj2
         b86elYRtPRt+WLd0sBEt07NSSOLJLAnqo08sudwPjgcx4swU3wfw8kV04b/JLYLvw1f6
         3FTm7rcKsRR/vAwEHvY3jU1Y4ElccL/knF3HNskCgbURNV82YioJpKiTohJ2gw9fQiHb
         396wd22UFwbU2J9T6/sE+ZSQ78aTQE2csYPnMNB41vUz6lhKlRh6Rs9Gagy9+MerqA9W
         FX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=izmMGovSSBuc6fozUgZUKC9IOfopD7QjXO+LOgTqnQw=;
        b=h7xVAk/7JwaL1DaW4IM2WpHVIAwlfYQOnVtIrMCu1HMlisOjgQrGdD3eqAa4fNuF94
         BJjXg8tq5GiY4B+fLxTTGXbE1ZMgs8ps9IRKmuru2eUl+ebFneiseJXGAVO6pevX2y3y
         2ChANDxmoOnGXjm3FmukDzt99H3DnQY5pwxKW3q1a+YdOf29hzebSWl5iggQ+/b9717d
         q8s+A0iu7S2FH4GpjWNLA4WyDjTukDx/n7R0iy5nr3wZ99MDwfrBq1IHP90f+ib02ZEp
         4fmdxWHf/JfI8LOuroF8IoIzXtlzsCQjg12MgSPGS6lqkLGinKJuN04lf+kr7fwTIIWh
         xuvw==
X-Gm-Message-State: AGi0PuZ6++nk8DHBduMcQEAowiBZ9/GHgIdv6nqq0Bd7K+GpGUIdwvQN
        jcMq+O3f+UOjttYtpOzDvbnefA==
X-Google-Smtp-Source: APiQypIIDmpm1njecMruJwbDzy3aimIA58Drn0zOPBOKm6iu6Dd6mjbx8mKpad3WfiiNgoWXELYH+w==
X-Received: by 2002:a1c:2042:: with SMTP id g63mr6812262wmg.70.1588803427613;
        Wed, 06 May 2020 15:17:07 -0700 (PDT)
Received: from starbuck.lan (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.googlemail.com with ESMTPSA id f5sm4760671wrp.70.2020.05.06.15.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 15:17:06 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] arm64: dts: meson: libretech-ac: add internal DAC support
Date:   Thu,  7 May 2020 00:16:53 +0200
Message-Id: <20200506221656.477379-5-jbrunet@baylibre.com>
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
DAC is provided on the 9J5 connector.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../amlogic/meson-gxl-s805x-libretech-ac.dts  | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
index 6e0984269662..6a226faab183 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
@@ -98,6 +98,15 @@ vcc_3v3: regulator-vcc_3v3 {
 		regulator-always-on;
 	};
 
+	vddio_ao18: regulator-vddio_ao18 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_AO18";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_3v3>;
+		regulator-always-on;
+	};
+
 	vddio_boot: regulator-vddio_boot {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_BOOT";
@@ -110,6 +119,10 @@ vddio_boot: regulator-vddio_boot {
 	sound {
 		compatible = "amlogic,gx-sound-card";
 		model = "GXL-LIBRETECH-S805X-AC";
+		audio-widgets = "Speaker", "9J5-3 LEFT",
+				"Speaker", "9J5-2 RIGHT";
+		audio-routing = "9J5-3 LEFT", "ACODEC LOLN",
+				"9J5-2 RIGHT", "ACODEC LORN";
 		assigned-clocks = <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>,
 				  <&clkc CLKID_MPLL2>;
@@ -131,6 +144,10 @@ dai-link-1 {
 			codec-0 {
 				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
 			};
+
+			codec-1 {
+				sound-dai = <&aiu AIU_ACODEC CTRL_I2S>;
+			};
 		};
 
 		dai-link-2 {
@@ -140,9 +157,22 @@ codec-0 {
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

