From: oliver+list-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org
Subject: [PATCH v2] ARM: sunxi: dts: Add support for the
 cubieboard3, the CubieTruck
Date: Tue,  8 Oct 2013 10:22:32 +0200
Message-ID: <1381220552-3123-1-git-send-email-oliver+list@schinagl.nl>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDDZ7YMYRMGBBJUCZ6JAKGQEYPOT7KI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Oliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>

Cubietech introduced a new cubieboard, the CubieTruck. This board added
more output connectors and features 2 GiB of RAM and a Gigabit PHY.

Tested are are uart0 and LEDS which both work as expected.

Signed-off-by: Oliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
---
Changes since previous version:

* It's a cubietruck, not a cubietech
* add more whitespaces
* add proper commit log

Thanks,
Oliver

 arch/arm/boot/dts/Makefile                 |  1 +
 arch/arm/boot/dts/sun7i-a20-cubietruck.dts | 63 ++++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 arch/arm/boot/dts/sun7i-a20-cubietruck.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index cc0f1fb..171e6c7 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -232,6 +232,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += \
 	sun5i-a13-olinuxino.dtb \
 	sun6i-a31-colombus.dtb \
 	sun7i-a20-cubieboard2.dtb \
+	sun7i-a20-cubietruck.dtb \
 	sun7i-a20-olinuxino-micro.dtb
 dtb-$(CONFIG_ARCH_TEGRA) += tegra20-harmony.dtb \
 	tegra20-iris-512.dtb \
diff --git a/arch/arm/boot/dts/sun7i-a20-cubietruck.dts b/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
new file mode 100644
index 0000000..8a1009d
--- /dev/null
+++ b/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
@@ -0,0 +1,63 @@
+/*
+ * Copyright 2013 Oliver Schinagl
+ *
+ * Oliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+/dts-v1/;
+/include/ "sun7i-a20.dtsi"
+
+/ {
+	model = "Cubietech Cubietruck";
+	compatible = "cubietech,cubietruck", "allwinner,sun7i-a20";
+
+	soc@01c00000 {
+		pinctrl@01c20800 {
+			led_pins_cubietruck: led_pins@0 {
+				allwinner,pins = "PH7", "PH11", "PH20", "PH21";
+				allwinner,function = "gpio_out";
+				allwinner,drive = <0>;
+				allwinner,pull = <0>;
+			};
+		};
+
+		uart0: serial@01c28000 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart0_pins_a>;
+			status = "okay";
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&led_pins_cubietruck>;
+
+		blue {
+			label = "cubietruck:blue:usr";
+			gpios = <&pio 7 21 0>;
+		};
+
+		orange {
+			label = "cubietruck:orange:usr";
+			gpios = <&pio 7 20 0>;
+		};
+
+		white {
+			label = "cubietruck:white:usr";
+			gpios = <&pio 7 11 0>;
+		};
+
+		green {
+			label = "cubietruck:green:usr";
+			gpios = <&pio 7 7 0>;
+		};
+	};
+};
-- 
1.8.1.5
