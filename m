From: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v5 09/11] arm64: dts: Add I2C DT nodes for Stingray SoC
Date: Fri, 26 May 2017 14:55:02 +0530
Message-ID: <1495790704-2438-10-git-send-email-anup.patel@broadcom.com>
References: <1495790704-2438-1-git-send-email-anup.patel@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1495790704-2438-1-git-send-email-anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Oza Pawandeep <oza.oza-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Srinath Mannam <srinath.mannam-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Pramod Kumar <pramod.kumar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Sandeep Tripathy <sandeep.tripathy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Oza Pawandeep <oza.oza-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

This patch adds I2C DT nodes on Stingray SoC.

Signed-off-by: Oza Pawandeep <oza.oza-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Vikram Prakash <vikram.prakash-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
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
index 059086f..8a077ff 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
@@ -269,6 +269,16 @@
 
 		#include "stingray-pinctrl.dtsi"
 
+		i2c0: i2c@689b0000 {
+			compatible = "brcm,iproc-i2c";
+			reg = <0x000b0000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 177 IRQ_TYPE_NONE>;
+			clock-frequency = <100000>;
+			status = "disabled";
+		};
+
 		gpio_hsls: gpio@689d0000 {
 			compatible = "brcm,iproc-gpio";
 			reg = <0x000d0000 0x864>;
@@ -295,6 +305,16 @@
 					<&pinmux 151 91 4>;
 		};
 
+		i2c1: i2c@689e0000 {
+			compatible = "brcm,iproc-i2c";
+			reg = <0x000e0000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 178 IRQ_TYPE_NONE>;
+			clock-frequency = <100000>;
+			status = "disabled";
+		};
+
 		uart0: uart@68a00000 {
 			device_type = "serial";
 			compatible = "snps,dw-apb-uart";
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
