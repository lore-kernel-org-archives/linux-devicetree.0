From: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v4 07/10] ARM: dts: hix5hd2: add ir node
Date: Wed, 29 Oct 2014 16:26:02 +0800
Message-ID: <1414571165-23736-8-git-send-email-zhangfei.gao@linaro.org>
References: <1414571165-23736-1-git-send-email-zhangfei.gao@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414571165-23736-1-git-send-email-zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arnd-r2nGTMty4D4@public.gmane.org, haifeng.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jchxue-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/hisi-x5hd2.dtsi |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/hisi-x5hd2.dtsi b/arch/arm/boot/dts/hisi-x5hd2.dtsi
index d07589b..576d8c2 100644
--- a/arch/arm/boot/dts/hisi-x5hd2.dtsi
+++ b/arch/arm/boot/dts/hisi-x5hd2.dtsi
@@ -391,7 +391,7 @@
 		};
 
 		sysctrl: system-controller@00000000 {
-			compatible = "hisilicon,sysctrl";
+			compatible = "hisilicon,sysctrl", "syscon";
 			reg = <0x00000000 0x1000>;
 			reboot-offset = <0x4>;
 		};
@@ -478,5 +478,13 @@
 			interrupts = <0 70 4>;
 			clocks = <&clock HIX5HD2_SATA_CLK>;
 		};
+
+		ir: ir@001000 {
+			compatible = "hisilicon,hix5hd2-ir";
+			reg = <0x001000 0x1000>;
+			interrupts = <0 47 4>;
+			clocks = <&clock HIX5HD2_FIXED_24M>;
+			hisilicon,power-syscon = <&sysctrl>;
+		};
 	};
 };
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
