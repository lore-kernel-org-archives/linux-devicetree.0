From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2] ARM: dts: sunxi: Update simplfb nodes so
 that u-boot can find them
Date: Tue, 18 Nov 2014 12:07:13 +0100
Message-ID: <1416308833-26739-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORB2OQVSRQKGQE6LZMDEQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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

Review of the u-boot sunxi simplefb patches has led to the decision that
u-boot should not use a specific path to find the nodes as this goes contrary
to how devicetree usually works.

Instead a platform specific compatible + properties should be used for this.

The simplefb bindings have already been updated to reflect this, this patch
brings the sunxi devicetree files in line with the new binding, and the
actual u-boot implementation as it is going upstream.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
Changes in v2:
-Use proper allwinner, vendor prefix instead of sunxi,
-Rename compatible to allwinner,simple-framebuffer to make clear these are
 vendor extensions to the simple-framebuffer bindings

foo
---
 arch/arm/boot/dts/sun4i-a10.dtsi  | 5 +++--
 arch/arm/boot/dts/sun5i-a10s.dtsi | 5 +++--
 arch/arm/boot/dts/sun6i-a31.dtsi  | 5 +++--
 arch/arm/boot/dts/sun7i-a20.dtsi  | 5 +++--
 4 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/sun4i-a10.dtsi b/arch/arm/boot/dts/sun4i-a10.dtsi
index 92d8aa6..7eae1bc 100644
--- a/arch/arm/boot/dts/sun4i-a10.dtsi
+++ b/arch/arm/boot/dts/sun4i-a10.dtsi
@@ -32,8 +32,9 @@
 		#size-cells = <1>;
 		ranges;
 
-		framebuffer0-hdmi {
-			compatible = "simple-framebuffer";
+		framebuffer@0 {
+			compatible = "allwinner,simple-framebuffer", "simple-framebuffer";
+			allwinner,pipeline = "de_be0-lcd0-hdmi";
 			clocks = <&pll5 1>, <&ahb_gates 36>, <&ahb_gates 43>,
 				 <&ahb_gates 44>;
 			status = "disabled";
diff --git a/arch/arm/boot/dts/sun5i-a10s.dtsi b/arch/arm/boot/dts/sun5i-a10s.dtsi
index c678e56..431343f 100644
--- a/arch/arm/boot/dts/sun5i-a10s.dtsi
+++ b/arch/arm/boot/dts/sun5i-a10s.dtsi
@@ -29,8 +29,9 @@
 		#size-cells = <1>;
 		ranges;
 
-		framebuffer0-hdmi {
-			compatible = "simple-framebuffer";
+		framebuffer@0 {
+			compatible = "allwinner,simple-framebuffer", "simple-framebuffer";
+			allwinner,pipeline = "de_be0-lcd0-hdmi";
 			clocks = <&pll5 1>, <&ahb_gates 36>, <&ahb_gates 43>,
 				 <&ahb_gates 44>;
 			status = "disabled";
diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a31.dtsi
index ccc03f3..a01b215 100644
--- a/arch/arm/boot/dts/sun6i-a31.dtsi
+++ b/arch/arm/boot/dts/sun6i-a31.dtsi
@@ -67,8 +67,9 @@
 		#size-cells = <1>;
 		ranges;
 
-		framebuffer0-hdmi {
-			compatible = "simple-framebuffer";
+		framebuffer@0 {
+			compatible = "allwinner,simple-framebuffer", "simple-framebuffer";
+			allwinner,pipeline = "de_be0-lcd0-hdmi";
 			clocks = <&pll6>;
 			status = "disabled";
 		};
diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index 89766cb..d605182d 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -69,8 +69,9 @@
 		#size-cells = <1>;
 		ranges;
 
-		framebuffer0-hdmi {
-			compatible = "simple-framebuffer";
+		framebuffer@0 {
+			compatible = "allwinner,simple-framebuffer", "simple-framebuffer";
+			allwinner,pipeline = "de_be0-lcd0-hdmi";
 			clocks = <&pll5 1>, <&ahb_gates 36>, <&ahb_gates 43>,
 				 <&ahb_gates 44>;
 			status = "disabled";
-- 
2.1.0
