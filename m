From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH v3 2/4] Documentation: Update the APM X-Gene SoC EDAC DTS binding for L3/SoC subnodes
Date: Tue, 11 Aug 2015 14:47:55 -0600
Message-ID: <1439326077-25507-3-git-send-email-lho@apm.com>
References: <1439326077-25507-1-git-send-email-lho@apm.com>
 <1439326077-25507-2-git-send-email-lho@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439326077-25507-2-git-send-email-lho-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch updates documentation for the APM X-Gene SoC EDAC DTS binding
for L3/SoC subnodes.

Signed-off-by: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
---
 .../devicetree/bindings/edac/apm-xgene-edac.txt    |   23 ++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/edac/apm-xgene-edac.txt b/Documentation/devicetree/bindings/edac/apm-xgene-edac.txt
index 78edb80..78e2a31 100644
--- a/Documentation/devicetree/bindings/edac/apm-xgene-edac.txt
+++ b/Documentation/devicetree/bindings/edac/apm-xgene-edac.txt
@@ -5,6 +5,8 @@ The follow error types are supported:
 
   memory controller	- Memory controller
   PMD (L1/L2)		- Processor module unit (PMD) L1/L2 cache
+  L3			- L3 cache controller
+  SoC			- SoC IP's such as Ethernet, SATA, and etc
 
 The following section describes the EDAC DT node binding.
 
@@ -30,6 +32,17 @@ Required properties for PMD subnode:
 - reg			: First resource shall be the PMD resource.
 - pmd-controller	: Instance number of the PMD controller.
 
+Required properties for L3 subnode:
+- compatible		: Shall be "apm,xgene-edac-l3" or
+                          "apm,xgene-edac-l3-v2".
+- reg			: First resource shall be the L3 EDAC resource.
+
+Required properties for SoC subnode:
+- compatible		: Shall be "apm,xgene-edac-soc-v1" for revision 1 or
+                          "apm,xgene-edac-l3-soc" for general value reporting
+                          only.
+- reg			: First resource shall be the SoC EDAC resource.
+
 Example:
 	csw: csw@7e200000 {
 		compatible = "apm,xgene-csw", "syscon";
@@ -76,4 +89,14 @@ Example:
 			reg = <0x0 0x7c000000 0x0 0x200000>;
 			pmd-controller = <0>;
 		};
+
+		edacl3@7e600000 {
+			compatible = "apm,xgene-edac-l3";
+			reg = <0x0 0x7e600000 0x0 0x1000>;
+		};
+
+		edacsoc@7e930000 {
+			compatible = "apm,xgene-edac-soc-v1";
+			reg = <0x0 0x7e930000 0x0 0x1000>;
+		};
 	};
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
