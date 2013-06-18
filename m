From: <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] ARM: dts: Change dw-apb-timer-osc and dw-apb-timer-sp to
 just dw-apb-timer
Date: Mon, 17 Jun 2013 19:08:48 -0500
Message-ID: <1371514129-22801-2-git-send-email-dinguyen@altera.com>
References: <1371514129-22801-1-git-send-email-dinguyen@altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1371514129-22801-1-git-send-email-dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
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
To: dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>

"dw-apb-timer-osc" and "dw-apb-timer-sp" are the same implementation of the
DW APB timer, just fed by different clocks.

Signed-off-by: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
CC: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
CC: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
CC: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Cc: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
---
 Documentation/devicetree/bindings/rtc/dw-apb.txt |   21 +++------------------
 arch/arm/boot/dts/socfpga.dtsi                   |   12 ++++++++----
 2 files changed, 11 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/dw-apb.txt b/Documentation/devicetree/bindings/rtc/dw-apb.txt
index eb2327b..0a1020e 100644
--- a/Documentation/devicetree/bindings/rtc/dw-apb.txt
+++ b/Documentation/devicetree/bindings/rtc/dw-apb.txt
@@ -1,7 +1,7 @@
 * Designware APB timer
 
 Required properties:
-- compatible: "snps,dw-apb-timer-sp" or "snps,dw-apb-timer-osc"
+- compatible: "snps,dw-apb-timer"
 - reg: physical base address of the controller and length of memory mapped
   region.
 - interrupts: IRQ line for the timer.
@@ -20,23 +20,8 @@ systems may use one.
 
 
 Example:
-
-		timer1: timer@ffc09000 {
-				compatible = "snps,dw-apb-timer-sp";
-				interrupts = <0 168 4>;
-				clock-frequency = <200000000>;
-				reg = <0xffc09000 0x1000>;
-			};
-
-		timer2: timer@ffd00000 {
-				compatible = "snps,dw-apb-timer-osc";
-				interrupts = <0 169 4>;
-				clock-frequency = <200000000>;
-				reg = <0xffd00000 0x1000>;
-			};
-
-		timer3: timer@ffe00000 {
-				compatible = "snps,dw-apb-timer-osc";
+		timer1: timer@ffe00000 {
+				compatible = "snps,dw-apb-timer";
 				interrupts = <0 170 4>;
 				reg = <0xffe00000 0x1000>;
 				clocks = <&timer_clk>, <&timer_pclk>;
diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index bee62a2..ede33ae 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -476,27 +476,31 @@
 		};
 
 		timer0: timer0@ffc08000 {
-			compatible = "snps,dw-apb-timer-sp";
+			compatible = "snps,dw-apb-timer";
 			interrupts = <0 167 4>;
 			reg = <0xffc08000 0x1000>;
+			clocks = <&osc>;
 		};
 
 		timer1: timer1@ffc09000 {
-			compatible = "snps,dw-apb-timer-sp";
+			compatible = "snps,dw-apb-timer";
 			interrupts = <0 168 4>;
 			reg = <0xffc09000 0x1000>;
+			clocks = <&osc>;
 		};
 
 		timer2: timer2@ffd00000 {
-			compatible = "snps,dw-apb-timer-osc";
+			compatible = "snps,dw-apb-timer";
 			interrupts = <0 169 4>;
 			reg = <0xffd00000 0x1000>;
+			clocks = <&l4_sp_clk>;
 		};
 
 		timer3: timer3@ffd01000 {
-			compatible = "snps,dw-apb-timer-osc";
+			compatible = "snps,dw-apb-timer";
 			interrupts = <0 170 4>;
 			reg = <0xffd01000 0x1000>;
+			clocks = <&l4_sp_clk>;
 		};
 
 		uart0: serial0@ffc02000 {
-- 
1.7.9.5
