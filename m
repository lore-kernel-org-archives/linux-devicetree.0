From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 1/7] ARM: mxc: fix gpio-ranges for VF610
Date: Thu, 13 Jun 2013 14:59:53 -0600
Message-ID: <1371157199-7272-1-git-send-email-swarren@wwwdotorg.org>
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
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Shiraz Hashim <shiraz.hashim-qxv4g6HH51o@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Jingchang Lu <b35083-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The gpio-ranges properties in vf610.dtsi were written according to an
older version of the GPIO bindings. Unfortunately, these were changed
incompatibly in commit 86853c8 "gpio: add gpio offset in gpio range
cells property". This patch adds the missing required extra cell in each
gpio-ranges property.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
This should be immediately applied to the tree which added vf610.dtsi.
---
 arch/arm/boot/dts/vf610.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/vf610.dtsi b/arch/arm/boot/dts/vf610.dtsi
index 659d845..e1eb7da 100644
--- a/arch/arm/boot/dts/vf610.dtsi
+++ b/arch/arm/boot/dts/vf610.dtsi
@@ -162,7 +162,7 @@
 			iomuxc: iomuxc@40048000 {
 				compatible = "fsl,vf610-iomuxc";
 				reg = <0x40048000 0x1000>;
-				#gpio-range-cells = <2>;
+				#gpio-range-cells = <3>;
 
 				/* functions and groups pins */
 
@@ -343,7 +343,7 @@
 				#gpio-cells = <2>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
-				gpio-ranges = <&iomuxc 0 32>;
+				gpio-ranges = <&iomuxc 0 0 32>;
 			};
 
 			gpio2: gpio@4004a000 {
@@ -354,7 +354,7 @@
 				#gpio-cells = <2>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
-				gpio-ranges = <&iomuxc 32 32>;
+				gpio-ranges = <&iomuxc 0 32 32>;
 			};
 
 			gpio3: gpio@4004b000 {
@@ -365,7 +365,7 @@
 				#gpio-cells = <2>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
-				gpio-ranges = <&iomuxc 64 32>;
+				gpio-ranges = <&iomuxc 0 64 32>;
 			};
 
 			gpio4: gpio@4004c000 {
@@ -376,7 +376,7 @@
 				#gpio-cells = <2>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
-				gpio-ranges = <&iomuxc 96 32>;
+				gpio-ranges = <&iomuxc 0 96 32>;
 			};
 
 			gpio5: gpio@4004d000 {
@@ -387,7 +387,7 @@
 				#gpio-cells = <2>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
-				gpio-ranges = <&iomuxc 128 7>;
+				gpio-ranges = <&iomuxc 0 128 7>;
 			};
 
 			anatop@40050000 {
-- 
1.8.1.5
