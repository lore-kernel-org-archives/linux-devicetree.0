From: Linus Walleij <linus.walleij@stericsson.com>
Subject: [PATCH] ARM: ux500: register LP5521 LEDs in the device tree
Date: Wed, 22 May 2013 10:12:11 +0200
Message-ID: <1369210331-18545-1-git-send-email-linus.walleij@stericsson.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Milo Kim <Milo.Kim@ti.com>, devicetree-discuss@lists.ozlabs.org, Bryan Wu <cooloney@gmail.com>, Gabriel Fernandez <gabriel.fernandez.st@gmail.com>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Linus Walleij <linus.walleij@linaro.org>

Based on pending device tree support in the LP55xx drivers
we can add the correct LED and channel configuration from the
ux500 device tree for all HREF variants.

Cc: Milo Kim <Milo.Kim@ti.com>
Cc: Bryan Wu <cooloney@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/href.dtsi | 38 ++++++++++++++++++++++++++++++++------
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/href.dtsi b/arch/arm/boot/dts/href.dtsi
index 62523f6..e315429 100644
--- a/arch/arm/boot/dts/href.dtsi
+++ b/arch/arm/boot/dts/href.dtsi
@@ -63,16 +63,42 @@
 		};
 
 		i2c@80128000 {
-			lp5521@0x33 {
-				compatible = "lp5521";
+			lp5521@33 {
+				compatible = "national,lp5521";
 				reg = <0x33>;
+				label = "lp5521_pri";
+				clock-mode = /bits/ 8 <2>;
+				chan0 {
+					led-cur = /bits/ 8 <0x2f>;
+					max-cur = /bits/ 8 <0x5f>;
+				};
+				chan1 {
+					led-cur = /bits/ 8 <0x2f>;
+					max-cur = /bits/ 8 <0x5f>;
+				};
+				chan2 {
+					led-cur = /bits/ 8 <0x2f>;
+					max-cur = /bits/ 8 <0x5f>;
+				};
 			};
-
-			lp5521@0x34 {
-				compatible = "lp5521";
+			lp5521@34 {
+				compatible = "national,lp5521";
 				reg = <0x34>;
+				label = "lp5521_sec";
+				clock-mode = /bits/ 8 <2>;
+				chan0 {
+					led-cur = /bits/ 8 <0x2f>;
+					max-cur = /bits/ 8 <0x5f>;
+				};
+				chan1 {
+					led-cur = /bits/ 8 <0x2f>;
+					max-cur = /bits/ 8 <0x5f>;
+				};
+				chan2 {
+					led-cur = /bits/ 8 <0x2f>;
+					max-cur = /bits/ 8 <0x5f>;
+				};
 			};
-
 			bh1780@0x29 {
 				compatible = "rohm,bh1780gli";
 				reg = <0x33>;
-- 
1.7.11.3
