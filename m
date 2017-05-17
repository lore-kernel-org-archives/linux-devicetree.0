From: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 11/12] arm64: dts: hi3660: add power key dts node
Date: Wed, 17 May 2017 16:37:44 +0800
Message-ID: <20170517083745.24479-12-guodong.xu@linaro.org>
References: <20170517083745.24479-1-guodong.xu@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170517083745.24479-1-guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chen Jun <chenjun14-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Chen Jun <chenjun14-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>

We use gpio_034 as power key on hikey960, and set gpio with pull-up
state, when key press the voltage on the gpio will come to lower, and
power key event will be reported.

Signed-off-by: Chen Jun <chenjun14-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Signed-off-by: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
index 79735ee..6de86c0 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
@@ -10,6 +10,8 @@
 #include "hi3660.dtsi"
 #include "hikey960-pinctrl.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	model = "HiKey960";
@@ -32,6 +34,21 @@
 		/* rewrite this at bootloader */
 		reg = <0x0 0x0 0x0 0x0>;
 	};
+
+	soc {
+		keys: gpio-keys {
+			compatible = "gpio-keys";
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwr_key_pmx_func &pwr_key_cfg_func>;
+
+			power {
+				wakeup-source;
+				gpios = <&gpio4 2 GPIO_ACTIVE_LOW>;
+				label = "GPIO Power";
+				linux,code = <KEY_POWER>;
+			};
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
