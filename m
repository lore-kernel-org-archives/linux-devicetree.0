From: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 11/11] arm64: dts: Add PWM and SDHCI DT nodes for Stingray SOC
Date: Sat,  6 May 2017 17:24:46 +0530
Message-ID: <1494071686-19098-12-git-send-email-anup.patel@broadcom.com>
References: <1494071686-19098-1-git-send-email-anup.patel@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1494071686-19098-1-git-send-email-anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Oza Pawandeep <oza-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Srinath Mannam <srinath.mannam-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Pramod Kumar <pramod.kumar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Sandeep Tripathy <sandeep.tripathy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Srinath Mannam <srinath.mannam-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

The Stingray SoC has two instances of SDHCI controller
and one instance of iProc PWM.

Let's enable above mentioned devices in Stingray DT.

Signed-off-by: Srinath Mannam <srinath.mannam-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Signed-off-by: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 .../boot/dts/broadcom/stingray/bcm958742-base.dtsi | 39 ++++++++++++++++++++++
 .../arm64/boot/dts/broadcom/stingray/stingray.dtsi | 28 ++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/stingray/bcm958742-base.dtsi b/arch/arm64/boot/dts/broadcom/stingray/bcm958742-base.dtsi
index 3250d09..a491ce9 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/bcm958742-base.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/bcm958742-base.dtsi
@@ -52,6 +52,28 @@
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
@@ -63,6 +85,10 @@
 	status = "okay";
 };
 
+&pwm {
+	status = "okay";
+};
+
 &i2c0 {
 	status = "okay";
 
@@ -99,3 +125,16 @@
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
index 36b8ced..d5e1944 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
@@ -266,6 +266,14 @@
 			gpio-controller;
 		};
 
+		pwm: pwm@68910000{
+			compatible = "brcm,iproc-pwm";
+			reg = <0x68910000 0x1000>;
+			clocks = <&crmu_ref25m>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@689b0000 {
 			compatible = "brcm,iproc-i2c";
 			reg = <0x689b0000 0x100>;
@@ -425,5 +433,25 @@
 			brcm,nand-has-wp;
 			status = "disabled";
 		};
+
+		sdio0: sdhci@68cf1000 {
+			compatible = "brcm,sdhci-iproc";
+			reg = <0x68cf1000 0x100>;
+			interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
+			bus-width = <8>;
+			clocks = <&sdio0_clk>;
+			iommus = <&smmu 0x6002 0x0000>;
+			status = "disabled";
+		};
+
+		sdio1: sdhci@68cf2000 {
+			compatible = "brcm,sdhci-iproc";
+			reg = <0x68cf2000 0x100>;
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
