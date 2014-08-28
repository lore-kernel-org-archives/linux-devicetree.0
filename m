From: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 2/6] ARM: dts: hix5hd2: add mmc node
Date: Thu, 28 Aug 2014 13:34:16 +0800
Message-ID: <1409204060-9223-3-git-send-email-zhangfei.gao@linaro.org>
References: <1409204060-9223-1-git-send-email-zhangfei.gao@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409204060-9223-1-git-send-email-zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mark.rutland-5wv7dgnIgG8@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, haifeng.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jchxue-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/hisi-x5hd2.dtsi |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/hisi-x5hd2.dtsi b/arch/arm/boot/dts/hisi-x5hd2.dtsi
index 012525c..802331b 100644
--- a/arch/arm/boot/dts/hisi-x5hd2.dtsi
+++ b/arch/arm/boot/dts/hisi-x5hd2.dtsi
@@ -167,6 +167,23 @@
 			};
 		};
 
+		/* unremovable emmc as mmcblk0 */
+		mmc: mmc@1830000 {
+			compatible = "snps,dw-mshc";
+			reg = <0x1830000 0x1000>;
+			interrupts = <0 35 4>;
+			clocks = <&clock HIX5HD2_MMC_CIU_RST>, <&clock HIX5HD2_MMC_BIU_CLK>;
+			clock-names = "ciu", "biu";
+		};
+
+		sd: mmc@1820000 {
+			compatible = "snps,dw-mshc";
+			reg = <0x1820000 0x1000>;
+			interrupts = <0 34 4>;
+			clocks = <&clock HIX5HD2_SD_CIU_RST>, <&clock HIX5HD2_SD_BIU_CLK>;
+			clock-names = "ciu","biu";
+		};
+
 		gmac0: ethernet@1840000 {
 			compatible = "hisilicon,hix5hd2-gmac";
 			reg = <0x1840000 0x1000>,<0x184300c 0x4>;
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
