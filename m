From: Anup Patel <anup.patel@broadcom.com>
Subject: [PATCH v4 11/11] arm64: dts: Add PWM and SDHCI DT nodes for Stingray SOC
Date: Mon, 22 May 2017 17:28:27 +0530
Message-ID: <1495454307-23464-12-git-send-email-anup.patel@broadcom.com>
References: <1495454307-23464-1-git-send-email-anup.patel@broadcom.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1495454307-23464-1-git-send-email-anup.patel@broadcom.com>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Oza Pawandeep <oza.oza@broadcom.com>, Srinath Mannam <srinath.mannam@broadcom.com>, Pramod Kumar <pramod.kumar@broadcom.com>, Sandeep Tripathy <sandeep.tripathy@broadcom.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, Anup Patel <anup.patel@broadcom.com>
List-Id: devicetree@vger.kernel.org

From: Srinath Mannam <srinath.mannam@broadcom.com>

The Stingray SoC has two instances of SDHCI controller
and one instance of iProc PWM.

Let's enable above mentioned devices in Stingray DT.

Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
Signed-off-by: Anup Patel <anup.patel@broadcom.com>
Reviewed-by: Ray Jui <ray.jui@broadcom.com>
Reviewed-by: Scott Branden <scott.branden@broadcom.com>
---
 .../boot/dts/broadcom/stingray/bcm958742-base.dtsi | 39 ++++++++++++++++++++++
 .../arm64/boot/dts/broadcom/stingray/stingray.dtsi | 28 ++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/stingray/bcm958742-base.dtsi b/arch/arm64/boot/dts/broadcom/stingray/bcm958742-base.dtsi
index ff59a26..5dca7d1 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/bcm958742-base.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/bcm958742-base.dtsi
@@ -43,6 +43,28 @@
 		serial2 = &uart2;
 		serial3 = &uart3;
 	};
+
+	sdio0_vddo_ctrl_reg: sdio0_vddo_ctrl {
+		compatible = "regulator-gpio";
+		regulator-name = "sdio0_vddo_ctrl_reg";
+		regulator-type = "voltage";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&pca9505 18 0>;
+		states = <3300000 0x0
+			  1800000 0x1>;
+	};
+
+	sdio1_vddo_ctrl_reg: sdio1_vddo_ctrl {
+		compatible = "regulator-gpio";
+		regulator-name = "sdio1_vddo_ctrl_reg";
+		regulator-type = "voltage";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&pca9505 19 0>;
+		states = <3300000 0x0
+			  1800000 0x1>;
+	};
 };
 
 &memory { /* Default DRAM banks */
@@ -54,6 +76,10 @@
 	status = "okay";
 };
 
+&pwm {
+	status = "okay";
+};
+
 &i2c0 {
 	status = "okay";
 
@@ -90,3 +116,16 @@
 		#size-cells = <1>;
 	};
 };
+
+&sdio0 {
+	vqmmc-supply = <&sdio0_vddo_ctrl_reg>;
+	non-removable;
+	full-pwr-cycle;
+	status = "okay";
+};
+
+&sdio1 {
+	vqmmc-supply = <&sdio1_vddo_ctrl_reg>;
+	full-pwr-cycle;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
index 642d42c..44ed73c 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
@@ -269,6 +269,14 @@
 
 		#include "stingray-pinctrl.dtsi"
 
+		pwm: pwm@68910000{
+			compatible = "brcm,iproc-pwm";
+			reg = <0x00010000 0x1000>;
+			clocks = <&crmu_ref25m>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@689b0000 {
 			compatible = "brcm,iproc-i2c";
 			reg = <0x000b0000 0x100>;
@@ -428,5 +436,25 @@
 			brcm,nand-has-wp;
 			status = "disabled";
 		};
+
+		sdio0: sdhci@68cf1000 {
+			compatible = "brcm,sdhci-iproc";
+			reg = <0x003f1000 0x100>;
+			interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
+			bus-width = <8>;
+			clocks = <&sdio0_clk>;
+			iommus = <&smmu 0x6002 0x0000>;
+			status = "disabled";
+		};
+
+		sdio1: sdhci@68cf2000 {
+			compatible = "brcm,sdhci-iproc";
+			reg = <0x003f2000 0x100>;
+			interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
+			bus-width = <8>;
+			clocks = <&sdio1_clk>;
+			iommus = <&smmu 0x6003 0x0000>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.7.4

