From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH v3 1/3] Documentation: Update the APM X-Gene SoC EDAC DTS binding for missing RB
Date: Fri, 22 Jan 2016 13:47:03 -0700
Message-ID: <1453495625-28006-2-git-send-email-lho@apm.com>
References: <1453495625-28006-1-git-send-email-lho@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453495625-28006-1-git-send-email-lho-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch updates the APM X-Gene SoC EDAC documentation binding to
reference the missing register bus for the SoC EDAC.

Signed-off-by: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
---
 .../devicetree/bindings/edac/apm-xgene-edac.txt    |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/edac/apm-xgene-edac.txt b/Documentation/devicetree/bindings/edac/apm-xgene-edac.txt
index 78e2a31..1006b04 100644
--- a/Documentation/devicetree/bindings/edac/apm-xgene-edac.txt
+++ b/Documentation/devicetree/bindings/edac/apm-xgene-edac.txt
@@ -16,6 +16,10 @@ Required properties:
 - regmap-mcba		: Regmap of the MCB-A (memory bridge) resource.
 - regmap-mcbb		: Regmap of the MCB-B (memory bridge) resource.
 - regmap-efuse		: Regmap of the PMD efuse resource.
+- regmap-rb		: Regmap of the register bus resource. This property
+			  is optional only for compatibility. If the RB
+			  error conditions are not cleared, it will
+			  continuously generate interrupt.
 - reg			: First resource shall be the CPU bus (PCP) resource.
 - interrupts            : Interrupt-specifier for MCU, PMD, L3, or SoC error
 			  IRQ(s).
@@ -64,6 +68,11 @@ Example:
 		reg = <0x0 0x1054a000 0x0 0x20>;
 	};
 
+	rb: rb@7e000000 {
+		compatible = "apm,xgene-rb", "syscon";
+		reg = <0x0 0x7e000000 0x0 0x10>;
+	};
+
 	edac@78800000 {
 		compatible = "apm,xgene-edac";
 		#address-cells = <2>;
@@ -73,6 +82,7 @@ Example:
 		regmap-mcba = <&mcba>;
 		regmap-mcbb = <&mcbb>;
 		regmap-efuse = <&efuse>;
+		regmap-rb = <&rb>;
 		reg = <0x0 0x78800000 0x0 0x100>;
 		interrupts = <0x0 0x20 0x4>,
 			     <0x0 0x21 0x4>,
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
