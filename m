From: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: [PATCH v3 2/9] ARM: dts: imx7d: add flexcan support
Date: Sat,  2 Apr 2016 18:25:44 +0200
Message-ID: <1459614351-16731-3-git-send-email-gary.bisson@boundarydevices.com>
References: <1458050668-26748-1-git-send-email-gary.bisson@boundarydevices.com>
 <1459614351-16731-1-git-send-email-gary.bisson@boundarydevices.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459614351-16731-1-git-send-email-gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, troy.kisky-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org, Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the device nodes for the i.MX7 FlexCAN buses.

Signed-off-by: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
---

Changes v1 -> v2:
- none
Changes v2 -> v3:
- Re-order flexcan nodes by unit-address order
- Remove flexcan unnecessary stop-mode property

---
 arch/arm/boot/dts/imx7d.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
index 2547e16..6b3faa2 100644
--- a/arch/arm/boot/dts/imx7d.dtsi
+++ b/arch/arm/boot/dts/imx7d.dtsi
@@ -704,6 +704,26 @@
 				status = "disabled";
 			};
 
+			flexcan1: can@30a00000 {
+				compatible = "fsl,imx7d-flexcan", "fsl,imx6q-flexcan";
+				reg = <0x30a00000 0x10000>;
+				interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX7D_CLK_DUMMY>,
+					<&clks IMX7D_CAN1_ROOT_CLK>;
+				clock-names = "ipg", "per";
+				status = "disabled";
+			};
+
+			flexcan2: can@30a10000 {
+				compatible = "fsl,imx7d-flexcan", "fsl,imx6q-flexcan";
+				reg = <0x30a10000 0x10000>;
+				interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX7D_CLK_DUMMY>,
+					<&clks IMX7D_CAN2_ROOT_CLK>;
+				clock-names = "ipg", "per";
+				status = "disabled";
+			};
+
 			i2c1: i2c@30a20000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
