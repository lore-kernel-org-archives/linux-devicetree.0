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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8571AC33C9B
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 04:20:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 58C342072B
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 04:20:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="joSnIdyk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbgAHEUs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Jan 2020 23:20:48 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41883 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbgAHEUs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 Jan 2020 23:20:48 -0500
Received: by mail-pg1-f193.google.com with SMTP id x8so899299pgk.8
        for <devicetree@vger.kernel.org>; Tue, 07 Jan 2020 20:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a9CbtpSeP2FndDuoSPtr7TkepCmjH+G9q6KhtPvuICk=;
        b=joSnIdykr9M65iSmT897djm+dYgRXOxKaLDa39hQjDBsRFT8cgHHS1HqfrC+8njn0S
         GmKpAfbIz9tI08oB05Mskl3Yrnlr1vqfYvN6GgvGWvX3FoY2D6jbqe2n4AiirNQdshck
         YcSK7KyOEEdgcfT1MDpDMqSH6+KBFM/JsK2panWK+6cq9d4i+8VHPl3LBwb3TRlt9GKC
         HWWP9v7YK8P8Gq1dR6DESgYndv5C65NUgUlKbRcPs16burh5GxlVTZ2qyyHDh2E6urd/
         xOk5klU4x4BpUSEAZqvVBMOap07jbZTKpxI8KR4tyg/7ZBcjNuYba9rroCATi6io/1NX
         eQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a9CbtpSeP2FndDuoSPtr7TkepCmjH+G9q6KhtPvuICk=;
        b=ozOsEdkVf4S7CdgZGg+e+kt2V709gc5UxOtPCQh76/w4Ady8BQszJr79h8g4VCt8B0
         7a2lYl92nM2eo2OfaMkkEjL4Rizp5X6yy4ArwV6Qg0UTdYbUhpMN3xV9NhEwvqIsy8hJ
         OvIhXUAAKSNjXwybohW8/FjdyhGo627i+ngim+Z7wiGUBwECehJw1THrCzg3Hi1lPoFZ
         Y//80rqyUtcFZXTyqnHSJ3yhaOBusRQUXwfrdHA50L4/KLvJb1Jb7nGHgewgFR2NjGAM
         K/v4ARe0E9d4KlYqWIYPlBOApCP2wuWH9cdWQtBV/maLAdEA6zQ46/oLhNWFZ+7mBKUh
         +Msg==
X-Gm-Message-State: APjAAAVVKAnpdnacSl9CJEgqQG1PiOORqit9/LTFqQzRQUhyjpLSXT1A
        3uzOynTNgHL41kpsFrxSsEQ=
X-Google-Smtp-Source: APXvYqzdjVZCW2V6yoSf9haV6oUXng2MFLJ+MiXr/PXgpLd1X/Um2PrG+0b8+5nZBm4rNj/J3c9wNQ==
X-Received: by 2002:a63:de03:: with SMTP id f3mr3268086pgg.141.1578457247965;
        Tue, 07 Jan 2020 20:20:47 -0800 (PST)
Received: from anarsoul-thinkpad.lan (216-71-213-236.dyn.novuscom.net. [216.71.213.236])
        by smtp.gmail.com with ESMTPSA id p12sm1133478pjo.5.2020.01.07.20.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 20:20:47 -0800 (PST)
From:   Vasily Khoruzhick <anarsoul@gmail.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc:     Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH v2 2/4] arm64: dts: allwinner: a64: add cooling maps and thermal tripping points
Date:   Tue,  7 Jan 2020 20:20:16 -0800
Message-Id: <20200108042018.571251-3-anarsoul@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200108042018.571251-1-anarsoul@gmail.com>
References: <20200108042018.571251-1-anarsoul@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add cooling maps and thermal tripping points to prevent CPU overheating when
running at the highest frequency. Tripping points are taken from A33 dts since
A64 user manual doesn't mention when we should start throttling.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 77b33087866d..54a741f3cd8c 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -92,6 +92,7 @@ cpu0: cpu@0 {
 			next-level-cache = <&L2>;
 			clocks = <&ccu CLK_CPUX>;
 			clock-names = "cpu";
+			#cooling-cells = <2>;
 		};
 
 		cpu1: cpu@1 {
@@ -102,6 +103,7 @@ cpu1: cpu@1 {
 			next-level-cache = <&L2>;
 			clocks = <&ccu CLK_CPUX>;
 			clock-names = "cpu";
+			#cooling-cells = <2>;
 		};
 
 		cpu2: cpu@2 {
@@ -112,6 +114,7 @@ cpu2: cpu@2 {
 			next-level-cache = <&L2>;
 			clocks = <&ccu CLK_CPUX>;
 			clock-names = "cpu";
+			#cooling-cells = <2>;
 		};
 
 		cpu3: cpu@3 {
@@ -122,6 +125,7 @@ cpu3: cpu@3 {
 			next-level-cache = <&L2>;
 			clocks = <&ccu CLK_CPUX>;
 			clock-names = "cpu";
+			#cooling-cells = <2>;
 		};
 
 		L2: l2-cache {
@@ -226,6 +230,46 @@ cpu_thermal: cpu0-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&ths 0>;
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert0>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+				map1 {
+					trip = <&cpu_alert1>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				cpu_alert0: cpu_alert0 {
+					/* milliCelsius */
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu_alert1: cpu_alert1 {
+					/* milliCelsius */
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				cpu_crit: cpu_crit {
+					/* milliCelsius */
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
 		};
 
 		gpu0_thermal: gpu0-thermal {
-- 
2.24.1

