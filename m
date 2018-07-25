Return-Path: <SRS0=GvcF=KJ=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 1/3] serial: sh-sci: Allow for compressed SCIF address space
Date: Wed, 25 Jul 2018 09:38:48 -0500
Message-Id: <20180725143850.32985-2-chris.brandt@renesas.com>
In-Reply-To: <20180725143850.32985-1-chris.brandt@renesas.com>
References: <20180725143850.32985-1-chris.brandt@renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Some devices with SCIx_SH4_SCIF_REGTYPE have no space between registers.
Use the register area size to determine the spacing between register.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 drivers/tty/serial/sh-sci.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index c181eb37f985..d9202ad1c9ca 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -315,15 +315,15 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
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
@@ -2869,6 +2869,10 @@ static int sci_init_single(struct platform_device *dev,
 			port->regshift = 1;
 	}
 
+	if (p->regtype == SCIx_SH4_SCIF_REGTYPE)
+		if (sci_port->reg_size >= 0x20)
+			port->regshift = 1;
+
 	/*
 	 * The UART port needs an IRQ value, so we peg this to the RX IRQ
 	 * for the multi-IRQ ports, which is where we are primarily
-- 
2.16.1
