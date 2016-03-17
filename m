From: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 14/18] MIPS: ath79: add initial support for Dragino MS14 (Dragino 2)
Date: Thu, 17 Mar 2016 06:34:21 +0300
Message-ID: <1458185665-4521-15-git-send-email-antonynpavlov@gmail.com>
References: <1458185665-4521-1-git-send-email-antonynpavlov@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458185665-4521-1-git-send-email-antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Alban Bedel <albeu-GANU6spQydw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The following features are supported:

  * UART;
  * SPI-flash;
  * USB host;
  * GPIO keys and LEDs.

Links:

    * http://www.dragino.com/products/mother-board/item/71-ms14-p.html
    * https://wiki.openwrt.org/toh/dragino/ms14

Signed-off-by: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 arch/mips/boot/dts/qca/Makefile                |   1 +
 arch/mips/boot/dts/qca/ar9331_dragino_ms14.dts | 102 +++++++++++++++++++++++++
 2 files changed, 103 insertions(+)

diff --git a/arch/mips/boot/dts/qca/Makefile b/arch/mips/boot/dts/qca/Makefile
index 5e2c20d..2451364 100644
--- a/arch/mips/boot/dts/qca/Makefile
+++ b/arch/mips/boot/dts/qca/Makefile
@@ -1,5 +1,6 @@
 # All DTBs
 dtb-$(CONFIG_ATH79)			+= ar9132_tl_wr1043nd_v1.dtb
+dtb-$(CONFIG_ATH79)			+= ar9331_dragino_ms14.dtb
 dtb-$(CONFIG_ATH79)			+= ar9331_tl_mr3020.dtb
 
 # Force kbuild to make empty built-in.o if necessary
diff --git a/arch/mips/boot/dts/qca/ar9331_dragino_ms14.dts b/arch/mips/boot/dts/qca/ar9331_dragino_ms14.dts
new file mode 100644
index 0000000..56f8320
--- /dev/null
+++ b/arch/mips/boot/dts/qca/ar9331_dragino_ms14.dts
@@ -0,0 +1,102 @@
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+#include "ar9331.dtsi"
+
+/ {
+	model = "Dragino MS14 (Dragino 2)";
+	compatible = "dragino,ms14";
+
+	aliases {
+		serial0 = &uart;
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x4000000>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		wlan {
+			label = "dragino2:red:wlan";
+			gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		lan {
+			label = "dragino2:red:lan";
+			gpios = <&gpio 13 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		wan {
+			label = "dragino2:red:wan";
+			gpios = <&gpio 17 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		system {
+			label = "dragino2:red:system";
+			gpios = <&gpio 28 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+	};
+
+	gpio-keys-polled {
+		compatible = "gpio-keys-polled";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		poll-interval = <100>;
+
+		button@0 {
+			label = "jumpstart";
+			linux,code = <KEY_WPS_BUTTON>;
+			gpios = <&gpio 11 GPIO_ACTIVE_LOW>;
+		};
+
+		button@1 {
+			label = "reset";
+			linux,code = <KEY_RESTART>;
+			gpios = <&gpio 12 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&ref {
+	clock-frequency = <25000000>;
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
+&usb {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usb_phy {
+	status = "okay";
+};
+
+&spi {
+	num-chipselects = <1>;
+	status = "okay";
+
+	/* Winbond 25Q128BVFG SPI flash */
+	spiflash: w25q128@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "winbond,w25q128", "jedec,spi-nor";
+		spi-max-frequency = <104000000>;
+		reg = <0>;
+	};
+};
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
