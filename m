From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 01/12] ARM: dts: imx51-ts4800: Fix syscon and touschscreen nodes
Date: Fri,  1 Dec 2017 17:24:34 -0200
Message-ID: <1512156285-18451-1-git-send-email-festevam@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Damien Riegel <damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>

The syscon node has an incorrect notation for its unit address and the
wdt node has an unneeded unit address.

Fix them so that the following build warnings with W=1 are gone:

arch/arm/boot/dts/imx51-ts4800.dtb: Warning (unit_address_vs_reg): Node /memory has a reg or ranges property, but no unit name
arch/arm/boot/dts/imx51-ts4800.dtb: Warning (unit_address_vs_reg): Node /soc/aips@80000000/weim@83fda000/fpga@0/syscon@b0010000/wdt@e has a unit name, but no reg property
arch/arm/boot/dts/imx51-ts4800.dtb: Warning (unit_address_vs_reg): Node /soc/aips@80000000/weim@83fda000/fpga@0/touchscreen has a reg or ranges property, but no unit name
arch/arm/boot/dts/imx51-ts4800.dtb: Warning (simple_bus_reg): Node /soc/aips@80000000/weim@83fda000/fpga@0/syscon@b0010000 simple-bus unit address format error, expected "10000"
arch/arm/boot/dts/imx51-ts4800.dtb: Warning (simple_bus_reg): Node /soc/aips@80000000/weim@83fda000/fpga@0/touchscreen simple-bus unit address format error, expected "12000"

Cc: Damien Riegel <damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Signed-off-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
---
 arch/arm/boot/dts/imx51-ts4800.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/imx51-ts4800.dts b/arch/arm/boot/dts/imx51-ts4800.dts
index 564233e..f59b02b 100644
--- a/arch/arm/boot/dts/imx51-ts4800.dts
+++ b/arch/arm/boot/dts/imx51-ts4800.dts
@@ -149,18 +149,18 @@
 		#size-cells = <1>;
 		ranges = <0 0 0 0x1d000>;
 
-		syscon: syscon@b0010000 {
+		syscon: syscon@10000 {
 			compatible = "syscon", "simple-mfd";
 			reg = <0x10000 0x3d>;
 			reg-io-width = <2>;
 
-			wdt@e {
+			wdt {
 				compatible = "technologic,ts4800-wdt";
 				syscon = <&syscon 0xe>;
 			};
 		};
 
-		touchscreen {
+		touchscreen@12000 {
 			compatible = "technologic,ts4800-ts";
 			reg = <0x12000 0x1000>;
 			syscon = <&syscon 0x10 6>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
