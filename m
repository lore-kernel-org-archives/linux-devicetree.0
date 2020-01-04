Return-Path: <SRS0=ng1M=2Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 914BCC33C99
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 06:35:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5F96224654
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 06:35:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4DKWAZE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbgADGfS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 4 Jan 2020 01:35:18 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39075 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbgADGfS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 4 Jan 2020 01:35:18 -0500
Received: by mail-pg1-f193.google.com with SMTP id b137so24366634pga.6;
        Fri, 03 Jan 2020 22:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yPtjDACR3H8K2uS1u9GQH0pid4N/OfHQXapx3wWocvc=;
        b=M4DKWAZE5QNZFoTHdeYXS06rY4JLo3uDrBNEw5WCHH+wu79VXgr/uRhsyCf60a2hTg
         bONQe20s3Sykap/CYALiA2SHNLVZRoJMEwez+lLdXdaU27GukTUeplxvqVxBM7KeaqF+
         j3KKVdmgeBpMEtx3N3/zIArUM7ouuyYB3Wr6XSaCwMU92b6zZxoSO79Dw1KM7+TiHqS8
         pebmaQ+9SXJNBrTeQ2sNRwc2wCGn9OSlTsZh3TRWCU5D9WPFLnYNIJj/rDx0BE/7drKh
         6Tb7TRslU2/NzUvykRFommL8z+oQVhD09LS1czUHzTdT3BNuaoJSnqGOjjnRBZKOrckc
         lFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yPtjDACR3H8K2uS1u9GQH0pid4N/OfHQXapx3wWocvc=;
        b=iTv4JFmAfCznyWgtD6bEzqh8rDaCHApcGf+UyO2seqJ9M/tv3CFz92U/cEE5hUDrDU
         BnJ4hI6fL5qphSuf8FouKnrJKkhyrnvd5B+r2+F9ly2LCAEK7PP6T3Wr/3Hxk7p/jGaV
         yYweQmeCJ7E+s0aK5IpwLZ2iJ02FFSMA5P71u71azLioI9C9o/2iq6KvVvpvFqj/fj2y
         UYUsARJYW6DeI7I1O7HK7DGxoHgieQUYWTJF/U3MGPPFZfL60E5N1twI1me/v1xaMjRr
         gVg8HS5QlEMBUBXcvryq1strkWMyi1/7sg+QZipWbWPYD2jK61I3kI0YkPmtlnDSD8gY
         H1eQ==
X-Gm-Message-State: APjAAAWXN/H4Cl4WScrjAEdggD8R6C7bHY9+yw3ooNSVTlNOrhCPMtN8
        ySxu6sQgZKfMU+QfUPJF8mU=
X-Google-Smtp-Source: APXvYqz5KiFQHxhZgupk5DoDrXsn58WhGeos+ZPkVYJG3AhthXc8O7ZT3cG/Nsr0Pl3lyJ9AXgGosg==
X-Received: by 2002:a63:9d85:: with SMTP id i127mr95917777pgd.186.1578119717534;
        Fri, 03 Jan 2020 22:35:17 -0800 (PST)
Received: from anarsoul-thinkpad.lan (216-71-213-236.dyn.novuscom.net. [216.71.213.236])
        by smtp.gmail.com with ESMTPSA id u2sm64761580pgc.19.2020.01.03.22.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 22:35:16 -0800 (PST)
From:   Vasily Khoruzhick <anarsoul@gmail.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Rob Herring <robh@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH 3/3] arm64: dts: allwinner: a64: enable DVFS
Date:   Fri,  3 Jan 2020 22:35:05 -0800
Message-Id: <20200104063505.219030-4-anarsoul@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200104063505.219030-1-anarsoul@gmail.com>
References: <20200104063505.219030-1-anarsoul@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add CPU regulator, CPU clock, operation points and thermal trip points
to enable DVFS on A64

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 .../allwinner/sun50i-a64-amarula-relic.dts    |   4 +
 .../dts/allwinner/sun50i-a64-bananapi-m64.dts |   4 +
 .../dts/allwinner/sun50i-a64-nanopi-a64.dts   |   4 +
 .../dts/allwinner/sun50i-a64-olinuxino.dts    |   4 +
 .../dts/allwinner/sun50i-a64-orangepi-win.dts |   4 +
 .../boot/dts/allwinner/sun50i-a64-pine64.dts  |   4 +
 .../dts/allwinner/sun50i-a64-pinebook.dts     |   4 +
 .../allwinner/sun50i-a64-sopine-baseboard.dts |   4 +
 .../boot/dts/allwinner/sun50i-a64-sopine.dtsi |   4 +
 .../boot/dts/allwinner/sun50i-a64-teres-i.dts |   4 +
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 102 ++++++++++++++++++
 11 files changed, 142 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
index 5634245d11db..43f6ac0beed6 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
@@ -65,6 +65,10 @@ wifi_pwrseq: wifi-pwrseq {
 	};
 };
 
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
 &csi {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
index 208373efee49..cbcab80de8c5 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
@@ -108,6 +108,10 @@ &codec_analog {
 	status = "okay";
 };
 
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
 &dai {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts
index 9b9d9157128c..6708acf94d01 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts
@@ -87,6 +87,10 @@ wifi_pwrseq: wifi_pwrseq {
 	};
 };
 
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
 &de {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
index 01a9a52edae4..f94e60eb4ec2 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
@@ -87,6 +87,10 @@ wifi_pwrseq: wifi_pwrseq {
 	};
 };
 
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
 &de {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
index f54a415f2e3b..2793afba4884 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
@@ -123,6 +123,10 @@ &codec_analog {
 	status = "okay";
 };
 
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
 &dai {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
index 409523cb0950..04aa452d4400 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
@@ -84,6 +84,10 @@ &codec_analog {
 	status = "okay";
 };
 
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
 &dai {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
index 78c82a665c84..365d85c16deb 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
@@ -98,6 +98,10 @@ &codec_analog {
 	status = "okay";
 };
 
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
 &dai {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
index 920103ec0046..e760e8efdf3e 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
@@ -100,6 +100,10 @@ &codec_analog {
 	status = "okay";
 };
 
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
 &dai {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi
index 9d20e13f0c02..3d8e2d452ce1 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi
@@ -51,6 +51,10 @@ &codec_analog {
 	cpvdd-supply = <&reg_eldo1>;
 };
 
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
 &mmc0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc0_pins>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
index 970415106dcf..28edcef8bed1 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
@@ -104,6 +104,10 @@ &de {
 	status = "okay";
 };
 
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
 &ehci1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 5e3f16c3b706..7f37c8cd1b6e 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -80,6 +80,52 @@ simplefb_hdmi: framebuffer-hdmi {
 		};
 	};
 
+	cpu0_opp_table: opp_table0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-648000000 {
+			opp-hz = /bits/ 64 <648000000>;
+			opp-microvolt = <1040000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+		opp-816000000 {
+			opp-hz = /bits/ 64 <816000000>;
+			opp-microvolt = <1100000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+		opp-912000000 {
+			opp-hz = /bits/ 64 <912000000>;
+			opp-microvolt = <1120000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+		opp-960000000 {
+			opp-hz = /bits/ 64 <960000000>;
+			opp-microvolt = <1160000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+		opp-1008000000 {
+			opp-hz = /bits/ 64 <1008000000>;
+			opp-microvolt = <1200000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+		opp-1056000000 {
+			opp-hz = /bits/ 64 <1056000000>;
+			opp-microvolt = <1240000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+		opp-1104000000 {
+			opp-hz = /bits/ 64 <1104000000>;
+			opp-microvolt = <1260000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+		opp-1152000000 {
+			opp-hz = /bits/ 64 <1152000000>;
+			opp-microvolt = <1300000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -90,6 +136,10 @@ cpu0: cpu@0 {
 			reg = <0>;
 			enable-method = "psci";
 			next-level-cache = <&L2>;
+			clocks = <&ccu CLK_CPUX>;
+			clock-names = "cpu";
+			operating-points-v2 = <&cpu0_opp_table>;
+			#cooling-cells = <2>;
 		};
 
 		cpu1: cpu@1 {
@@ -98,6 +148,10 @@ cpu1: cpu@1 {
 			reg = <1>;
 			enable-method = "psci";
 			next-level-cache = <&L2>;
+			clocks = <&ccu CLK_CPUX>;
+			clock-names = "cpu";
+			operating-points-v2 = <&cpu0_opp_table>;
+			#cooling-cells = <2>;
 		};
 
 		cpu2: cpu@2 {
@@ -106,6 +160,10 @@ cpu2: cpu@2 {
 			reg = <2>;
 			enable-method = "psci";
 			next-level-cache = <&L2>;
+			clocks = <&ccu CLK_CPUX>;
+			clock-names = "cpu";
+			operating-points-v2 = <&cpu0_opp_table>;
+			#cooling-cells = <2>;
 		};
 
 		cpu3: cpu@3 {
@@ -114,6 +172,10 @@ cpu3: cpu@3 {
 			reg = <3>;
 			enable-method = "psci";
 			next-level-cache = <&L2>;
+			clocks = <&ccu CLK_CPUX>;
+			clock-names = "cpu";
+			operating-points-v2 = <&cpu0_opp_table>;
+			#cooling-cells = <2>;
 		};
 
 		L2: l2-cache {
@@ -218,6 +280,46 @@ cpu_thermal: cpu0-thermal {
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

