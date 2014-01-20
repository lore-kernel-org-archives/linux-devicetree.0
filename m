From: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH] ARM: dts: imx6qdl-sabresd: correct gpio key's active state
Date: Mon, 20 Jan 2014 19:42:33 +0800
Message-ID: <1390218153-11034-1-git-send-email-b20788@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

>From schematic, the power, vol+/- key's active state is low,
so we need to set the gpio flag to active low.

Signed-off-by: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl-sabresd.dtsi |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
index 91e5dd4..f7689b4 100644
--- a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
@@ -58,21 +58,21 @@
 
 		power {
 			label = "Power Button";
-			gpios = <&gpio3 29 0>;
+			gpios = <&gpio3 29 1>;
 			gpio-key,wakeup;
 			linux,code = <KEY_POWER>;
 		};
 
 		volume-up {
 			label = "Volume Up";
-			gpios = <&gpio1 4 0>;
+			gpios = <&gpio1 4 1>;
 			gpio-key,wakeup;
 			linux,code = <KEY_VOLUMEUP>;
 		};
 
 		volume-down {
 			label = "Volume Down";
-			gpios = <&gpio1 5 0>;
+			gpios = <&gpio1 5 1>;
 			gpio-key,wakeup;
 			linux,code = <KEY_VOLUMEDOWN>;
 		};
-- 
1.7.9.5


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
