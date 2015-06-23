From: Paul Osmialowski <pawelo-rhuoMcPwk82rDJvtcaxF/A@public.gmane.org>
Subject: [PATCH 9/9] arm: twr-k70f120m: extend Freescale lpuart driver with ability to support Kinetis SoC
Date: Tue, 23 Jun 2015 23:19:47 +0200
Message-ID: <1435094387-20146-10-git-send-email-pawelo@king.net.pl>
References: <1435094387-20146-1-git-send-email-pawelo@king.net.pl>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435094387-20146-1-git-send-email-pawelo-rhuoMcPwk82rDJvtcaxF/A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Bhupesh Sharma <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Magnus Damm <damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Nathan Lynch <nathan_lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Nicolas
Cc: Paul Osmialowski <pawelo-rhuoMcPwk82rDJvtcaxF/A@public.gmane.org>, Yuri Tikhonov <yur-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>, Sergei Poselenov <sposelenov-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>, Dmitry Cherkassov <d_cherkasov-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>, Alexander Potashev <aspotashev-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds Kinetis SoC UART support to Freescale lpuart driver.

Apart from some small changes (e.g. phony handler for error interrupt),
somewhat bigger change was required by rx DMA operation model: for Kinetis
the transfer residue should be consumed when handling interrupt caused by
IDLE state. As a reference I used DMA related code from pre-OF UART driver
published on Emcraft git repo:

https://github.com/EmcraftSystems/linux-emcraft.git

9dc9c6dd13fa3058c776ac71a5a9f71ec89712d3
 RT76540. serial: kinetis_uart: Support receiving from UART using DMA

by Alexander Potashev <aspotashev-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>

Note that enabling tx DMA resulted in messy output, so I didn't configure
it in the .dts file - however nothing in the code prevents one from doing
so. Also note that original reference UART driver did not implement tx DMA
at all.

Signed-off-by: Paul Osmialowski <pawelo-rhuoMcPwk82rDJvtcaxF/A@public.gmane.org>
---
 .../devicetree/bindings/serial/fsl-lpuart.txt      |  6 +-
 arch/arm/boot/dts/kinetis-twr-k70f120m.dts         | 23 ++++++
 arch/arm/boot/dts/kinetis.dtsi                     | 78 +++++++++++++++++++
 drivers/clk/clk-kinetis.c                          | 28 +++++++
 drivers/tty/serial/fsl_lpuart.c                    | 90 ++++++++++++++++++----
 include/dt-bindings/clock/kinetis-mcg.h            |  8 +-
 6 files changed, 216 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.txt b/Documentation/devicetree/bindings/serial/fsl-lpuart.txt
index c95005e..9a8d672 100644
--- a/Documentation/devicetree/bindings/serial/fsl-lpuart.txt
+++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.txt
@@ -6,6 +6,8 @@ Required properties:
     on Vybrid vf610 SoC with 8-bit register organization
   - "fsl,ls1021a-lpuart" for lpuart compatible with the one integrated
     on LS1021A SoC with 32-bit big-endian register organization
+  - "fsl,kinetis-lpuart" for lpuart compatible with the one integrated
+    on Kinetis SoC with 8-bit register organization
 - reg : Address and length of the register set for the device
 - interrupts : Should contain uart interrupt
 - clocks : phandle + clock specifier pairs, one for each entry in clock-names
@@ -15,7 +17,9 @@ Optional properties:
 - dmas: A list of two dma specifiers, one for each entry in dma-names.
 - dma-names: should contain "tx" and "rx".
 
-Note: Optional properties for DMA support. Write them both or both not.
+Note: Optional properties for DMA support.
+        For Kinetis SoC, write "rx" only.
+        For others, write them both or both not.
 
 Example:
 
diff --git a/arch/arm/boot/dts/kinetis-twr-k70f120m.dts b/arch/arm/boot/dts/kinetis-twr-k70f120m.dts
index a6efc29..5d8470a 100644
--- a/arch/arm/boot/dts/kinetis-twr-k70f120m.dts
+++ b/arch/arm/boot/dts/kinetis-twr-k70f120m.dts
@@ -10,11 +10,34 @@
 	model = "Freescale TWR-K70F120M Development Kit";
 	compatible = "fsl,kinetis-twr-k70f120m";
 
+	chosen {
+		bootargs = "console=ttyLP2,115200";
+	};
+
 	memory {
 		reg = <0x8000000 0x8000000>;
 	};
 };
 
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_pins>;
+	status = "ok";
+};
+
+&portE {
+	status = "ok";
+
+	uart2 {
+		uart2_pins: pinmux_uart2_pins {
+			fsl,pins = <
+				16	0x300 /* E.16 = UART2_TX */
+				17	0x300 /* E.17 = UART2_RX */
+			>;
+		};
+	};
+};
+
 &pit0 {
 	status = "ok";
 };
diff --git a/arch/arm/boot/dts/kinetis.dtsi b/arch/arm/boot/dts/kinetis.dtsi
index 7638103..8d276af 100644
--- a/arch/arm/boot/dts/kinetis.dtsi
+++ b/arch/arm/boot/dts/kinetis.dtsi
@@ -17,9 +17,87 @@
 		pmx3 = &portD;
 		pmx4 = &portE;
 		pmx5 = &portF;
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+		serial4 = &uart4;
+		serial5 = &uart5;
 	};
 
 	soc {
+		uart0: serial@4006a000 {
+			compatible = "fsl,kinetis-lpuart";
+			reg = <0x4006a000 0x1000>;
+			interrupts = <45>, <46>;
+			interrupt-names = "uart-stat", "uart-err";
+			clocks = <&mcg CLOCK_UART0>;
+			clock-names = "ipg";
+			dmas = <&edma 0 2>;
+			dma-names = "rx";
+			status = "disabled";
+		};
+
+		uart1: serial@4006b000 {
+			compatible = "fsl,kinetis-lpuart";
+			reg = <0x4006b000 0x1000>;
+			interrupts = <47>, <48>;
+			interrupt-names = "uart-stat", "uart-err";
+			clocks = <&mcg CLOCK_UART1>;
+			clock-names = "ipg";
+			dmas = <&edma 0 4>;
+			dma-names = "rx";
+			status = "disabled";
+		};
+
+		uart2: serial@4006c000 {
+			compatible = "fsl,kinetis-lpuart";
+			reg = <0x4006c000 0x1000>;
+			interrupts = <49>, <50>;
+			interrupt-names = "uart-stat", "uart-err";
+			clocks = <&mcg CLOCK_UART2>;
+			clock-names = "ipg";
+			dmas = <&edma 0 6>;
+			dma-names = "rx";
+			status = "disabled";
+		};
+
+		uart3: serial@4006d000 {
+			compatible = "fsl,kinetis-lpuart";
+			reg = <0x4006d000 0x1000>;
+			interrupts = <51>, <52>;
+			interrupt-names = "uart-stat", "uart-err";
+			clocks = <&mcg CLOCK_UART3>;
+			clock-names = "ipg";
+			dmas = <&edma 0 8>;
+			dma-names = "rx";
+			status = "disabled";
+		};
+
+		uart4: serial@400ea000 {
+			compatible = "fsl,kinetis-lpuart";
+			reg = <0x400ea000 0x1000>;
+			interrupts = <53>, <54>;
+			interrupt-names = "uart-stat", "uart-err";
+			clocks = <&mcg CLOCK_UART4>;
+			clock-names = "ipg";
+			dmas = <&edma 0 10>;
+			dma-names = "rx";
+			status = "disabled";
+		};
+
+		uart5: serial@400eb000 {
+			compatible = "fsl,kinetis-lpuart";
+			reg = <0x400eb000 0x1000>;
+			interrupts = <55>, <56>;
+			interrupt-names = "uart-stat", "uart-err";
+			clocks = <&mcg CLOCK_UART5>;
+			clock-names = "ipg";
+			dmas = <&edma 0 12>;
+			dma-names = "rx";
+			status = "disabled";
+		};
+
 		edma: dma-controller@40008000 {
 			compatible = "fsl,kinetis-edma";
 			reg = <0x40008000 0x2000>, /* DMAC */
diff --git a/drivers/clk/clk-kinetis.c b/drivers/clk/clk-kinetis.c
index 454096c..1fea509 100644
--- a/drivers/clk/clk-kinetis.c
+++ b/drivers/clk/clk-kinetis.c
@@ -263,6 +263,34 @@ static void __init kinetis_mcg_init(struct device_node *np)
 		KINETIS_SIM_PTR(scgc[KINETIS_CG_REG(KINETIS_CG_DMAMUX1)]),
 		KINETIS_CG_IDX(KINETIS_CG_DMAMUX1), 0, NULL);
 
+	/*
+	 * UART0 and UART1 are clocked from the core clock, the remaining UARTs
+	 * are clocked from the bus clock.
+	 */
+	clk[CLOCK_UART0] = clk_register_gate(NULL, "UART0", "CCLK", 0,
+			KINETIS_SIM_PTR(scgc[KINETIS_CG_REG(KINETIS_CG_UART0)]),
+			KINETIS_CG_IDX(KINETIS_CG_UART0), 0, NULL);
+
+	clk[CLOCK_UART1] = clk_register_gate(NULL, "UART1", "CCLK", 0,
+			KINETIS_SIM_PTR(scgc[KINETIS_CG_REG(KINETIS_CG_UART1)]),
+			KINETIS_CG_IDX(KINETIS_CG_UART1), 0, NULL);
+
+	clk[CLOCK_UART2] = clk_register_gate(NULL, "UART2", "PCLK", 0,
+			KINETIS_SIM_PTR(scgc[KINETIS_CG_REG(KINETIS_CG_UART2)]),
+			KINETIS_CG_IDX(KINETIS_CG_UART2), 0, NULL);
+
+	clk[CLOCK_UART3] = clk_register_gate(NULL, "UART3", "PCLK", 0,
+			KINETIS_SIM_PTR(scgc[KINETIS_CG_REG(KINETIS_CG_UART3)]),
+			KINETIS_CG_IDX(KINETIS_CG_UART3), 0, NULL);
+
+	clk[CLOCK_UART4] = clk_register_gate(NULL, "UART4", "PCLK", 0,
+			KINETIS_SIM_PTR(scgc[KINETIS_CG_REG(KINETIS_CG_UART4)]),
+			KINETIS_CG_IDX(KINETIS_CG_UART4), 0, NULL);
+
+	clk[CLOCK_UART5] = clk_register_gate(NULL, "UART5", "PCLK", 0,
+			KINETIS_SIM_PTR(scgc[KINETIS_CG_REG(KINETIS_CG_UART5)]),
+			KINETIS_CG_IDX(KINETIS_CG_UART5), 0, NULL);
+
 	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
 }
 
diff --git a/drivers/tty/serial/fsl_lpuart.c b/drivers/tty/serial/fsl_lpuart.c
index 08ce76f..acf4094 100644
--- a/drivers/tty/serial/fsl_lpuart.c
+++ b/drivers/tty/serial/fsl_lpuart.c
@@ -236,6 +236,8 @@ struct lpuart_port {
 	unsigned int		txfifo_size;
 	unsigned int		rxfifo_size;
 	bool			lpuart32;
+	bool			kinetis;
+	int			kinetis_err_irq;
 
 	bool			lpuart_dma_tx_use;
 	bool			lpuart_dma_rx_use;
@@ -264,6 +266,9 @@ static const struct of_device_id lpuart_dt_ids[] = {
 	{
 		.compatible = "fsl,ls1021a-lpuart",
 	},
+	{
+		.compatible = "fsl,kinetis-lpuart",
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, lpuart_dt_ids);
@@ -350,7 +355,9 @@ static void lpuart_pio_tx(struct lpuart_port *sport)
 	spin_lock_irqsave(&sport->port.lock, flags);
 
 	while (!uart_circ_empty(xmit) &&
-		readb(sport->port.membase + UARTTCFIFO) < sport->txfifo_size) {
+	    (sport->kinetis ?
+	      (readb(sport->port.membase + UARTSR1) & UARTSR1_TDRE) :
+	      (readb(sport->port.membase + UARTTCFIFO) < sport->txfifo_size))) {
 		writeb(xmit->buf[xmit->tail], sport->port.membase + UARTDR);
 		xmit->tail = (xmit->tail + 1) & (UART_XMIT_SIZE - 1);
 		sport->port.icount.tx++;
@@ -471,7 +478,10 @@ static void lpuart_dma_rx_complete(void *arg)
 	unsigned long flags;
 
 	async_tx_ack(sport->dma_rx_desc);
-	mod_timer(&sport->lpuart_timer, jiffies + sport->dma_rx_timeout);
+	if (!(sport->kinetis)) {
+		mod_timer(&sport->lpuart_timer,
+				jiffies + sport->dma_rx_timeout);
+	}
 
 	spin_lock_irqsave(&sport->port.lock, flags);
 
@@ -483,16 +493,14 @@ static void lpuart_dma_rx_complete(void *arg)
 	spin_unlock_irqrestore(&sport->port.lock, flags);
 }
 
-static void lpuart_timer_func(unsigned long data)
+static inline void lpuart_dma_rx_extract_residue(struct lpuart_port *sport)
 {
-	struct lpuart_port *sport = (struct lpuart_port *)data;
 	struct tty_port *port = &sport->port.state->port;
 	struct dma_tx_state state;
 	unsigned long flags;
 	unsigned char temp;
 	int count;
 
-	del_timer(&sport->lpuart_timer);
 	dmaengine_pause(sport->dma_rx_chan);
 	dmaengine_tx_status(sport->dma_rx_chan, sport->dma_rx_cookie, &state);
 	dmaengine_terminate_all(sport->dma_rx_chan);
@@ -510,6 +518,14 @@ static void lpuart_timer_func(unsigned long data)
 	spin_unlock_irqrestore(&sport->port.lock, flags);
 }
 
+static void lpuart_timer_func(unsigned long data)
+{
+	struct lpuart_port *sport = (struct lpuart_port *)data;
+
+	del_timer(&sport->lpuart_timer);
+	lpuart_dma_rx_extract_residue(sport);
+}
+
 static inline void lpuart_prepare_rx(struct lpuart_port *sport)
 {
 	unsigned long flags;
@@ -517,8 +533,10 @@ static inline void lpuart_prepare_rx(struct lpuart_port *sport)
 
 	spin_lock_irqsave(&sport->port.lock, flags);
 
-	sport->lpuart_timer.expires = jiffies + sport->dma_rx_timeout;
-	add_timer(&sport->lpuart_timer);
+	if (!(sport->kinetis)) {
+		sport->lpuart_timer.expires = jiffies + sport->dma_rx_timeout;
+		add_timer(&sport->lpuart_timer);
+	}
 
 	lpuart_dma_rx(sport);
 	temp = readb(sport->port.membase + UARTCR5);
@@ -532,7 +550,9 @@ static inline void lpuart_transmit_buffer(struct lpuart_port *sport)
 	struct circ_buf *xmit = &sport->port.state->xmit;
 
 	while (!uart_circ_empty(xmit) &&
-		(readb(sport->port.membase + UARTTCFIFO) < sport->txfifo_size)) {
+	    (sport->kinetis ?
+	      (readb(sport->port.membase + UARTSR1) & UARTSR1_TDRE) :
+	      (readb(sport->port.membase + UARTTCFIFO) < sport->txfifo_size))) {
 		writeb(xmit->buf[xmit->tail], sport->port.membase + UARTDR);
 		xmit->tail = (xmit->tail + 1) & (UART_XMIT_SIZE - 1);
 		sport->port.icount.tx++;
@@ -766,13 +786,20 @@ out:
 static irqreturn_t lpuart_int(int irq, void *dev_id)
 {
 	struct lpuart_port *sport = dev_id;
-	unsigned char sts, crdma;
+	unsigned char sts, crdma, tmp;
 
 	sts = readb(sport->port.membase + UARTSR1);
 	crdma = readb(sport->port.membase + UARTCR5);
 
-	if (sts & UARTSR1_RDRF && !(crdma & UARTCR5_RDMAS)) {
-		if (sport->lpuart_dma_rx_use)
+	if (sport->kinetis && sport->lpuart_dma_rx_use) {
+		if (sts & UARTSR1_IDLE) {
+			/* Clear S[IDLE] flag by reading from UARTx_D */
+			tmp = readb(sport->port.membase + UARTDR);
+			lpuart_dma_rx_extract_residue(sport);
+			lpuart_prepare_rx(sport);
+		}
+	} else if (sts & UARTSR1_RDRF && !(crdma & UARTCR5_RDMAS)) {
+		if ((!(sport->kinetis)) && (sport->lpuart_dma_rx_use))
 			lpuart_prepare_rx(sport);
 		else
 			lpuart_rxint(irq, dev_id);
@@ -807,6 +834,11 @@ static irqreturn_t lpuart32_int(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t lpuart_errint(int irq, void *data)
+{
+	return IRQ_HANDLED;
+}
+
 /* return TIOCSER_TEMT when transmitter is not busy */
 static unsigned int lpuart_tx_empty(struct uart_port *port)
 {
@@ -1086,8 +1118,11 @@ static int lpuart_startup(struct uart_port *port)
 
 	if (sport->dma_rx_chan && !lpuart_dma_rx_request(port)) {
 		sport->lpuart_dma_rx_use = true;
-		setup_timer(&sport->lpuart_timer, lpuart_timer_func,
-			    (unsigned long)sport);
+		if (sport->kinetis)
+			lpuart_prepare_rx(sport);
+		else
+			setup_timer(&sport->lpuart_timer, lpuart_timer_func,
+					(unsigned long)sport);
 	} else
 		sport->lpuart_dma_rx_use = false;
 
@@ -1105,12 +1140,23 @@ static int lpuart_startup(struct uart_port *port)
 	if (ret)
 		return ret;
 
+	if (sport->kinetis) {
+		ret = devm_request_irq(port->dev, sport->kinetis_err_irq,
+					lpuart_errint, 0, DRIVER_NAME, sport);
+		if (ret) {
+			devm_free_irq(port->dev, port->irq, sport);
+			return ret;
+		}
+	}
+
 	spin_lock_irqsave(&sport->port.lock, flags);
 
 	lpuart_setup_watermark(sport);
 
 	temp = readb(sport->port.membase + UARTCR2);
 	temp |= (UARTCR2_RIE | UARTCR2_TIE | UARTCR2_RE | UARTCR2_TE);
+	if (sport->kinetis && sport->lpuart_dma_rx_use)
+		temp |= UARTCR2_ILIE;
 	writeb(temp, sport->port.membase + UARTCR2);
 
 	spin_unlock_irqrestore(&sport->port.lock, flags);
@@ -1169,6 +1215,9 @@ static void lpuart_shutdown(struct uart_port *port)
 
 	devm_free_irq(port->dev, port->irq, sport);
 
+	if (sport->kinetis)
+		devm_free_irq(port->dev, sport->kinetis_err_irq, sport);
+
 	if (sport->lpuart_dma_rx_use) {
 		lpuart_dma_rx_free(&sport->port);
 		del_timer_sync(&sport->lpuart_timer);
@@ -1781,6 +1830,8 @@ static int lpuart_probe(struct platform_device *pdev)
 	}
 	sport->port.line = ret;
 	sport->lpuart32 = of_device_is_compatible(np, "fsl,ls1021a-lpuart");
+	sport->kinetis = of_device_is_compatible(np, "fsl,kinetis-lpuart");
+	spin_lock_init(&(sport->port.lock));
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	sport->port.membase = devm_ioremap_resource(&pdev->dev, res);
@@ -1788,10 +1839,19 @@ static int lpuart_probe(struct platform_device *pdev)
 		return PTR_ERR(sport->port.membase);
 
 	sport->port.mapbase = res->start;
+	sport->port.mapsize = resource_size(res);
 	sport->port.dev = &pdev->dev;
 	sport->port.type = PORT_LPUART;
 	sport->port.iotype = UPIO_MEM;
-	sport->port.irq = platform_get_irq(pdev, 0);
+
+	if (sport->kinetis) {
+		sport->port.irq = platform_get_irq_byname(pdev, "uart-stat");
+		sport->kinetis_err_irq =
+				platform_get_irq_byname(pdev, "uart-err");
+	} else {
+		sport->port.irq = platform_get_irq(pdev, 0);
+	}
+
 	if (sport->lpuart32)
 		sport->port.ops = &lpuart32_pops;
 	else
@@ -1829,7 +1889,7 @@ static int lpuart_probe(struct platform_device *pdev)
 	}
 
 	sport->dma_tx_chan = dma_request_slave_channel(sport->port.dev, "tx");
-	if (!sport->dma_tx_chan)
+	if ((!sport->dma_tx_chan) && (!sport->kinetis))
 		dev_info(sport->port.dev, "DMA tx channel request failed, "
 				"operating without tx DMA\n");
 
diff --git a/include/dt-bindings/clock/kinetis-mcg.h b/include/dt-bindings/clock/kinetis-mcg.h
index d853c3c..541c3fd 100644
--- a/include/dt-bindings/clock/kinetis-mcg.h
+++ b/include/dt-bindings/clock/kinetis-mcg.h
@@ -14,6 +14,12 @@
 #define CLOCK_EDMA		10
 #define CLOCK_DMAMUX0		11
 #define CLOCK_DMAMUX1		12
-#define CLOCK_END		13
+#define CLOCK_UART0		13
+#define CLOCK_UART1		14
+#define CLOCK_UART2		15
+#define CLOCK_UART3		16
+#define CLOCK_UART4		17
+#define CLOCK_UART5		18
+#define CLOCK_END		19
 
 #endif /* _DT_BINDINGS_CLOCK_KINETIS_MCG_H */
-- 
2.3.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
