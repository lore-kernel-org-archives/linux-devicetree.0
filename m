Return-Path: <SRS0=rqTW=6V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 332CAC38A2A
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 11:24:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F5E6208CA
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 11:24:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725969AbgEGLYt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 May 2020 07:24:49 -0400
Received: from foss.arm.com ([217.140.110.172]:56842 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725879AbgEGLYt (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 7 May 2020 07:24:49 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C11751FB;
        Thu,  7 May 2020 04:24:48 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.25])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A82463F68F;
        Thu,  7 May 2020 04:24:47 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Rob Herring <robh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 04/17] arm64: dts: arm: FVP: Fix motherboard .dtsi
Date:   Thu,  7 May 2020 12:24:17 +0100
Message-Id: <20200507112430.183940-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200507112430.183940-1-andre.przywara@arm.com>
References: <20200507112430.183940-1-andre.przywara@arm.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The "motherboard" DT include file was mixing MMIO mapped devices with
other peripherals like fixed clocks or regulators. The simple-bus
binding denies this.

Adjust the .dtsi to declare the clocks and not memory mapped devices
outside of the bus node.

This fixes a dtbs_check complaint for the fastmodel DTs.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../boot/dts/arm/rtsm_ve-motherboard.dtsi     | 136 +++++++++---------
 1 file changed, 68 insertions(+), 68 deletions(-)

diff --git a/arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi b/arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi
index d1bfa62ca073..f61e313ab1a4 100644
--- a/arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi
+++ b/arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi
@@ -8,6 +8,74 @@
  * VEMotherBoard.lisa
  */
 / {
+	v2m_clk24mhz: clk24mhz {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "v2m:clk24mhz";
+	};
+
+	v2m_refclk1mhz: refclk1mhz {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <1000000>;
+		clock-output-names = "v2m:refclk1mhz";
+	};
+
+	v2m_refclk32khz: refclk32khz {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		clock-output-names = "v2m:refclk32khz";
+	};
+
+	v2m_fixed_3v3: v2m-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	mcc {
+		compatible = "arm,vexpress,config-bus";
+		arm,vexpress,config-bridge = <&v2m_sysreg>;
+
+		v2m_oscclk1: oscclk1 {
+			/* CLCD clock */
+			compatible = "arm,vexpress-osc";
+			arm,vexpress-sysreg,func = <1 1>;
+			freq-range = <23750000 63500000>;
+			#clock-cells = <0>;
+			clock-output-names = "v2m:oscclk1";
+		};
+
+		reset {
+			compatible = "arm,vexpress-reset";
+			arm,vexpress-sysreg,func = <5 0>;
+		};
+
+		muxfpga {
+			compatible = "arm,vexpress-muxfpga";
+			arm,vexpress-sysreg,func = <7 0>;
+		};
+
+		shutdown {
+			compatible = "arm,vexpress-shutdown";
+			arm,vexpress-sysreg,func = <8 0>;
+		};
+
+		reboot {
+			compatible = "arm,vexpress-reboot";
+			arm,vexpress-sysreg,func = <9 0>;
+		};
+
+		dvimode {
+			compatible = "arm,vexpress-dvimode";
+			arm,vexpress-sysreg,func = <11 0>;
+		};
+	};
+
 	bus@8000000 {
 		motherboard {
 			arm,v2m-memory-map = "rs1";
@@ -30,27 +98,6 @@
 				interrupts = <15>;
 			};
 
-			v2m_clk24mhz: clk24mhz {
-				compatible = "fixed-clock";
-				#clock-cells = <0>;
-				clock-frequency = <24000000>;
-				clock-output-names = "v2m:clk24mhz";
-			};
-
-			v2m_refclk1mhz: refclk1mhz {
-				compatible = "fixed-clock";
-				#clock-cells = <0>;
-				clock-frequency = <1000000>;
-				clock-output-names = "v2m:refclk1mhz";
-			};
-
-			v2m_refclk32khz: refclk32khz {
-				compatible = "fixed-clock";
-				#clock-cells = <0>;
-				clock-frequency = <32768>;
-				clock-output-names = "v2m:refclk32khz";
-			};
-
 			iofpga@300000000 {
 				compatible = "simple-bus";
 				#address-cells = <1>;
@@ -198,53 +245,6 @@
 					};
 				};
 			};
-
-			v2m_fixed_3v3: v2m-3v3 {
-				compatible = "regulator-fixed";
-				regulator-name = "3V3";
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-always-on;
-			};
-
-			mcc {
-				compatible = "arm,vexpress,config-bus";
-				arm,vexpress,config-bridge = <&v2m_sysreg>;
-
-				v2m_oscclk1: oscclk1 {
-					/* CLCD clock */
-					compatible = "arm,vexpress-osc";
-					arm,vexpress-sysreg,func = <1 1>;
-					freq-range = <23750000 63500000>;
-					#clock-cells = <0>;
-					clock-output-names = "v2m:oscclk1";
-				};
-
-				reset {
-					compatible = "arm,vexpress-reset";
-					arm,vexpress-sysreg,func = <5 0>;
-				};
-
-				muxfpga {
-					compatible = "arm,vexpress-muxfpga";
-					arm,vexpress-sysreg,func = <7 0>;
-				};
-
-				shutdown {
-					compatible = "arm,vexpress-shutdown";
-					arm,vexpress-sysreg,func = <8 0>;
-				};
-
-				reboot {
-					compatible = "arm,vexpress-reboot";
-					arm,vexpress-sysreg,func = <9 0>;
-				};
-
-				dvimode {
-					compatible = "arm,vexpress-dvimode";
-					arm,vexpress-sysreg,func = <11 0>;
-				};
-			};
 		};
 	};
 };
-- 
2.17.1

