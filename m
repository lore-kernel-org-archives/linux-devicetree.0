From: "Ivan T. Ivanov" <ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 2/2] arm64: dts: qcom: 8x16: UART1 and UART2 use DMA for RX and TX
Date: Fri, 18 Sep 2015 16:18:54 +0300
Message-ID: <1442582334-29387-3-git-send-email-ivan.ivanov@linaro.org>
References: <1442582334-29387-1-git-send-email-ivan.ivanov@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442582334-29387-1-git-send-email-ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add DMA channels definitions for UART1 and UART2 controllers.

Signed-off-by: Ivan T. Ivanov <ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 85f7bee33c18..4d313a9eba7b 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -108,6 +108,8 @@
 			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&gcc GCC_BLSP1_UART1_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
 			clock-names = "core", "iface";
+			dmas = <&blsp_dma 1>, <&blsp_dma 0>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};

@@ -117,6 +119,8 @@
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
 			clock-names = "core", "iface";
+			dmas = <&blsp_dma 3>, <&blsp_dma 2>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};

--
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
