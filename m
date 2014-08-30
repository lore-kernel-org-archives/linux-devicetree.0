From: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3 5/6] ARM: dts: hix5hd2: add gpio node
Date: Sat, 30 Aug 2014 12:15:41 +0800
Message-ID: <1409372142-5960-6-git-send-email-zhangfei.gao@linaro.org>
References: <1409372142-5960-1-git-send-email-zhangfei.gao@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409372142-5960-1-git-send-email-zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mark.rutland-5wv7dgnIgG8@public.gmane.org, dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, haifeng.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jchxue-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/hisi-x5hd2.dtsi |  234 +++++++++++++++++++++++++++++++++++++
 1 file changed, 234 insertions(+)

diff --git a/arch/arm/boot/dts/hisi-x5hd2.dtsi b/arch/arm/boot/dts/hisi-x5hd2.dtsi
index 18f52f0..152f3ad 100644
--- a/arch/arm/boot/dts/hisi-x5hd2.dtsi
+++ b/arch/arm/boot/dts/hisi-x5hd2.dtsi
@@ -131,6 +131,240 @@
 				clock-names = "apb_pclk";
 				status = "disabled";
 			};
+
+			gpio0: gpio@b20000 {
+				compatible = "arm,pl061", "arm,primecell";
+				reg = <0xb20000 0x1000>;
+				interrupts = <0 108 0x4>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				clocks = <&clock HIX5HD2_FIXED_100M>;
+				clock-names = "apb_pclk";
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				status = "disabled";
+			};
+
+			gpio1: gpio@b21000 {
+				compatible = "arm,pl061", "arm,primecell";
+				reg = <0xb21000 0x1000>;
+				interrupts = <0 109 0x4>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				clocks = <&clock HIX5HD2_FIXED_100M>;
+				clock-names = "apb_pclk";
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				status = "disabled";
+			};
+
+			gpio2: gpio@b22000 {
+				compatible = "arm,pl061", "arm,primecell";
+				reg = <0xb22000 0x1000>;
+				interrupts = <0 110 0x4>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				clocks = <&clock HIX5HD2_FIXED_100M>;
+				clock-names = "apb_pclk";
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				status = "disabled";
+			};
+
+			gpio3: gpio@b23000 {
+				compatible = "arm,pl061", "arm,primecell";
+				reg = <0xb23000 0x1000>;
+				interrupts = <0 111 0x4>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				clocks = <&clock HIX5HD2_FIXED_100M>;
+				clock-names = "apb_pclk";
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				status = "disabled";
+			};
+
+			gpio4: gpio@b24000 {
+				compatible = "arm,pl061", "arm,primecell";
+				reg = <0xb24000 0x1000>;
+				interrupts = <0 112 0x4>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				clocks = <&clock HIX5HD2_FIXED_100M>;
+				clock-names = "apb_pclk";
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				status = "disabled";
+			};
+
+			gpio5: gpio@004000 {
+				compatible = "arm,pl061", "arm,primecell";
+				reg = <0x004000 0x1000>;
+				interrupts = <0 113 0x4>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				clocks = <&clock HIX5HD2_FIXED_100M>;
+				clock-names = "apb_pclk";
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				status = "disabled";
+			};
+
+			gpio6: gpio@b26000 {
+				compatible = "arm,pl061", "arm,primecell";
+				reg = <0xb26000 0x1000>;
+				interrupts = <0 114 0x4>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				clocks = <&clock HIX5HD2_FIXED_100M>;
+				clock-names = "apb_pclk";
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				status = "disabled";
+			};
+
+			gpio7: gpio@b27000 {
+				compatible = "arm,pl061", "arm,primecell";
+				reg = <0xb27000 0x1000>;
+				interrupts = <0 115 0x4>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				clocks = <&clock HIX5HD2_FIXED_100M>;
+				clock-names = "apb_pclk";
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				status = "disabled";
+			};
+
+			gpio8: gpio@b28000 {
+				compatible = "arm,pl061", "arm,primecell";
+				reg = <0xb28000 0x1000>;
+				interrupts = <0 116 0x4>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				clocks = <&clock HIX5HD2_FIXED_100M>;
+				clock-names = "apb_pclk";
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				status = "disabled";
+			};
+
+			gpio9: gpio@b29000 {
+				compatible = "arm,pl061", "arm,primecell";
+				reg = <0xb29000 0x1000>;
+				interrupts = <0 117 0x4>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				clocks = <&clock HIX5HD2_FIXED_100M>;
+				clock-names = "apb_pclk";
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				status = "disabled";
+			};
+
+			gpio10: gpio@b2a000 {
+				compatible = "arm,pl061", "arm,primecell";
+				reg = <0xb2a000 0x1000>;
+				interrupts = <0 118 0x4>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				clocks = <&clock HIX5HD2_FIXED_100M>;
+				clock-names = "apb_pclk";
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				status = "disabled";
+			};
+
+			gpio11: gpio@b2b000 {
+				compatible = "arm,pl061", "arm,primecell";
+				reg = <0xb2b000 0x1000>;
+				interrupts = <0 119 0x4>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				clocks = <&clock HIX5HD2_FIXED_100M>;
+				clock-names = "apb_pclk";
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				status = "disabled";
+			};
+
+			gpio12: gpio@b2c000 {
+				compatible = "arm,pl061", "arm,primecell";
+				reg = <0xb2c000 0x1000>;
+				interrupts = <0 120 0x4>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				clocks = <&clock HIX5HD2_FIXED_100M>;
+				clock-names = "apb_pclk";
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				status = "disabled";
+			};
+
+			gpio13: gpio@b2d000 {
+				compatible = "arm,pl061", "arm,primecell";
+				reg = <0xb2d000 0x1000>;
+				interrupts = <0 121 0x4>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				clocks = <&clock HIX5HD2_FIXED_100M>;
+				clock-names = "apb_pclk";
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				status = "disabled";
+			};
+
+			gpio14: gpio@b2e000 {
+				compatible = "arm,pl061", "arm,primecell";
+				reg = <0xb2e000 0x1000>;
+				interrupts = <0 122 0x4>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				clocks = <&clock HIX5HD2_FIXED_100M>;
+				clock-names = "apb_pclk";
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				status = "disabled";
+			};
+
+			gpio15: gpio@b2f000 {
+				compatible = "arm,pl061", "arm,primecell";
+				reg = <0xb2f000 0x1000>;
+				interrupts = <0 123 0x4>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				clocks = <&clock HIX5HD2_FIXED_100M>;
+				clock-names = "apb_pclk";
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				status = "disabled";
+			};
+
+			gpio16: gpio@b30000 {
+				compatible = "arm,pl061", "arm,primecell";
+				reg = <0xb30000 0x1000>;
+				interrupts = <0 124 0x4>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				clocks = <&clock HIX5HD2_FIXED_100M>;
+				clock-names = "apb_pclk";
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				status = "disabled";
+			};
+
+			gpio17: gpio@b31000 {
+				compatible = "arm,pl061", "arm,primecell";
+				reg = <0xb31000 0x1000>;
+				interrupts = <0 125 0x4>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				clocks = <&clock HIX5HD2_FIXED_100M>;
+				clock-names = "apb_pclk";
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				status = "disabled";
+			};
 		};
 
 		local_timer@00a00600 {
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
