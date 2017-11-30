From: tyler-yzvPICuk2AAEdKtRPRuaE5USO3DlRtUf@public.gmane.org
Subject: [PATCH 4/8] ARM: dts: imx7s: add dma support
Date: Thu, 30 Nov 2017 12:14:30 -0800
Message-ID: <20171130201434.14122-5-tyler@opensourcefoundries.com>
References: <20171130201434.14122-1-tyler@opensourcefoundries.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171130201434.14122-1-tyler-yzvPICuk2AAEdKtRPRuaE5USO3DlRtUf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tyler Baker <tyler-yzvPICuk2AAEdKtRPRuaE5USO3DlRtUf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Tyler Baker <tyler-yzvPICuk2AAEdKtRPRuaE5USO3DlRtUf@public.gmane.org>

Enable dma on all SPI and UART interfaces.

Signed-off-by: Tyler Baker <tyler-yzvPICuk2AAEdKtRPRuaE5USO3DlRtUf@public.gmane.org>
---
 arch/arm/boot/dts/imx7s.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index 82ad26e..7b85659 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -700,6 +700,8 @@
 				clocks = <&clks IMX7D_ECSPI1_ROOT_CLK>,
 					<&clks IMX7D_ECSPI1_ROOT_CLK>;
 				clock-names = "ipg", "per";
+				dmas = <&sdma 0 7 1>, <&sdma 1 7 2>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
@@ -712,6 +714,8 @@
 				clocks = <&clks IMX7D_ECSPI2_ROOT_CLK>,
 					<&clks IMX7D_ECSPI2_ROOT_CLK>;
 				clock-names = "ipg", "per";
+				dmas = <&sdma 2 7 1>, <&sdma 3 7 2>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
@@ -724,6 +728,8 @@
 				clocks = <&clks IMX7D_ECSPI3_ROOT_CLK>,
 					<&clks IMX7D_ECSPI3_ROOT_CLK>;
 				clock-names = "ipg", "per";
+				dmas = <&sdma 4 7 1>, <&sdma 5 7 2>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
