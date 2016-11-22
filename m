From: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 6/6] arm64: dts: hi6220: update reset node according to reset-hi6220.c
Date: Tue, 22 Nov 2016 15:49:21 +0800
Message-ID: <1479800961-6249-7-git-send-email-zhangfei.gao@linaro.org>
References: <1479800961-6249-1-git-send-email-zhangfei.gao@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479800961-6249-1-git-send-email-zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Xinliang Liu <xinliang.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Xia Qing <saberlily.xia-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index 17839db..7918043 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -246,14 +246,24 @@
 			compatible = "hisilicon,hi6220-sysctrl", "syscon";
 			reg = <0x0 0xf7030000 0x0 0x2000>;
 			#clock-cells = <1>;
-			#reset-cells = <1>;
 		};
 
 		media_ctrl: media_ctrl@f4410000 {
 			compatible = "hisilicon,hi6220-mediactrl", "syscon";
 			reg = <0x0 0xf4410000 0x0 0x1000>;
 			#clock-cells = <1>;
+		};
+
+		sys_ctrl_rst: sys_rst_controller {
+			compatible = "hisilicon,hi6220-reset-sysctrl";
+			#reset-cells = <1>;
+			hisi,rst-syscon = <&sys_ctrl>;
+		};
+
+		media_ctrl_rst: media_rst_controller {
+			compatible = "hisilicon,hi6220-reset-mediactrl";
 			#reset-cells = <1>;
+			hisi,rst-syscon = <&media_ctrl>;
 		};
 
 		pm_ctrl: pm_ctrl@f7032000 {
@@ -771,7 +781,7 @@
 			interrupts = <0x0 0x48 0x4>;
 			clocks = <&sys_ctrl 2>, <&sys_ctrl 1>;
 			clock-names = "ciu", "biu";
-			resets = <&sys_ctrl PERIPH_RSTDIS0_MMC0>;
+			resets = <&sys_ctrl_rst PERIPH_RSTDIS0_MMC0>;
 			bus-width = <0x8>;
 			vmmc-supply = <&ldo19>;
 			pinctrl-names = "default";
@@ -794,7 +804,7 @@
 			#size-cells = <0x0>;
 			clocks = <&sys_ctrl 4>, <&sys_ctrl 3>;
 			clock-names = "ciu", "biu";
-			resets = <&sys_ctrl PERIPH_RSTDIS0_MMC1>;
+			resets = <&sys_ctrl_rst PERIPH_RSTDIS0_MMC1>;
 			vqmmc-supply = <&ldo7>;
 			vmmc-supply = <&ldo10>;
 			bus-width = <0x4>;
@@ -812,7 +822,7 @@
 			interrupts = <0x0 0x4a 0x4>;
 			clocks = <&sys_ctrl HI6220_MMC2_CIUCLK>, <&sys_ctrl HI6220_MMC2_CLK>;
 			clock-names = "ciu", "biu";
-			resets = <&sys_ctrl PERIPH_RSTDIS0_MMC2>;
+			resets = <&sys_ctrl_rst PERIPH_RSTDIS0_MMC2>;
 			bus-width = <0x4>;
 			broken-cd;
 			pinctrl-names = "default", "idle";
@@ -867,7 +877,7 @@
 			reg = <0x0 0xf4100000 0x0 0x7800>;
 			reg-names = "ade_base";
 			hisilicon,noc-syscon = <&medianoc_ade>;
-			resets = <&media_ctrl MEDIA_ADE>;
+			resets = <&media_ctrl_rst MEDIA_ADE>;
 			interrupts = <0 115 4>; /* ldi interrupt */
 
 			clocks = <&media_ctrl HI6220_ADE_CORE>,
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
