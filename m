From: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 09/16] arm64: dts: add hi6220 usb node
Date: Sat,  2 Apr 2016 17:29:36 +0800
Message-ID: <1459589383-16914-10-git-send-email-guodong.xu@linaro.org>
References: <1459589383-16914-1-git-send-email-guodong.xu@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459589383-16914-1-git-send-email-guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd.bergmann-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 32 +++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index 664cc7a..2608b68 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -633,5 +633,37 @@
 			pinctrl-0 = <&i2c2_pmx_func &i2c2_cfg_func>;
 			status = "disabled";
 		};
+
+		fixed_5v_hub: regulator@0 {
+			compatible = "regulator-fixed";
+			regulator-name = "fixed_5v_hub";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			regulator-boot-on;
+			gpio = <&gpio0 7 0>;
+			regulator-always-on;
+		};
+
+		usb_phy: usbphy {
+			compatible = "hisilicon,hi6220-usb-phy";
+			#phy-cells = <0>;
+			phy-supply = <&fixed_5v_hub>;
+			hisilicon,peripheral-syscon = <&sys_ctrl>;
+		};
+
+		usb: usb@f72c0000 {
+			compatible = "hisilicon,hi6220-usb";
+			reg = <0x0 0xf72c0000 0x0 0x40000>;
+			phys = <&usb_phy>;
+			phy-names = "usb2-phy";
+			clocks = <&sys_ctrl HI6220_USBOTG_HCLK>;
+			clock-names = "otg";
+			dr_mode = "otg";
+			g-use-dma;
+			g-rx-fifo-size = <512>;
+			g-np-tx-fifo-size = <128>;
+			g-tx-fifo-size = <128 128 128 128 128 128>;
+			interrupts = <0 77 0x4>;
+		};
 	};
 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
