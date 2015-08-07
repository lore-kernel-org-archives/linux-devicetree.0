From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 01/11] dm: serial: Update binding for PL01x serial UART
Date: Fri,  7 Aug 2015 07:42:21 -0600
Message-ID: <1438954951-13329-2-git-send-email-sjg@chromium.org>
References: <1438954951-13329-1-git-send-email-sjg@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438954951-13329-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joe Hershberger <joe.hershberger-acOepvfBmUk@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Herrmann <morpheus.ibis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vikas Manocha <vikas.manocha-qxv4g6HH51o@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This binding differs from that of Linux. Update it and change existing
users.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

Changes in v3:
- Rename binding file to pl01x.txt

Changes in v2: None

 arch/arm/dts/stv0991.dts                  |  2 +-
 doc/device-tree-bindings/serial/pl01x.txt | 55 ++++++++++++++++++++++++++++---
 drivers/serial/serial_pl01x.c             |  6 ++--
 3 files changed, 56 insertions(+), 7 deletions(-)

diff --git a/arch/arm/dts/stv0991.dts b/arch/arm/dts/stv0991.dts
index fa3fd64..d20c87a 100644
--- a/arch/arm/dts/stv0991.dts
+++ b/arch/arm/dts/stv0991.dts
@@ -18,7 +18,7 @@
 	uart0: serial@0x80406000 {
 		compatible = "arm,pl011", "arm,primecell";
 		reg = <0x80406000 0x1000>;
-		clock = <2700000>;
+		clock-frequency = <2700000>;
 	};
 
 	aliases {
diff --git a/doc/device-tree-bindings/serial/pl01x.txt b/doc/device-tree-bindings/serial/pl01x.txt
index 61c27d1..4483553 100644
--- a/doc/device-tree-bindings/serial/pl01x.txt
+++ b/doc/device-tree-bindings/serial/pl01x.txt
@@ -1,7 +1,54 @@
-* ARM AMBA Primecell PL011 & PL010 serial UART
+* ARM AMBA Primecell PL011 serial UART
 
 Required properties:
-- compatible: must be "arm,primecell", "arm,pl011" or "arm,pl010"
+- compatible: must be "arm,primecell", "arm,pl011"
 - reg: exactly one register range with length 0x1000
-- clock: input clock frequency for the UART (used to calculate the baud
-  rate divisor)
+- interrupts: exactly one interrupt specifier
+
+Optional properties:
+- pinctrl:
+	   When present, must have one state named "default",
+	   and may contain a second name named "sleep". The former
+	   state sets up pins for ordinary operation whereas
+	   the latter state will put the associated pins to sleep
+	   when the UART is unused
+- clocks:
+	   When present, the first clock listed must correspond to
+	   the clock named UARTCLK on the IP block, i.e. the clock
+	   to the external serial line, whereas the second clock
+	   must correspond to the PCLK clocking the internal logic
+	   of the block. Just listing one clock (the first one) is
+	   deprecated.
+- clocks-names:
+	   When present, the first clock listed must be named
+	   "uartclk" and the second clock listed must be named
+	   "apb_pclk"
+- dmas:
+	   When present, may have one or two dma channels.
+	   The first one must be named "rx", the second one
+	   must be named "tx".
+- auto-poll:
+	   Enables polling when using RX DMA.
+- poll-rate-ms:
+	   Rate at which poll occurs when auto-poll is set,
+	   default 100ms.
+- poll-timeout-ms:
+	   Poll timeout when auto-poll is set, default
+	   3000ms.
+- clock-frequency:
+	   Input clock frequency for UART. This is optional in Linux but required
+	   in U-Boot.
+
+See also bindings/arm/primecell.txt
+
+Example:
+
+uart@80120000 {
+	compatible = "arm,pl011", "arm,primecell";
+	reg = <0x80120000 0x1000>;
+	interrupts = <0 11 IRQ_TYPE_LEVEL_HIGH>;
+	dmas = <&dma 13 0 0x2>, <&dma 13 0 0x0>;
+	dma-names = "rx", "tx";
+	clocks = <&foo_clk>, <&bar_clk>;
+	clock-names = "uartclk", "apb_pclk";
+};
diff --git a/drivers/serial/serial_pl01x.c b/drivers/serial/serial_pl01x.c
index ad503af..ae6fc0e 100644
--- a/drivers/serial/serial_pl01x.c
+++ b/drivers/serial/serial_pl01x.c
@@ -365,13 +365,15 @@ static int pl01x_serial_ofdata_to_platdata(struct udevice *dev)
 	struct pl01x_serial_platdata *plat = dev_get_platdata(dev);
 	fdt_addr_t addr;
 
-	addr = fdtdec_get_addr(gd->fdt_blob, dev->of_offset, "reg");
+	addr = dev_get_addr(dev);
 	if (addr == FDT_ADDR_T_NONE)
 		return -EINVAL;
 
 	plat->base = addr;
-	plat->clock = fdtdec_get_int(gd->fdt_blob, dev->of_offset, "clock", 1);
+	plat->clock = fdtdec_get_int(gd->fdt_blob, dev->of_offset,
+				     "clock-frequency", 1);
 	plat->type = dev_get_driver_data(dev);
+
 	return 0;
 }
 #endif
-- 
2.5.0.rc2.392.g76e840b

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
