From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH 5/5] arm64: Add APM X-Gene SoC EDAC DTS entries
Date: Tue, 28 Apr 2015 16:10:45 -0600
Message-ID: <1430259045-19012-6-git-send-email-lho@apm.com>
References: <1430259045-19012-1-git-send-email-lho@apm.com>
 <1430259045-19012-2-git-send-email-lho@apm.com>
 <1430259045-19012-3-git-send-email-lho@apm.com>
 <1430259045-19012-4-git-send-email-lho@apm.com>
 <1430259045-19012-5-git-send-email-lho@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430259045-19012-5-git-send-email-lho-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org
Cc: linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds APM X-Gene SoC EDAC DTS entries.

Signed-off-by: Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
Signed-off-by: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
---
 arch/arm64/boot/dts/apm/apm-storm.dtsi |  123 ++++++++++++++++++++++++++++++++
 1 files changed, 123 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
index c8d3e0e..7ccb289 100644
--- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
@@ -374,6 +374,129 @@
 			};
 		};
 
+		efuse: efuse@1054a000 {
+			compatible = "syscon";
+			reg = <0x0 0x1054a000 0x0 0x20>;
+		};
+
+		pcperror: pcperror@78800000 {
+			compatible = "syscon";
+			reg = <0x0 0x78800000 0x0 0x100>;
+		};
+
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
+		edacmc0: edacmc0@7e800000 {
+			compatible = "apm,xgene-edac-mc";
+			regmap-pcp = <&pcperror>;
+			regmap-csw = <&csw>;
+			regmap-mcba = <&mcba>;
+			regmap-mcbb = <&mcbb>;
+			reg = <0x0 0x7e800000 0x0 0x1000>;
+			interrupts = <0x0 0x20 0x4>,
+				     <0x0 0x21 0x4>;
+		};
+
+		edacmc1: edacmc1@7e840000 {
+			compatible = "apm,xgene-edac-mc";
+			regmap-pcp = <&pcperror>;
+			regmap-csw = <&csw>;
+			regmap-mcba = <&mcba>;
+			regmap-mcbb = <&mcbb>;
+			reg = <0x0 0x7e840000 0x0 0x1000>;
+			interrupts = <0x0 0x20 0x4>,
+				     <0x0 0x21 0x4>;
+		};
+
+		edacmc2: edacmc2@7e880000 {
+			compatible = "apm,xgene-edac-mc";
+			regmap-pcp = <&pcperror>;
+			regmap-csw = <&csw>;
+			regmap-mcba = <&mcba>;
+			regmap-mcbb = <&mcbb>;
+			reg = <0x0 0x7e880000 0x0 0x1000>;
+			interrupts = <0x0 0x20 0x4>,
+				     <0x0 0x21 0x4>;
+		};
+
+		edacmc3: edacmc3@7e8c0000 {
+			compatible = "apm,xgene-edac-mc";
+			regmap-pcp = <&pcperror>;
+			regmap-csw = <&csw>;
+			regmap-mcba = <&mcba>;
+			regmap-mcbb = <&mcbb>;
+			reg = <0x0 0x7e8c0000 0x0 0x1000>;
+			interrupts = <0x0 0x20 0x4>,
+				     <0x0 0x21 0x4>;
+		};
+
+		edacpmd0: edacpmd0@7c000000 {
+			compatible = "apm,xgene-edac-pmd";
+			regmap-pcp = <&pcperror>;
+			regmap-efuse = <&efuse>;
+			reg = <0x0 0x7c000000 0x0 0x200000>;
+			interrupts = <0x0 0x20 0x4>,
+				     <0x0 0x21 0x4>;
+		};
+
+		edacpmd1: edacpmd1@7c200000 {
+			compatible = "apm,xgene-edac-pmd";
+			regmap-pcp = <&pcperror>;
+			regmap-efuse = <&efuse>;
+			reg = <0x0 0x7c200000 0x0 0x200000>;
+			interrupts = <0x0 0x20 0x4>,
+				     <0x0 0x21 0x4>;
+		};
+
+		edacpmd2: edacpmd2@7c400000 {
+			compatible = "apm,xgene-edac-pmd";
+			regmap-pcp = <&pcperror>;
+			regmap-efuse = <&efuse>;
+			reg = <0x0 0x7c400000 0x0 0x200000>;
+			interrupts = <0x0 0x20 0x4>,
+				     <0x0 0x21 0x4>;
+		};
+
+		edacpmd3: edacpmd3@7c600000 {
+			compatible = "apm,xgene-edac-pmd";
+			regmap-pcp = <&pcperror>;
+			regmap-efuse = <&efuse>;
+			reg = <0x0 0x7c600000 0x0 0x200000>;
+			interrupts = <0x0 0x20 0x4>,
+				     <0x0 0x21 0x4>;
+		};
+
+		edacl3: edacl3@7e600000 {
+			compatible = "apm,xgene-edac-l3";
+			regmap-pcp = <&pcperror>;
+			reg = <0x0 0x7e600000 0x0 0x1000>;
+			interrupts = <0x0 0x20 0x4>,
+				     <0x0 0x21 0x4>;
+		};
+
+		edacsoc: edacsoc@7e930000 {
+			compatible = "apm,xgene-edac-soc";
+			regmap-pcp = <&pcperror>;
+			reg = <0x0 0x7e930000 0x0 0x1000>,
+			      <0x0 0x7e000000 0x0 0x1000>;
+			interrupts = <0x0 0x20 0x4>,
+				     <0x0 0x21 0x4>,
+				     <0x0 0x27 0x4>;
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
