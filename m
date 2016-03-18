From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 08/10] ARM: dts: rockchip: override edp hpd handling on veyron-pinky and speedy
Date: Fri, 18 Mar 2016 02:40:04 +0100
Message-ID: <1458265206-15733-9-git-send-email-heiko@sntech.de>
References: <1458265206-15733-1-git-send-email-heiko@sntech.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458265206-15733-1-git-send-email-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Pinky boards don't have the hotplug pin connected. So remove the
hotplug pinctrl setting and enable the force-hpd option, to allow
them to find the display too.

While on speedy boards, the hotplug pin is connected, judging by comments
in a chromeos change it seems the "panels HPD voltage is too low to be
detected", so it also needs the forced hotplug, as we of course also know
that a display is connected.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 arch/arm/boot/dts/rk3288-veyron-pinky.dts  | 7 +++++++
 arch/arm/boot/dts/rk3288-veyron-speedy.dts | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-veyron-pinky.dts b/arch/arm/boot/dts/rk3288-veyron-pinky.dts
index 94b56e3..d44351e 100644
--- a/arch/arm/boot/dts/rk3288-veyron-pinky.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-pinky.dts
@@ -65,6 +65,13 @@
 	pinctrl-0 = <&emmc_clk &emmc_cmd &emmc_bus8 &emmc_reset>;
 };
 
+&edp {
+	/delete-property/pinctrl-names;
+	/delete-property/pinctrl-0;
+
+	force-hpd;
+};
+
 &gpio_keys {
 	pinctrl-0 = <&pwr_key_h &ap_lid_int_l>;
 
diff --git a/arch/arm/boot/dts/rk3288-veyron-speedy.dts b/arch/arm/boot/dts/rk3288-veyron-speedy.dts
index e62cdee..90aa145 100644
--- a/arch/arm/boot/dts/rk3288-veyron-speedy.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-speedy.dts
@@ -97,6 +97,13 @@
 	temperature = <70000>;
 };
 
+&edp {
+	/delete-property/pinctrl-names;
+	/delete-property/pinctrl-0;
+
+	force-hpd;
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
