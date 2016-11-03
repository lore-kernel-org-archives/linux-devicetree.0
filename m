From: Anurup M <anurupvasu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RESEND PATCH v1 02/11] dt-bindings: hisi: Add Hisilicon HiP05/06/07 Sysctrl and Djtag dts bindings
Date: Thu,  3 Nov 2016 01:41:58 -0400
Message-ID: <1478151727-20250-3-git-send-email-anurup.m@huawei.com>
References: <1478151727-20250-1-git-send-email-anurup.m@huawei.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478151727-20250-1-git-send-email-anurup.m-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, anurup.m-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, zhangshaokun-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, tanxiaojun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, sanil.kumar-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, john.garry-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, shiju.jose-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
Cc: guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, shyju.pv-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, anurupvasu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Tan Xiaojun <tanxiaojun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>

	1) Add Hisilicon HiP05/06/07 CPU and ALGSUB system controller dts
	   bindings.
	2) Add Hisilicon Djtag dts binding.

Signed-off-by: Tan Xiaojun <tanxiaojun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Signed-off-by: Anurup M <anurup.m-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
---
 .../bindings/arm/hisilicon/hisilicon.txt           | 82 ++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
index 7df79a7..341cbb9 100644
--- a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
+++ b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
@@ -270,3 +270,85 @@ Required Properties:
   [1]: bootwrapper size
   [2]: relocation physical address
   [3]: relocation size
+
+-----------------------------------------------------------------------
+The Hisilicon Djtag in CPU die is an independent component which connects with
+some other components in the SoC by Debug Bus. This driver can be configured
+to access the registers of connecting components (like L3 cache, l3 cache PMU
+ etc.) during real time debugging by sysctrl. These components appear as child
+nodes of djtag.
+
+The Hip05/06/07 CPU system controller(sysctrl) support to manage some important
+components (such as clock, reset, soft reset, secure debugger, etc.).
+The CPU sysctrl registers in hip05/06/07 doesnot use syscon but will be mapped
+by djtag driver for use by connecting components.
+
+Hisilicon HiP05 CPU system controller
+Required properties:
+  - compatible : "hisilicon,hip05-cpu-djtag-v1"
+  - reg : Register address and size
+
+Hisilicon HiP06 djtag for CPU sysctrl
+Required properties:
+- compatible : "hisilicon,hip06-sysctrl", "syscon", "simple-mfd";
+- reg : Register address and size
+- djtag :
+  - compatible : "hisilicon,hip06-cpu-djtag-v1"
+  - reg : Register address and size
+
+Hisilicon HiP07 djtag for CPU sysctrl
+Required properties:
+  - compatible : "hisilicon,hip07-cpu-djtag-v2"
+  - reg : Register address and size
+
+Example:
+	/* for Hisilicon HiP05 djtag for CPU sysctrl */
+	djtag0: djtag@80010000 {
+		compatible = "hisilicon,hip05-cpu-djtag-v1";
+		reg = <0x0 0x80010000 0x0 0x10000>;
+
+		/* For L3 cache PMU */
+		pmul3c0 {
+			compatible = "hisilicon,hisi-pmu-l3c-v1";
+			scl-id = <0x02>;
+			num-events = <0x16>;
+			num-counters = <0x08>;
+			module-id = <0x04>;
+			num-banks = <0x04>;
+			cfgen-map = <0x02 0x04 0x01 0x08>;
+			counter-reg = <0x170>;
+			evctrl-reg = <0x04>;
+			event-en = <0x1000000>;
+			evtype-reg = <0x140>;
+		};
+	};
+
+-----------------------------------------------------------------------
+The Hisilicon HiP05/06/07 ALGSUB system controller(sysctrl) is in IO die
+of SoC. It has a similar function as the Hisilicon HiP05/06/07 CPU system
+controller in CPU die and it manage different components, like RSA, etc.
+The Hisilicon Djtag in IO die has a similar function as in CPU die and maps
+the sysctrl registers for use by connecting components.
+All connecting components shall appear as child nodes of djtag.
+
+Hisilicon HiP05 djtag for ALGSUB sysctrl
+Required properties:
+  - compatible : "hisilicon,hip05-io-djtag-v1"
+  - reg : Register address and size
+
+Hisilicon HiP06 djtag for ALGSUB sysctrl
+Required properties:
+  - compatible : "hisilicon,hip06-io-djtag-v2"
+  - reg : Register address and size
+
+Hisilicon HiP07 djtag for ALGSUB sysctrl
+Required properties:
+  - compatible : "hisilicon,hip07-io-djtag-v2"
+  - reg : Register address and size
+
+Example:
+	/* for Hisilicon HiP05 djtag for alg sysctrl */
+	djtag0: djtag@d0000000 {
+	       compatible = "hisilicon,hip05-io-djtag-v1";
+		reg = <0x0 0xd0000000 0x0 0x10000>;
+	};
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
