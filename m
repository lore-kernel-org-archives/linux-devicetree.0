From: Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
Subject: [PATCH] ARM: ux500: fix typo in STUIB device tree
Date: Tue, 21 May 2013 13:56:42 +0200
Message-ID: <1369137402-17580-1-git-send-email-linus.walleij@stericsson.com>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Gabriel Fernandez <gabriel.fernandez.st-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

The Rohm vendor name was twisted in the STUIB device tree
include file. Fix it up.

Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/stuib.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/stuib.dtsi b/arch/arm/boot/dts/stuib.dtsi
index 7fa10a7..0fdb259 100644
--- a/arch/arm/boot/dts/stuib.dtsi
+++ b/arch/arm/boot/dts/stuib.dtsi
@@ -53,25 +53,25 @@
 
 		i2c@80110000 {
 			bu21013_tp@0x5c {
-				compatible = "rhom,bu21013_tp";
+				compatible = "rohm,bu21013_tp";
 				reg = <0x5c>;
 				touch-gpio = <&gpio2 20 0x4>;
 				avdd-supply = <&ab8500_ldo_aux1_reg>;
 
-				rhom,touch-max-x = <384>;
-				rhom,touch-max-y = <704>;
-				rhom,flip-y;
+				rohm,touch-max-x = <384>;
+				rohm,touch-max-y = <704>;
+				rohm,flip-y;
 			};
 
 			bu21013_tp@0x5d {
-				compatible = "rhom,bu21013_tp";
+				compatible = "rohm,bu21013_tp";
 				reg = <0x5d>;
 				touch-gpio = <&gpio2 20 0x4>;
 				avdd-supply = <&ab8500_ldo_aux1_reg>;
 
-				rhom,touch-max-x = <384>;
-				rhom,touch-max-y = <704>;
-				rhom,flip-y;
+				rohm,touch-max-x = <384>;
+				rohm,touch-max-y = <704>;
+				rohm,flip-y;
 			};
 		};
 	};
-- 
1.7.11.3
