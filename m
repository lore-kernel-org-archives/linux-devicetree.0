From: Anup Patel <anup.patel@broadcom.com>
Subject: [PATCH v6 09/11] arm64: dts: Add I2C DT nodes for Stingray SoC
Date: Fri,  2 Jun 2017 12:04:33 +0530
Message-ID: <1496385275-6899-10-git-send-email-anup.patel@broadcom.com>
References: <1496385275-6899-1-git-send-email-anup.patel@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1496385275-6899-1-git-send-email-anup.patel@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Oza Pawandeep <oza.oza@broadcom.com>, Srinath Mannam <srinath.mannam@broadcom.com>, Pramod Kumar <pramod.kumar@broadcom.com>, Sandeep Tripathy <sandeep.tripathy@broadcom.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

From: Oza Pawandeep <oza.oza@broadcom.com>

This patch adds I2C DT nodes on Stingray SoC.

Signed-off-by: Oza Pawandeep <oza.oza@broadcom.com>
Reviewed-by: Vikram Prakash <vikram.prakash@broadcom.com>
Reviewed-by: Ray Jui <ray.jui@broadcom.com>
Reviewed-by: Scott Branden <scott.branden@broadcom.com>
---
 .../boot/dts/broadcom/stingray/bcm958742-base.dtsi | 22 ++++++++++++++++++++++
 .../arm64/boot/dts/broadcom/stingray/stingray.dtsi | 20 ++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/stingray/bcm958742-base.dtsi b/arch/arm64/boot/dts/broadcom/stingray/bcm958742-base.dtsi
index aad45a2..ff59a26 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/bcm958742-base.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/bcm958742-base.dtsi
@@ -54,6 +54,28 @@
 	status = "okay";
 };
 
+&i2c0 {
+	status = "okay";
+
+	pca9505: pca9505@20 {
+		compatible = "nxp,pca9505";
+		gpio-controller;
+		#gpio-cells = <2>;
+		reg = <0x20>;
+	};
+};
+
+&i2c1 {
+	status = "okay";
+
+	pcf8574: pcf8574@20 {
+		compatible = "nxp,pcf8574a";
+		gpio-controller;
+		#gpio-cells = <2>;
+		reg = <0x27>;
+	};
+};
+
 &nand {
 	status = "ok";
 	nandcs@0 {
diff --git a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
index e91debe..91ba61e 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
@@ -269,6 +269,16 @@
 
 		#include "stingray-pinctrl.dtsi"
 
+		i2c0: i2c@000b0000 {
+			compatible = "brcm,iproc-i2c";
+			reg = <0x000b0000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 177 IRQ_TYPE_NONE>;
+			clock-frequency = <100000>;
+			status = "disabled";
+		};
+
 		gpio_hsls: gpio@000d0000 {
 			compatible = "brcm,iproc-gpio";
 			reg = <0x000d0000 0x864>;
@@ -295,6 +305,16 @@
 					<&pinmux 151 91 4>;
 		};
 
+		i2c1: i2c@000e0000 {
+			compatible = "brcm,iproc-i2c";
+			reg = <0x000e0000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 178 IRQ_TYPE_NONE>;
+			clock-frequency = <100000>;
+			status = "disabled";
+		};
+
 		uart0: uart@00100000 {
 			device_type = "serial";
 			compatible = "snps,dw-apb-uart";
-- 
2.7.4
