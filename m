From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 10/12] ARM: dts: imx6q-h100: Remove unneeded unit address
Date: Fri,  1 Dec 2017 17:24:43 -0200
Message-ID: <1512156285-18451-10-git-send-email-festevam@gmail.com>
References: <1512156285-18451-1-git-send-email-festevam@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1512156285-18451-1-git-send-email-festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>

Remove the unneeded unit address for the port nodes in order to fix
the following build warnings with W=1:

arch/arm/boot/dts/imx6q-h100.dtb: Warning (unit_address_vs_reg): Node /soc/aips-bus@2100000/i2c@21a0000/tc358743@f/port@0 has a unit name, but no reg property
arch/arm/boot/dts/imx6q-h100.dtb: Warning (unit_address_vs_reg): Node /soc/aips-bus@2100000/mipi@21dc000/port@0 has a unit name, but no reg property

Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
---
 arch/arm/boot/dts/imx6q-h100.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx6q-h100.dts b/arch/arm/boot/dts/imx6q-h100.dts
index 743c11f..cc1ce46 100644
--- a/arch/arm/boot/dts/imx6q-h100.dts
+++ b/arch/arm/boot/dts/imx6q-h100.dts
@@ -205,7 +205,7 @@
 		reset-gpios = <&gpio6 15 GPIO_ACTIVE_LOW>;
 		/* IRQ has a wrong pull resistor which renders it useless  */
 
-		port@0 {
+		port {
 			tc358743_out: endpoint {
 				remote-endpoint = <&mipi_csi2_in>;
 				data-lanes = <1 2 3 4>;
@@ -348,7 +348,7 @@
 &mipi_csi {
 	status = "okay";
 
-	port@0 {
+	port {
 		mipi_csi2_in: endpoint {
 			remote-endpoint = <&tc358743_out>;
 			data-lanes = <1 2 3 4>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
