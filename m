From: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: [PATCH] ARM: dts: rockchip: Enable sata support on rock2 square
Date: Fri, 17 Mar 2017 14:51:17 +0100
Message-ID: <20170317135118.17333-1-sjoerd.simons@collabora.co.uk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

The Rock 2 square board has a USB -> SATA converter hooked up to its usb
host1 connection. Enable the usb controller and always turn on the power
on the 5V sata power connector (controlled by gpio).

Signed-off-by: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>

---

 arch/arm/boot/dts/rk3288-rock2-square.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-rock2-square.dts b/arch/arm/boot/dts/rk3288-rock2-square.dts
index fbf11d410c42..a23a94811be8 100644
--- a/arch/arm/boot/dts/rk3288-rock2-square.dts
+++ b/arch/arm/boot/dts/rk3288-rock2-square.dts
@@ -81,6 +81,17 @@
 		};
 	};
 
+	sata_pwr: sata-prw-regulator {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio0 13 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sata_pwr_en>;
+		/* Always turn on the 5V sata power connector */
+		regulator-always-on;
+		regulator-name = "sata_pwr";
+	};
+
 	spdif_out: spdif-out {
 		compatible = "linux,spdif-dit";
 		#sound-dai-cells = <0>;
@@ -237,6 +248,12 @@
 		};
 	};
 
+	sata {
+		sata_pwr_en: sata-pwr-en {
+			rockchip,pins = <0 13 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	sdmmc {
 		sdmmc_pwr: sdmmc-pwr {
 			rockchip,pins = <7 11 RK_FUNC_GPIO &pcfg_pull_none>;
@@ -265,3 +282,7 @@
 &usb_host0_ehci {
 	status = "okay";
 };
+
+&usb_host1 {
+	status = "okay";
+};
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
