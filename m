From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH 1/3] Documentation: Update the APM X-Gene SoC EDAC DTS binding for L3/SoC subnodes
Date: Fri, 29 May 2015 16:04:33 -0600
Message-ID: <1432937075-16558-2-git-send-email-lho@apm.com>
References: <1432937075-16558-1-git-send-email-lho@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432937075-16558-1-git-send-email-lho-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org
Cc: linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch updates documentation for the APM X-Gene SoC EDAC DTS binding
for L3/SoC subnodes.

Signed-off-by: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
---
 .../devicetree/bindings/edac/apm-xgene-edac.txt    |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/edac/apm-xgene-edac.txt b/Documentation/devicetree/bindings/edac/apm-xgene-edac.txt
index 480911c..0aa4bd3 100644
--- a/Documentation/devicetree/bindings/edac/apm-xgene-edac.txt
+++ b/Documentation/devicetree/bindings/edac/apm-xgene-edac.txt
@@ -29,6 +29,14 @@ Required properties for PMD subnode:
 - reg			: First resource shall be the PMD resource.
 - pmd-controller	: Instance number of the PMD controller.
 
+Required properties for L3 subnode:
+- compatible		: Shall be "apm,xgene-edac-l3".
+- reg			: First resource shall be the L3 resource.
+
+Required properties for SoC subnode:
+- compatible		: Shall be "apm,xgene-edac-soc".
+- reg			: First resource shall be the SoC resource.
+
 Example:
 	csw: csw@7e200000 {
 		compatible = "apm,xgene-csw", "syscon";
@@ -75,4 +83,14 @@ Example:
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
+			compatible = "apm,xgene-edac-soc";
+			reg = <0x0 0x7e930000 0x0 0x1000>;
+		};
 	};
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
