Return-Path: <SRS0=TsJA=KP=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v3 4/4] serial: sh-sci: Improve support for separate TEI and DRI interrupts
Date: Tue, 31 Jul 2018 05:41:39 -0500
Message-Id: <20180731104139.93291-5-chris.brandt@renesas.com>
In-Reply-To: <20180731104139.93291-1-chris.brandt@renesas.com>
References: <20180731104139.93291-1-chris.brandt@renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Some SCIF versions mux error and break interrupts together and then provide
a separate interrupt ID for just TEI/DRI.

Allow all 6 types of interrupts to be specified via platform data (or DT)
and for any signals that are muxed together (have the same interrupt
number) simply register one handler.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
* Setting string to NULL first is no longer needed
v2:
* Removed - 1 from loop
* Added Reviewed-by
---
 drivers/tty/serial/sh-sci.c | 91 ++++++++++++++++++++-------------------------
 1 file changed, 40 insertions(+), 51 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 54ea58bbe3c9..ac4424bf6b13 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -65,7 +65,8 @@ enum {
 	SCIx_RXI_IRQ,
 	SCIx_TXI_IRQ,
 	SCIx_BRI_IRQ,
-	SCIx_TEIDRI_IRQ,
+	SCIx_DRI_IRQ,
+	SCIx_TEI_IRQ,
 	SCIx_NR_IRQS,
 
 	SCIx_MUX_IRQ = SCIx_NR_IRQS,	/* special case */
@@ -77,9 +78,6 @@ enum {
 	((port)->irqs[SCIx_ERI_IRQ] &&	\
 	 ((port)->irqs[SCIx_RXI_IRQ] < 0))
 
-#define SCIx_TEIDRI_IRQ_EXISTS(port)		\
-	((port)->irqs[SCIx_TEIDRI_IRQ] > 0)
-
 enum SCI_CLKS {
 	SCI_FCK,		/* Functional Clock */
 	SCI_SCK,		/* Optional External Clock */
@@ -1685,14 +1683,23 @@ static irqreturn_t sci_tx_interrupt(int irq, void *ptr)
 	return IRQ_HANDLED;
 }
 
-static irqreturn_t sci_br_interrupt(int irq, void *ptr);
+static irqreturn_t sci_br_interrupt(int irq, void *ptr)
+{
+	struct uart_port *port = ptr;
+
+	/* Handle BREAKs */
+	sci_handle_breaks(port);
+	sci_clear_SCxSR(port, SCxSR_BREAK_CLEAR(port));
+
+	return IRQ_HANDLED;
+}
 
 static irqreturn_t sci_er_interrupt(int irq, void *ptr)
 {
 	struct uart_port *port = ptr;
 	struct sci_port *s = to_sci_port(port);
 
-	if (SCIx_TEIDRI_IRQ_EXISTS(s)) {
+	if (s->irqs[SCIx_ERI_IRQ] == s->irqs[SCIx_BRI_IRQ]) {
 		/* Break and Error interrupts are muxed */
 		unsigned short ssr_status = serial_port_in(port, SCxSR);
 
@@ -1727,17 +1734,6 @@ static irqreturn_t sci_er_interrupt(int irq, void *ptr)
 	return IRQ_HANDLED;
 }
 
-static irqreturn_t sci_br_interrupt(int irq, void *ptr)
-{
-	struct uart_port *port = ptr;
-
-	/* Handle BREAKs */
-	sci_handle_breaks(port);
-	sci_clear_SCxSR(port, SCxSR_BREAK_CLEAR(port));
-
-	return IRQ_HANDLED;
-}
-
 static irqreturn_t sci_mpxed_interrupt(int irq, void *ptr)
 {
 	unsigned short ssr_status, scr_status, err_enabled, orer_status = 0;
@@ -1811,6 +1807,16 @@ static const struct sci_irq_desc {
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
@@ -1823,12 +1829,19 @@ static const struct sci_irq_desc {
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
@@ -1844,32 +1857,8 @@ static int sci_request_irq(struct sci_port *port)
 		}
 
 		desc = sci_irq_desc + i;
-		port->irqstr[j] = NULL;
-		if (SCIx_TEIDRI_IRQ_EXISTS(port)) {
-			/*
-			 * ERI and BRI are muxed, just register ERI and
-			 * ignore BRI.
-			 * TEI and DRI are muxed, but only DRI
-			 * is enabled, so use RXI handler
-			 */
-			if (i == SCIx_ERI_IRQ)
-				port->irqstr[j] = kasprintf(GFP_KERNEL,
-							    "%s:err + break",
-							    dev_name(up->dev));
-			if (i == SCIx_BRI_IRQ)
-				continue;
-			if (i == SCIx_TEIDRI_IRQ) {
-				port->irqstr[j] = kasprintf(GFP_KERNEL,
-							    "%s:tx end + rx ready",
-							    dev_name(up->dev));
-				desc = sci_irq_desc + SCIx_RXI_IRQ;
-			}
-		}
-
-		if (!port->irqstr[j])
-			port->irqstr[j] = kasprintf(GFP_KERNEL, "%s:%s",
-						    dev_name(up->dev),
-						    desc->desc);
+		port->irqstr[j] = kasprintf(GFP_KERNEL, "%s:%s",
+					    dev_name(up->dev), desc->desc);
 		if (!port->irqstr[j]) {
 			ret = -ENOMEM;
 			goto out_nomem;
@@ -2842,17 +2831,17 @@ static int sci_init_single(struct platform_device *dev,
 
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
 
-	if (sci_port->irqs[1] < 0) {
-		sci_port->irqs[1] = sci_port->irqs[0];
-		sci_port->irqs[2] = sci_port->irqs[0];
-		sci_port->irqs[3] = sci_port->irqs[0];
-	}
+	if (sci_port->irqs[1] < 0)
+		for (i = 1; i < ARRAY_SIZE(sci_port->irqs); i++)
+			sci_port->irqs[i] = sci_port->irqs[0];
 
 	sci_port->params = sci_probe_regmap(p);
 	if (unlikely(sci_port->params == NULL))
-- 
2.16.1
