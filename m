From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH v3 4/4] arm64: Add APM X-Gene SoC EDAC DTS entries
Date: Mon,  2 Jun 2014 20:14:20 -0600
Message-ID: <1401761660-11515-5-git-send-email-lho@apm.com>
References: <1401761660-11515-1-git-send-email-lho@apm.com>
 <1401761660-11515-2-git-send-email-lho@apm.com>
 <1401761660-11515-3-git-send-email-lho@apm.com>
 <1401761660-11515-4-git-send-email-lho@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401761660-11515-4-git-send-email-lho-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds APM X-Gene SoC EDAC DTS entries.

Signed-off-by: Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
Signed-off-by: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
---
 arch/arm64/boot/dts/apm-storm.dtsi |   97 ++++++++++++++++++++++++++++++++++++
 1 files changed, 97 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/boot/dts/apm-storm.dtsi b/arch/arm64/boot/dts/apm-storm.dtsi
index 93f4b2d..6042a99 100644
--- a/arch/arm64/boot/dts/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm-storm.dtsi
@@ -269,6 +269,103 @@
 			interrupts = <0x0 0x4c 0x4>;
 		};
 
+		edacmc0: edacmc0@7e800000 {
+			compatible = "apm,xgene-edac-mc";
+			reg = <0x0 0x78800000 0x0 0x1000>,
+			      <0x0 0x7e200000 0x0 0x1000>,
+			      <0x0 0x7e700000 0x0 0x1000>,
+			      <0x0 0x7e720000 0x0 0x1000>,
+			      <0x0 0x7e800000 0x0 0x1000>;
+			interrupts = <0x0 0x20 0x4>,
+				     <0x0 0x21 0x4>;
+		};
+
+		edacmc1: edacmc1@7e840000 {
+			compatible = "apm,xgene-edac-mc";
+			reg = <0x0 0x78800000 0x0 0x1000>,
+			      <0x0 0x7e200000 0x0 0x1000>,
+			      <0x0 0x7e700000 0x0 0x1000>,
+			      <0x0 0x7e720000 0x0 0x1000>,
+			      <0x0 0x7e840000 0x0 0x1000>;
+			interrupts = <0x0 0x20 0x4>,
+				     <0x0 0x21 0x4>;
+		};
+
+		edacmc2: edacmc2@7e880000 {
+			compatible = "apm,xgene-edac-mc";
+			reg = <0x0 0x78800000 0x0 0x1000>,
+			      <0x0 0x7e200000 0x0 0x1000>,
+			      <0x0 0x7e700000 0x0 0x1000>,
+			      <0x0 0x7e720000 0x0 0x1000>,
+			      <0x0 0x7e880000 0x0 0x1000>;
+			interrupts = <0x0 0x20 0x4>,
+				     <0x0 0x21 0x4>;
+		};
+
+		edacmc3: edacmc3@7e8c0000 {
+			compatible = "apm,xgene-edac-mc";
+			reg = <0x0 0x78800000 0x0 0x1000>,
+			      <0x0 0x7e200000 0x0 0x1000>,
+			      <0x0 0x7e700000 0x0 0x1000>,
+			      <0x0 0x7e720000 0x0 0x1000>,
+			      <0x0 0x7e8c0000 0x0 0x1000>;
+			interrupts = <0x0 0x20 0x4>,
+				     <0x0 0x21 0x4>;
+		};
+
+		edacpmd0: edacpmd0@7c000000 {
+			compatible = "apm,xgene-edac-pmd";
+			reg = <0x0 0x78800000 0x0 0x1000>,
+			      <0x0 0x7c000000 0x0 0x200000>,
+			      <0x0 0x1054a000 0x0 0x10>;
+			interrupts = <0x0 0x20 0x4>,
+				     <0x0 0x21 0x4>;
+		};
+
+		edacpmd1: edacpmd1@7c200000 {
+			compatible = "apm,xgene-edac-pmd";
+			reg = <0x0 0x78800000 0x0 0x1000>,
+			      <0x0 0x7c200000 0x0 0x200000>,
+			      <0x0 0x1054a000 0x0 0x10>;
+			interrupts = <0x0 0x20 0x4>,
+				     <0x0 0x21 0x4>;
+		};
+
+		edacpmd2: edacpmd2@7c400000 {
+			compatible = "apm,xgene-edac-pmd";
+			reg = <0x0 0x78800000 0x0 0x1000>,
+			      <0x0 0x7c400000 0x0 0x200000>,
+			      <0x0 0x1054a000 0x0 0x10>;
+			interrupts = <0x0 0x20 0x4>,
+				     <0x0 0x21 0x4>;
+		};
+
+		edacpmd3: edacpmd3@7c600000 {
+			compatible = "apm,xgene-edac-pmd";
+			reg = <0x0 0x78800000 0x0 0x1000>,
+			      <0x0 0x7c600000 0x0 0x200000>,
+			      <0x0 0x1054a000 0x0 0x10>;
+			interrupts = <0x0 0x20 0x4>,
+				     <0x0 0x21 0x4>;
+		};
+
+		edacl3: edacl3@7e600000 {
+			compatible = "apm,xgene-edac-l3";
+			reg = <0x0 0x78800000 0x0 0x1000>,
+			      <0x0 0x7e600000 0x0 0x1000>;
+			interrupts = <0x0 0x20 0x4>,
+				     <0x0 0x21 0x4>;
+		};
+
+		edacsoc: edacsoc@7e930000 {
+			compatible = "apm,xgene-edac-soc";
+			reg = <0x0 0x78800000 0x0 0x1000>,
+			      <0x0 0x7e930000 0x0 0x1000>;
+			interrupts = <0x0 0x20 0x4>,
+				     <0x0 0x21 0x4>,
+				     <0x0 0x27 0x4>;
+		};
+
 		phy1: phy@1f21a000 {
 			compatible = "apm,xgene-phy";
 			reg = <0x0 0x1f21a000 0x0 0x100>;
-- 
1.5.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
