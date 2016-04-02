From: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 12/16] arm64: dts: hi6220: add pinctrl for uarts and enable them
Date: Sat,  2 Apr 2016 17:29:39 +0800
Message-ID: <1459589383-16914-13-git-send-email-guodong.xu@linaro.org>
References: <1459589383-16914-1-git-send-email-guodong.xu@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459589383-16914-1-git-send-email-guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd.bergmann-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add pinctrl for uart2 uart3 and uart4. Enable uart1 uart2 and uart3.

Signed-off-by: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts | 12 ++++++++++++
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi      |  9 +++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
index e00e9ec..c4f560a 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
@@ -50,6 +50,18 @@
 		i2c1: i2c@f7101000 {
 			status = "ok";
 		};
+
+		uart1: uart@f7111000 {
+			status = "ok";
+		};
+
+		uart2: uart@f7112000 {
+			status = "ok";
+		};
+
+		uart3: uart@f7113000 {
+			status = "ok";
+		};
 	};
 };
 
diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index a7ca40b..6afd327 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -266,6 +266,8 @@
 			clocks = <&sys_ctrl HI6220_UART1_PCLK>,
 				 <&sys_ctrl HI6220_UART1_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart1_pmx_func &uart1_cfg_func1 &uart1_cfg_func2>;
 			status = "disabled";
 		};
 
@@ -276,6 +278,8 @@
 			clocks = <&sys_ctrl HI6220_UART2_PCLK>,
 				 <&sys_ctrl HI6220_UART2_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart2_pmx_func &uart2_cfg_func>;
 			status = "disabled";
 		};
 
@@ -286,6 +290,9 @@
 			clocks = <&sys_ctrl HI6220_UART3_PCLK>,
 				 <&sys_ctrl HI6220_UART3_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart3_pmx_func &uart3_cfg_func>;
+			status = "disabled";
 		};
 
 		uart4: uart@f7114000 {
@@ -295,6 +302,8 @@
 			clocks = <&sys_ctrl HI6220_UART4_PCLK>,
 				 <&sys_ctrl HI6220_UART4_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart4_pmx_func &uart4_cfg_func>;
 			status = "disabled";
 		};
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
