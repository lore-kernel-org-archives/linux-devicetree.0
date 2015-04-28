From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH v7 3/5] Documentation: Add documentation for the APM X-Gene SoC EDAC DTS binding
Date: Tue, 28 Apr 2015 16:10:43 -0600
Message-ID: <1430259045-19012-4-git-send-email-lho@apm.com>
References: <1430259045-19012-1-git-send-email-lho@apm.com>
 <1430259045-19012-2-git-send-email-lho@apm.com>
 <1430259045-19012-3-git-send-email-lho@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430259045-19012-3-git-send-email-lho-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org
Cc: linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds documentation for the APM X-Gene SoC EDAC DTS binding.

Signed-off-by: Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
Signed-off-by: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
---
 .../devicetree/bindings/edac/apm-xgene-edac.txt    |  107 ++++++++++++++++++++
 1 files changed, 107 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/edac/apm-xgene-edac.txt

diff --git a/Documentation/devicetree/bindings/edac/apm-xgene-edac.txt b/Documentation/devicetree/bindings/edac/apm-xgene-edac.txt
new file mode 100644
index 0000000..548299a
--- /dev/null
+++ b/Documentation/devicetree/bindings/edac/apm-xgene-edac.txt
@@ -0,0 +1,107 @@
+* APM X-Gene SoC EDAC nodes
+
+EDAC nodes are defined to describe on-chip error detection and correction.
+There are four types of EDAC:
+
+  memory controller	- Memory controller
+  PMD (L1/L2)		- Processor module unit (PMD) L1/L2 cache
+  L3			- CPU L3 cache
+  SoC			- SoC IP such as SATA, Ethernet, and etc
+
+The following section describes the memory controller DT node binding.
+
+Required properties:
+- compatible		: Shall be "apm,xgene-edac-mc".
+- regmap-pcp		: Regmap of the PCP resource.
+- regmap-csw		: Regmap of the CSW resource.
+- regmap-mcba		: Regmap of the MCB-A resource.
+- regmap-mcbb		: Regmap of the MCB-B resource.
+- reg			: First resource shall be the MCU resource.
+- interrupts            : Interrupt-specifier for MCU error IRQ(s).
+
+The following section describes the L1/L2 DT node binding.
+
+- compatible		: Shall be "apm,xgene-edac-pmd".
+- regmap-pcp		: Regmap of the PCP resource.
+- regmap-efuse		: Regmap of the PMD efuse resource.
+- reg			: First resource shall be the PMD resource.
+- interrupts            : Interrupt-specifier for PMD error IRQ(s).
+
+The following section describes the L3 DT node binding.
+
+- compatible		: Shall be "apm,xgene-edac-l3".
+- regmap-pcp		: Regmap of the PCP resource.
+- reg			: First resource shall be the L3 resource.
+- interrupts            : Interrupt-specifier for L3 error IRQ(s).
+
+The following section describes the SoC DT node binding.
+
+- compatible		: Shall be "apm,xgene-edac-soc"".
+- regmap-pcp		: Regmap of the PCP resource.
+- reg			: First resource shall be the SoC resource.
+			  Second resource shall be the register bus resource.
+- interrupts		: Interrupt-specifier for SoC error IRQ(s).
+
+Example:
+	efuse: efuse@1054a000 {
+		compatible = "syscon";
+		reg = <0x0 0x1054a000 0x0 0x20>;
+	};
+
+	pcperror: pcperror@78800000 {
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
+		regmap-pcp = <&pcperror>;
+		regmap-csw = <&csw>;
+		regmap-mcba = <&mcba>;
+		regmap-mcbb = <&mcbb>;
+		reg = <0x0 0x7e800000 0x0 0x1000>;
+		interrupts = <0x0 0x20 0x4>,
+			     <0x0 0x21 0x4>;
+	};
+
+	edacpmd0: edacpmd0@7c000000 {
+		compatible = "apm,xgene-edac-pmd";
+		regmap-pcp = <&pcperror>;
+		regmap-efuse = <&efuse>;
+		reg = <0x0 0x7c000000 0x0 0x200000>;
+		interrupts = <0x0 0x20 0x4>,
+			     <0x0 0x21 0x4>;
+	};
+
+	edacl3: edacl3@7e600000 {
+		compatible = "apm,xgene-edac-l3";
+		regmap-pcp = <&pcperror>;
+		reg = <0x0 0x7e600000 0x0 0x1000>;
+		interrupts = <0x0 0x20 0x4>,
+			     <0x0 0x21 0x4>;
+	};
+
+	edacsoc: edacsoc@7e930000 {
+		compatible = "apm,xgene-edac-soc";
+		regmap-pcp = <&pcperror>;
+		reg = <0x0 0x7e930000 0x0 0x1000>,
+		      <0x0 0x7e000000 0x0 0x1000>;
+		interrupts = <0x0 0x20 0x4>,
+			     <0x0 0x21 0x4>,
+			     <0x0 0x27 0x4>;
+	};
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
