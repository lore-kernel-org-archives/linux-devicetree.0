From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 4/4] ARM: dts: apq8064: Add ADM configuration node
Date: Wed,  4 Jan 2017 13:34:14 +0000
Message-ID: <1483536854-21389-4-git-send-email-srinivas.kandagatla@linaro.org>
References: <1483536854-21389-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1483536854-21389-1-git-send-email-srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Ivan T. Ivanov" <ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: "Ivan T. Ivanov" <ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Add Application Data Mover (DMA) device node.
Connect GSBI6 UARTDM RX and TX channels to it.

Signed-off-by: Ivan T. Ivanov <ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts |  4 ++++
 arch/arm/boot/dts/qcom-apq8064.dtsi        | 28 ++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
index 881ce70..eec67cd 100644
--- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
@@ -234,6 +234,10 @@
 			};
 		};
 
+		adm: dma@18320000 {
+			status = "okay";
+		};
+
 		sata_phy0: phy@1b400000 {
 			status = "okay";
 		};
diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index e68a8a1..8a7c325 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -564,6 +564,7 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
+			syscon-tcsr = <&tcsr>;
 
 			gsbi6_serial: serial@16540000 {
 				compatible = "qcom,msm-uartdm-v1.3", "qcom,msm-uartdm";
@@ -572,6 +573,13 @@
 				interrupts = <0 156 0x0>;
 				clocks = <&gcc GSBI6_UART_CLK>, <&gcc GSBI6_H_CLK>;
 				clock-names = "core", "iface";
+
+				qcom,rx-crci = <11>;
+				qcom,tx-crci = <6>;
+
+				dmas = <&adm 6>, <&adm 7>;
+				dma-names = "rx", "tx";
+
 				status = "disabled";
 			};
 
@@ -1059,6 +1067,26 @@
 			};
 		};
 
+		adm: dma@18320000 {
+			compatible = "qcom,adm";
+			reg = <0x18320000 0xE0000>;
+			interrupts = <GIC_SPI 171 IRQ_TYPE_NONE>;
+			#dma-cells = <1>;
+
+			clocks = <&gcc ADM0_CLK>, <&gcc ADM0_PBUS_CLK>;
+			clock-names = "core", "iface";
+
+			resets = <&gcc ADM0_RESET>,
+				 <&gcc ADM0_PBUS_RESET>,
+				 <&gcc ADM0_C0_RESET>,
+				 <&gcc ADM0_C1_RESET>,
+				 <&gcc ADM0_C2_RESET>;
+			reset-names = "clk", "pbus", "c0", "c1", "c2";
+			qcom,ee = <1>;
+
+			status = "disabled";
+		};
+
 		tcsr: syscon@1a400000 {
 			compatible = "qcom,tcsr-apq8064", "syscon";
 			reg = <0x1a400000 0x100>;
-- 
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
