From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH 3/3] arm64: Update the APM X-Gene EDAC node with the RB register resource
Date: Tue, 12 Jan 2016 16:05:00 -0700
Message-ID: <1452639900-30919-4-git-send-email-lho@apm.com>
References: <1452639900-30919-1-git-send-email-lho@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452639900-30919-1-git-send-email-lho-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org
Cc: linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the RB register resource as requires with the updated driver.

Signed-off-by: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
---
 arch/arm64/boot/dts/apm/apm-storm.dtsi |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
index 6c5ed11..6665906 100644
--- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
@@ -444,6 +444,11 @@
 			reg = <0x0 0x1054a000 0x0 0x20>;
 		};
 
+                rb: rb@7e000000 {
+                        compatible = "apm,xgene-rb", "syscon";
+                        reg = <0x0 0x7e000000 0x0 0x10>;
+                };
+
 		edac@78800000 {
 			compatible = "apm,xgene-edac";
 			#address-cells = <2>;
@@ -453,6 +458,7 @@
 			regmap-mcba = <&mcba>;
 			regmap-mcbb = <&mcbb>;
 			regmap-efuse = <&efuse>;
+			regmap-rb = <&rb>;
 			reg = <0x0 0x78800000 0x0 0x100>;
 			interrupts = <0x0 0x20 0x4>,
 				     <0x0 0x21 0x4>,
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
