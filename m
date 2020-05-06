Return-Path: <SRS0=1UAq=6U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B28BC38A2A
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 22:17:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D25DE20753
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 22:17:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="R/XprMhF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730086AbgEFWRG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 May 2020 18:17:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730071AbgEFWRF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 May 2020 18:17:05 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 096A6C061A0F
        for <devicetree@vger.kernel.org>; Wed,  6 May 2020 15:17:05 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id h9so4028017wrt.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2020 15:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MMsqSs/SSZ3pe/sBbExNqHgguhkBo7qZyyilemVOFmk=;
        b=R/XprMhFIHT73MOJsNm/08fO4X1XbkAG8F09dAKe5z7OhBsUZKFIr+hbWrI4dU4PpN
         ClomDlzaWGVcCoNAjnpvhsQvdzvalf9g2X3azJZ/6zlFKmQ9sMLyiMnn8lpCLDW+JzqR
         2BNXZj6cNzAgkxQOgWTitjGL0M0/PjSTEVW3TYgUddQnB9x/v+3bb7XjmtEqT8XKPwG8
         Ep1vNi8AA9JYHabMT9wxwLYjDOd4QNfip9AsvZRIvWWEgRg3zYqD1R48xhPrJLPZ1Uqx
         R5w7BF2kSIf6qoD/2n9xTKPMrBacFnzO1AKCU35bO1D233Fdtt9Y6fR3zhKWo1DzITWe
         MTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MMsqSs/SSZ3pe/sBbExNqHgguhkBo7qZyyilemVOFmk=;
        b=lyHa97cQARew+ZG7qJ9J6X01wAKkRGvwyZ2+vY+yZ1MjKwtfZbYjR+1dlgNoZMuooW
         BAMQ1qXSP8O8ckbbbLOkDBguI6isFYTADqdSSxJ1EPuqlkPWxDYn4aPkNlaCI0a6sPes
         PV7i4ExOSiQhWTS/ojPy3v9SZxFKKhsXknNZi85IZIQpEXyGuVIijVH8eh3d63AxH5gE
         p/H+vou1xd/MI/MtypkXf96xZXOt9t/AQFkEImwvu/gxjqgYqF1exHfZuo6z71FJ1dZv
         mV8p61qU6DtMFTNZqNm8xqR87nLrhWkBdktgLvIBtKRmmc8P6bGIuPub8n4SFr5DJr32
         3RrQ==
X-Gm-Message-State: AGi0PuYGQDfwQisSX9PNNYl7hCBqjxZIDGHRj2A8LuTH2G7Uze4TKQBE
        bVCSok5MYG08pKEph2wwMh41aA==
X-Google-Smtp-Source: APiQypJQBg086iQTTx6VFZFje8o4xqNCPjNd3ec/pqGfUNwp2w2xdZlzaN3MmJl8MdEj1hpq6QMcdw==
X-Received: by 2002:a5d:4905:: with SMTP id x5mr13089933wrq.158.1588803423764;
        Wed, 06 May 2020 15:17:03 -0700 (PDT)
Received: from starbuck.lan (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.googlemail.com with ESMTPSA id f5sm4760671wrp.70.2020.05.06.15.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 15:17:03 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] arm64: dts: meson: p230-q200: add internal DAC support
Date:   Thu,  7 May 2020 00:16:51 +0200
Message-Id: <20200506221656.477379-3-jbrunet@baylibre.com>
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

Add the necessary bits to support the internal audio DAC the p230/q200
reference design derivated boards. The output of this DAC is provided
on the 3.5mm jack connector

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../boot/dts/amlogic/meson-gx-p23x-q20x.dtsi  | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
index acb05a756aca..6b57e15aade3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
@@ -16,6 +16,13 @@ aliases {
 		ethernet0 = &ethmac;
 	};
 
+	dio2133: analog-amplifier {
+		compatible = "simple-audio-amplifier";
+		sound-name-prefix = "AU2";
+		VCC-supply = <&hdmi_5v>;
+		enable-gpios = <&gpio GPIOH_5 GPIO_ACTIVE_HIGH>;
+	};
+
 	spdif_dit: audio-codec-0 {
 		#sound-dai-cells = <0>;
 		compatible = "linux,spdif-dit";
@@ -115,6 +122,14 @@ hdmi_connector_in: endpoint {
 	sound {
 		compatible = "amlogic,gx-sound-card";
 		model = "GX-P230-Q200";
+		audio-aux-devs = <&dio2133>;
+		audio-widgets = "Line", "Lineout";
+		audio-routing = "AU2 INL", "ACODEC LOLP",
+				"AU2 INR", "ACODEC LORP",
+				"AU2 INL", "ACODEC LOLN",
+				"AU2 INR", "ACODEC LORN",
+				"Lineout", "AU2 OUTL",
+				"Lineout", "AU2 OUTR";
 		assigned-clocks = <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>,
 				  <&clkc CLKID_MPLL2>;
@@ -140,6 +155,10 @@ dai-link-2 {
 			codec-0 {
 				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
 			};
+
+			codec-1 {
+				sound-dai = <&aiu AIU_ACODEC CTRL_I2S>;
+			};
 		};
 
 		dai-link-3 {
@@ -157,9 +176,22 @@ codec-0 {
 				sound-dai = <&hdmi_tx>;
 			};
 		};
+
+		dai-link-5 {
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
 	pinctrl-0 = <&spdif_out_h_pins>;
-- 
2.25.4

