From: Hong Xu <hong.xu@atmel.com>
Subject: [PATCH v2 1/3] AT91: Add DT description files for AT91SAM9N12-EK
Date: Mon, 16 Apr 2012 17:39:25 +0800
Message-ID: <1334569167-7064-2-git-send-email-hong.xu@atmel.com>
References: <1334569167-7064-1-git-send-email-hong.xu@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1334569167-7064-1-git-send-email-hong.xu@atmel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: nicolas.ferre@atmel.com
Cc: devicetree-discuss@lists.ozlabs.org, plagnioj@jcrosoft.com, Hong Xu <hong.xu@atmel.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Added AT91SAM9N12 SoC DT file, as well as the board definition file
for AT91SAM9N12-EK.

Signed-off-by: Hong Xu <hong.xu@atmel.com>
---
Changes since v1,
* Removed offset for memory node according to Ludovic's comment
* Changed compatibility string for various peripherals
* Removed <okay> status for tcb0/1 because they're enabled by default
* Removed PMECC related bindings

 arch/arm/boot/dts/at91sam9n12.dtsi  |  223 +++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/at91sam9n12ek.dts |   99 ++++++++++++++++
 2 files changed, 322 insertions(+)
 create mode 100644 arch/arm/boot/dts/at91sam9n12.dtsi
 create mode 100644 arch/arm/boot/dts/at91sam9n12ek.dts

diff --git a/arch/arm/boot/dts/at91sam9n12.dtsi b/arch/arm/boot/dts/at91sam9n12.dtsi
new file mode 100644
index 0000000..2013c0a
--- /dev/null
+++ b/arch/arm/boot/dts/at91sam9n12.dtsi
@@ -0,0 +1,223 @@
+/*
+ * at91sam9n12.dtsi - Device Tree include file for AT91SAM9N12 SoC
+ *
+ *  Copyright (C) 2012 Atmel,
+ *                2012 Hong Xu <hong.xu@atmel.com>
+ *
+ * Licensed under GPLv2 or later.
+ */
+
+/include/ "skeleton.dtsi"
+
+/ {
+	model = "Atmel AT91SAM9N12 SoC";
+	compatible = "atmel,at91sam9n12";
+	interrupt-parent = <&aic>;
+
+	aliases {
+		serial0 = &dbgu;
+		serial1 = &usart0;
+		serial2 = &usart1;
+		serial3 = &usart2;
+		serial4 = &usart3;
+		gpio0 = &pioA;
+		gpio1 = &pioB;
+		gpio2 = &pioC;
+		gpio3 = &pioD;
+		tcb0 = &tcb0;
+		tcb1 = &tcb1;
+	};
+	cpus {
+		cpu@0 {
+			compatible = "arm,arm926ejs";
+		};
+	};
+
+	memory {
+		reg = <0x20000000 0x10000000>;
+	};
+
+	ahb {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		apb {
+			compatible = "simple-bus";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			aic: interrupt-controller@fffff000 {
+				#interrupt-cells = <2>;
+				compatible = "atmel,at91rm9200-aic";
+				interrupt-controller;
+				interrupt-parent;
+				reg = <0xfffff000 0x200>;
+			};
+
+			ramc0: ramc@ffffe800 {
+				compatible = "atmel,at91sam9g45-ddramc";
+				reg = <0xffffe800 0x200>;
+			};
+
+			pmc: pmc@fffffc00 {
+				compatible = "atmel,at91rm9200-pmc";
+				reg = <0xfffffc00 0x100>;
+			};
+
+			rstc@fffffe00 {
+				compatible = "atmel,at91sam9g45-rstc";
+				reg = <0xfffffe00 0x10>;
+			};
+
+			pit: timer@fffffe30 {
+				compatible = "atmel,at91sam9260-pit";
+				reg = <0xfffffe30 0xf>;
+				interrupts = <1 4>;
+			};
+
+
+			shdwc@fffffe10 {
+				compatible = "atmel,at91sam9x5-shdwc";
+				reg = <0xfffffe10 0x10>;
+			};
+
+			tcb0: timer@f8008000 {
+				compatible = "atmel,at91sam9x5-tcb";
+				reg = <0xf8008000 0x100>;
+				interrupts = <17 4>;
+			};
+
+			tcb1: timer@f800c000 {
+				compatible = "atmel,at91sam9x5-tcb";
+				reg = <0xf800c000 0x100>;
+				interrupts = <17 4>;
+			};
+
+			dma: dma-controller@ffffec00 {
+				compatible = "atmel,at91sam9g45-dma";
+				reg = <0xffffec00 0x200>;
+				interrupts = <20 4>;
+			};
+
+			pioA: gpio@fffff400 {
+				compatible = "atmel,at91sam9x5-gpio", "atmel,at91rm9200-gpio";
+				reg = <0xfffff400 0x100>;
+				interrupts = <2 4>;
+				#gpio-cells = <2>;
+				gpio-controller;
+				interrupt-controller;
+			};
+
+			pioB: gpio@fffff600 {
+				compatible = "atmel,at91sam9x5-gpio", "atmel,at91rm9200-gpio";
+				reg = <0xfffff600 0x100>;
+				interrupts = <2 4>;
+				#gpio-cells = <2>;
+				gpio-controller;
+				interrupt-controller;
+			};
+
+			pioC: gpio@fffff800 {
+				compatible = "atmel,at91sam9x5-gpio", "atmel,at91rm9200-gpio";
+				reg = <0xfffff800 0x100>;
+				interrupts = <3 4>;
+				#gpio-cells = <2>;
+				gpio-controller;
+				interrupt-controller;
+			};
+
+			pioD: gpio@fffffa00 {
+				compatible = "atmel,at91sam9x5-gpio", "atmel,at91rm9200-gpio";
+				reg = <0xfffffa00 0x100>;
+				interrupts = <3 4>;
+				#gpio-cells = <2>;
+				gpio-controller;
+				interrupt-controller;
+			};
+
+			dbgu: serial@fffff200 {
+				compatible = "atmel,at91sam9260-usart";
+				reg = <0xfffff200 0x200>;
+				interrupts = <1 4>;
+				status = "disabled";
+			};
+
+			usart0: serial@f801c000 {
+				compatible = "atmel,at91sam9260-usart";
+				reg = <0xf801c000 0x4000>;
+				interrupts = <5 4>;
+				atmel,use-dma-rx;
+				atmel,use-dma-tx;
+				status = "disabled";
+			};
+
+			usart1: serial@f8020000 {
+				compatible = "atmel,at91sam9260-usart";
+				reg = <0xf8020000 0x4000>;
+				interrupts = <6 4>;
+				atmel,use-dma-rx;
+				atmel,use-dma-tx;
+				status = "disabled";
+			};
+
+			usart2: serial@f8024000 {
+				compatible = "atmel,at91sam9260-usart";
+				reg = <0xf8024000 0x4000>;
+				interrupts = <7 4>;
+				atmel,use-dma-rx;
+				atmel,use-dma-tx;
+				status = "disabled";
+			};
+
+			usart3: serial@f8028000 {
+				compatible = "atmel,at91sam9260-usart";
+				reg = <0xf8028000 0x4000>;
+				interrupts = <8 4>;
+				atmel,use-dma-rx;
+				atmel,use-dma-tx;
+				status = "disabled";
+			};
+		};
+
+		nand0: nand@40000000 {
+			compatible = "atmel,at91rm9200-nand";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = < 0x40000000 0x10000000
+				0xffffe000 0x00000600
+				0xffffe600 0x00000200
+				0x00100000 0x00100000
+			       >;
+			atmel,nand-addr-offset = <21>;
+			atmel,nand-cmd-offset = <22>;
+			gpios = <&pioD 5 0
+				 &pioD 4 0
+				 0
+				>;
+			status = "disabled";
+		};
+
+		usb0: ohci@00500000 {
+			compatible = "atmel,at91rm9200-ohci", "usb-ohci";
+			reg = <0x00500000 0x00100000>;
+			interrupts = <22 4>;
+			status = "disabled";
+		};
+	};
+
+	i2c@0 {
+		compatible = "i2c-gpio";
+		gpios = <&pioA 30 0 /* sda */
+			 &pioA 31 0 /* scl */
+			>;
+		i2c-gpio,sda-open-drain;
+		i2c-gpio,scl-open-drain;
+		i2c-gpio,delay-us = <2>;	/* ~100 kHz */
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+};
diff --git a/arch/arm/boot/dts/at91sam9n12ek.dts b/arch/arm/boot/dts/at91sam9n12ek.dts
new file mode 100644
index 0000000..62dc605
--- /dev/null
+++ b/arch/arm/boot/dts/at91sam9n12ek.dts
@@ -0,0 +1,99 @@
+/*
+ * at91sam9n12ek.dts - Device Tree file for AT91SAM9N12-EK board
+ *
+ *  Copyright (C) 2012 Atmel,
+ *                2012 Hong Xu <hong.xu@atmel.com>
+ *
+ * Licensed under GPLv2 or later.
+ */
+/dts-v1/;
+/include/ "at91sam9n12.dtsi"
+
+/ {
+	model = "Atmel AT91SAM9N12-EK";
+	compatible = "atmel,at91sam9n12ek", "atmel,at91sam9n12", "atmel,at91sam9";
+
+	chosen {
+		bootargs = "mem=128M console=ttyS0,115200 root=/dev/mtdblock1 rw rootfstype=jffs2";
+	};
+
+	memory {
+		reg = <0x20000000 0x10000000>;
+	};
+
+	clocks {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		main_clock: clock@0 {
+			compatible = "atmel,osc", "fixed-clock";
+			clock-frequency = <16000000>;
+		};
+	};
+
+	ahb {
+		apb {
+			dbgu: serial@fffff200 {
+				status = "okay";
+			};
+		};
+
+		nand0: nand@40000000 {
+			nand-bus-width = <8>;
+			nand-ecc-mode = "soft";
+			nand-on-flash-bbt;
+			status = "okay";
+
+			boot@0 {
+				label = "bootstrap/uboot/kernel";
+				reg = <0x0 0x400000>;
+			};
+
+			rootfs@400000 {
+				label = "rootfs";
+				reg = <0x400000 0x3C00000>;
+			};
+
+			data@4000000 {
+				label = "data";
+				reg = <0x4000000 0xC000000>;
+			};
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		d8 {
+			label = "d8";
+			gpios = <&pioB 4 1>;
+			linux,default-trigger = "mmc0";
+		};
+
+		d9 {
+			label = "d6";
+			gpios = <&pioB 5 1>;
+			linux,default-trigger = "nand-disk";
+		};
+
+		d10 {
+			label = "d7";
+			gpios = <&pioB 6 0>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	gpio_keys {
+		compatible = "gpio-keys";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		enter {
+			label = "Enter";
+			gpios = <&pioB 4 1>;
+			linux,code = <28>;
+			gpio-key,wakeup;
+		};
+	};
+};
-- 
1.7.10
