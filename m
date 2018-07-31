Return-Path: <SRS0=TsJA=KP=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v3 2/4] serial: sh-sci: Allow for compressed SCIF address
Date: Tue, 31 Jul 2018 05:41:37 -0500
Message-Id: <20180731104139.93291-3-chris.brandt@renesas.com>
In-Reply-To: <20180731104139.93291-1-chris.brandt@renesas.com>
References: <20180731104139.93291-1-chris.brandt@renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Some devices with SCIx_SH4_SCIF_REGTYPE have no space between registers.
Use the register area size to determine the spacing between register.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
v2:
* adjust for case of SCIx_PROBE_REGTYPE
---
 drivers/tty/serial/sh-sci.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 6ff6f2bf3b9b..c29244f76057 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -348,15 +348,15 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 	[SCIx_SH4_SCIF_REGTYPE] = {
 		.regs = {
 			[SCSMR]		= { 0x00, 16 },
-			[SCBRR]		= { 0x04,  8 },
-			[SCSCR]		= { 0x08, 16 },
-			[SCxTDR]	= { 0x0c,  8 },
-			[SCxSR]		= { 0x10, 16 },
-			[SCxRDR]	= { 0x14,  8 },
-			[SCFCR]		= { 0x18, 16 },
-			[SCFDR]		= { 0x1c, 16 },
-			[SCSPTR]	= { 0x20, 16 },
-			[SCLSR]		= { 0x24, 16 },
+			[SCBRR]		= { 0x02,  8 },
+			[SCSCR]		= { 0x04, 16 },
+			[SCxTDR]	= { 0x06,  8 },
+			[SCxSR]		= { 0x08, 16 },
+			[SCxRDR]	= { 0x0a,  8 },
+			[SCFCR]		= { 0x0c, 16 },
+			[SCFDR]		= { 0x0e, 16 },
+			[SCSPTR]	= { 0x10, 16 },
+			[SCLSR]		= { 0x12, 16 },
 		},
 		.fifosize = 16,
 		.overrun_reg = SCLSR,
@@ -2848,7 +2848,7 @@ static int sci_init_single(struct platform_device *dev,
 {
 	struct uart_port *port = &sci_port->port;
 	const struct resource *res;
-	unsigned int i;
+	unsigned int i, regtype;
 	int ret;
 
 	sci_port->cfg	= p;
@@ -2885,6 +2885,7 @@ static int sci_init_single(struct platform_device *dev,
 	if (unlikely(sci_port->params == NULL))
 		return -EINVAL;
 
+	regtype = sci_port->params - sci_port_params;
 	switch (p->type) {
 	case PORT_SCIFB:
 		sci_port->rx_trigger = 48;
@@ -2939,6 +2940,10 @@ static int sci_init_single(struct platform_device *dev,
 			port->regshift = 1;
 	}
 
+	if (regtype == SCIx_SH4_SCIF_REGTYPE)
+		if (sci_port->reg_size >= 0x20)
+			port->regshift = 1;
+
 	/*
 	 * The UART port needs an IRQ value, so we peg this to the RX IRQ
 	 * for the multi-IRQ ports, which is where we are primarily
-- 
2.16.1
