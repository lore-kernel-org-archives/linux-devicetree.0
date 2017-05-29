From: Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 2/3] ARM: dts: sunxi: Update model and
 compatible for bananapi
Date: Mon, 29 May 2017 19:30:27 +0000
Message-ID: <1496086228-2806-2-git-send-email-jagan@openedev.com>
References: <1496086228-2806-1-git-send-email-jagan@openedev.com>
Reply-To: jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDH5TZWAZAFBBC7OWHEQKGQEAXHRYIY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1496086228-2806-1-git-send-email-jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>

Since Bananapi brand is owned by BIPAI KEJI(BPI), the previous
Lemaker and Sinovoip no longer use the bananapi brand, hence
Updated the model and compatible for existing bananapi boards
which is denoted same like in binanapi site.

Example: for Bananapi M64 board as

model = "Banana Pi BPI-M64";
compatible = "bananapi,bpi-m64", "allwinner,sun50i-a64";

Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
---
Note: Bananapi BPI product site
http://www.banana-pi.org/product.html

 arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts          | 4 ++--
 arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts          | 4 ++--
 arch/arm/boot/dts/sun7i-a20-bananapi-m1.dts               | 4 ++--
 arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts           | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts | 4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts b/arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts
index bdfdce8..265f79d 100644
--- a/arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts
+++ b/arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts
@@ -46,8 +46,8 @@
 #include <dt-bindings/gpio/gpio.h>
 
 / {
-	model = "Sinovoip BPI-M2";
-	compatible = "sinovoip,bpi-m2", "allwinner,sun6i-a31s";
+	model = "Banana PI BPI-M2";
+	compatible = "bananapi,bpi-m2", "allwinner,sun6i-a31s";
 
 	aliases {
 		serial0 = &uart0;
diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts b/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
index 08e776a..2c87236 100644
--- a/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
+++ b/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
@@ -49,8 +49,8 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
 / {
-	model = "Banana Pi BPI-M1-Plus";
-	compatible = "sinovoip,bpi-m1-plus", "allwinner,sun7i-a20";
+	model = "Banana Pi BPI-M1+";
+	compatible = "bananapi,bpi-m1-plus", "allwinner,sun7i-a20";
 
 	aliases {
 		serial0 = &uart0;
diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi-m1.dts b/arch/arm/boot/dts/sun7i-a20-bananapi-m1.dts
index 8b97b89..3d2597e 100644
--- a/arch/arm/boot/dts/sun7i-a20-bananapi-m1.dts
+++ b/arch/arm/boot/dts/sun7i-a20-bananapi-m1.dts
@@ -50,8 +50,8 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 
 / {
-	model = "LeMaker Banana Pi M1";
-	compatible = "lemaker,bananapi", "allwinner,sun7i-a20";
+	model = "Banana Pi BPI-M1";
+	compatible = "bananapi,bpi-m1", "allwinner,sun7i-a20";
 
 	aliases {
 		serial0 = &uart0;
diff --git a/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts b/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts
index 52acbe1..643b8ec 100644
--- a/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts
+++ b/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts
@@ -49,7 +49,7 @@
 
 / {
 	model = "Banana Pi BPI-M2-Plus";
-	compatible = "sinovoip,bpi-m2-plus", "allwinner,sun8i-h3";
+	compatible = "bananapi,bpi-m2-plus", "allwinner,sun8i-h3";
 
 	aliases {
 		serial0 = &uart0;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
index 6872135..949edba 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
@@ -47,8 +47,8 @@
 #include <dt-bindings/gpio/gpio.h>
 
 / {
-	model = "BananaPi-M64";
-	compatible = "sinovoip,bananapi-m64", "allwinner,sun50i-a64";
+	model = "Banana Pi BPI-M64";
+	compatible = "bananapi,bpi-m64", "allwinner,sun50i-a64";
 
 	aliases {
 		serial0 = &uart0;
-- 
1.9.1
