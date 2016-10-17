From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC PATCH 2/3] ARM: dts: OX810: Update with dt-bindings includes
Date: Mon, 17 Oct 2016 14:40:00 +0200
Message-ID: <20161017124001.23820-3-narmstrong@baylibre.com>
References: <20161017124001.23820-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161017124001.23820-1-narmstrong@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-oxnas@lists.tuxfamily.org, devicetree@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>
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
