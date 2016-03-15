From: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: [PATCH 1/9] ARM: dts: imx7d: add lcdif support
Date: Tue, 15 Mar 2016 11:30:18 +0100
Message-ID: <1458037826-19375-2-git-send-email-gary.bisson@boundarydevices.com>
References: <1458037826-19375-1-git-send-email-gary.bisson@boundarydevices.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458037826-19375-1-git-send-email-gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, troy.kisky-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org, Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the device node for the i.MX7 eLCDIF interface.

Signed-off-by: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
---
 arch/arm/boot/dts/imx7d.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
index b5a50e0..a768716 100644
--- a/arch/arm/boot/dts/imx7d.dtsi
+++ b/arch/arm/boot/dts/imx7d.dtsi
@@ -608,6 +608,17 @@
 				status = "disabled";
 			};
 
+			lcdif: lcdif@30730000 {
+				compatible = "fsl,imx7d-lcdif", "fsl,imx28-lcdif";
+				reg = <0x30730000 0x10000>;
+				interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX7D_LCDIF_PIXEL_ROOT_CLK>,
+					<&clks IMX7D_CLK_DUMMY>,
+					<&clks IMX7D_CLK_DUMMY>;
+				clock-names = "pix", "axi", "disp_axi";
+				status = "disabled";
+			};
+
 			pwm1: pwm@30660000 {
 				compatible = "fsl,imx7d-pwm", "fsl,imx27-pwm";
 				reg = <0x30660000 0x10000>;
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
