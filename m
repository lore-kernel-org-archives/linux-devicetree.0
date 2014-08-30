From: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3 3/6] ARM: dts: hix5hd2: add usb node
Date: Sat, 30 Aug 2014 12:15:39 +0800
Message-ID: <1409372142-5960-4-git-send-email-zhangfei.gao@linaro.org>
References: <1409372142-5960-1-git-send-email-zhangfei.gao@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409372142-5960-1-git-send-email-zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mark.rutland-5wv7dgnIgG8@public.gmane.org, dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, haifeng.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jchxue-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/hisi-x5hd2.dtsi |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/hisi-x5hd2.dtsi b/arch/arm/boot/dts/hisi-x5hd2.dtsi
index 802331b..9252264 100644
--- a/arch/arm/boot/dts/hisi-x5hd2.dtsi
+++ b/arch/arm/boot/dts/hisi-x5hd2.dtsi
@@ -199,5 +199,19 @@
 			clocks = <&clock HIX5HD2_MAC1_CLK>;
 			status = "disabled";
 		};
+
+		usb0: ehci@1890000 {
+		        compatible = "generic-ehci";
+			reg = <0x1890000 0x1000>;
+			interrupts = <0 66 4>;
+			clocks = <&clock HIX5HD2_USB_CLK>;
+	        };
+
+		usb1: ohci@1880000 {
+			compatible = "generic-ohci";
+			reg = <0x1880000 0x1000>;
+			interrupts = <0 67 4>;
+			clocks = <&clock HIX5HD2_USB_CLK>;
+		};
 	};
 };
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
