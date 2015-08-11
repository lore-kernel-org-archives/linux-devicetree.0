From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH v3 4/4] arm64: Add L3/SoC DT subnodes to the APM X-Gene SoC EDAC node
Date: Tue, 11 Aug 2015 14:47:57 -0600
Message-ID: <1439326077-25507-5-git-send-email-lho@apm.com>
References: <1439326077-25507-1-git-send-email-lho@apm.com>
 <1439326077-25507-2-git-send-email-lho@apm.com>
 <1439326077-25507-3-git-send-email-lho@apm.com>
 <1439326077-25507-4-git-send-email-lho@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439326077-25507-4-git-send-email-lho-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds L3/SoC DT subnodes to the APM X-Gene SoC EDAC node.

Signed-off-by: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
---
 arch/arm64/boot/dts/apm/apm-storm.dtsi |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
index 58093ed..8ab6b0e 100644
--- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
@@ -477,6 +477,16 @@
 				reg = <0x0 0x7c600000 0x0 0x200000>;
 				pmd-controller = <3>;
 			};
+
+			edacl3@7e600000 {
+				compatible = "apm,xgene-edac-l3";
+				reg = <0x0 0x7e600000 0x0 0x1000>;
+			};
+
+			edacsoc@7e930000 {
+				compatible = "apm,xgene-edac-soc-v1";
+				reg = <0x0 0x7e930000 0x0 0x1000>;
+			};
 		};
 
 		pcie0: pcie@1f2b0000 {
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
