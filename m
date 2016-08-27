From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v2 8/8] ARM: dts: sun9i: a80-optimus: Disable EHCI1
Date: Sat, 27 Aug 2016 15:55:44 +0800
Message-ID: <20160827075544.26316-9-wens@csie.org>
References: <20160827075544.26316-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBHVJQW7AKGQEWZNSGGA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160827075544.26316-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

EHCI1 provides an HSIC interface. This interface is exposed on the
board through two pins among the GPIO header.

With the PHY now powered up and responding, enabling the interface when
nothing is connected results in a lot of error messages:

	usb 2-1: device descriptor read/64, error -71
	usb 2-1: device descriptor read/64, error -71
	usb 2-1: new high-speed USB device number 3 using ehci-platform
	usb 2-1: device descriptor read/64, error -71
	usb 2-1: device descriptor read/64, error -71
	usb 2-1: new high-speed USB device number 4 using ehci-platform
	usb 2-1: device not accepting address 4, error -71
	usb 2-1: new high-speed USB device number 5 using ehci-platform
	usb 2-1: device not accepting address 5, error -71
	usb usb2-port1: unable to enumerate USB device

Disable it by default, but leave the entries in the board DTS.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
Changes since v1: none
---
 arch/arm/boot/dts/sun9i-a80-optimus.dts | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sun9i-a80-optimus.dts b/arch/arm/boot/dts/sun9i-a80-optimus.dts
index d805cb50b5c8..ceb6ef15d669 100644
--- a/arch/arm/boot/dts/sun9i-a80-optimus.dts
+++ b/arch/arm/boot/dts/sun9i-a80-optimus.dts
@@ -112,7 +112,8 @@
 };
 
 &ehci1 {
-	status = "okay";
+	/* Enable if HSIC peripheral is connected */
+	status = "disabled";
 };
 
 &ehci2 {
@@ -484,7 +485,8 @@
 
 &usbphy2 {
 	phy-supply = <&reg_bldo4>;
-	status = "okay";
+	/* Enable if HSIC peripheral is connected */
+	status = "disabled";
 };
 
 &usbphy3 {
-- 
2.9.3
