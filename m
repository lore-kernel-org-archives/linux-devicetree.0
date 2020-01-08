Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3AE2C33C9E
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 04:20:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6E42220705
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 04:20:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kc6oE+AJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbgAHEUu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Jan 2020 23:20:50 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41887 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbgAHEUu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 Jan 2020 23:20:50 -0500
Received: by mail-pg1-f194.google.com with SMTP id x8so899330pgk.8
        for <devicetree@vger.kernel.org>; Tue, 07 Jan 2020 20:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BsY5fjuE+U5lF0TwpIgIkyumygVTDJwlCVDsGfXmUK8=;
        b=kc6oE+AJmInib4sWUwj7Bo4GM/V9TueAwUxznfc+rj2AY6joapIE3XSs6HMfKGAijK
         DglLqt5X+pDenU7oBGRdAcOQnDlVhlMyS25SVHmZwEGo/uRJJujF5KYfSdora/uss2tQ
         4r+D81aayGrqJ+BeyPcugXTMGzav3DlAaYQx6QNBYfFzECHWyWtfe/pHak+Uo5c3Levu
         pGwplkFv1OUWFA0NsKIJIIRqCFNntsiRDj/eaKCtOOF9NSxk20AOplYC3meKtt13z0Og
         i22Ueiq0WiDRlTR/g91e/b9iKSYl+4yDHdWqRPGFWSnduIB9ccLor/uOYVZ6eMr6pvEp
         VliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BsY5fjuE+U5lF0TwpIgIkyumygVTDJwlCVDsGfXmUK8=;
        b=sNnU2dvGdpTMeHJorh8/aldwg56gL9I3+sQD0mhPnrp+3+HF1Ebr+8UllYtYPvQrDc
         q93jFWVM8bLX6o6d+A5Yi6JT0cpR4bAY/rL2YvXpeFQZe8rO7Dj7rt+O+v61W2XaoaVP
         rvOX44NsYJ9Y988DqLTgr+mCwrVGSh05u04SOxkpxhK17j9Db2OpFCeRnthKWwCvnBjf
         Stdo4a9H9sn11y653f7bKWogxCoiQozvJLRyFxneZA/KQlnaKwxjijN/0xzcN/EDqFGU
         knMa/JaM7HJwmJ9A3DuCmSIQWapSDcr7RWzhpXvQ4Bx/5xDA2tolXgBxGH7c0ImMO7Nk
         nr6w==
X-Gm-Message-State: APjAAAUR9DX19x9rsGWS9F3WRAgq0KTL4Ql0eYgWeeW4JGe0JHWzasYY
        zjQqeGqanQ8w4uWDsHACAjBFJO88
X-Google-Smtp-Source: APXvYqxdSxMGety0x4AQA+p6/3GZXq/gedEOa5lO+VVW/Q7TsVcy3wbnObTRaipaON3o9Kb4R8AagQ==
X-Received: by 2002:a62:f94d:: with SMTP id g13mr3001129pfm.60.1578457249828;
        Tue, 07 Jan 2020 20:20:49 -0800 (PST)
Received: from anarsoul-thinkpad.lan (216-71-213-236.dyn.novuscom.net. [216.71.213.236])
        by smtp.gmail.com with ESMTPSA id p12sm1133478pjo.5.2020.01.07.20.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 20:20:49 -0800 (PST)
From:   Vasily Khoruzhick <anarsoul@gmail.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc:     Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH v2 4/4] arm64: dts: allwinner: a64: enable DVFS
Date:   Tue,  7 Jan 2020 20:20:18 -0800
Message-Id: <20200108042018.571251-5-anarsoul@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200108042018.571251-1-anarsoul@gmail.com>
References: <20200108042018.571251-1-anarsoul@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add CPU regulator and operating points for all the A64-based boards
that are currently supported to enable DVFS.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 .../dts/allwinner/sun50i-a64-amarula-relic.dts  | 17 +++++++++++++++++
 .../dts/allwinner/sun50i-a64-bananapi-m64.dts   | 17 +++++++++++++++++
 .../dts/allwinner/sun50i-a64-nanopi-a64.dts     | 17 +++++++++++++++++
 .../boot/dts/allwinner/sun50i-a64-olinuxino.dts | 17 +++++++++++++++++
 .../dts/allwinner/sun50i-a64-orangepi-win.dts   | 17 +++++++++++++++++
 .../boot/dts/allwinner/sun50i-a64-pine64.dts    | 17 +++++++++++++++++
 .../boot/dts/allwinner/sun50i-a64-pinebook.dts  | 17 +++++++++++++++++
 .../boot/dts/allwinner/sun50i-a64-sopine.dtsi   | 17 +++++++++++++++++
 .../boot/dts/allwinner/sun50i-a64-teres-i.dts   | 17 +++++++++++++++++
 9 files changed, 153 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
index 5634245d11db..6ee7291293ec 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "sun50i-a64.dtsi"
+#include "sun50i-a64-cpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
@@ -65,6 +66,22 @@ wifi_pwrseq: wifi-pwrseq {
 	};
 };
 
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&cpu1 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&cpu2 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&cpu3 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
 &csi {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
index 208373efee49..9b80e06f40d6 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
@@ -43,6 +43,7 @@
 /dts-v1/;
 
 #include "sun50i-a64.dtsi"
+#include "sun50i-a64-cpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
@@ -108,6 +109,22 @@ &codec_analog {
 	status = "okay";
 };
 
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&cpu1 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&cpu2 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&cpu3 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
 &dai {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts
index 9b9d9157128c..6b81b91da504 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts
@@ -43,6 +43,7 @@
 /dts-v1/;
 
 #include "sun50i-a64.dtsi"
+#include "sun50i-a64-cpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
@@ -87,6 +88,22 @@ wifi_pwrseq: wifi_pwrseq {
 	};
 };
 
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&cpu1 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&cpu2 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&cpu3 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
 &de {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
index 01a9a52edae4..fb45c32558c5 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
@@ -43,6 +43,7 @@
 /dts-v1/;
 
 #include "sun50i-a64.dtsi"
+#include "sun50i-a64-cpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
@@ -87,6 +88,22 @@ wifi_pwrseq: wifi_pwrseq {
 	};
 };
 
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&cpu1 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&cpu2 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&cpu3 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
 &de {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
index f54a415f2e3b..a510cf40a9fe 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
@@ -44,6 +44,7 @@
 /dts-v1/;
 
 #include "sun50i-a64.dtsi"
+#include "sun50i-a64-cpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
@@ -123,6 +124,22 @@ &codec_analog {
 	status = "okay";
 };
 
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&cpu1 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&cpu2 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&cpu3 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
 &dai {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
index 409523cb0950..7cb01886aa32 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
@@ -43,6 +43,7 @@
 /dts-v1/;
 
 #include "sun50i-a64.dtsi"
+#include "sun50i-a64-cpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
@@ -84,6 +85,22 @@ &codec_analog {
 	status = "okay";
 };
 
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&cpu1 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&cpu2 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&cpu3 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
 &dai {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
index 78c82a665c84..74a8569c677f 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 
 #include "sun50i-a64.dtsi"
+#include "sun50i-a64-cpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
@@ -98,6 +99,22 @@ &codec_analog {
 	status = "okay";
 };
 
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&cpu1 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&cpu2 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&cpu3 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
 &dai {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi
index 9d20e13f0c02..e64f330ca420 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi
@@ -44,6 +44,7 @@
  */
 
 #include "sun50i-a64.dtsi"
+#include "sun50i-a64-cpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
@@ -51,6 +52,22 @@ &codec_analog {
 	cpvdd-supply = <&reg_eldo1>;
 };
 
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&cpu1 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&cpu2 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&cpu3 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
 &mmc0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc0_pins>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
index 970415106dcf..0356608ce467 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 
 #include "sun50i-a64.dtsi"
+#include "sun50i-a64-cpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
@@ -104,6 +105,22 @@ &de {
 	status = "okay";
 };
 
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&cpu1 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&cpu2 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&cpu3 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
 &ehci1 {
 	status = "okay";
 };
-- 
2.24.1

