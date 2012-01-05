From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: [PATCHv5 4/4] ARM: picoxcell: use new Synopsys Designware GPIO binding
Date: Thu,  5 Jan 2012 01:23:39 +0000
Message-ID: <1325726619-31796-5-git-send-email-jamie@jamieiles.com>
References: <1325726619-31796-1-git-send-email-jamie@jamieiles.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1325726619-31796-1-git-send-email-jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

Use the DesignWare specific binding rather than the generic binding
which isn't supported in mainline.

Signed-off-by: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
---
 arch/arm/boot/dts/picoxcell-pc3x2.dtsi |   19 ++++++++-----------
 arch/arm/boot/dts/picoxcell-pc3x3.dtsi |   28 +++++++++++-----------------
 2 files changed, 19 insertions(+), 28 deletions(-)

diff --git a/arch/arm/boot/dts/picoxcell-pc3x2.dtsi b/arch/arm/boot/dts/picoxcell-pc3x2.dtsi
index f0a8c20..a247812 100644
--- a/arch/arm/boot/dts/picoxcell-pc3x2.dtsi
+++ b/arch/arm/boot/dts/picoxcell-pc3x2.dtsi
@@ -169,28 +169,25 @@
 				reg = <0x20000 0x1000>;
 				#address-cells = <1>;
 				#size-cells = <0>;
-				reg-io-width = <4>;
 
 				banka: gpio-controller@0 {
 					compatible = "snps,dw-apb-gpio-bank";
 					gpio-controller;
 					#gpio-cells = <2>;
-					gpio-generic,nr-gpio = <8>;
-
-					regoffset-dat = <0x50>;
-					regoffset-set = <0x00>;
-					regoffset-dirout = <0x04>;
+					nr-gpio = <8>;
+					reg = <0>;
+					interrupt-controller;
+					#interrupt-cells = <2>;
+					interrupt-parent = <&vic1>;
+					interrupts = <0 1 2 3 4 5 6 7>;
 				};
 
 				bankb: gpio-controller@1 {
 					compatible = "snps,dw-apb-gpio-bank";
 					gpio-controller;
 					#gpio-cells = <2>;
-					gpio-generic,nr-gpio = <8>;
-
-					regoffset-dat = <0x54>;
-					regoffset-set = <0x0c>;
-					regoffset-dirout = <0x10>;
+					nr-gpio = <8>;
+					reg = <1>;
 				};
 			};
 
diff --git a/arch/arm/boot/dts/picoxcell-pc3x3.dtsi b/arch/arm/boot/dts/picoxcell-pc3x3.dtsi
index daa962d..96f049f 100644
--- a/arch/arm/boot/dts/picoxcell-pc3x3.dtsi
+++ b/arch/arm/boot/dts/picoxcell-pc3x3.dtsi
@@ -252,39 +252,33 @@
 				reg = <0x20000 0x1000>;
 				#address-cells = <1>;
 				#size-cells = <0>;
-				reg-io-width = <4>;
 
 				banka: gpio-controller@0 {
 					compatible = "snps,dw-apb-gpio-bank";
 					gpio-controller;
+					reg = <0>;
 					#gpio-cells = <2>;
-					gpio-generic,nr-gpio = <8>;
-
-					regoffset-dat = <0x50>;
-					regoffset-set = <0x00>;
-					regoffset-dirout = <0x04>;
+					nr-gpio = <8>;
+					interrupt-controller;
+					#interrupt-cells = <2>;
+					interrupt-parent = <&vic1>;
+					interrupts = <0 1 2 3 4 5 6 7>;
 				};
 
 				bankb: gpio-controller@1 {
 					compatible = "snps,dw-apb-gpio-bank";
 					gpio-controller;
+					reg = <1>;
 					#gpio-cells = <2>;
-					gpio-generic,nr-gpio = <16>;
-
-					regoffset-dat = <0x54>;
-					regoffset-set = <0x0c>;
-					regoffset-dirout = <0x10>;
+					nr-gpio = <16>;
 				};
 
-				bankd: gpio-controller@2 {
+				bankd: gpio-controller@3 {
 					compatible = "snps,dw-apb-gpio-bank";
 					gpio-controller;
+					reg = <3>;
 					#gpio-cells = <2>;
-					gpio-generic,nr-gpio = <30>;
-
-					regoffset-dat = <0x5c>;
-					regoffset-set = <0x24>;
-					regoffset-dirout = <0x28>;
+					nr-gpio = <30>;
 				};
 			};
 
-- 
1.7.5.4
