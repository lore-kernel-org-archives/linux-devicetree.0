From: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC 3/4] MIPS: ath79: add initial support for TP-LINK MR3020
Date: Mon, 18 Jan 2016 02:56:26 +0300
Message-ID: <1453074987-3356-4-git-send-email-antonynpavlov@gmail.com>
References: <1453074987-3356-1-git-send-email-antonynpavlov@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453074987-3356-1-git-send-email-antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: Yegor Yefremov <yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Alban Bedel <albeu-GANU6spQydw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Currently only the UART, SPI-flash and LEDs are supported.

Links:

  * http://www.tp-link.com/en/products/details/?model=TL-MR3020
  * http://wiki.openwrt.org/toh/tp-link/tl-mr3020
  * https://wikidevi.com/wiki/TP-LINK_TL-MR3020

Signed-off-by: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 arch/mips/ath79/Kconfig              |  5 +++
 arch/mips/boot/dts/qca/Makefile      |  1 +
 arch/mips/boot/dts/qca/tl_mr3020.dts | 68 ++++++++++++++++++++++++++++++++++++
 3 files changed, 74 insertions(+)

diff --git a/arch/mips/ath79/Kconfig b/arch/mips/ath79/Kconfig
index 13c04cf..bbd7a1f 100644
--- a/arch/mips/ath79/Kconfig
+++ b/arch/mips/ath79/Kconfig
@@ -81,6 +81,11 @@ choice
 		bool "TL-WR1043ND Version 1"
 		select BUILTIN_DTB
 		select SOC_AR913X
+
+	config DTB_TL_MR3020
+		bool "TL-MR3020"
+		select BUILTIN_DTB
+		select SOC_AR933X
 endchoice
 
 endmenu
diff --git a/arch/mips/boot/dts/qca/Makefile b/arch/mips/boot/dts/qca/Makefile
index 2d61455d..8c96d67 100644
--- a/arch/mips/boot/dts/qca/Makefile
+++ b/arch/mips/boot/dts/qca/Makefile
@@ -3,6 +3,7 @@ dtb-$(CONFIG_ATH79)			+= ar9132_tl_wr1043nd_v1.dtb
 
 # Select a DTB to build in the kernel
 obj-$(CONFIG_DTB_TL_WR1043ND_V1)	+= ar9132_tl_wr1043nd_v1.dtb.o
+obj-$(CONFIG_DTB_TL_MR3020)		+= tl_mr3020.dtb.o
 
 # Force kbuild to make empty built-in.o if necessary
 obj-				+= dummy.o
diff --git a/arch/mips/boot/dts/qca/tl_mr3020.dts b/arch/mips/boot/dts/qca/tl_mr3020.dts
new file mode 100644
index 0000000..571989b
--- /dev/null
+++ b/arch/mips/boot/dts/qca/tl_mr3020.dts
@@ -0,0 +1,68 @@
+/dts-v1/;
+
+#include "ar9331.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "TP-Link TL-MR3020";
+	compatible = "tplink,tl-mr3020";
+
+	aliases {
+		serial0 = &uart;
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x2000000>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		wlan {
+			label = "tp-link:green:wlan";
+			gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		lan {
+			label = "tp-link:green:lan";
+			gpios = <&gpio 17 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		wps {
+			label = "tp-link:green:wps";
+			gpios = <&gpio 26 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led3g {
+			label = "tp-link:green:3g";
+			gpios = <&gpio 27 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+	};
+};
+
+&uart {
+	status = "okay";
+};
+
+&gpio {
+	status = "okay";
+};
+
+&spi {
+	num-chipselects = <1>;
+	status = "okay";
+
+	/* Spansion S25FL032PIF SPI flash */
+	spiflash: m25p80@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "m25p80";
+		spi-max-frequency = <104000000>;
+		reg = <0>;
+	};
+};
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
