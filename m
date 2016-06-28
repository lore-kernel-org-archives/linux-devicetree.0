From: Tai Nguyen <ttnguyen-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH v6 2/4] Documentation: Add documentation for APM X-Gene SoC PMU DTS binding
Date: Tue, 28 Jun 2016 11:50:43 -0700
Message-ID: <1467139845-29753-3-git-send-email-ttnguyen@apm.com>
References: <1467139845-29753-1-git-send-email-ttnguyen@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467139845-29753-1-git-send-email-ttnguyen-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mark.rutland-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org, Tai Nguyen <ttnguyen-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Tai Nguyen <ttnguyen-qTEPVZfXA3Y@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/perf/apm-xgene-pmu.txt     | 112 +++++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/apm-xgene-pmu.txt

diff --git a/Documentation/devicetree/bindings/perf/apm-xgene-pmu.txt b/Documentation/devicetree/bindings/perf/apm-xgene-pmu.txt
new file mode 100644
index 0000000..afb11cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/perf/apm-xgene-pmu.txt
@@ -0,0 +1,112 @@
+* APM X-Gene SoC PMU bindings
+
+This is APM X-Gene SoC PMU (Performance Monitoring Unit) module.
+The following PMU devices are supported:
+
+  L3C			- L3 cache controller
+  IOB			- IO bridge
+  MCB			- Memory controller bridge
+  MC			- Memory controller
+
+The following section describes the SoC PMU DT node binding.
+
+Required properties:
+- compatible		: Shall be "apm,xgene-pmu" for revision 1 or
+                          "apm,xgene-pmu-v2" for revision 2.
+- regmap-csw		: Regmap of the CPU switch fabric (CSW) resource.
+- regmap-mcba		: Regmap of the MCB-A (memory bridge) resource.
+- regmap-mcbb		: Regmap of the MCB-B (memory bridge) resource.
+- reg			: First resource shall be the CPU bus PMU resource.
+- interrupts            : Interrupt-specifier for PMU IRQ.
+
+Required properties for L3C subnode:
+- compatible		: Shall be "apm,xgene-pmu-l3c".
+- reg			: First resource shall be the L3C PMU resource.
+
+Required properties for IOB subnode:
+- compatible		: Shall be "apm,xgene-pmu-iob".
+- reg			: First resource shall be the IOB PMU resource.
+
+Required properties for MCB subnode:
+- compatible		: Shall be "apm,xgene-pmu-mcb".
+- reg			: First resource shall be the MCB PMU resource.
+- enable-bit-index	: The bit indicates if the according MCB is enabled.
+
+Required properties for MC subnode:
+- compatible		: Shall be "apm,xgene-pmu-mc".
+- reg			: First resource shall be the MC PMU resource.
+- enable-bit-index	: The bit indicates if the according MC is enabled.
+
+Example:
+	csw: csw@7e200000 {
+		compatible = "apm,xgene-csw", "syscon";
+		reg = <0x0 0x7e200000 0x0 0x1000>;
+	};
+
+	mcba: mcba@7e700000 {
+		compatible = "apm,xgene-mcb", "syscon";
+		reg = <0x0 0x7e700000 0x0 0x1000>;
+	};
+
+	mcbb: mcbb@7e720000 {
+		compatible = "apm,xgene-mcb", "syscon";
+		reg = <0x0 0x7e720000 0x0 0x1000>;
+	};
+
+	pmu: pmu@78810000 {
+		compatible = "apm,xgene-pmu-v2";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		regmap-csw = <&csw>;
+		regmap-mcba = <&mcba>;
+		regmap-mcbb = <&mcbb>;
+		reg = <0x0 0x78810000 0x0 0x1000>;
+		interrupts = <0x0 0x22 0x4>;
+
+		pmul3c@7e610000 {
+			compatible = "apm,xgene-pmu-l3c";
+			reg = <0x0 0x7e610000 0x0 0x1000>;
+		};
+
+		pmuiob@7e940000 {
+			compatible = "apm,xgene-pmu-iob";
+			reg = <0x0 0x7e940000 0x0 0x1000>;
+		};
+
+		pmucmcb@7e710000 {
+			compatible = "apm,xgene-pmu-mcb";
+			reg = <0x0 0x7e710000 0x0 0x1000>;
+			enable-bit-index = <0>;
+		};
+
+		pmucmcb@7e730000 {
+			compatible = "apm,xgene-pmu-mcb";
+			reg = <0x0 0x7e730000 0x0 0x1000>;
+			enable-bit-index = <1>;
+		};
+
+		pmucmc@7e810000 {
+			compatible = "apm,xgene-pmu-mc";
+			reg = <0x0 0x7e810000 0x0 0x1000>;
+			enable-bit-index = <0>;
+		};
+
+		pmucmc@7e850000 {
+			compatible = "apm,xgene-pmu-mc";
+			reg = <0x0 0x7e850000 0x0 0x1000>;
+			enable-bit-index = <1>;
+		};
+
+		pmucmc@7e890000 {
+			compatible = "apm,xgene-pmu-mc";
+			reg = <0x0 0x7e890000 0x0 0x1000>;
+			enable-bit-index = <2>;
+		};
+
+		pmucmc@7e8d0000 {
+			compatible = "apm,xgene-pmu-mc";
+			reg = <0x0 0x7e8d0000 0x0 0x1000>;
+			enable-bit-index = <3>;
+		};
+	};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
