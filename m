From: Anurup M <anurupvasu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v7 2/9] dt-bindings: hisi: Add Hisilicon HiP05/06/07 Djtag dts bindings
Date: Tue,  4 Apr 2017 06:55:23 -0400
Message-ID: <1491303323-140295-1-git-send-email-anurup.m@huawei.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, anurup.m-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, zhangshaokun-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, tanxiaojun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, sanil.kumar-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, john.garry-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, shiju.jose-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, huangdaode-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, dikshit.n-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, shyju.pv-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, anurupvasu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Tan Xiaojun <tanxiaojun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>

Add Hisilicon HiP05/06/07 Djtag dts bindings for CPU and IO Die

Signed-off-by: Tan Xiaojun <tanxiaojun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Signed-off-by: Anurup M <anurup.m-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/arm/hisilicon/djtag.txt    | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/hisilicon/djtag.txt

diff --git a/Documentation/devicetree/bindings/arm/hisilicon/djtag.txt b/Documentation/devicetree/bindings/arm/hisilicon/djtag.txt
new file mode 100644
index 0000000..fde5bab
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/hisilicon/djtag.txt
@@ -0,0 +1,51 @@
+The Hisilicon Djtag is an independent component which connects with some other
+components in the SoC by Debug Bus. The djtag is available in CPU and IO dies
+in the chip. The djtag controls access to connecting modules of CPU and IO
+dies.
+The various connecting components in CPU die (like L3 cache, L3 cache PMU etc.)
+are accessed by djtag during real time debugging. In IO die there are connecting
+components like RSA. These components appear as devices attached to djtag bus.
+
+Hisilicon HiP05/06/07 djtag for CPU die
+Required properties:
+  - compatible : The value should be as follows
+	(a) "hisilicon,hip05-cpu-djtag-v1" for CPU die which use v1 hw in
+	    HiP05 chipset.
+	(b) "hisilicon,hip06-cpu-djtag-v1" for CPU die which use v1 hw in
+	    HiP06 chipset.
+	(c) "hisilicon,hip07-cpu-djtag-v2" for CPU die which use v2 hw in
+	    HiP07 chipset.
+  - reg : Register address and size
+  - hisilicon,scl-id : The Super Cluster ID for CPU or IO die
+
+Example 1: Djtag for CPU die in HiP07
+
+	/* for Hisilicon HiP07 djtag for CPU Die */
+	djtag0: djtag@60010000 {
+		compatible = "hisilicon,hip07-cpu-djtag-v2";
+		reg = <0x0 0x60010000 0x0 0x10000>;
+		hisilicon,scl-id = <0x03>;
+
+		/* All connecting components will appear as child nodes */
+	};
+
+Hisilicon HiP05/06/07 djtag for IO die
+Required properties:
+  - compatible : The value should be as follows
+	(a) "hisilicon,hip05-io-djtag-v1" for IO die which use v1 hw in
+	    HiP05 chipset.
+	(c) "hisilicon,hip06-io-djtag-v2" for IO die which use v2 hw in
+	    HiP06 chipset.
+	(d) "hisilicon,hip07-io-djtag-v2" for IO die which use v2 hw in
+	    HiP07 chipset
+
+Example 2: Djtag for IO die in HiP05
+
+	/* for Hisilicon HiP05 djtag for IO Die */
+	djtag1: djtag@d0000000 {
+		compatible = "hisilicon,hip05-io-djtag-v1";
+		reg = <0x0 0xd0000000 0x0 0x10000>;
+		hisilicon,scl-id = <0x0>;
+
+		/* All connecting components will appear as child nodes */
+	};
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
