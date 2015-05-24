From: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v5 35/37] MIPS: JZ4740: use Ingenic SoC UART driver
Date: Sun, 24 May 2015 16:11:45 +0100
Message-ID: <1432480307-23789-36-git-send-email-paul.burton@imgtec.com>
References: <1432480307-23789-1-git-send-email-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432480307-23789-1-git-send-email-paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Apelete Seketeli <apelete-fIDRvF7C5ezk1uMJSBkQmQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Remove the serial support from arch/mips/jz4740 & make use of the new
Ingenic SoC UART driver. This is done for both regular & early console
output.

Signed-off-by: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
---

Changes in v5: None
Changes in v4: None
Changes in v3:
- Enable the UART driver in qi_lb60_defconfig to preserve its current
  behaviour.

Changes in v2: None

 arch/mips/Kconfig                            |  1 -
 arch/mips/boot/dts/ingenic/jz4740.dtsi       | 22 ++++++++++++++
 arch/mips/boot/dts/ingenic/qi_lb60.dts       |  4 +++
 arch/mips/configs/qi_lb60_defconfig          |  1 +
 arch/mips/include/asm/mach-jz4740/platform.h |  2 --
 arch/mips/jz4740/Makefile                    |  2 +-
 arch/mips/jz4740/board-qi_lb60.c             |  2 --
 arch/mips/jz4740/platform.c                  | 45 ----------------------------
 arch/mips/jz4740/prom.c                      | 13 --------
 arch/mips/jz4740/serial.c                    | 33 --------------------
 arch/mips/jz4740/serial.h                    | 23 --------------
 11 files changed, 28 insertions(+), 120 deletions(-)
 delete mode 100644 arch/mips/jz4740/serial.c
 delete mode 100644 arch/mips/jz4740/serial.h

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index f07a213..01045fb 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -296,7 +296,6 @@ config MACH_INGENIC
 	select DMA_NONCOHERENT
 	select IRQ_CPU
 	select ARCH_REQUIRE_GPIOLIB
-	select SYS_HAS_EARLY_PRINTK
 	select COMMON_CLK
 	select GENERIC_IRQ_CHIP
 	select BUILTIN_DTB
diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi b/arch/mips/boot/dts/ingenic/jz4740.dtsi
index 9903ab2..c64e01f 100644
--- a/arch/mips/boot/dts/ingenic/jz4740.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
@@ -43,4 +43,26 @@
 
 		#clock-cells = <1>;
 	};
+
+	uart0: serial@10030000 {
+		compatible = "ingenic,jz4740-uart";
+		reg = <0x10030000 0x100>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <9>;
+
+		clocks = <&ext>, <&cgu JZ4740_CLK_UART0>;
+		clock-names = "baud", "module";
+	};
+
+	uart1: serial@10031000 {
+		compatible = "ingenic,jz4740-uart";
+		reg = <0x10031000 0x100>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <8>;
+
+		clocks = <&ext>, <&cgu JZ4740_CLK_UART1>;
+		clock-names = "baud", "module";
+	};
 };
diff --git a/arch/mips/boot/dts/ingenic/qi_lb60.dts b/arch/mips/boot/dts/ingenic/qi_lb60.dts
index 106d13c..2414d63 100644
--- a/arch/mips/boot/dts/ingenic/qi_lb60.dts
+++ b/arch/mips/boot/dts/ingenic/qi_lb60.dts
@@ -4,6 +4,10 @@
 
 / {
 	compatible = "qi,lb60", "ingenic,jz4740";
+
+	chosen {
+		stdout-path = &uart0;
+	};
 };
 
 &ext {
diff --git a/arch/mips/configs/qi_lb60_defconfig b/arch/mips/configs/qi_lb60_defconfig
index 1139b89..d7bb8cc 100644
--- a/arch/mips/configs/qi_lb60_defconfig
+++ b/arch/mips/configs/qi_lb60_defconfig
@@ -66,6 +66,7 @@ CONFIG_SERIAL_8250_CONSOLE=y
 # CONFIG_SERIAL_8250_DMA is not set
 CONFIG_SERIAL_8250_NR_UARTS=2
 CONFIG_SERIAL_8250_RUNTIME_UARTS=2
+CONFIG_SERIAL_8250_INGENIC=y
 # CONFIG_HW_RANDOM is not set
 CONFIG_SPI=y
 CONFIG_SPI_GPIO=y
diff --git a/arch/mips/include/asm/mach-jz4740/platform.h b/arch/mips/include/asm/mach-jz4740/platform.h
index 069b43a..32cfbe6 100644
--- a/arch/mips/include/asm/mach-jz4740/platform.h
+++ b/arch/mips/include/asm/mach-jz4740/platform.h
@@ -35,6 +35,4 @@ extern struct platform_device jz4740_wdt_device;
 extern struct platform_device jz4740_pwm_device;
 extern struct platform_device jz4740_dma_device;
 
-void jz4740_serial_device_register(void);
-
 #endif
diff --git a/arch/mips/jz4740/Makefile b/arch/mips/jz4740/Makefile
index 70a9578..89ce401 100644
--- a/arch/mips/jz4740/Makefile
+++ b/arch/mips/jz4740/Makefile
@@ -5,7 +5,7 @@
 # Object file lists.
 
 obj-y += prom.o time.o reset.o setup.o \
-	gpio.o platform.o timer.o serial.o
+	gpio.o platform.o timer.o
 
 CFLAGS_setup.o = -I$(src)/../../../scripts/dtc/libfdt
 
diff --git a/arch/mips/jz4740/board-qi_lb60.c b/arch/mips/jz4740/board-qi_lb60.c
index 21b034c..4e62bf8 100644
--- a/arch/mips/jz4740/board-qi_lb60.c
+++ b/arch/mips/jz4740/board-qi_lb60.c
@@ -482,8 +482,6 @@ static int __init qi_lb60_init_platform_devices(void)
 	gpiod_add_lookup_table(&qi_lb60_audio_gpio_table);
 	gpiod_add_lookup_table(&qi_lb60_nand_gpio_table);
 
-	jz4740_serial_device_register();
-
 	spi_register_board_info(qi_lb60_spi_board_info,
 				ARRAY_SIZE(qi_lb60_spi_board_info));
 
diff --git a/arch/mips/jz4740/platform.c b/arch/mips/jz4740/platform.c
index 2a5c7c7..e8a463b 100644
--- a/arch/mips/jz4740/platform.c
+++ b/arch/mips/jz4740/platform.c
@@ -30,7 +30,6 @@
 #include <linux/serial_core.h>
 #include <linux/serial_8250.h>
 
-#include "serial.h"
 #include "clock.h"
 
 /* OHCI controller */
@@ -280,50 +279,6 @@ struct platform_device jz4740_adc_device = {
 	.resource	= jz4740_adc_resources,
 };
 
-/* Serial */
-#define JZ4740_UART_DATA(_id) \
-	{ \
-		.flags = UPF_SKIP_TEST | UPF_IOREMAP | UPF_FIXED_TYPE, \
-		.iotype = UPIO_MEM, \
-		.regshift = 2, \
-		.serial_out = jz4740_serial_out, \
-		.type = PORT_16550, \
-		.mapbase = JZ4740_UART ## _id ## _BASE_ADDR, \
-		.irq = JZ4740_IRQ_UART ## _id, \
-	}
-
-static struct plat_serial8250_port jz4740_uart_data[] = {
-	JZ4740_UART_DATA(0),
-	JZ4740_UART_DATA(1),
-	{},
-};
-
-static struct platform_device jz4740_uart_device = {
-	.name = "serial8250",
-	.id = 0,
-	.dev = {
-		.platform_data = jz4740_uart_data,
-	},
-};
-
-void jz4740_serial_device_register(void)
-{
-	struct plat_serial8250_port *p;
-	struct clk *ext_clk;
-	unsigned long ext_rate;
-
-	ext_clk = clk_get(NULL, "ext");
-	if (IS_ERR(ext_clk))
-		panic("unable to get ext clock");
-	ext_rate = clk_get_rate(ext_clk);
-	clk_put(ext_clk);
-
-	for (p = jz4740_uart_data; p->flags != 0; ++p)
-		p->uartclk = ext_rate;
-
-	platform_device_register(&jz4740_uart_device);
-}
-
 /* Watchdog */
 static struct resource jz4740_wdt_resources[] = {
 	{
diff --git a/arch/mips/jz4740/prom.c b/arch/mips/jz4740/prom.c
index 5a93f38..6984683 100644
--- a/arch/mips/jz4740/prom.c
+++ b/arch/mips/jz4740/prom.c
@@ -53,16 +53,3 @@ void __init prom_init(void)
 void __init prom_free_prom_memory(void)
 {
 }
-
-#define UART_REG(_reg) ((void __iomem *)CKSEG1ADDR(JZ4740_UART0_BASE_ADDR + (_reg << 2)))
-
-void prom_putchar(char c)
-{
-	uint8_t lsr;
-
-	do {
-		lsr = readb(UART_REG(UART_LSR));
-	} while ((lsr & UART_LSR_TEMT) == 0);
-
-	writeb(c, UART_REG(UART_TX));
-}
diff --git a/arch/mips/jz4740/serial.c b/arch/mips/jz4740/serial.c
deleted file mode 100644
index d23de45..0000000
--- a/arch/mips/jz4740/serial.c
+++ /dev/null
@@ -1,33 +0,0 @@
-/*
- *  Copyright (C) 2010, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
- *  JZ4740 serial support
- *
- *  This program is free software; you can redistribute	 it and/or modify it
- *  under  the terms of	 the GNU General  Public License as published by the
- *  Free Software Foundation;  either version 2 of the	License, or (at your
- *  option) any later version.
- *
- *  You should have received a copy of the  GNU General Public License along
- *  with this program; if not, write  to the Free Software Foundation, Inc.,
- *  675 Mass Ave, Cambridge, MA 02139, USA.
- *
- */
-
-#include <linux/io.h>
-#include <linux/serial_core.h>
-#include <linux/serial_reg.h>
-
-void jz4740_serial_out(struct uart_port *p, int offset, int value)
-{
-	switch (offset) {
-	case UART_FCR:
-		value |= 0x10; /* Enable uart module */
-		break;
-	case UART_IER:
-		value |= (value & 0x4) << 2;
-		break;
-	default:
-		break;
-	}
-	writeb(value, p->membase + (offset << p->regshift));
-}
diff --git a/arch/mips/jz4740/serial.h b/arch/mips/jz4740/serial.h
deleted file mode 100644
index 8eb715b..0000000
--- a/arch/mips/jz4740/serial.h
+++ /dev/null
@@ -1,23 +0,0 @@
-/*
- *  Copyright (C) 2010, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
- *  JZ4740 serial support
- *
- *  This program is free software; you can redistribute	 it and/or modify it
- *  under  the terms of	 the GNU General  Public License as published by the
- *  Free Software Foundation;  either version 2 of the	License, or (at your
- *  option) any later version.
- *
- *  You should have received a copy of the  GNU General Public License along
- *  with this program; if not, write  to the Free Software Foundation, Inc.,
- *  675 Mass Ave, Cambridge, MA 02139, USA.
- *
- */
-
-#ifndef __MIPS_JZ4740_SERIAL_H__
-#define __MIPS_JZ4740_SERIAL_H__
-
-struct uart_port;
-
-void jz4740_serial_out(struct uart_port *p, int offset, int value);
-
-#endif
-- 
2.4.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
