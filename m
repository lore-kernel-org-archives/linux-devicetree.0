From: Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
Subject: [PATCH] ARM: ux500: drop any 0x prefix from I2C DT devices
Date: Tue, 4 Jun 2013 11:53:16 +0200
Message-ID: <1370339596-21606-1-git-send-email-linus.walleij@stericsson.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Gabriel Fernandez <gabriel.fernandez.st-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

This removes the "0x" prefix in front of the I2C DT device
address designation for each I2C DT node in the ux500
devicetree files.

Reported-by: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/href.dtsi      | 2 +-
 arch/arm/boot/dts/hrefprev60.dts | 2 +-
 arch/arm/boot/dts/snowball.dts   | 6 +++---
 arch/arm/boot/dts/stuib.dtsi     | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/href.dtsi b/arch/arm/boot/dts/href.dtsi
index 080c530..9db41b9 100644
--- a/arch/arm/boot/dts/href.dtsi
+++ b/arch/arm/boot/dts/href.dtsi
@@ -100,7 +100,7 @@
 					max-cur = /bits/ 8 <0x5f>;
 				};
 			};
-			bh1780@0x29 {
+			bh1780@29 {
 				compatible = "rohm,bh1780gli";
 				reg = <0x33>;
 			};
diff --git a/arch/arm/boot/dts/hrefprev60.dts b/arch/arm/boot/dts/hrefprev60.dts
index 23c6dc1..c6bb07d 100644
--- a/arch/arm/boot/dts/hrefprev60.dts
+++ b/arch/arm/boot/dts/hrefprev60.dts
@@ -41,7 +41,7 @@
 		};
 
 		i2c@80110000 {
-			bu21013_tp@0x5c {
+			bu21013_tp@5c {
 				reset-gpio = <&tc3589x_gpio 13 0x4>;
 			};
 		};
diff --git a/arch/arm/boot/dts/snowball.dts b/arch/arm/boot/dts/snowball.dts
index 92c2f5ad..fb9dce5 100644
--- a/arch/arm/boot/dts/snowball.dts
+++ b/arch/arm/boot/dts/snowball.dts
@@ -178,15 +178,15 @@
 		};
 
 		i2c@80128000 {
-			lp5521@0x33 {
+			lp5521@33 {
 				// compatible = "lp5521";
 				reg = <0x33>;
 			};
-			lp5521@0x34 {
+			lp5521@34 {
 				// compatible = "lp5521";
 				reg = <0x34>;
 			};
-			bh1780@0x29 {
+			bh1780@29 {
 				// compatible = "rohm,bh1780gli";
 				reg = <0x33>;
 			};
diff --git a/arch/arm/boot/dts/stuib.dtsi b/arch/arm/boot/dts/stuib.dtsi
index b47b62a..524e332 100644
--- a/arch/arm/boot/dts/stuib.dtsi
+++ b/arch/arm/boot/dts/stuib.dtsi
@@ -54,7 +54,7 @@
 		};
 
 		i2c@80110000 {
-			bu21013_tp@0x5c {
+			bu21013_tp@5c {
 				compatible = "rohm,bu21013_tp";
 				reg = <0x5c>;
 				touch-gpio = <&gpio2 20 0x4>;
@@ -65,7 +65,7 @@
 				rohm,flip-y;
 			};
 
-			bu21013_tp@0x5d {
+			bu21013_tp@5d {
 				compatible = "rohm,bu21013_tp";
 				reg = <0x5d>;
 				touch-gpio = <&gpio2 20 0x4>;
-- 
1.7.11.3
