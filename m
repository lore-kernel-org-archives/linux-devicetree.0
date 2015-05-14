From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH v9 5/5] arm64: Add APM X-Gene SoC EDAC DTS entries
Date: Thu, 14 May 2015 11:05:47 -0600
Message-ID: <1431623147-4950-6-git-send-email-lho@apm.com>
References: <1431623147-4950-1-git-send-email-lho@apm.com>
 <1431623147-4950-2-git-send-email-lho@apm.com>
 <1431623147-4950-3-git-send-email-lho@apm.com>
 <1431623147-4950-4-git-send-email-lho@apm.com>
 <1431623147-4950-5-git-send-email-lho@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431623147-4950-5-git-send-email-lho-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org
Cc: linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds APM X-Gene SoC EDAC DTS entries.

Signed-off-by: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
---
 arch/arm64/boot/dts/apm/apm-storm.dtsi |   86 ++++++++++++++++++++++++++++++++
 1 files changed, 86 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
index c8d3e0e..0a12589 100644
--- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
@@ -374,6 +374,92 @@
 			};
 		};
 
+		csw: csw@7e200000 {
+			compatible = "syscon";
+			reg = <0x0 0x7e200000 0x0 0x1000>;
+		};
+
+		mcba: mcba@7e700000 {
+			compatible = "syscon";
+			reg = <0x0 0x7e700000 0x0 0x1000>;
+		};
+
+		mcbb: mcbb@7e720000 {
+			compatible = "syscon";
+			reg = <0x0 0x7e720000 0x0 0x1000>;
+		};
+
+		efuse: efuse@1054a000 {
+			compatible = "syscon";
+			reg = <0x0 0x1054a000 0x0 0x20>;
+		};
+
+		edac: edac@78800000 {
+			compatible = "apm,xgene-edac";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			reg = <0x0 0x78800000 0x0 0x100>;
+			interrupts = <0x0 0x20 0x4>,
+				     <0x0 0x21 0x4>,
+				     <0x0 0x27 0x4>;
+
+			edacmc0: edacmc0@7e800000 {
+				compatible = "apm,xgene-edac-mc";
+				regmap-csw = <&csw>;
+				regmap-mcba = <&mcba>;
+				regmap-mcbb = <&mcbb>;
+				reg = <0x0 0x7e800000 0x0 0x1000>;
+			};
+
+			edacmc1: edacmc1@7e840000 {
+				compatible = "apm,xgene-edac-mc";
+				regmap-csw = <&csw>;
+				regmap-mcba = <&mcba>;
+				regmap-mcbb = <&mcbb>;
+				reg = <0x0 0x7e840000 0x0 0x1000>;
+			};
+
+			edacmc2: edacmc2@7e880000 {
+				compatible = "apm,xgene-edac-mc";
+				regmap-csw = <&csw>;
+				regmap-mcba = <&mcba>;
+				regmap-mcbb = <&mcbb>;
+				reg = <0x0 0x7e880000 0x0 0x1000>;
+			};
+
+			edacmc3: edacmc3@7e8c0000 {
+				compatible = "apm,xgene-edac-mc";
+				regmap-csw = <&csw>;
+				regmap-mcba = <&mcba>;
+				regmap-mcbb = <&mcbb>;
+				reg = <0x0 0x7e8c0000 0x0 0x1000>;
+			};
+
+			edacpmd0: edacpmd0@7c000000 {
+				compatible = "apm,xgene-edac-pmd";
+				regmap-efuse = <&efuse>;
+				reg = <0x0 0x7c000000 0x0 0x200000>;
+			};
+
+			edacpmd1: edacpmd1@7c200000 {
+				compatible = "apm,xgene-edac-pmd";
+				regmap-efuse = <&efuse>;
+				reg = <0x0 0x7c200000 0x0 0x200000>;
+			};
+
+			edacpmd2: edacpmd2@7c400000 {
+				compatible = "apm,xgene-edac-pmd";
+				regmap-efuse = <&efuse>;
+				reg = <0x0 0x7c400000 0x0 0x200000>;
+			};
+
+			edacpmd3: edacpmd3@7c600000 {
+				compatible = "apm,xgene-edac-pmd";
+				regmap-efuse = <&efuse>;
+				reg = <0x0 0x7c600000 0x0 0x200000>;
+			};
+		};
+
 		pcie0: pcie@1f2b0000 {
 			status = "disabled";
 			device_type = "pci";
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
