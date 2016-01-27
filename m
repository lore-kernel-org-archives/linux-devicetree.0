From: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [RESEND PATCH] ARM: dts: rockchip: add the leds control for kylin board
Date: Wed, 27 Jan 2016 13:06:44 +0800
Message-ID: <1453871204-7312-1-git-send-email-wxt@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

As the kylin schematic drawing, add the needed work led for
kylin board.

Run:
echo 0 > /sys/class/leds/kylin:red:led/brightness
echo 1 > /sys/class/leds/kylin:red:led/brightness

The led can be normall on/off on kylin board.

Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

---

Hi Heiko,

Describing the content:
- This patch is based on your for-next branch.
- Verified on
  https://github.com/Caesar-github/rockchip/commits/kylin/next.

 arch/arm/boot/dts/rk3036-kylin.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/rk3036-kylin.dts b/arch/arm/boot/dts/rk3036-kylin.dts
index 190f22c..3332a7f 100644
--- a/arch/arm/boot/dts/rk3036-kylin.dts
+++ b/arch/arm/boot/dts/rk3036-kylin.dts
@@ -46,6 +46,17 @@
 	model = "Rockchip RK3036 KylinBoard";
 	compatible = "rockchip,rk3036-kylin", "rockchip,rk3036";
 
+	leds: gpio-leds {
+		compatible = "gpio-leds";
+
+		work {
+			gpios = <&gpio2 30 GPIO_ACTIVE_HIGH>;
+			label = "kylin:red:led";
+			pinctrl-names = "default";
+			pinctrl-0 = <&led_ctl>;
+		};
+	};
+
 	sdio_pwrseq: sdio-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		pinctrl-names = "default";
@@ -359,6 +370,12 @@
 };
 
 &pinctrl {
+	leds {
+		led_ctl: led-ctl {
+			rockchip,pins = <2 30 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	pmic {
 		pmic_int: pmic-int {
 			rockchip,pins = <2 2 RK_FUNC_GPIO &pcfg_pull_default>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
