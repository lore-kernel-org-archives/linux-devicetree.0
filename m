From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 1/2] ARM: dts: rockchip: add hym8563 rtc to Radxa Rock board
Date: Wed, 20 Aug 2014 21:07:22 +0200
Message-ID: <2306550.nl6CA81PdX@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The Radxa Rock uses a hym8563 as rtc. Add the i2c device and necessary
pinconfig for the interrupt pin - labeled rtc_int in the schematics.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
if nobody complains I'll queue this into my v3.18-next/dts branch

 arch/arm/boot/dts/rk3188-radxarock.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/rk3188-radxarock.dts b/arch/arm/boot/dts/rk3188-radxarock.dts
index ef72faf..ff35acfa 100644
--- a/arch/arm/boot/dts/rk3188-radxarock.dts
+++ b/arch/arm/boot/dts/rk3188-radxarock.dts
@@ -80,6 +80,17 @@
 	status = "okay";
 	clock-frequency = <400000>;
 
+	rtc@51 {
+		compatible = "haoyu,hym8563";
+		reg = <0x51>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&rtc_int>;
+		#clock-cells = <0>;
+		clock-output-names = "xin32k";
+	};
+
 	act8846: act8846@5a {
 		compatible = "active-semi,act8846";
 		reg = <0x5a>;
@@ -196,6 +207,12 @@
 		};
 	};
 
+	hym8563 {
+		rtc_int: rtc-int {
+			rockchip,pins = <RK_GPIO0 0 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
 	ir-receiver {
 		ir_recv_pin: ir-recv-pin {
 			rockchip,pins = <RK_GPIO0 10 RK_FUNC_GPIO &pcfg_pull_none>;
-- 
1.9.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
