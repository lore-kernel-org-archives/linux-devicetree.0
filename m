From: WingMan Kwok <w-kwok2-l0cyMroinI0@public.gmane.org>
Subject: [PATCH] ARM: dts: keystone: use one to one address translations under netcp
Date: Tue, 1 Sep 2015 16:28:44 -0400
Message-ID: <1441139324-29296-1-git-send-email-w-kwok2@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: m-karicheri2-l0cyMroinI0@public.gmane.org, WingMan Kwok <w-kwok2-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Network subsystem NetCP in Keystone-2 devices includes some HW blocks
that are memory mapped to ranges outside that of the NetCP itself.
Thus address space of a child node of the NetCP node needs to be
mapped 1:1 onto the parent address space.  Hence empty ranges
should be used under the NetCP node.

Signed-off-by: WingMan Kwok <w-kwok2-l0cyMroinI0@public.gmane.org>
---
 arch/arm/boot/dts/k2e-netcp.dtsi  |    8 +++-----
 arch/arm/boot/dts/k2hk-netcp.dtsi |   14 ++++++--------
 arch/arm/boot/dts/k2l-netcp.dtsi  |    8 +++-----
 3 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/k2e-netcp.dtsi b/arch/arm/boot/dts/k2e-netcp.dtsi
index b13b3c9..e103ed9 100644
--- a/arch/arm/boot/dts/k2e-netcp.dtsi
+++ b/arch/arm/boot/dts/k2e-netcp.dtsi
@@ -111,9 +111,7 @@ netcp: netcp@24000000 {
 	compatible = "ti,netcp-1.0";
 	#address-cells = <1>;
 	#size-cells = <1>;
-
-	/* NetCP address range */
-	ranges = <0 0x24000000 0x1000000>;
+	ranges;
 
 	clocks = <&papllclk>, <&clkcpgmac>, <&chipclk12>;
 	dma-coherent;
@@ -127,10 +125,10 @@ netcp: netcp@24000000 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges;
-		gbe@200000 { /* ETHSS */
+		gbe@24200000 { /* ETHSS */
 			label = "netcp-gbe";
 			compatible = "ti,netcp-gbe-9";
-			reg = <0x200000 0x900>, <0x220000 0x20000>;
+			reg = <0x24200000 0x900>, <0x24220000 0x20000>;
 			/* enable-ale; */
 			tx-queue = <896>;
 			tx-channel = "nettx";
diff --git a/arch/arm/boot/dts/k2hk-netcp.dtsi b/arch/arm/boot/dts/k2hk-netcp.dtsi
index 77a32c3..3b885f5 100644
--- a/arch/arm/boot/dts/k2hk-netcp.dtsi
+++ b/arch/arm/boot/dts/k2hk-netcp.dtsi
@@ -127,9 +127,7 @@ netcp: netcp@2000000 {
 	compatible = "ti,netcp-1.0";
 	#address-cells = <1>;
 	#size-cells = <1>;
-
-	/* NetCP address range */
-	ranges  = <0 0x2000000 0x100000>;
+	ranges;
 
 	clocks = <&papllclk>, <&clkcpgmac>, <&chipclk12>;
 	dma-coherent;
@@ -140,15 +138,15 @@ netcp: netcp@2000000 {
 	ti,navigator-dma-names = "netrx0", "netrx1", "nettx";
 
 	netcp-devices {
-		ranges;
 		#address-cells = <1>;
 		#size-cells = <1>;
-		gbe@90000 { /* ETHSS */
-			#address-cells = <1>;
-			#size-cells = <1>;
+		ranges;
+		gbe@2090000 { /* ETHSS */
 			label = "netcp-gbe";
 			compatible = "ti,netcp-gbe";
-			reg = <0x90000 0x300>, <0x90400 0x400>, <0x90800 0x700>;
+			reg = <0x02090000 0x300>,
+			      <0x02090400 0x400>,
+			      <0x02090800 0x700>;
 			/* enable-ale; */
 			tx-queue = <648>;
 			tx-channel = "nettx";
diff --git a/arch/arm/boot/dts/k2l-netcp.dtsi b/arch/arm/boot/dts/k2l-netcp.dtsi
index 6b95284..97ae805 100644
--- a/arch/arm/boot/dts/k2l-netcp.dtsi
+++ b/arch/arm/boot/dts/k2l-netcp.dtsi
@@ -110,9 +110,7 @@ netcp: netcp@26000000 {
 	compatible = "ti,netcp-1.0";
 	#address-cells = <1>;
 	#size-cells = <1>;
-
-	/* NetCP address range */
-	ranges = <0 0x26000000 0x1000000>;
+	ranges;
 
 	clocks = <&papllclk>, <&clkcpgmac>, <&chipclk12>;
 	dma-coherent;
@@ -126,10 +124,10 @@ netcp: netcp@26000000 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges;
-		gbe@200000 { /* ETHSS */
+		gbe@26200000 { /* ETHSS */
 			label = "netcp-gbe";
 			compatible = "ti,netcp-gbe-5";
-			reg = <0x200000 0x900>, <0x220000 0x20000>;
+			reg = <0x26200000 0x900>, <0x26220000 0x20000>;
 			/* enable-ale; */
 			tx-queue = <896>;
 			tx-channel = "nettx";
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
