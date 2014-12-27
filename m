From: Siarhei Siamashka <siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] ARM: dts: sun6i: Add dts file for MSI
 Primo81 tablet
Date: Sat, 27 Dec 2014 09:37:20 +0200
Message-ID: <1419665841-22629-1-git-send-email-siarhei.siamashka@gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCH4DA7NUEBBBNGD7GSAKGQE7LRK7EA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The MSI Primo81 is an A31s based tablet, with 1G RAM, 16G NAND,
1024x768 IPS LCD display, mono speaker, 0.3 MP front camera, 2.0 MP
rear camera, 3500 mAh battery, gt911 touchscreen, mma8452 accelerometer
and rtl8188etv usb wifi. Has "power", "volume+" and "volume-" buttons
(both volume buttons are also connected to the UBOOT_SEL pin). The
external connectors are represented by MicroSD slot, MiniHDMI, MicroUSB
OTG and 3.5mm headphone jack. More details are available at
    http://linux-sunxi.org/MSI_Primo81

This initial dts file only provides support for mmc, wifi and uart
(there is no external connector for uart though). Graphics can be used
via simplefb. However, without usb otg, there are no reasonable means
to handle user input yet.

Signed-off-by: Siarhei Siamashka <siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/Makefile               |  3 +-
 arch/arm/boot/dts/sun6i-a31s-primo81.dts | 95 ++++++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/sun6i-a31s-primo81.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index c486545..f363938 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -464,7 +464,8 @@ dtb-$(CONFIG_MACH_SUN6I) += \
 	sun6i-a31-colombus.dtb \
 	sun6i-a31-hummingbird.dtb \
 	sun6i-a31-m9.dtb \
-	sun6i-a31s-cs908.dtb
+	sun6i-a31s-cs908.dtb \
+	sun6i-a31s-primo81.dtb
 dtb-$(CONFIG_MACH_SUN7I) += \
 	sun7i-a20-bananapi.dtb \
 	sun7i-a20-bootsetup.dtb \
diff --git a/arch/arm/boot/dts/sun6i-a31s-primo81.dts b/arch/arm/boot/dts/sun6i-a31s-primo81.dts
new file mode 100644
index 0000000..a5e8562
--- /dev/null
+++ b/arch/arm/boot/dts/sun6i-a31s-primo81.dts
@@ -0,0 +1,95 @@
+/*
+ * Copyright 2014 Siarhei Siamashka <siarhei.siamashka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This library is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License as
+ *     published by the Free Software Foundation; either version 2 of the
+ *     License, or (at your option) any later version.
+ *
+ *     This library is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ *     You should have received a copy of the GNU General Public
+ *     License along with this library; if not, write to the Free
+ *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
+ *     MA 02110-1301 USA
+ *
+ * Or, alternatively,
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use,
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+/dts-v1/;
+/include/ "sun6i-a31s.dtsi"
+/include/ "sunxi-common-regulators.dtsi"
+
+/ {
+	model = "MSI Primo81 tablet";
+	compatible = "msi,primo81", "allwinner,sun6i-a31s";
+
+	chosen {
+		bootargs = "earlyprintk console=ttyS0,115200";
+	};
+
+	soc@01c00000 {
+		mmc0: mmc@01c0f000 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&mmc0_pins_a>, <&mmc0_cd_pin_primo81>;
+			vmmc-supply = <&reg_vcc3v0>;
+			bus-width = <4>;
+			cd-gpios = <&pio 0 8 0>; /* PA8 */
+			cd-inverted;
+			status = "okay";
+		};
+
+		usbphy: phy@01c19400 {
+			status = "okay";
+		};
+
+		ehci0: usb@01c1a000 {
+			/* rtl8188etv wifi is connected here */
+			status = "okay";
+		};
+
+		pio: pinctrl@01c20800 {
+			mmc0_cd_pin_primo81: mmc0_cd_pin@0 {
+				allwinner,pins = "PA8";
+				allwinner,function = "gpio_in";
+				allwinner,drive = <0>;
+				allwinner,pull = <1>;
+			};
+		};
+
+		uart0: serial@01c28000 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart0_pins_a>;
+			status = "okay";
+		};
+	};
+};
-- 
2.0.4
