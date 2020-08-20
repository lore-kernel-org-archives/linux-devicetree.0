Return-Path: <SRS0=Ay4y=B6=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20333C433E3
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 12:14:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E9B3B207BB
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 12:14:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mldFscpK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729498AbgHTMOD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 20 Aug 2020 08:14:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730464AbgHTMNi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 20 Aug 2020 08:13:38 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A094C061385
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2020 05:13:38 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id d188so943627pfd.2
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2020 05:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EvaYpGhPiyzIV8u7Pu49cgT7qrkQ0eRWWRMKQuP5HaA=;
        b=mldFscpKgM3ipzzkLfP0lvFj1wLLTrVWsSfCnd5CMAAxGBKOs6PZgoxS7xR5+i6RLu
         MJOkwBORNxN3Z+BpvATXOYR4I4cXJGJzW251epBSZHOGfJP5jq2c4tfJXlMjhj/Gzp4q
         0fj39D35xxmV+PvhLdiRR1V7jNqeDvntsSoRef7nJhb3aUoZ+z10yl4v186fyh0u8kd0
         VLuurtQkBxy0WTB7UjeZej/yK2/Pu197/cERRpIQN4KaESH5NDdL+MnkVWxW7H2F344m
         msuGgYxi6TmLXtMfeIDfEfz4A5AiK3lAQG7XlADOCzaVZbmBQBtVvz9Hifzv/UCD6zQr
         12pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EvaYpGhPiyzIV8u7Pu49cgT7qrkQ0eRWWRMKQuP5HaA=;
        b=Q4GNhwsdyV4bQHD+UWiKV1XP/Whbg8HqDktaHNmBOAEhNg9N5KMf/+xsMtJY9PsYG0
         wQTvX+14imMCWWtgFLPxde0txcD59ShIbDU1uhM4UrB6NT+C07DE4n4/8o3y3SBGbVGf
         5jxuPUpu09eypkMNMbe1n/YiSphyBgXyLTPJQkQAS62Oaz57RjvQVBKfJ/A0Z1IZobZJ
         ykgjqZIRjLBd58OQEzHA1RR19Dny0jJMLL8CYz1tQ/0dC7rFMA/YlrEdpH9kFsufsjqa
         5MXUUB9VZMk2ZN3yO4V6HUv3Tidc9nATVYPYnjHMKwGsmo0ZoUfSw9zQkJnNGlRjDPRj
         mG/w==
X-Gm-Message-State: AOAM532s8OrJFdo7Ax+BEOVuBTmK3u3YEli9wyo4ZvD+UnTpZoI68jx5
        mumhzrSUPgNCQv//MCW0FtcDf77lO/o=
X-Google-Smtp-Source: ABdhPJy10u5ElLDD6qJCDxC8DtyeOr0hEPgkm9g/Vkrdr0Rn/axi1Qz1t+rNirf2rMoaKurT/sp+gA==
X-Received: by 2002:aa7:9569:: with SMTP id x9mr2208031pfq.16.1597925617760;
        Thu, 20 Aug 2020 05:13:37 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.137])
        by smtp.gmail.com with ESMTPSA id p20sm1985937pjg.44.2020.08.20.05.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 05:13:37 -0700 (PDT)
From:   Anand Moon <linux.amoon@gmail.com>
To:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Christian Hewitt <christianshewitt@gmail.com>,
        Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v3 1/2] arm64: dts: meson-g12b-odroid-n2: Enable RTC controller node
Date:   Thu, 20 Aug 2020 17:43:22 +0530
Message-Id: <20200820121323.564-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200820121323.564-1-linux.amoon@gmail.com>
References: <20200820121323.564-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Enable RTC PCF8563 node on Odroid-N2 SBC, In order to
support the RTC wakealarm feature for suspend and resume.
Also assign an alias to the pcf8563 to rtc0 and meson-vrtc to rtc1
timer device to prevent it being assigned to /dev/rtc0
which disto userspace tools assume is a clock device.

Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Suggested-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
Changes V3
--Drop the INI GPIOAO.BIT7 pinctrl.
--Added missing RTC alias so that rtc get assigned correcly,
  as suggested by Chris Hewitt.
changes v2
--Fix the missing INT (GPIOAO.BIT7) pinctrl.
--Fix the missing rtcwakeup.
--Drop the clock not required clock property by the PCF8563 driver.
---
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts      | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index 34fffa6d859d..35a31cf181e2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -19,6 +19,8 @@ / {
 	aliases {
 		serial0 = &uart_AO;
 		ethernet0 = &ethmac;
+		rtc0 = &rtc0;
+		rtc1 = &vrtc;
 	};
 
 	dioo2133: audio-amplifier-0 {
@@ -477,6 +479,18 @@ hdmi_tx_tmds_out: endpoint {
 	};
 };
 
+&i2c3 {
+	pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	rtc0: rtc@51 {
+		reg = <0x51>;
+		compatible = "nxp,pcf8563";
+		wakeup-source;
+	};
+};
+
 &ir {
 	status = "okay";
 	pinctrl-0 = <&remote_input_ao_pins>;
-- 
2.28.0

