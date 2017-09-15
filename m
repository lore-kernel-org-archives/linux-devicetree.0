From: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Subject: [PATCH] arm64: dt marvell: extend AP806 system controller size
Date: Fri, 15 Sep 2017 10:50:07 +0300
Message-ID: <d230651ed28aa4344bab7e13e9964d69673ecace.1505461807.git.baruch@tkos.co.il>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Extend the container size to 0x2000 to include the gpio controller at
offset 0x1040.

While at it, add start address notation to the gpio node name to match
its 'offset' property.

Signed-off-by: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
---
 arch/arm64/boot/dts/marvell/armada-ap806.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
index 4d360713ed12..30d48ecf46e0 100644
--- a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
@@ -254,7 +254,7 @@
 
 			ap_syscon: system-controller@6f4000 {
 				compatible = "syscon", "simple-mfd";
-				reg = <0x6f4000 0x1000>;
+				reg = <0x6f4000 0x2000>;
 
 				ap_clk: clock {
 					compatible = "marvell,ap806-clock";
@@ -265,7 +265,7 @@
 					compatible = "marvell,ap806-pinctrl";
 				};
 
-				ap_gpio: gpio {
+				ap_gpio: gpio@1040 {
 					compatible = "marvell,armada-8k-gpio";
 					offset = <0x1040>;
 					ngpios = <20>;
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
