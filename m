From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH] ARM: BCM5301X: Add basic dts for BCM53573 based Tenda AC9
Date: Wed, 27 Jul 2016 23:18:01 +0200
Message-ID: <1469654305-1700-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@armlinux.org.uk>, Hauke Mehrtens <hauke@hauke-m.de>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Kalle Valo <kvalo@codeaurora.org>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Emil Velikov <emil.l.velikov@gmail.com>, Guenter Roeck <linux@roeck-us.net>, open list <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

BCM53573 seems to be low priced alternative for standard Northstar
chipsets. It uses single core Cortex-A7, doesn't have SDU or local (TWD=
)
timer. It was also stripped out of independent SPI controller and 2
GMACs.

DTS for Tenda AC9 isn't completed yet. It misses e.g. switch entry (we
still need some bgmac/b53 fixes) and probably some clocks. It adds
support for basic features however and can be improved later.

Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
---
 MAINTAINERS                              |   2 +
 arch/arm/boot/dts/Makefile               |   1 +
 arch/arm/boot/dts/bcm47189-tenda-ac9.dts |  74 ++++++++++++++++
 arch/arm/boot/dts/bcm53573.dtsi          | 147 +++++++++++++++++++++++=
++++++++
 4 files changed, 224 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm47189-tenda-ac9.dts
 create mode 100644 arch/arm/boot/dts/bcm53573.dtsi

diff --git a/MAINTAINERS b/MAINTAINERS
index 7304d2e..eceff03 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2516,6 +2516,8 @@ S:	Maintained
 F:	arch/arm/mach-bcm/bcm_5301x.c
 F:	arch/arm/boot/dts/bcm5301x.dtsi
 F:	arch/arm/boot/dts/bcm470*
+F:	arch/arm/boot/dts/bcm53573*
+F:	arch/arm/boot/dts/bcm47189*
=20
 BROADCOM BCM63XX ARM ARCHITECTURE
 M:	Florian Fainelli <f.fainelli@gmail.com>
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 973b0da..f7ce377 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -83,6 +83,7 @@ dtb-$(CONFIG_ARCH_BCM_5301X) +=3D \
 	bcm4709-netgear-r7000.dtb \
 	bcm4709-netgear-r8000.dtb \
 	bcm47094-dlink-dir-885l.dtb \
+	bcm47189-tenda-ac9.dtb \
 	bcm94708.dtb \
 	bcm94709.dtb \
 	bcm953012er.dtb \
diff --git a/arch/arm/boot/dts/bcm47189-tenda-ac9.dts b/arch/arm/boot/d=
ts/bcm47189-tenda-ac9.dts
new file mode 100644
index 0000000..4403ae8
--- /dev/null
+++ b/arch/arm/boot/dts/bcm47189-tenda-ac9.dts
@@ -0,0 +1,74 @@
+/*
+ * Copyright (C) 2016 Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
+ *
+ * Licensed under the ISC license.
+ */
+
+/dts-v1/;
+
+#include "bcm53573.dtsi"
+
+/ {
+	compatible =3D "tenda,ac9", "brcm,bcm47189", "brcm,bcm53573";
+	model =3D "Tenda AC9";
+
+	chosen {
+		bootargs =3D "console=3DttyS0,115200 earlycon";
+	};
+
+	memory {
+		reg =3D <0x00000000 0x08000000>;
+	};
+
+	leds {
+		compatible =3D "gpio-leds";
+
+		usb {
+			label =3D "bcm53xx:blue:usb";
+			gpios =3D <&chipcommon 1 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger =3D "default-off";
+		};
+
+		wps {
+			label =3D "bcm53xx:blue:wps";
+			gpios =3D <&chipcommon 10 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger =3D "default-off";
+		};
+
+		5ghz {
+			label =3D "bcm53xx:blue:5ghz";
+			gpios =3D <&chipcommon 11 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger =3D "default-off";
+		};
+
+		system {
+			label =3D "bcm53xx:blue:system";
+			gpios =3D <&chipcommon 15 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger =3D "timer";
+		};
+	};
+
+	gpio-keys {
+		compatible =3D "gpio-keys";
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		rfkill {
+			label =3D "WiFi";
+			linux,code =3D <KEY_RFKILL>;
+			gpios =3D <&chipcommon 3 GPIO_ACTIVE_LOW>;
+		};
+
+		restart {
+			label =3D "Reset";
+			linux,code =3D <KEY_RESTART>;
+			gpios =3D <&chipcommon 7 GPIO_ACTIVE_LOW>;
+		};
+
+		wps {
+			label =3D "WPS";
+			linux,code =3D <KEY_WPS_BUTTON>;
+			gpios =3D <&chipcommon 9 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/bcm53573.dtsi b/arch/arm/boot/dts/bcm535=
73.dtsi
new file mode 100644
index 0000000..efa07de
--- /dev/null
+++ b/arch/arm/boot/dts/bcm53573.dtsi
@@ -0,0 +1,147 @@
+/*
+ * Copyright (C) 2016 Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
+ *
+ * Licensed under the ISC license.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include "skeleton.dtsi"
+
+/ {
+	interrupt-parent =3D <&gic>;
+
+	chosen {
+		stdout-path =3D &uart0;
+	};
+
+	cpus {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		cpu@0 {
+			device_type =3D "cpu";
+			compatible =3D "arm,cortex-a7";
+			reg =3D <0x0>;
+		};
+	};
+
+	mpcore {
+		compatible =3D "simple-bus";
+		ranges =3D <0x00000000 0x18310000 0x00008000>;
+		#address-cells =3D <1>;
+		#size-cells =3D <1>;
+
+		gic: interrupt-controller@1000 {
+			compatible =3D "arm,cortex-a7-gic";
+			#interrupt-cells =3D <3>;
+			#address-cells =3D <0>;
+			interrupt-controller;
+			reg =3D <0x1000 0x1000>,
+			      <0x2000 0x0100>;
+		};
+	};
+
+	clocks {
+		#address-cells =3D <1>;
+		#size-cells =3D <1>;
+		ranges;
+
+		alp: oscillator {
+			#clock-cells =3D <0>;
+			compatible =3D "fixed-clock";
+			clock-frequency =3D <40000000>;
+		};
+	};
+
+	axi@18000000 {
+		compatible =3D "brcm,bus-axi";
+		reg =3D <0x18000000 0x1000>;
+		ranges =3D <0x00000000 0x18000000 0x00100000>;
+		#address-cells =3D <1>;
+		#size-cells =3D <1>;
+
+		#interrupt-cells =3D <1>;
+		interrupt-map-mask =3D <0x000fffff 0xffff>;
+		interrupt-map =3D
+			/* ChipCommon */
+			<0x00000000 0 &gic GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+
+			/* IEEE 802.11 0 */
+			<0x00001000 0 &gic GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+
+			/* PCIe Controller 0 */
+			<0x00002000 0 &gic GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+			<0x00002000 1 &gic GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+			<0x00002000 2 &gic GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+			<0x00002000 3 &gic GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+			<0x00002000 4 &gic GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+			<0x00002000 5 &gic GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+
+			/* USB 2.0 Controller */
+			<0x00004000 0 &gic GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+
+			/* Ethernet Controller 0 */
+			<0x00005000 0 &gic GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+
+			/* IEEE 802.11 1 */
+			<0x0000a000 0 &gic GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+
+			/* Ethernet Controller 1 */
+			<0x0000b000 0 &gic GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+
+		chipcommon: chipcommon@0 {
+			compatible =3D "simple-bus";
+			reg =3D <0x00000000 0x1000>;
+			ranges;
+
+			#address-cells =3D <1>;
+			#size-cells =3D <1>;
+
+			gpio-controller;
+			#gpio-cells =3D <2>;
+
+			uart0: serial@0300 {
+				compatible =3D "ns16550a";
+				reg =3D <0x0300 0x100>;
+				interrupt-parent =3D <&gic>;
+				interrupts =3D <GIC_PPI 16 IRQ_TYPE_LEVEL_HIGH>;
+				clocks =3D <&alp>;
+				status =3D "okay";
+			};
+		};
+
+		usb2: usb2@4000 {
+			reg =3D <0x4000 0x1000>;
+			ranges;
+			#address-cells =3D <1>;
+			#size-cells =3D <1>;
+
+			ehci: ehci@4000 {
+				compatible =3D "generic-ehci";
+				reg =3D <0x4000 0x1000>;
+				interrupt-parent =3D <&gic>;
+				interrupts =3D <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			ohci: ohci@d000 {
+				#usb-cells =3D <0>;
+
+				compatible =3D "generic-ohci";
+				reg =3D <0xd000 0x1000>;
+				interrupt-parent =3D <&gic>;
+				interrupts =3D <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		gmac0: ethernet@5000 {
+			reg =3D <0x5000 0x1000>;
+		};
+
+		gmac1: ethernet@b000 {
+			reg =3D <0xb000 0x1000>;
+		};
+	};
+};
--=20
1.8.4.5
