Return-Path: <SRS0=TsJA=KP=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v3 3/4] serial: sh-sci: Remove SCIx_RZ_SCIFA_REGTYPE
Date: Tue, 31 Jul 2018 05:41:38 -0500
Message-Id: <20180731104139.93291-4-chris.brandt@renesas.com>
In-Reply-To: <20180731104139.93291-1-chris.brandt@renesas.com>
References: <20180731104139.93291-1-chris.brandt@renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

There is no more need for SCIx_RZ_SCIFA_REGTYPE now that
SCIx_SH4_SCIF_REGTYPE can provide the same register/address definitions.

Also, R7S9210 no longer needs a special compatible since the standard
"renesas,scif" will work just fine.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
* add Reviewed-by
---
 drivers/tty/serial/sh-sci.c | 31 -------------------------------
 include/linux/serial_sci.h  |  1 -
 2 files changed, 32 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index c29244f76057..54ea58bbe3c9 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -293,33 +293,6 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
 		.error_clear = SCIF_ERROR_CLEAR,
 	},
 
-	/*
-	 * The "SCIFA" that is in RZ/T and RZ/A2.
-	 * It looks like a normal SCIF with FIFO data, but with a
-	 * compressed address space. Also, the break out of interrupts
-	 * are different: ERI/BRI, RXI, TXI, TEI, DRI.
-	 */
-	[SCIx_RZ_SCIFA_REGTYPE] = {
-		.regs = {
-			[SCSMR]		= { 0x00, 16 },
-			[SCBRR]		= { 0x02,  8 },
-			[SCSCR]		= { 0x04, 16 },
-			[SCxTDR]	= { 0x06,  8 },
-			[SCxSR]		= { 0x08, 16 },
-			[SCxRDR]	= { 0x0A,  8 },
-			[SCFCR]		= { 0x0C, 16 },
-			[SCFDR]		= { 0x0E, 16 },
-			[SCSPTR]	= { 0x10, 16 },
-			[SCLSR]		= { 0x12, 16 },
-		},
-		.fifosize = 16,
-		.overrun_reg = SCLSR,
-		.overrun_mask = SCLSR_ORER,
-		.sampling_rate_mask = SCI_SR(32),
-		.error_mask = SCIF_DEFAULT_ERROR_MASK,
-		.error_clear = SCIF_ERROR_CLEAR,
-	},
-
 	/*
 	 * Common SH-3 SCIF definitions.
 	 */
@@ -3148,10 +3121,6 @@ static const struct of_device_id of_sci_match[] = {
 		.compatible = "renesas,scif-r7s72100",
 		.data = SCI_OF_DATA(PORT_SCIF, SCIx_SH2_SCIF_FIFODATA_REGTYPE),
 	},
-	{
-		.compatible = "renesas,scif-r7s9210",
-		.data = SCI_OF_DATA(PORT_SCIF, SCIx_RZ_SCIFA_REGTYPE),
-	},
 	/* Family-specific types */
 	{
 		.compatible = "renesas,rcar-gen1-scif",
diff --git a/include/linux/serial_sci.h b/include/linux/serial_sci.h
index 1c89611e0e06..c0e795d95477 100644
--- a/include/linux/serial_sci.h
+++ b/include/linux/serial_sci.h
@@ -36,7 +36,6 @@ enum {
 	SCIx_SH4_SCIF_FIFODATA_REGTYPE,
 	SCIx_SH7705_SCIF_REGTYPE,
 	SCIx_HSCIF_REGTYPE,
-	SCIx_RZ_SCIFA_REGTYPE,
 
 	SCIx_NR_REGTYPES,
 };
-- 
2.16.1
