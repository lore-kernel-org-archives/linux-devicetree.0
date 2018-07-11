Return-Path: <SRS0=m83C=J3=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 1/2] serial: sh-sci: Add support for R7S9210
Date: Wed, 11 Jul 2018 09:41:30 -0500
Message-Id: <20180711144131.73552-2-chris.brandt@renesas.com>
In-Reply-To: <20180711144131.73552-1-chris.brandt@renesas.com>
References: <20180711144131.73552-1-chris.brandt@renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add support for a "RZ_SCIFA" which is different than a traditional
SCIFA. It looks like a normal SCIF with FIFO data, but with a
compressed address space. Also, the break out of interrupts
are different then traditinal SCIF: ERI/BRI, RXI, TXI, TEI, DRI.
The R7S9210 (RZ/A2) contains this type of SCIF.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 drivers/tty/serial/sh-sci.c | 77 +++++++++++++++++++++++++++++++++++++++++++--
 include/linux/serial_sci.h  |  1 +
 2 files changed, 76 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index c181eb37f985..d3435976ba7e 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -65,6 +65,7 @@ enum {
 	SCIx_RXI_IRQ,
 	SCIx_TXI_IRQ,
 	SCIx_BRI_IRQ,
+	SCIx_TEIDRI_IRQ,
 	SCIx_NR_IRQS,
 
 	SCIx_MUX_IRQ = SCIx_NR_IRQS,	/* special case */
@@ -76,6 +77,9 @@ enum {
 	((port)->irqs[SCIx_ERI_IRQ] &&	\
 	 ((port)->irqs[SCIx_RXI_IRQ] < 0))
 
+#define SCIx_TEIDRI_IRQ_EXISTS(port)		\
+	((port)->irqs[SCIx_TEIDRI_IRQ] > 0)
+
 enum SCI_CLKS {
 	SCI_FCK,		/* Functional Clock */
 	SCI_SCK,		/* Optional External Clock */
@@ -287,6 +291,33 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 		.error_clear = SCIF_ERROR_CLEAR,
 	},
 
+	/*
+	 * The "SCIFA" that is in RZ/T and RZ/A2.
+	 * It looks like a normal SCIF with FIFO data, but with a
+	 * compressed address space. Also, the break out of interrupts
+	 * are different: ERI/BRI, RXI, TXI, TEI, DRI.
+	 */
+	[SCIx_RZ_SCIFA_REGTYPE] = {
+		.regs = {
+			[SCSMR]		= { 0x00, 16 },
+			[SCBRR]		= { 0x02,  8 },
+			[SCSCR]		= { 0x04, 16 },
+			[SCxTDR]	= { 0x06,  8 },
+			[SCxSR]		= { 0x08, 16 },
+			[SCxRDR]	= { 0x0A,  8 },
+			[SCFCR]		= { 0x0C, 16 },
+			[SCFDR]		= { 0x0E, 16 },
+			[SCSPTR]	= { 0x10, 16 },
+			[SCLSR]		= { 0x12, 16 },
+		},
+		.fifosize = 16,
+		.overrun_reg = SCLSR,
+		.overrun_mask = SCLSR_ORER,
+		.sampling_rate_mask = SCI_SR(32),
+		.error_mask = SCIF_DEFAULT_ERROR_MASK,
+		.error_clear = SCIF_ERROR_CLEAR,
+	},
+
 	/*
 	 * Common SH-3 SCIF definitions.
 	 */
@@ -1683,11 +1714,26 @@ static irqreturn_t sci_tx_interrupt(int irq, void *ptr)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t sci_br_interrupt(int irq, void *ptr);
+
 static irqreturn_t sci_er_interrupt(int irq, void *ptr)
 {
 	struct uart_port *port = ptr;
 	struct sci_port *s = to_sci_port(port);
 
+	if (SCIx_TEIDRI_IRQ_EXISTS(s)) {
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
@@ -1827,8 +1873,31 @@ static int sci_request_irq(struct sci_port *port)
 		}
 
 		desc = sci_irq_desc + i;
-		port->irqstr[j] = kasprintf(GFP_KERNEL, "%s:%s",
-					    dev_name(up->dev), desc->desc);
+		if (SCIx_TEIDRI_IRQ_EXISTS(port)) {
+			/*
+			 * ERI and BRI are muxed, just register ERI and
+			 * ignore BRI.
+			 * TEI and DRI are muxed, but only DRI
+			 * is enabled, so use RXI handler
+			 */
+			if (i == SCIx_ERI_IRQ)
+				port->irqstr[j] = kasprintf(GFP_KERNEL,
+							    "%s:err + break",
+							    dev_name(up->dev));
+			if (i == SCIx_BRI_IRQ)
+				continue;
+			if (i == SCIx_TEIDRI_IRQ) {
+				port->irqstr[j] = kasprintf(GFP_KERNEL,
+							    "%s:tx end + rx ready",
+							    dev_name(up->dev));
+				desc = sci_irq_desc + SCIx_RXI_IRQ;
+			}
+		}
+
+		if (!port->irqstr[j])
+			port->irqstr[j] = kasprintf(GFP_KERNEL, "%s:%s",
+						    dev_name(up->dev),
+						    desc->desc);
 		if (!port->irqstr[j]) {
 			ret = -ENOMEM;
 			goto out_nomem;
@@ -3073,6 +3142,10 @@ static const struct of_device_id of_sci_match[] = {
 		.compatible = "renesas,scif-r7s72100",
 		.data = SCI_OF_DATA(PORT_SCIF, SCIx_SH2_SCIF_FIFODATA_REGTYPE),
 	},
+	{
+		.compatible = "renesas,scif-r7s9210",
+		.data = SCI_OF_DATA(PORT_SCIF, SCIx_RZ_SCIFA_REGTYPE),
+	},
 	/* Family-specific types */
 	{
 		.compatible = "renesas,rcar-gen1-scif",
diff --git a/include/linux/serial_sci.h b/include/linux/serial_sci.h
index c0e795d95477..1c89611e0e06 100644
--- a/include/linux/serial_sci.h
+++ b/include/linux/serial_sci.h
@@ -36,6 +36,7 @@ enum {
 	SCIx_SH4_SCIF_FIFODATA_REGTYPE,
 	SCIx_SH7705_SCIF_REGTYPE,
 	SCIx_HSCIF_REGTYPE,
+	SCIx_RZ_SCIFA_REGTYPE,
 
 	SCIx_NR_REGTYPES,
 };
-- 
2.16.1
