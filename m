From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 09/10] ARM: dts: rockchip: simple panel and backlight supplies on veyron boards
Date: Fri, 18 Mar 2016 02:40:05 +0100
Message-ID: <1458265206-15733-10-git-send-email-heiko@sntech.de>
References: <1458265206-15733-1-git-send-email-heiko@sntech.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458265206-15733-1-git-send-email-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Jerry and Speedy don't need any special handling wrt the backlight or
panel, so only need their backlight and panel-regulators hooked up.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 arch/arm/boot/dts/rk3288-veyron-jerry.dts  | 8 ++++++++
 arch/arm/boot/dts/rk3288-veyron-speedy.dts | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-veyron-jerry.dts b/arch/arm/boot/dts/rk3288-veyron-jerry.dts
index 1a9bef1..f6b2eaa 100644
--- a/arch/arm/boot/dts/rk3288-veyron-jerry.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-jerry.dts
@@ -88,6 +88,14 @@
 	};
 };
 
+&backlight {
+	power-supply = <&backlight_regulator>;
+};
+
+&panel {
+	power-supply= <&panel_regulator>;
+};
+
 &rk808 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pmic_int_l>;
diff --git a/arch/arm/boot/dts/rk3288-veyron-speedy.dts b/arch/arm/boot/dts/rk3288-veyron-speedy.dts
index 90aa145..a0d033f 100644
--- a/arch/arm/boot/dts/rk3288-veyron-speedy.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-speedy.dts
@@ -89,6 +89,10 @@
 	};
 };
 
+&backlight {
+	power-supply = <&backlight_regulator>;
+};
+
 &cpu_alert0 {
 	temperature = <65000>;
 };
@@ -104,6 +108,10 @@
 	force-hpd;
 };
 
+&panel {
+	power-supply= <&panel_regulator>;
+};
+
 &rk808 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pmic_int_l>;
-- 
2.6.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
