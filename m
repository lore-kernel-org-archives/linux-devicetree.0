From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 08/11] ARM: dts: imx7s: Add unit address and reg for the anatop nodes
Date: Wed, 29 Nov 2017 16:46:16 -0200
Message-ID: <1511981179-12660-8-git-send-email-festevam@gmail.com>
References: <1511981179-12660-1-git-send-email-festevam@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1511981179-12660-1-git-send-email-festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>

Add unit address and reg for the anatop nodes in order to fix the
following build warnings with W=1:

arch/arm/boot/dts/imx7d-cl-som-imx7.dtb: Warning (simple_bus_reg): Node /soc/aips-bus@30000000/anatop@30360000/regulator-vdd1p0d missing or empty reg/ranges property

Signed-off-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
---
 arch/arm/boot/dts/imx7s.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index 81467ac..2ceb37d 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -522,8 +522,11 @@
 				reg = <0x30360000 0x10000>;
 				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
 					<GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 
-				reg_1p0d: regulator-vdd1p0d {
+				reg_1p0d: regulator-vdd1p0d@30360210 {
+					reg = <0x30360210>;
 					compatible = "fsl,anatop-regulator";
 					regulator-name = "vdd1p0d";
 					regulator-min-microvolt = <800000>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
