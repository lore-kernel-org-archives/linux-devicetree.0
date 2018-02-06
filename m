From: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 6/7] arm64: dts: Add DMA device node for Spreadtrum SC9860
Date: Tue,  6 Feb 2018 17:28:25 +0800
Message-ID: <ec74e9b83ec9b1c83f7ad54d0a80be68ce7bb2e0.1517908478.git.baolin.wang@linaro.org>
References: <410b2f2d3f3f019c96ec31213647c41cd7f1174d.1517908478.git.baolin.wang@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <410b2f2d3f3f019c96ec31213647c41cd7f1174d.1517908478.git.baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
In-Reply-To: <410b2f2d3f3f019c96ec31213647c41cd7f1174d.1517908478.git.baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
References: <410b2f2d3f3f019c96ec31213647c41cd7f1174d.1517908478.git.baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org, orson.zhai-lxIno14LUO0EEoCn2XhGlw@public.gmane.org, mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

The Spreadtrum SC9860 platform has two DMA controllers, one is located
on the ap-ahb system, and another one is located on the agcp system.

Signed-off-by: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm64/boot/dts/sprd/whale2.dtsi |   34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/sprd/whale2.dtsi b/arch/arm64/boot/dts/sprd/whale2.dtsi
index f2cdf4d..66a881e 100644
--- a/arch/arm64/boot/dts/sprd/whale2.dtsi
+++ b/arch/arm64/boot/dts/sprd/whale2.dtsi
@@ -107,6 +107,23 @@
 			};
 		};
 
+		ap-ahb {
+			compatible = "simple-bus";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			ap_dma: dma-controller@20100000 {
+				compatible = "sprd,sc9860-dma";
+				reg = <0 0x20100000 0 0x4000>;
+				interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+				#dma-cells = <1>;
+				#dma-channels = <32>;
+				clock-names = "enable";
+				clocks = <&apahb_gate CLK_DMA_EB>;
+			};
+		};
+
 		aon {
 			compatible = "simple-bus";
 			#address-cells = <2>;
@@ -151,6 +168,23 @@
 				clocks = <&aon_gate CLK_APCPU_WDG_EB>;
 			};
 		};
+
+		agcp {
+			compatible = "simple-bus";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			agcp_dma: dma-controller@41580000 {
+				compatible = "sprd,sc9860-dma";
+				reg = <0 0x41580000 0 0x4000>;
+				#dma-cells = <1>;
+				#dma-channels = <32>;
+				clock-names = "enable", "ashb_eb";
+				clocks = <&agcp_gate CLK_AGCP_DMAAP_EB>,
+				       <&agcp_gate CLK_AGCP_AP_ASHB_EB>;
+			};
+		};
 	};
 
 	ext_32k: ext_32k {
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
