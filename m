Return-Path: <SRS0=QJws=63=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC95CA90AF
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 10:30:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 62F92206CC
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 10:30:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732622AbgEMKaj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 13 May 2020 06:30:39 -0400
Received: from foss.arm.com ([217.140.110.172]:42614 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729731AbgEMKai (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 13 May 2020 06:30:38 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC92E11B3;
        Wed, 13 May 2020 03:30:37 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.25])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2C963F305;
        Wed, 13 May 2020 03:30:36 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Rob Herring <robh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v3 06/20] arm64: dts: arm: juno: Move fixed devices out of bus node
Date:   Wed, 13 May 2020 11:30:02 +0100
Message-Id: <20200513103016.130417-7-andre.przywara@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200513103016.130417-1-andre.przywara@arm.com>
References: <20200513103016.130417-1-andre.przywara@arm.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The devicetree compiler complains when DT nodes without a reg property
live inside a (simple) bus node:
Warning (simple_bus_reg): Node /bus@8000000/v2m_refclk32khz
                          missing or empty reg/ranges property

Move the fixed clocks, the fixed regulator, and the gpio keys to the
root node, since they do not depend on any busses.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/arm/juno-motherboard.dtsi | 158 +++++++++---------
 1 file changed, 79 insertions(+), 79 deletions(-)

diff --git a/arch/arm64/boot/dts/arm/juno-motherboard.dtsi b/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
index d5cefddde08c..f3279327a665 100644
--- a/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
@@ -8,35 +8,90 @@
  */
 
 / {
-	bus@8000000 {
-		mb_clk24mhz: clk24mhz {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <24000000>;
-			clock-output-names = "juno_mb:clk24mhz";
-		};
+	mb_clk24mhz: clk24mhz {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "juno_mb:clk24mhz";
+	};
 
-		mb_clk25mhz: clk25mhz {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <25000000>;
-			clock-output-names = "juno_mb:clk25mhz";
-		};
+	mb_clk25mhz: clk25mhz {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+		clock-output-names = "juno_mb:clk25mhz";
+	};
 
-		v2m_refclk1mhz: refclk1mhz {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <1000000>;
-			clock-output-names = "juno_mb:refclk1mhz";
-		};
+	v2m_refclk1mhz: refclk1mhz {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <1000000>;
+		clock-output-names = "juno_mb:refclk1mhz";
+	};
 
-		v2m_refclk32khz: refclk32khz {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
-			clock-output-names = "juno_mb:refclk32khz";
+	v2m_refclk32khz: refclk32khz {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		clock-output-names = "juno_mb:refclk32khz";
+	};
+
+	mb_fixed_3v3: mcc-sb-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "MCC_SB_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		power-button {
+			debounce-interval = <50>;
+			wakeup-source;
+			linux,code = <116>;
+			label = "POWER";
+			gpios = <&iofpga_gpio0 0 0x4>;
+		};
+		home-button {
+			debounce-interval = <50>;
+			wakeup-source;
+			linux,code = <102>;
+			label = "HOME";
+			gpios = <&iofpga_gpio0 1 0x4>;
+		};
+		rlock-button {
+			debounce-interval = <50>;
+			wakeup-source;
+			linux,code = <152>;
+			label = "RLOCK";
+			gpios = <&iofpga_gpio0 2 0x4>;
+		};
+		vol-up-button {
+			debounce-interval = <50>;
+			wakeup-source;
+			linux,code = <115>;
+			label = "VOL+";
+			gpios = <&iofpga_gpio0 3 0x4>;
 		};
+		vol-down-button {
+			debounce-interval = <50>;
+			wakeup-source;
+			linux,code = <114>;
+			label = "VOL-";
+			gpios = <&iofpga_gpio0 4 0x4>;
+		};
+		nmi-button {
+			debounce-interval = <50>;
+			wakeup-source;
+			linux,code = <99>;
+			label = "NMI";
+			gpios = <&iofpga_gpio0 5 0x4>;
+		};
+	};
 
+	bus@8000000 {
 		motherboard {
 			compatible = "arm,vexpress,v2p-p1", "simple-bus";
 			#address-cells = <2>;  /* SMB chipselect number and offset */
@@ -48,61 +103,6 @@
 			arm,vexpress,site = <0>;
 			arm,v2m-memory-map = "rs1";
 
-			mb_fixed_3v3: mcc-sb-3v3 {
-				compatible = "regulator-fixed";
-				regulator-name = "MCC_SB_3V3";
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-always-on;
-			};
-
-			gpio-keys {
-				compatible = "gpio-keys";
-
-				power-button {
-					debounce-interval = <50>;
-					wakeup-source;
-					linux,code = <116>;
-					label = "POWER";
-					gpios = <&iofpga_gpio0 0 0x4>;
-				};
-				home-button {
-					debounce-interval = <50>;
-					wakeup-source;
-					linux,code = <102>;
-					label = "HOME";
-					gpios = <&iofpga_gpio0 1 0x4>;
-				};
-				rlock-button {
-					debounce-interval = <50>;
-					wakeup-source;
-					linux,code = <152>;
-					label = "RLOCK";
-					gpios = <&iofpga_gpio0 2 0x4>;
-				};
-				vol-up-button {
-					debounce-interval = <50>;
-					wakeup-source;
-					linux,code = <115>;
-					label = "VOL+";
-					gpios = <&iofpga_gpio0 3 0x4>;
-				};
-				vol-down-button {
-					debounce-interval = <50>;
-					wakeup-source;
-					linux,code = <114>;
-					label = "VOL-";
-					gpios = <&iofpga_gpio0 4 0x4>;
-				};
-				nmi-button {
-					debounce-interval = <50>;
-					wakeup-source;
-					linux,code = <99>;
-					label = "NMI";
-					gpios = <&iofpga_gpio0 5 0x4>;
-				};
-			};
-
 			flash@0 {
 				/* 2 * 32MiB NOR Flash memory mounted on CS0 */
 				compatible = "arm,vexpress-flash", "cfi-flash";
-- 
2.17.1

