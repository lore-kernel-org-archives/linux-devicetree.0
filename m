From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: dts: sun6i: Add a dts file for the Mele
 A1000G quad top set box
Date: Mon,  1 Jun 2015 17:02:59 +0200
Message-ID: <1433170979-13725-1-git-send-email-hdegoede@redhat.com>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBJXIWGVQKGQE6BH7KJA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Mele A1000G-quad and the Mele M9 have the same PCB, sofar we've been using
the same dts for both models. Unfortunately this does not work for the otg
controller, on the M9 this is routed to a micro-usb connector on the outside,
while as on the A1000G-quad it is connected to an usb to sata bridge
(which is not populated on the M9 pcb).

This commit adds a new dts for the Mele-A1000G-quad to allow using
different otg controller settings on the 2 boards.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/Makefile                                        | 1 +
 arch/arm/boot/dts/{sun6i-a31-m9.dts => sun6i-a31-a1000g-quad.dts} | 4 ++--
 arch/arm/boot/dts/sun6i-a31-m9.dts                                | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)
 copy arch/arm/boot/dts/{sun6i-a31-m9.dts => sun6i-a31-a1000g-quad.dts} (97%)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index b308baf..a413d7b 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -546,6 +546,7 @@ dtb-$(CONFIG_MACH_SUN5I) += \
 	sun5i-a13-olinuxino-micro.dtb \
 	sun5i-a13-utoo-p66.dtb
 dtb-$(CONFIG_MACH_SUN6I) += \
+	sun6i-a31-a1000g-quad.dtb \
 	sun6i-a31-app4-evb1.dtb \
 	sun6i-a31-colombus.dtb \
 	sun6i-a31-hummingbird.dtb \
diff --git a/arch/arm/boot/dts/sun6i-a31-m9.dts b/arch/arm/boot/dts/sun6i-a31-a1000g-quad.dts
similarity index 97%
copy from arch/arm/boot/dts/sun6i-a31-m9.dts
copy to arch/arm/boot/dts/sun6i-a31-a1000g-quad.dts
index a5660d6..4404f37 100644
--- a/arch/arm/boot/dts/sun6i-a31-m9.dts
+++ b/arch/arm/boot/dts/sun6i-a31-a1000g-quad.dts
@@ -48,8 +48,8 @@
 #include <dt-bindings/pinctrl/sun4i-a10.h>
 
 / {
-	model = "Mele M9 / A1000G Quad top set box";
-	compatible = "mele,m9", "allwinner,sun6i-a31";
+	model = "Mele A1000G Quad top set box";
+	compatible = "mele,a1000g-quad", "allwinner,sun6i-a31";
 
 	aliases {
 		serial0 = &uart0;
diff --git a/arch/arm/boot/dts/sun6i-a31-m9.dts b/arch/arm/boot/dts/sun6i-a31-m9.dts
index a5660d6..6e0e5687 100644
--- a/arch/arm/boot/dts/sun6i-a31-m9.dts
+++ b/arch/arm/boot/dts/sun6i-a31-m9.dts
@@ -48,7 +48,7 @@
 #include <dt-bindings/pinctrl/sun4i-a10.h>
 
 / {
-	model = "Mele M9 / A1000G Quad top set box";
+	model = "Mele M9 top set box";
 	compatible = "mele,m9", "allwinner,sun6i-a31";
 
 	aliases {
-- 
2.4.2
