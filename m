Return-Path: <SRS0=VnZl=7Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7216DC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed,  3 Jun 2020 16:22:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 59E1D207DF
	for <linux-devicetree@archiver.kernel.org>; Wed,  3 Jun 2020 16:22:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgFCQWs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 3 Jun 2020 12:22:48 -0400
Received: from foss.arm.com ([217.140.110.172]:35368 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725995AbgFCQWr (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 3 Jun 2020 12:22:47 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C94FA55D;
        Wed,  3 Jun 2020 09:22:46 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.25])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C6DF3F52E;
        Wed,  3 Jun 2020 09:22:45 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Rob Herring <robh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] arm: dts: vexpress: Move mcc node back into motherboard node
Date:   Wed,  3 Jun 2020 17:22:37 +0100
Message-Id: <20200603162237.16319-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Commit 	d9258898ad49 ("arm64: dts: arm: vexpress: Move fixed devices
out of bus node") moved the "mcc" DT node into the root node, because
it does not have any children using "reg" properties, so does violate
some dtc checks about "simple-bus" nodes.
However this broke the vexpress config-bus code, which walks up the
device tree to find the first node with an "arm,vexpress,site" property.
This gave the wrong result (matching the root node instead of the
motherboard node), so broke the clocks and some other devices for
VExpress boards.

Move the whole node back into its original position. This re-introduces
the dtc warning, but is conceptually the right thing to do. The dtc
warning seems to be overzealous here, there are discussions on fixing or
relaxing this check instead.

Fixes: 	d9258898ad49 ("arm64: dts: arm: vexpress: Move fixed devices out of bus node")
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
P.S. The broken commit has not reached mainline yet, but is already in
arm-soc/arm/dt.

 arch/arm/boot/dts/vexpress-v2m-rs1.dtsi | 146 ++++++++++++------------
 1 file changed, 73 insertions(+), 73 deletions(-)

diff --git a/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi b/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
index e6308fb76183..a88ee5294d35 100644
--- a/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
+++ b/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
@@ -100,79 +100,6 @@
 		};
 	};
 
-	mcc {
-		compatible = "arm,vexpress,config-bus";
-		arm,vexpress,config-bridge = <&v2m_sysreg>;
-
-		oscclk0 {
-			/* MCC static memory clock */
-			compatible = "arm,vexpress-osc";
-			arm,vexpress-sysreg,func = <1 0>;
-			freq-range = <25000000 60000000>;
-			#clock-cells = <0>;
-			clock-output-names = "v2m:oscclk0";
-		};
-
-		v2m_oscclk1: oscclk1 {
-			/* CLCD clock */
-			compatible = "arm,vexpress-osc";
-			arm,vexpress-sysreg,func = <1 1>;
-			freq-range = <23750000 65000000>;
-			#clock-cells = <0>;
-			clock-output-names = "v2m:oscclk1";
-		};
-
-		v2m_oscclk2: oscclk2 {
-			/* IO FPGA peripheral clock */
-			compatible = "arm,vexpress-osc";
-			arm,vexpress-sysreg,func = <1 2>;
-			freq-range = <24000000 24000000>;
-			#clock-cells = <0>;
-			clock-output-names = "v2m:oscclk2";
-		};
-
-		volt-vio {
-			/* Logic level voltage */
-			compatible = "arm,vexpress-volt";
-			arm,vexpress-sysreg,func = <2 0>;
-			regulator-name = "VIO";
-			regulator-always-on;
-			label = "VIO";
-		};
-
-		temp-mcc {
-			/* MCC internal operating temperature */
-			compatible = "arm,vexpress-temp";
-			arm,vexpress-sysreg,func = <4 0>;
-			label = "MCC";
-		};
-
-		reset {
-			compatible = "arm,vexpress-reset";
-			arm,vexpress-sysreg,func = <5 0>;
-		};
-
-		muxfpga {
-			compatible = "arm,vexpress-muxfpga";
-			arm,vexpress-sysreg,func = <7 0>;
-		};
-
-		shutdown {
-			compatible = "arm,vexpress-shutdown";
-			arm,vexpress-sysreg,func = <8 0>;
-		};
-
-		reboot {
-			compatible = "arm,vexpress-reboot";
-			arm,vexpress-sysreg,func = <9 0>;
-		};
-
-		dvimode {
-			compatible = "arm,vexpress-dvimode";
-			arm,vexpress-sysreg,func = <11 0>;
-		};
-	};
-
 	bus@8000000 {
 		motherboard-bus {
 			model = "V2M-P1";
@@ -435,6 +362,79 @@
 						};
 					};
 				};
+
+				mcc {
+					compatible = "arm,vexpress,config-bus";
+					arm,vexpress,config-bridge = <&v2m_sysreg>;
+
+					oscclk0 {
+						/* MCC static memory clock */
+						compatible = "arm,vexpress-osc";
+						arm,vexpress-sysreg,func = <1 0>;
+						freq-range = <25000000 60000000>;
+						#clock-cells = <0>;
+						clock-output-names = "v2m:oscclk0";
+					};
+
+					v2m_oscclk1: oscclk1 {
+						/* CLCD clock */
+						compatible = "arm,vexpress-osc";
+						arm,vexpress-sysreg,func = <1 1>;
+						freq-range = <23750000 65000000>;
+						#clock-cells = <0>;
+						clock-output-names = "v2m:oscclk1";
+					};
+
+					v2m_oscclk2: oscclk2 {
+						/* IO FPGA peripheral clock */
+						compatible = "arm,vexpress-osc";
+						arm,vexpress-sysreg,func = <1 2>;
+						freq-range = <24000000 24000000>;
+						#clock-cells = <0>;
+						clock-output-names = "v2m:oscclk2";
+					};
+
+					volt-vio {
+						/* Logic level voltage */
+						compatible = "arm,vexpress-volt";
+						arm,vexpress-sysreg,func = <2 0>;
+						regulator-name = "VIO";
+						regulator-always-on;
+						label = "VIO";
+					};
+
+					temp-mcc {
+						/* MCC internal operating temperature */
+						compatible = "arm,vexpress-temp";
+						arm,vexpress-sysreg,func = <4 0>;
+						label = "MCC";
+					};
+
+					reset {
+						compatible = "arm,vexpress-reset";
+						arm,vexpress-sysreg,func = <5 0>;
+					};
+
+					muxfpga {
+						compatible = "arm,vexpress-muxfpga";
+						arm,vexpress-sysreg,func = <7 0>;
+					};
+
+					shutdown {
+						compatible = "arm,vexpress-shutdown";
+						arm,vexpress-sysreg,func = <8 0>;
+					};
+
+					reboot {
+						compatible = "arm,vexpress-reboot";
+						arm,vexpress-sysreg,func = <9 0>;
+					};
+
+					dvimode {
+						compatible = "arm,vexpress-dvimode";
+						arm,vexpress-sysreg,func = <11 0>;
+					};
+				};
 			};
 		};
 	};
-- 
2.17.1

