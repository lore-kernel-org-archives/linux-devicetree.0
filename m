From: Tan Xiaojun <tanxiaojun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH v1 1/2] Documentation: arm64: Add Hisilicon HiP05/06/07 Sysctrl and Djtag dts bindings
Date: Fri, 22 Jul 2016 16:48:51 +0800
Message-ID: <1469177332-72156-2-git-send-email-tanxiaojun@huawei.com>
References: <1469177332-72156-1-git-send-email-tanxiaojun@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1469177332-72156-1-git-send-email-tanxiaojun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, amitdanielk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org, alex.aring-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, qiang.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

First, add Hisilicon HiP05/06/07 CPU and ALGSUB system controller dts
bindings. Then, add Hisilicon Djtag dts binding.

Signed-off-by: Tan Xiaojun <tanxiaojun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
---
 .../bindings/arm/hisilicon/hisilicon.txt           |   98 ++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
index 83fe816..82a22ed 100644
--- a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
+++ b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
@@ -249,3 +249,101 @@ Required Properties:
   [1]: bootwrapper size
   [2]: relocation physical address
   [3]: relocation size
+
+-----------------------------------------------------------------------
+Hisilicon HiP05 CPU system controller
+Required properties:
+- compatible : "hisilicon,hip05-sysctrl", "syscon", "simple-mfd";
+- reg : Register address and size
+- djtag :
+  - compatible : "hisilicon,hip05-cpu-djtag-v1"
+  - syscon : which sysctrl node
+
+Hisilicon HiP06 CPU system controller
+Required properties:
+- compatible : "hisilicon,hip06-sysctrl", "syscon", "simple-mfd";
+- reg : Register address and size
+- djtag :
+  - compatible : "hisilicon,hip06-cpu-djtag-v1"
+  - syscon : which sysctrl node
+
+Hisilicon HiP07 CPU system controller
+Required properties:
+- compatible : "hisilicon,hip07-sysctrl", "syscon", "simple-mfd";
+- reg : Register address and size
+- djtag :
+  - compatible : "hisilicon,hip07-cpu-djtag-v2"
+  - syscon : which sysctrl node
+
+The Hisilicon HiP05/06/07 CPU system controller is in CPU die of SoC. It is 
+used to control system operation mode, control system operating status and
+manage some important modules (such as clock, reset, soft reset, secure
+debugger, etc.). We can also configure some functions of the peripheral
+devices and query their status by it.
+
+The Hisilicon Djtag in CPU die is an independent module which connects with
+some modules in the SoC by Debug Bus. This module can be configured to access
+the registers of connecting modules (like L3 cache) during real time debugging
+by sysctrl.
+
+Example:
+	/* for Hisilicon HiP05 sysctrl */
+	hip05-sysctrl: hip05-sysctrl@80010000 {
+		compatible = "hisilicon,hip05-sysctrl", "syscon", "simple-mfd";
+		reg = <0x80010000 0x10000>;
+		
+		djtag0: djtag@0 {
+		       compatible = "hisilicon,hip05-cpu-djtag-v1";
+		       syscon = <&hip05-sysctrl>;
+		};
+	};
+
+	/* for Hisilicon HiP05 l3 cache maybe set like below */
+	llc0: llc@0 {
+		compatible = "hisilicon,hip05-llc";
+		djtag = <&djtag0>;
+	};
+
+-----------------------------------------------------------------------
+Hisilicon HiP05 ALGSUB system controller
+Required properties:
+- compatible : "hisilicon,hip05-alg-sysctrl", "syscon", "simple-mfd";
+- reg : Register address and size
+- djtag :
+  - compatible : "hisilicon,hip05-io-djtag-v1"
+  - syscon : which sysctrl node
+
+Hisilicon HiP06 ALGSUB system controller
+Required properties:
+- compatible : "hisilicon,hip06-alg-sysctrl", "syscon", "simple-mfd";
+- reg : Register address and size
+- djtag :
+  - compatible : "hisilicon,hip06-io-djtag-v2"
+  - syscon : which sysctrl node
+
+Hisilicon HiP07 ALGSUB system controller
+Required properties:
+- compatible : "hisilicon,hip07-alg-sysctrl", "syscon", "simple-mfd";
+- reg : Register address and size
+- djtag :
+  - compatible : "hisilicon,hip07-io-djtag-v2"
+  - syscon : which sysctrl node
+
+The Hisilicon HiP05/06/07 ALGSUB system controller is in IO die of SoC. It
+has a similar function as the Hisilicon HiP05/06/07 CPU system controller
+in CPU die and it manage default modules, like RSA, etc.
+
+The Hisilicon Djtag in IO die has a similar function as the one in CPU die.
+
+Example:
+	/* for Hisilicon HiP05 alg subctrl */
+	hip05-alg-sysctrl: hip05-alg-sysctrl@d0000000 {
+		compatible = "hisilicon,hip05-alg-sysctrl", "syscon", "simple-mfd";
+		reg = <0xd0000000 0x10000>;
+		
+		djtag0: djtag@0 {
+		       compatible = "hisilicon,hip05-io-djtag-v1";
+		       syscon = <&hip05-alg-sysctrl>;
+		};
+	};
+
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
