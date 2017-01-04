From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 1/2] ARM: dts: OX810: Update with dt-bindings includes
Date: Wed,  4 Jan 2017 10:30:45 +0100
Message-ID: <20170104093046.12428-2-narmstrong@baylibre.com>
References: <20170104093046.12428-1-narmstrong@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170104093046.12428-1-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-oxnas@lists.tuxfamily.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add OX810SE dt-bindings includes files for clocks and resets, replace
resets numbers by human readable defines.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
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
