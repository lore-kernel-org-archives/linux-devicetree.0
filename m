From: Loys Ollivier <lollivier@baylibre.com>
Subject: [PATCH 0/4] Add driver for globaltop GNSS receivers
Date: Fri, 28 Dec 2018 11:50:31 +0100
Message-ID: <1545994235-8309-1-git-send-email-lollivier@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, Johan Hovold <johan@kernel.org>
Cc: Loys Ollivier <lollivier@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello !

This patch series adds a new GNSS driver for the globaltop GNSS receivers.
These receivers transmits NMEA output sequence as soon as they have booted.
Power management can be done via the main supply and optional backup supply
as defined in the device tree.

The driver has been tested using a GlobalTop pa6h chipset on a Libretech-cc
board using the expansion header. Changes made in the board device tree can
be found below for reference and testing.

Loys

Loys Ollivier (4):
  dt-bindings: Add vendor prefix for "GlobalTop Technology, Inc."
  dt-bindings: gnss: add gtop binding
  gnss: add gtop receiver type support
  gnss: add driver for globaltop receivers

 Documentation/devicetree/bindings/gnss/gtop.txt    |  33 +++++
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 drivers/gnss/Kconfig                               |  13 ++
 drivers/gnss/Makefile                              |   3 +
 drivers/gnss/core.c                                |   1 +
 drivers/gnss/gtop.c                                | 152 +++++++++++++++++++++
 include/linux/gnss.h                               |   1 +
 7 files changed, 204 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gnss/gtop.txt
 create mode 100644 drivers/gnss/gtop.c

---
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
index 90a56af967a7..3b3d4dcc47aa 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
@@ -17,6 +17,7 @@
 
        aliases {
                serial0 = &uart_AO;
+               serial1 = &uart_A;
                ethernet0 = &ethmac;
        };
 
@@ -269,7 +270,20 @@
        pinctrl-names = "default";
 };
 
+/* This is brought out on the UART_A_TX (8) and UART_A_RX (10) pins: */
+&uart_A {
+       status = "okay";
+       pinctrl-0 = <&uart_a_pins>;
+       pinctrl-names = "default";
+
+       gnss {
+               compatible = "globaltop,pa6h";
+               v-bckp-supply = <&vcc_3v3>;
+               vcc-supply = <&vcc_3v3>;
+               current-speed = <9600>;
+       };
+};
+
 &usb0 {
        status = "okay";
 };
-- 
2.7.4
