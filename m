From: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 4/6] dt-bindings: change hi6220-reset.txt according to reset-hi6220.c
Date: Tue, 22 Nov 2016 15:49:19 +0800
Message-ID: <1479800961-6249-5-git-send-email-zhangfei.gao@linaro.org>
References: <1479800961-6249-1-git-send-email-zhangfei.gao@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479800961-6249-1-git-send-email-zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Xinliang Liu <xinliang.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Xia Qing <saberlily.xia-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/reset/hisilicon,hi6220-reset.txt   | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/reset/hisilicon,hi6220-reset.txt b/Documentation/devicetree/bindings/reset/hisilicon,hi6220-reset.txt
index c25da39..6a864f3 100644
--- a/Documentation/devicetree/bindings/reset/hisilicon,hi6220-reset.txt
+++ b/Documentation/devicetree/bindings/reset/hisilicon,hi6220-reset.txt
@@ -9,10 +9,9 @@ hi6220 SoC.
 
 Required properties:
 - compatible: should be one of the following:
-  - "hisilicon,hi6220-sysctrl", "syscon" : For peripheral reset controller.
-  - "hisilicon,hi6220-mediactrl", "syscon" : For media reset controller.
-- reg: should be register base and length as documented in the
-  datasheet
+  - "hisilicon,hi6220-reset-sysctrl" : For peripheral reset controller.
+  - "hisilicon,hi6220-reset-mediactrl" : For media reset controller.
+- hisi,rst-syscon: phandle of the reset's syscon.
 - #reset-cells: 1, see below
 
 Example:
@@ -20,7 +19,12 @@ sys_ctrl: sys_ctrl@f7030000 {
 	compatible = "hisilicon,hi6220-sysctrl", "syscon";
 	reg = <0x0 0xf7030000 0x0 0x2000>;
 	#clock-cells = <1>;
+};
+
+sys_ctrl_rst: sys_rst_controller {
+	compatible = "hisilicon,hi6220-reset-sysctrl";
 	#reset-cells = <1>;
+	hisi,rst-syscon = <&sys_ctrl>;
 };
 
 Specifying reset lines connected to IP modules
@@ -29,7 +33,7 @@ example:
 
         uart1: serial@..... {
                 ...
-                resets = <&sys_ctrl PERIPH_RSTEN3_UART1>;
+                resets = <&sys_ctrl_rst PERIPH_RSTEN3_UART1>;
                 ...
         };
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
