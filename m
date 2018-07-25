Return-Path: <SRS0=GvcF=KJ=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 2/3] serial: sh-sci: Add support for separate TEI+DRI interrupts
Date: Wed, 25 Jul 2018 09:38:49 -0500
Message-Id: <20180725143850.32985-3-chris.brandt@renesas.com>
In-Reply-To: <20180725143850.32985-1-chris.brandt@renesas.com>
References: <20180725143850.32985-1-chris.brandt@renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Some SCIF versions mux error and break interrupts together and then provide
a separate interrupt ID for just TEI/DRI.

Allow all 6 types of interrupts to be specified via platform data (or DT)
and for any signals that are muxed together (have the same interrupt
number) simply register one handler.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
v2:
 * Move compressed SCIF reg address space to a separate commit
 * Handle all 6 possible interrupt types
---
 drivers/tty/serial/sh-sci.c | 44 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index d9202ad1c9ca..f1272fecbe44 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -65,6 +65,8 @@ enum {
 	SCIx_RXI_IRQ,
 	SCIx_TXI_IRQ,
 	SCIx_BRI_IRQ,
+	SCIx_DRI_IRQ,
+	SCIx_TEI_IRQ,
 	SCIx_NR_IRQS,
 
 	SCIx_MUX_IRQ = SCIx_NR_IRQS,	/* special case */
@@ -1683,11 +1685,26 @@ static irqreturn_t sci_tx_interrupt(int irq, void *ptr)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t sci_br_interrupt(int irq, void *ptr);
+
 static irqreturn_t sci_er_interrupt(int irq, void *ptr)
 {
 	struct uart_port *port = ptr;
 	struct sci_port *s = to_sci_port(port);
 
+	if (s->irqs[SCIx_ERI_IRQ] == s->irqs[SCIx_BRI_IRQ]) {
+		/* Break and Error interrupts are muxed */
+		unsigned short ssr_status = serial_port_in(port, SCxSR);
+
+		/* Break Interrupt */
+		if (ssr_status & SCxSR_BRK(port))
+			sci_br_interrupt(irq, ptr);
+
+		/* Break only? */
+		if (!(ssr_status & SCxSR_ERRORS(port)))
+			return IRQ_HANDLED;
+	}
+
 	/* Handle errors */
 	if (port->type == PORT_SCI) {
 		if (sci_handle_errors(port)) {
@@ -1794,6 +1811,16 @@ static const struct sci_irq_desc {
 		.handler = sci_br_interrupt,
 	},
 
+	[SCIx_DRI_IRQ] = {
+		.desc = "rx ready",
+		.handler = sci_rx_interrupt,
+	},
+
+	[SCIx_TEI_IRQ] = {
+		.desc = "tx end",
+		.handler = sci_tx_interrupt,
+	},
+
 	/*
 	 * Special muxed handler.
 	 */
@@ -1806,12 +1833,19 @@ static const struct sci_irq_desc {
 static int sci_request_irq(struct sci_port *port)
 {
 	struct uart_port *up = &port->port;
-	int i, j, ret = 0;
+	int i, j, w, ret = 0;
 
 	for (i = j = 0; i < SCIx_NR_IRQS; i++, j++) {
 		const struct sci_irq_desc *desc;
 		int irq;
 
+		/* Check if already registered (muxed) */
+		for (w = 0; w < i; w++)
+			if (port->irqs[w] == port->irqs[i])
+				w = i + 1;
+		if (w > i)
+			continue;
+
 		if (SCIx_IRQ_IS_MUXED(port)) {
 			i = SCIx_MUX_IRQ;
 			irq = up->irq;
@@ -2799,8 +2833,10 @@ static int sci_init_single(struct platform_device *dev,
 
 	/* The SCI generates several interrupts. They can be muxed together or
 	 * connected to different interrupt lines. In the muxed case only one
-	 * interrupt resource is specified. In the non-muxed case three or four
-	 * interrupt resources are specified, as the BRI interrupt is optional.
+	 * interrupt resource is specified as there is only one interrupt ID.
+	 * In the non-muxed case, up to 6 interrupt signals might be generated
+	 * from the SCI, however those signals might have their own individual
+	 * interrupt ID numbers, or muxed together with another interrupt.
 	 */
 	if (sci_port->irqs[0] < 0)
 		return -ENXIO;
@@ -2809,6 +2845,8 @@ static int sci_init_single(struct platform_device *dev,
 		sci_port->irqs[1] = sci_port->irqs[0];
 		sci_port->irqs[2] = sci_port->irqs[0];
 		sci_port->irqs[3] = sci_port->irqs[0];
+		sci_port->irqs[4] = sci_port->irqs[0];
+		sci_port->irqs[5] = sci_port->irqs[0];
 	}
 
 	sci_port->params = sci_probe_regmap(p);
-- 
2.16.1
