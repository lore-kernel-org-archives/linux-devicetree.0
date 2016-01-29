From: Kefeng Wang <wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 5/6] arm64: dts: hip05: Append power button node for D02 board
Date: Fri, 29 Jan 2016 16:39:05 +0800
Message-ID: <1454056746-5048-6-git-send-email-wangkefeng.wang@huawei.com>
References: <1454056746-5048-1-git-send-email-wangkefeng.wang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454056746-5048-1-git-send-email-wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kefeng Wang <wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds poweroff button device node to support
poweroff feature on hip05 d02 board.

Signed-off-by: Kefeng Wang <wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/hisilicon/hip05-d02.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hip05-d02.dts b/arch/arm64/boot/dts/hisilicon/hip05-d02.dts
index ae34e25..e9436c0 100644
--- a/arch/arm64/boot/dts/hisilicon/hip05-d02.dts
+++ b/arch/arm64/boot/dts/hisilicon/hip05-d02.dts
@@ -11,6 +11,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
 #include "hip05.dtsi"
 
 / {
@@ -29,8 +30,25 @@
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	gpio_keys {
+		compatible = "gpio-keys";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pwrbutton {
+			label = "Power Button";
+			gpios = <&porta 8 GPIO_ACTIVE_LOW>;
+			linux,code = <116>;
+			debounce-interval = <0>;
+		};
+	};
 };
 
 &uart0 {
 	status = "ok";
 };
+
+&peri_gpio0 {
+	status = "ok";
+};
-- 
2.6.0.GIT

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
