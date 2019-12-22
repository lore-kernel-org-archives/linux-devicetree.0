Return-Path: <SRS0=TQXC=2M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D16F8C2D0D3
	for <linux-devicetree@archiver.kernel.org>; Sun, 22 Dec 2019 13:30:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A5FFC208C3
	for <linux-devicetree@archiver.kernel.org>; Sun, 22 Dec 2019 13:30:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Ko7Ge9z6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbfLVNaB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 22 Dec 2019 08:30:01 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:44842 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbfLVNaA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 22 Dec 2019 08:30:00 -0500
Received: by mail-pg1-f194.google.com with SMTP id x7so7421570pgl.11
        for <devicetree@vger.kernel.org>; Sun, 22 Dec 2019 05:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mkXpYcbeC0bnNO0q+6BYbbUdKRmj3eZu6k2PkyZZ+20=;
        b=Ko7Ge9z6rEc/DNmA95FoqQhmD4ZRDMPPBvY192RjylPy6mpEnDYy49s6Gs0N/4z2kS
         T0nAmsWgfOGv42sGav/y+PMu+c2uzyw9DWV3Oeh7UpIBgQY7ACvqC80JS6JoZL9MGDR3
         vFWd3oxz+DYWwGFdxlws9nHlwBEx04TuiX6rY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mkXpYcbeC0bnNO0q+6BYbbUdKRmj3eZu6k2PkyZZ+20=;
        b=qbUKE/413EcjVW7QWhwhr2ld4MLqkgRF7DSR+a37DLViAG8NL7eaAccIajA2sgRF8A
         7tDveAeSI3V/xA8K5YSpOLYElVDVC9FfDWCLOE5AxWAyiQASj9iTPuiUzO73jcEDsLru
         k5a0a0O3MTVnJ7B14u/VKLDR5z0bemEGBQcfhbxzD/prfmvtKt+ybv+gH3984lI2JKfx
         MEuqoAJmliNwfBgwNsw8Mb/GK8uGUzv76VtdC/m0OOFGDB8ubCOG6JKhBjsX15fzf/+q
         O+tQo5C6fKJyD+qUSanmlbnbQjKvPKkYxvA79BilAEQWeFfXXxHypqur3p7opirTJOSh
         0Tsw==
X-Gm-Message-State: APjAAAVLlD6hGhlQcvrQkbWYscgZU0wDoozc6leT0X5KaziIjfv7Cl+8
        XIt7COTsW4FeRu8uCiaswjS/uA==
X-Google-Smtp-Source: APXvYqyHkanj7JlhaLM0WTdhZMkadXcPfBdMYpNMuwK5QyAWQ/FBBL4mGlVa76wmMBcDwSTcOZH+Ag==
X-Received: by 2002:a63:201d:: with SMTP id g29mr26867710pgg.427.1577021399945;
        Sun, 22 Dec 2019 05:29:59 -0800 (PST)
Received: from localhost.localdomain ([49.206.202.16])
        by smtp.gmail.com with ESMTPSA id o2sm12073058pjo.26.2019.12.22.05.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2019 05:29:59 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     michael@amarulasolutions.com, Icenowy Zheng <icenowy@aosc.io>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-amarula@amarulasolutions.com,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [DO NOT MERGE] [PATCH v14 7/7] arm64: dts: allwinner: bananapi-m64: Enable Bananapi S070WV20-CT16 DSI panel
Date:   Sun, 22 Dec 2019 18:52:29 +0530
Message-Id: <20191222132229.30276-8-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191222132229.30276-1-jagan@amarulasolutions.com>
References: <20191222132229.30276-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch add support for Bananapi S070WV20-CT16 DSI panel to
BPI-M64 board.

DSI panel connected via board DSI port with,
- DLDO1 as VCC-DSI supply
- DCDC1 as VDD supply
- PD7 gpio for lcd enable pin
- PD6 gpio for lcd reset pin
- PD5 gpio for backlight enable pin

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 .../dts/allwinner/sun50i-a64-bananapi-m64.dts | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
index 208373efee49..6beaecdd802a 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
@@ -45,6 +45,7 @@
 #include "sun50i-a64.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pwm/pwm.h>
 
 / {
 	model = "BananaPi-M64";
@@ -56,6 +57,14 @@
 		serial1 = &uart1;
 	};
 
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&r_pwm 0 50000 PWM_POLARITY_INVERTED>;
+		brightness-levels = <1 2 4 8 16 32 64 128 255>;
+		default-brightness-level = <2>;
+		enable-gpios = <&pio 3 5 GPIO_ACTIVE_HIGH>; /* LCD-BL-EN: PD5 */
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
@@ -116,6 +125,24 @@
 	status = "okay";
 };
 
+&dphy {
+	status = "okay";
+};
+
+&dsi {
+	vcc-dsi-supply = <&reg_dldo1>;		/* VCC3V3-DSI */
+	status = "okay";
+
+	panel@0 {
+		compatible = "bananapi,s070wv20-ct16-icn6211";
+		reg = <0>;
+		enable-gpios = <&pio 3 7 GPIO_ACTIVE_HIGH>; /* LCD-PWR-EN: PD7 */
+		reset-gpios = <&pio 3 6 GPIO_ACTIVE_HIGH>; /* LCD-RST: PD6 */
+		vdd-supply = <&reg_dcdc1>;
+		backlight = <&backlight>;
+	};
+};
+
 &ehci0 {
 	status = "okay";
 };
@@ -206,6 +233,10 @@
 	status = "okay";
 };
 
+&r_pwm {
+	status = "okay";
+};
+
 &r_rsb {
 	status = "okay";
 
-- 
2.18.0.321.gffc6fa0e3

