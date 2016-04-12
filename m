From: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v4 07/16] arm64: dts: add all hi6220 i2c nodes
Date: Wed, 13 Apr 2016 07:55:43 +0800
Message-ID: <1460505352-13157-8-git-send-email-guodong.xu@linaro.org>
References: <1460505352-13157-1-git-send-email-guodong.xu@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460505352-13157-1-git-send-email-guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Xinwei Kong <kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Xinwei Kong <kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>

This patch adds all I2C nodes for the Hi6220 SoC. This hi6220 Soc
use this I2C IP of Synopsys Designware for HiKey board.

Signed-off-by: Xinwei Kong <kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Signed-off-by: Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Signed-off-by: Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 33 +++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index 7bcfffe..4fc0347 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -582,5 +582,38 @@
 			cs-gpios = <&gpio6 2 0>;
 			status = "disabled";
 		};
+
+		i2c0: i2c@f7100000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x0 0xf7100000 0x0 0x1000>;
+			interrupts = <0 44 4>;
+			clocks = <&sys_ctrl HI6220_I2C0_CLK>;
+			i2c-sda-hold-time-ns = <300>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c0_pmx_func &i2c0_cfg_func>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@f7101000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x0 0xf7101000 0x0 0x1000>;
+			clocks = <&sys_ctrl HI6220_I2C1_CLK>;
+			interrupts = <0 45 4>;
+			i2c-sda-hold-time-ns = <300>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c1_pmx_func &i2c1_cfg_func>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@f7102000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x0 0xf7102000 0x0 0x1000>;
+			clocks = <&sys_ctrl HI6220_I2C2_CLK>;
+			interrupts = <0 46 4>;
+			i2c-sda-hold-time-ns = <300>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c2_pmx_func &i2c2_cfg_func>;
+			status = "disabled";
+		};
 	};
 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
