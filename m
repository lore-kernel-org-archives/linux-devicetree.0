From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH] arm64: dts: allwinner: properly connect USB PHY
 to port 0
Date: Thu, 20 Jun 2019 02:01:27 +0100
Message-ID: <20190620010127.12071-1-andre.przywara@arm.com>
Reply-To: andre.przywara-5wv7dgnIgG8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDNZNK75ZIKRBKFWVPUAKGQEFLZSF2Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

In recent Allwinner SoCs the first USB host controller (HCI0) shares
the first PHY with the MUSB controller. Probably to make this sharing
work, we were avoiding to declare this in the DT. This has two
shortcomings:
- U-Boot (which uses the same .dts) cannot use this port without a PHY
  linked, so we were loosing one USB port there.
- It requires the MUSB driver to be enabled and loaded, although we
  don't actually use it.

For those (64-bit) boards which use an USB-A socket for HCI0/MUSB, add
a "phys" property pointing to the USB PHY 0.

This makes it work in U-Boot, also improves compatiblity when no MUSB
driver is loaded (for instance in distribution installers).

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
Hi,

I have the feeling this belongs into the .dtsi, but cant't tell for sure
how this interacts with the MUSB driver. If need be, we can always pull
this up later, I guess.

Thanks,
Andre

 arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts           | 2 ++
 arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts | 2 ++
 arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts  | 2 ++
 arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts       | 2 ++
 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts          | 2 ++
 5 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
index 409523cb0950..b23e827a6065 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
@@ -93,6 +93,7 @@
 };
 
 &ehci0 {
+	phys = <&usbphy 0>;
 	status = "okay";
 };
 
@@ -147,6 +148,7 @@
 };
 
 &ohci0 {
+	phys = <&usbphy 0>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
index e6fb9683f213..b422bef19fff 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
@@ -105,6 +105,7 @@
 };
 
 &ehci0 {
+	phys = <&usbphy 0>;
 	status = "okay";
 };
 
@@ -151,6 +152,7 @@
 };
 
 &ohci0 {
+	phys = <&usbphy 0>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
index 9887948d5c86..5da9cdfb4f48 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
@@ -124,6 +124,7 @@
 };
 
 &ehci0 {
+	phys = <&usbphy 0>;
 	status = "okay";
 };
 
@@ -179,6 +180,7 @@
 };
 
 &ohci0 {
+	phys = <&usbphy 0>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
index 0dc33c90dd60..293f66c44032 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
@@ -58,6 +58,7 @@
 };
 
 &ehci0 {
+	phys = <&usb2phy 0>;
 	status = "okay";
 };
 
@@ -104,6 +105,7 @@
 };
 
 &ohci0 {
+	phys = <&usb2phy 0>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
index 9e464d40cbff..577f8133181e 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
@@ -96,6 +96,7 @@
 };
 
 &ehci0 {
+	phys = <&usb2phy 0>;
 	status = "okay";
 };
 
@@ -120,6 +121,7 @@
 };
 
 &ohci0 {
+	phys = <&usb2phy 0>;
 	status = "okay";
 };
 
-- 
2.14.5
