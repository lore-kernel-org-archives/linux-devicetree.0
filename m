From: Fei Wang <w.f-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 8/8] arm64: dts: Add Hi6220 mtcmos regulator node
Date: Wed, 30 Sep 2015 19:05:11 +0800
Message-ID: <1443611111-3196-9-git-send-email-w.f@huawei.com>
References: <1443611111-3196-1-git-send-email-w.f@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443611111-3196-1-git-send-email-w.f-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, z.liuxinliang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, william.wfei-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, w.f-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch add mtcmos regulator dts file for Hi6220 SoC.

Signed-off-by: Fei Wang <w.f-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi |   21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index 40f895b..9b1a6ed 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -167,6 +167,27 @@
 			clocks = <&ao_ctrl 36>, <&ao_ctrl 36>;
 			clock-names = "uartclk", "apb_pclk";
 		};
+
+		mtcmos {
+			compatible = "hisilicon,hi6220-mtcmos-driver";
+			hisilicon,mtcmos-steady-us = <10>;
+			hisilicon,mtcmos-sc-on-base  = <0xf7800000>;
+			hisilicon,mtcmos-acpu-on-base = <0xf65a0000>;
+
+			mtcmos1: regulator@a1{
+				regulator-name = "G3D_PD_VDD";
+				regulator-compatible = "mtcmos1";
+				hisilicon,ctrl-regs = <0x830 0x834 0x83c>;
+				hisilicon,ctrl-data = <1 0x1>;
+			};
+
+			mtcmos2: regulator@a2{
+				regulator-name = "SOC_MED";
+				regulator-compatible = "mtcmos2";
+				hisilicon,ctrl-regs = <0x830 0x834 0x83c>;
+				hisilicon,ctrl-data = <2 0x1>;
+			};
+		};
 	};
 
 	pmic: pmic@F8000000 {
-- 
1.7.9.5


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
