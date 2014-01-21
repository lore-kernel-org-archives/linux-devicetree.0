From: Tang Yuantian <Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH] powerpc: T4240: Add ina220 node in dts
Date: Tue, 21 Jan 2014 10:31:13 +0800
Message-ID: <1390271473-23661-1-git-send-email-Yuantian.Tang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: b07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org
Cc: galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tang Yuantian <yuantian.tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Tang Yuantian <Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Tang Yuantian <yuantian.tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Add power sensor chip ina220 node in dts to support
power monitor

Signed-off-by: Tang Yuantian <Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/powerpc/boot/dts/t4240qds.dts | 42 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/powerpc/boot/dts/t4240qds.dts b/arch/powerpc/boot/dts/t4240qds.dts
index 63e81b0..97683f6 100644
--- a/arch/powerpc/boot/dts/t4240qds.dts
+++ b/arch/powerpc/boot/dts/t4240qds.dts
@@ -159,6 +159,48 @@
 						interrupts = <0x1 0x1 0 0>;
 					};
 				};
+
+				i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x2>;
+
+					ina220@40 {
+						compatible = "ti,ina220";
+						reg = <0x40>;
+						shunt-resistor = <1000>;
+					};
+
+					ina220@41 {
+						compatible = "ti,ina220";
+						reg = <0x41>;
+						shunt-resistor = <1000>;
+					};
+
+					ina220@44 {
+						compatible = "ti,ina220";
+						reg = <0x44>;
+						shunt-resistor = <1000>;
+					};
+
+					ina220@45 {
+						compatible = "ti,ina220";
+						reg = <0x45>;
+						shunt-resistor = <1000>;
+					};
+
+					ina220@46 {
+						compatible = "ti,ina220";
+						reg = <0x46>;
+						shunt-resistor = <1000>;
+					};
+
+					ina220@47 {
+						compatible = "ti,ina220";
+						reg = <0x47>;
+						shunt-resistor = <1000>;
+					};
+				};
 			};
 		};
 
-- 
1.8.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
