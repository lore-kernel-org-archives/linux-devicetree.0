From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH v8 3/5] Documentation: Add documentation for the APM X-Gene SoC EDAC DTS binding
Date: Tue,  5 May 2015 22:02:25 -0600
Message-ID: <1430884947-16787-4-git-send-email-lho@apm.com>
References: <1430884947-16787-1-git-send-email-lho@apm.com>
 <1430884947-16787-2-git-send-email-lho@apm.com>
 <1430884947-16787-3-git-send-email-lho@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430884947-16787-3-git-send-email-lho-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org
Cc: linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds documentation for the APM X-Gene SoC EDAC DTS binding.

Signed-off-by: Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
Signed-off-by: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
---
 .../devicetree/bindings/edac/apm-xgene-edac.txt    |   50 ++++++++++++++++++++
 1 files changed, 50 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/edac/apm-xgene-edac.txt

diff --git a/Documentation/devicetree/bindings/edac/apm-xgene-edac.txt b/Documentation/devicetree/bindings/edac/apm-xgene-edac.txt
new file mode 100644
index 0000000..b27c5a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/edac/apm-xgene-edac.txt
@@ -0,0 +1,50 @@
+* APM X-Gene SoC EDAC nodes
+
+EDAC nodes are defined to describe on-chip error detection and correction.
+The follow type is supported:
+
+  memory controller	- Memory controller
+
+The following section describes the memory controller DT node binding.
+
+Required properties:
+- compatible		: Shall be "apm,xgene-edac-mc".
+- regmap-pcp		: Regmap of the CPU bus (PCP) resource.
+- regmap-csw		: Regmap of the CPU switch fabric (CSW) resource.
+- regmap-mcba		: Regmap of the MCB-A (memory bridge) resource.
+- regmap-mcbb		: Regmap of the MCB-B (memory bridge) resource.
+- reg			: First resource shall be the memory controller unit
+                          (MCU) resource.
+- interrupts            : Interrupt-specifier for MCU error IRQ(s).
+
+Example:
+	pcp: pcp@78800000 {
+		compatible = "syscon";
+		reg = <0x0 0x78800000 0x0 0x100>;
+	};
+
+	csw: csw@7e200000 {
+		compatible = "syscon";
+		reg = <0x0 0x7e200000 0x0 0x1000>;
+	};
+
+	mcba: mcba@7e700000 {
+		compatible = "syscon";
+		reg = <0x0 0x7e700000 0x0 0x1000>;
+	};
+
+	mcbb: mcbb@7e720000 {
+		compatible = "syscon";
+		reg = <0x0 0x7e720000 0x0 0x1000>;
+	};
+
+	edacmc0: edacmc0@7e800000 {
+		compatible = "apm,xgene-edac-mc";
+		regmap-pcp = <&pcp>;
+		regmap-csw = <&csw>;
+		regmap-mcba = <&mcba>;
+		regmap-mcbb = <&mcbb>;
+		reg = <0x0 0x7e800000 0x0 0x1000>;
+		interrupts = <0x0 0x20 0x4>,
+			     <0x0 0x21 0x4>;
+	};
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
