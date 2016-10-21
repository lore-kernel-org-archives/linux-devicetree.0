From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 2/3] ARM: dts: OX810: Update with dt-bindings includes
Date: Fri, 21 Oct 2016 17:10:36 +0200
Message-ID: <20161021151037.20112-3-narmstrong@baylibre.com>
References: <20161021151037.20112-1-narmstrong@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161021151037.20112-1-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-oxnas-Xt5XgHjqiBU06sgRBLv0+0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add OX810SE dt-bindings includes files for clocks and resets, replace
resets numbers by human readable defines.

Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/ox810se.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/ox810se.dtsi b/arch/arm/boot/dts/ox810se.dtsi
index ce13705..46aa6db 100644
--- a/arch/arm/boot/dts/ox810se.dtsi
+++ b/arch/arm/boot/dts/ox810se.dtsi
@@ -7,6 +7,8 @@
  */
 
 /include/ "skeleton.dtsi"
+#include <dt-bindings/clock/oxsemi,ox810se.h>
+#include <dt-bindings/reset/oxsemi,ox810se.h>
 
 / {
 	compatible = "oxsemi,ox810se";
@@ -242,7 +244,7 @@
 			       current-speed = <115200>;
 			       no-loopback-test;
 			       status = "disabled";
-			       resets = <&reset 17>;
+			       resets = <&reset RESET_UART1>;
 			};
 
 			uart1: serial@300000 {
@@ -256,7 +258,7 @@
 			       current-speed = <115200>;
 			       no-loopback-test;
 			       status = "disabled";
-			       resets = <&reset 18>;
+			       resets = <&reset RESET_UART2>;
 			};
 
 			uart2: serial@900000 {
@@ -270,7 +272,7 @@
 			       current-speed = <115200>;
 			       no-loopback-test;
 			       status = "disabled";
-			       resets = <&reset 22>;
+			       resets = <&reset RESET_UART3>;
 			};
 
 			uart3: serial@a00000 {
@@ -284,7 +286,7 @@
 			       current-speed = <115200>;
 			       no-loopback-test;
 			       status = "disabled";
-			       resets = <&reset 23>;
+			       resets = <&reset RESET_UART4>;
 			};
 		};
 
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
