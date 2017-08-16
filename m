From: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2] arm64: dts: hi6220: add acpu_sctrl
Date: Wed, 16 Aug 2017 15:26:35 +0800
Message-ID: <1502868395-11481-1-git-send-email-zhangfei.gao@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Li Pengcheng <lipengcheng8-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add acpu_sctrl clock node

Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Li Pengcheng <lipengcheng8-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
---
Update name to acpu_sctrl@f6504000

 arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index eacbe0d..f8012d5 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -262,6 +262,12 @@
 			#clock-cells = <1>;
 		};
 
+		acpu_sctrl: acpu_sctrl@f6504000 {
+			compatible = "hisilicon,hi6220-acpu-sctrl", "syscon";
+			reg = <0x0 0xf6504000 0x0 0x1000>;
+			#clock-cells = <1>;
+		};
+
 		medianoc_ade: medianoc_ade@f4520000 {
 			compatible = "syscon";
 			reg = <0x0 0xf4520000 0x0 0x4000>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
