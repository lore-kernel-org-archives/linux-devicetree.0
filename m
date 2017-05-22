From: Shaokun Zhang <zhangshaokun-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: [PATCH v8 9/9] dts: arm64: hip07: Add Hisilicon SoC PMU support
Date: Mon, 22 May 2017 20:48:40 +0800
Message-ID: <1495457320-239973-1-git-send-email-zhangshaokun@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mark.rutland-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, anurup.m-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, zhangshaokun-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, tanxiaojun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, sanil.kumar-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, john.garry-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, shiju.jose-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, huangdaode-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, dikshit.n-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, shyju.pv-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, anurupvasu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Anurup M <anurup.m-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>

Add nodes for djtag, L3 cache and MN to support uncore events.

Signed-off-by: Anurup M <anurup.m-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Signed-off-by: Shaokun Zhang <zhangshaokun-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
---
 arch/arm64/boot/dts/hisilicon/hip07.dtsi | 87 ++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hip07.dtsi b/arch/arm64/boot/dts/hisilicon/hip07.dtsi
index 283d7b5..38bf2e8 100644
--- a/arch/arm64/boot/dts/hisilicon/hip07.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hip07.dtsi
@@ -1535,4 +1535,91 @@
 			status = "disabled";
 		};
 	};
+
+	djtag0: djtag@60010000 {
+		compatible = "hisilicon,hip07-cpu-djtag-v2";
+		reg = <0x0 0x60010000 0x0 0x10000>;
+		hisilicon,scl-id = <0x03>;
+
+		/* L3 cache bank 0 for socket0 CPU die scl#3 */
+		pmul3c0 {
+			compatible = "hisilicon,hip07-pmu-l3c-v2";
+			hisilicon,module-id = <0x01>;
+			hisilicon,instance-id = <0x01>;
+		};
+
+		/* L3 cache bank 1 for socket0 CPU die scl#3 */
+		pmul3c1 {
+			compatible = "hisilicon,hip07-pmu-l3c-v2";
+			hisilicon,module-id = <0x02>;
+			hisilicon,instance-id = <0x01>;
+		};
+
+		/* L3 cache bank 2 for socket0 CPU die scl#3 */
+		pmul3c2 {
+			compatible = "hisilicon,hip07-pmu-l3c-v2";
+			hisilicon,module-id = <0x03>;
+			hisilicon,instance-id = <0x01>;
+		};
+
+		/* L3 cache bank 3 for socket0 CPU die scl#3 */
+		pmul3c3 {
+			compatible = "hisilicon,hip07-pmu-l3c-v2";
+			hisilicon,module-id = <0x04>;
+			hisilicon,instance-id = <0x01>;
+		};
+
+		/*
+		 * Miscellaneous node for socket0
+		 * CPU die scl#3
+		 */
+		pmumn0 {
+			compatible = "hisilicon,hip07-pmu-mn-v2";
+			hisilicon,module-id = <0x21>;
+		};
+	};
+
+	djtag1: djtag@40010000 {
+		compatible = "hisilicon,hip07-cpu-djtag-v2";
+		reg = <0x0 0x40010000 0x0 0x10000>;
+		hisilicon,scl-id = <0x01>;
+
+		/* L3 cache bank 0 for socket0 CPU die scl#1 */
+		pmul3c0 {
+			compatible = "hisilicon,hip07-pmu-l3c-v2";
+			hisilicon,module-id = <0x01>;
+			hisilicon,instance-id = <0x01>;
+		};
+
+		/* L3 cache bank 1 for socket0 CPU die scl#1 */
+		pmul3c1 {
+			compatible = "hisilicon,hip07-pmu-l3c-v2";
+			hisilicon,module-id = <0x02>;
+			hisilicon,instance-id = <0x01>;
+		};
+
+		/* L3 cache bank 2 for socket0 CPU die scl#1 */
+		pmul3c2 {
+			compatible = "hisilicon,hip07-pmu-l3c-v2";
+			hisilicon,module-id = <0x03>;
+			hisilicon,instance-id = <0x01>;
+		};
+
+		/* L3 cache bank 3 for socket0 CPU die scl#1 */
+		pmul3c3 {
+			compatible = "hisilicon,hip07-pmu-l3c-v2";
+			hisilicon,module-id = <0x04>;
+			hisilicon,instance-id = <0x01>;
+		};
+
+		/*
+		 * Miscellaneous node for socket0
+		 * CPU die scl#1
+		 */
+		pmumn1 {
+			compatible = "hisilicon,hip07-pmu-mn-v2";
+			hisilicon,module-id = <0x21>;
+		};
+	};
+
 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
