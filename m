Return-Path: <SRS0=Wk2R=75=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0987DC433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 16 Jun 2020 20:57:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D76B4207DD
	for <linux-devicetree@archiver.kernel.org>; Tue, 16 Jun 2020 20:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592341032;
	bh=pE6KAEG0FkVf+j0FkRuLIZrJHM/qGhk/wFLAAGhtPi4=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=JIjwodr/p7deHKR1kvZmmjMGZp2t65wlQJGSU2MhE0awN9CGr6SqtvsII8AhBkPHM
	 LbjUwl3+F2bO8BhOfLIdiVfx41Nx37RP6SbloEiewD9Px/sJrf+u3qXUDDakIRuBnZ
	 FaX5bJbIK29lKNQiOScPuY76wrIoofCrFwakAHrs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728518AbgFPU5M (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 16 Jun 2020 16:57:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:50074 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727085AbgFPU5M (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 16 Jun 2020 16:57:12 -0400
Received: from localhost.localdomain (cpe-70-114-128-244.austin.res.rr.com [70.114.128.244])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C1E92208B3;
        Tue, 16 Jun 2020 20:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592341031;
        bh=pE6KAEG0FkVf+j0FkRuLIZrJHM/qGhk/wFLAAGhtPi4=;
        h=From:To:Cc:Subject:Date:From;
        b=E7/S45QDOeRF87SdbIgGsDB2fcP12jZivSQb6sQnJPfBvSbTAxrKaP55GB1HCqZVy
         BjlSO8FGt5mDY4RhsHf3oU6tVAV7QNaC0wIdAv8JH8gi58bO51VRhRqZr8ieefiK5m
         OLjNbsWvDqJ4jVutnFcA2/eyJnAMnJ682cgvfzpY=
From:   Dinh Nguyen <dinguyen@kernel.org>
To:     robh+dt@kernel.org, mark.rutland@arm.com
Cc:     dinguyen@kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: agilex: populate clock dts entries for Intel SoCFPGA Agilex
Date:   Tue, 16 Jun 2020 15:57:06 -0500
Message-Id: <20200616205706.17266-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: "Signed-off-by: Dinh Nguyen" <dinguyen@kernel.org>

Add clock dts entries to the Intel SoCFPGA Agilex platform.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi | 73 +++++++++++++++++++
 .../boot/dts/intel/socfpga_agilex_socdk.dts   |  8 ++
 2 files changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
index f52de8f7806a..e300330536b7 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
@@ -6,6 +6,7 @@
 /dts-v1/;
 #include <dt-bindings/reset/altr,rst-mgr-s10.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clock/agilex-clock.h>
 
 / {
 	compatible = "intel,socfpga-agilex";
@@ -101,6 +102,40 @@
 			fpga-mgr = <&fpga_mgr>;
 		};
 
+		clkmgr: clock-controller@ffd10000 {
+			compatible = "intel,agilex-clkmgr";
+			reg = <0xffd10000 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		clocks {
+			cb_intosc_hs_div2_clk: cb-intosc-hs-div2-clk {
+				#clock-cells = <0>;
+				compatible = "fixed-clock";
+			};
+
+			cb_intosc_ls_clk: cb-intosc-ls-clk {
+				#clock-cells = <0>;
+				compatible = "fixed-clock";
+			};
+
+			f2s_free_clk: f2s-free-clk {
+				#clock-cells = <0>;
+				compatible = "fixed-clock";
+			};
+
+			osc1: osc1 {
+				#clock-cells = <0>;
+				compatible = "fixed-clock";
+			};
+
+			qspi_clk: qspi-clk {
+				#clock-cells = <0>;
+				compatible = "fixed-clock";
+				clock-frequency = <200000000>;
+			};
+		};
+
 		gmac0: ethernet@ff800000 {
 			compatible = "altr,socfpga-stmmac-a10-s10", "snps,dwmac-3.74a", "snps,dwmac";
 			reg = <0xff800000 0x2000>;
@@ -114,6 +149,8 @@
 			snps,multicast-filter-bins = <256>;
 			iommus = <&smmu 1>;
 			altr,sysmgr-syscon = <&sysmgr 0x44 0>;
+			clocks = <&clkmgr AGILEX_EMAC0_CLK>;
+			clock-names = "stmmaceth";
 			status = "disabled";
 		};
 
@@ -130,6 +167,8 @@
 			snps,multicast-filter-bins = <256>;
 			iommus = <&smmu 2>;
 			altr,sysmgr-syscon = <&sysmgr 0x48 8>;
+			clocks = <&clkmgr AGILEX_EMAC1_CLK>;
+			clock-names = "stmmaceth";
 			status = "disabled";
 		};
 
@@ -146,6 +185,8 @@
 			snps,multicast-filter-bins = <256>;
 			iommus = <&smmu 3>;
 			altr,sysmgr-syscon = <&sysmgr 0x4c 16>;
+			clocks = <&clkmgr AGILEX_EMAC2_CLK>;
+			clock-names = "stmmaceth";
 			status = "disabled";
 		};
 
@@ -196,6 +237,7 @@
 			reg = <0xffc02800 0x100>;
 			interrupts = <0 103 4>;
 			resets = <&rst I2C0_RESET>;
+			clocks = <&clkmgr AGILEX_L4_SP_CLK>;
 			status = "disabled";
 		};
 
@@ -206,6 +248,7 @@
 			reg = <0xffc02900 0x100>;
 			interrupts = <0 104 4>;
 			resets = <&rst I2C1_RESET>;
+			clocks = <&clkmgr AGILEX_L4_SP_CLK>;
 			status = "disabled";
 		};
 
@@ -216,6 +259,7 @@
 			reg = <0xffc02a00 0x100>;
 			interrupts = <0 105 4>;
 			resets = <&rst I2C2_RESET>;
+			clocks = <&clkmgr AGILEX_L4_SP_CLK>;
 			status = "disabled";
 		};
 
@@ -226,6 +270,7 @@
 			reg = <0xffc02b00 0x100>;
 			interrupts = <0 106 4>;
 			resets = <&rst I2C3_RESET>;
+			clocks = <&clkmgr AGILEX_L4_SP_CLK>;
 			status = "disabled";
 		};
 
@@ -236,6 +281,7 @@
 			reg = <0xffc02c00 0x100>;
 			interrupts = <0 107 4>;
 			resets = <&rst I2C4_RESET>;
+			clocks = <&clkmgr AGILEX_L4_SP_CLK>;
 			status = "disabled";
 		};
 
@@ -248,6 +294,9 @@
 			fifo-depth = <0x400>;
 			resets = <&rst SDMMC_RESET>;
 			reset-names = "reset";
+			clocks = <&clkmgr AGILEX_L4_MP_CLK>,
+				 <&clkmgr AGILEX_SDMMC_CLK>;
+			clock-names = "biu", "ciu";
 			iommus = <&smmu 5>;
 			status = "disabled";
 		};
@@ -286,6 +335,8 @@
 			#dma-requests = <32>;
 			resets = <&rst DMA_RESET>, <&rst DMA_OCP_RESET>;
 			reset-names = "dma", "dma-ocp";
+			clocks = <&clkmgr AGILEX_L4_MAIN_CLK>;
+			clock-names = "apb_pclk";
 		};
 
 		rst: rstmgr@ffd11000 {
@@ -312,6 +363,9 @@
 				<0 162 4>, <0 163 4>, <0 164 4>, <0 165 4>,
 				<0 166 4>, <0 167 4>, <0 168 4>, <0 169 4>;
 			stream-match-mask = <0x7ff0>;
+			clocks = <&clkmgr AGILEX_MPU_CCU_CLK>,
+				 <&clkmgr AGILEX_L3_MAIN_FREE_CLK>,
+				 <&clkmgr AGILEX_L4_MAIN_CLK>;
 			status = "disabled";
 		};
 
@@ -324,6 +378,7 @@
 			resets = <&rst SPIM0_RESET>;
 			reg-io-width = <4>;
 			num-cs = <4>;
+			clocks = <&clkmgr AGILEX_L4_MAIN_CLK>;
 			status = "disabled";
 		};
 
@@ -336,6 +391,7 @@
 			resets = <&rst SPIM1_RESET>;
 			reg-io-width = <4>;
 			num-cs = <4>;
+			clocks = <&clkmgr AGILEX_L4_MAIN_CLK>;
 			status = "disabled";
 		};
 
@@ -357,24 +413,32 @@
 			compatible = "snps,dw-apb-timer";
 			interrupts = <0 113 4>;
 			reg = <0xffc03000 0x100>;
+			clocks = <&clkmgr AGILEX_L4_SP_CLK>;
+			clock-names = "timer";
 		};
 
 		timer1: timer1@ffc03100 {
 			compatible = "snps,dw-apb-timer";
 			interrupts = <0 114 4>;
 			reg = <0xffc03100 0x100>;
+			clocks = <&clkmgr AGILEX_L4_SP_CLK>;
+			clock-names = "timer";
 		};
 
 		timer2: timer2@ffd00000 {
 			compatible = "snps,dw-apb-timer";
 			interrupts = <0 115 4>;
 			reg = <0xffd00000 0x100>;
+			clocks = <&clkmgr AGILEX_L4_SP_CLK>;
+			clock-names = "timer";
 		};
 
 		timer3: timer3@ffd00100 {
 			compatible = "snps,dw-apb-timer";
 			interrupts = <0 116 4>;
 			reg = <0xffd00100 0x100>;
+			clocks = <&clkmgr AGILEX_L4_SP_CLK>;
+			clock-names = "timer";
 		};
 
 		uart0: serial0@ffc02000 {
@@ -385,6 +449,7 @@
 			reg-io-width = <4>;
 			resets = <&rst UART0_RESET>;
 			status = "disabled";
+			clocks = <&clkmgr AGILEX_L4_SP_CLK>;
 		};
 
 		uart1: serial1@ffc02100 {
@@ -394,6 +459,7 @@
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			resets = <&rst UART1_RESET>;
+			clocks = <&clkmgr AGILEX_L4_SP_CLK>;
 			status = "disabled";
 		};
 
@@ -411,6 +477,7 @@
 			phy-names = "usb2-phy";
 			resets = <&rst USB0_RESET>, <&rst USB0_OCP_RESET>;
 			reset-names = "dwc2", "dwc2-ecc";
+			clocks = <&clkmgr AGILEX_USB_CLK>;
 			iommus = <&smmu 6>;
 			status = "disabled";
 		};
@@ -424,6 +491,7 @@
 			resets = <&rst USB1_RESET>, <&rst USB1_OCP_RESET>;
 			reset-names = "dwc2", "dwc2-ecc";
 			iommus = <&smmu 7>;
+			clocks = <&clkmgr AGILEX_USB_CLK>;
 			status = "disabled";
 		};
 
@@ -432,6 +500,7 @@
 			reg = <0xffd00200 0x100>;
 			interrupts = <0 117 4>;
 			resets = <&rst WATCHDOG0_RESET>;
+			clocks = <&clkmgr AGILEX_L4_SYS_FREE_CLK>;
 			status = "disabled";
 		};
 
@@ -440,6 +509,7 @@
 			reg = <0xffd00300 0x100>;
 			interrupts = <0 118 4>;
 			resets = <&rst WATCHDOG1_RESET>;
+			clocks = <&clkmgr AGILEX_L4_SYS_FREE_CLK>;
 			status = "disabled";
 		};
 
@@ -448,6 +518,7 @@
 			reg = <0xffd00400 0x100>;
 			interrupts = <0 125 4>;
 			resets = <&rst WATCHDOG2_RESET>;
+			clocks = <&clkmgr AGILEX_L4_SYS_FREE_CLK>;
 			status = "disabled";
 		};
 
@@ -456,6 +527,7 @@
 			reg = <0xffd00500 0x100>;
 			interrupts = <0 126 4>;
 			resets = <&rst WATCHDOG3_RESET>;
+			clocks = <&clkmgr AGILEX_L4_SYS_FREE_CLK>;
 			status = "disabled";
 		};
 
@@ -533,6 +605,7 @@
 			cdns,fifo-depth = <128>;
 			cdns,fifo-width = <4>;
 			cdns,trigger-address = <0x00000000>;
+			clocks = <&qspi_clk>;
 
 			status = "disabled";
 		};
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts
index 51d948323bfd..ac6e51b403d8 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts
@@ -41,6 +41,14 @@
 		/* We expect the bootloader to fill in the reg */
 		reg = <0 0 0 0>;
 	};
+
+	soc {
+		clocks {
+			osc1 {
+				clock-frequency = <25000000>;
+			};
+		};
+	};
 };
 
 &gpio1 {
-- 
2.17.1

