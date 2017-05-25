From: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 11/12] arm64: dts: hikey960: add LED nodes
Date: Thu, 25 May 2017 16:18:53 +0800
Message-ID: <20170525081854.4701-12-guodong.xu@linaro.org>
References: <20170525081854.4701-1-guodong.xu@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170525081854.4701-1-guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
Cc: zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

HiKey960 has four user LEDs, and two special purpose LEDs: WiFi and BT
respectively.

All of them are implemented as GPIO.

Signed-off-by: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 48 +++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
index 7aac35b..9ecf6c6 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
@@ -49,6 +49,54 @@
 			linux,code = <KEY_POWER>;
 		};
 	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		user_led1 {
+			label = "user_led1";
+			/* gpio_150_user_led1 */
+			gpios = <&gpio18 6 0>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		user_led2 {
+			label = "user_led2";
+			/* gpio_151_user_led2 */
+			gpios = <&gpio18 7 0>;
+			linux,default-trigger = "mmc0";
+		};
+
+		user_led3 {
+			label = "user_led3";
+			/* gpio_189_user_led3 */
+			gpios = <&gpio23 5 0>;
+			default-state = "off";
+		};
+
+		user_led4 {
+			label = "user_led4";
+			/* gpio_190_user_led4 */
+			gpios = <&gpio23 6 0>;
+			linux,default-trigger = "cpu0";
+		};
+
+		wlan_active_led {
+			label = "wifi_active";
+			/* gpio_205_wifi_active */
+			gpios = <&gpio25 5 0>;
+			linux,default-trigger = "phy0tx";
+			default-state = "off";
+		};
+
+		bt_active_led {
+			label = "bt_active";
+			gpios = <&gpio25 7 0>;
+			/* gpio_207_user_led1 */
+			linux,default-trigger = "hci0-power";
+			default-state = "off";
+		};
+	};
 };
 
 &i2c0 {
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
