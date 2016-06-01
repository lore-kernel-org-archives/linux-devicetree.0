From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 01/13] ARM: shmobile: r8a7792: add clock index macros
Date: Wed, 1 Jun 2016 09:52:46 +0900
Message-ID: <20160601005246.GF20527@verge.net.au>
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
 <2280165.siMXMbFrFe@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2280165.siMXMbFrFe@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 01, 2016 at 01:09:58AM +0300, Sergei Shtylyov wrote:
> Add macros usable by the device tree sources to reference the R8A7792
> clocks  by index.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
>  include/dt-bindings/clock/r8a7792-clock.h |  104 ++++++++++++++++++++++++++++++
>  1 file changed, 104 insertions(+)
> 
> Index: renesas/include/dt-bindings/clock/r8a7792-clock.h
> ===================================================================
> --- /dev/null
> +++ renesas/include/dt-bindings/clock/r8a7792-clock.h
> @@ -0,0 +1,104 @@
> +/*
> + * Copyright (C) 2016 Cogent Embedded, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#ifndef __DT_BINDINGS_CLOCK_R8A7792_H__
> +#define __DT_BINDINGS_CLOCK_R8A7792_H__
> +
> +/* CPG */
> +#define R8A7792_CLK_MAIN		0
> +#define R8A7792_CLK_PLL0		1
> +#define R8A7792_CLK_PLL1		2
> +#define R8A7792_CLK_PLL3		3
> +#define R8A7792_CLK_LB			4
> +#define R8A7792_CLK_QSPI		5
> +#define R8A7792_CLK_SDH			6
> +#define R8A7792_CLK_SD0			7
> +#define R8A7792_CLK_SD1			8
> +#define R8A7792_CLK_Z			9

According to my copy of the documentation (v2.00) SDH, SD0 and SD1 do
not seem to be provided by the r8a7792 CPG.

It does, however, provide RCAN and ADSP which are supported by the CPG
driver. You may wish to add them now for completeness though from my point
of view they could also be added later when they are used.


I reviewed the values below. They appear to be complete and correct.

> +/* MSTP0 */
> +#define R8A7792_CLK_MSIOF0		0
> +
> +/* MSTP1 */
> +#define R8A7792_CLK_TMU1		11
> +#define R8A7792_CLK_TMU3		21
> +#define R8A7792_CLK_TMU2		22
> +#define R8A7792_CLK_CMT0		24
> +#define R8A7792_CLK_TMU0		25
> +#define R8A7792_CLK_VSP1DU1		27
> +#define R8A7792_CLK_VSP1DU0		28
> +#define R8A7792_CLK_VSP1_SY		31
> +/* MSTP2 */
> +#define R8A7792_CLK_MSIOF1		8
> +#define R8A7792_CLK_SYS_DMAC0		18
> +#define R8A7792_CLK_SYS_DMAC1		19

> +/* MSTP3 */
> +#define R8A7792_CLK_TPU0		4
> +#define R8A7792_CLK_SDHI0		14
> +#define R8A7792_CLK_CMT1		29
> +
> +/* MSTP4 */
> +#define R8A7792_CLK_IRQC		7
> +
> +/* MSTP5 */
> +#define R8A7792_CLK_AUDIO_DMAC0		2
> +#define R8A7792_CLK_THERMAL		22
> +#define R8A7792_CLK_PWM			23
> +
> +/* MSTP7 */
> +#define R8A7792_CLK_HSCIF1		16
> +#define R8A7792_CLK_HSCIF0		17
> +#define R8A7792_CLK_SCIF3		18
> +#define R8A7792_CLK_SCIF2		19
> +#define R8A7792_CLK_SCIF1		20
> +#define R8A7792_CLK_SCIF0		21
> +#define R8A7792_CLK_DU1			23
> +#define R8A7792_CLK_DU0			24
> +
> +/* MSTP8 */
> +#define R8A7792_CLK_VIN5		4
> +#define R8A7792_CLK_VIN4		5
> +#define R8A7792_CLK_VIN3		8
> +#define R8A7792_CLK_VIN2		9
> +#define R8A7792_CLK_VIN1		10
> +#define R8A7792_CLK_VIN0		11
> +#define R8A7792_CLK_ETHERAVB		12
> +
> +/* MSTP9 */
> +#define R8A7792_CLK_GPIO7		4
> +#define R8A7792_CLK_GPIO6		5
> +#define R8A7792_CLK_GPIO5		7
> +#define R8A7792_CLK_GPIO4		8
> +#define R8A7792_CLK_GPIO3		9
> +#define R8A7792_CLK_GPIO2		10
> +#define R8A7792_CLK_GPIO1		11
> +#define R8A7792_CLK_GPIO0		12
> +#define R8A7792_CLK_GPIO11		13
> +#define R8A7792_CLK_GPIO10		14
> +#define R8A7792_CLK_CAN1		15
> +#define R8A7792_CLK_CAN0		16
> +#define R8A7792_CLK_QSPI_MOD		17
> +#define R8A7792_CLK_GPIO9		19
> +#define R8A7792_CLK_GPIO8		21
> +#define R8A7792_CLK_I2C5		25
> +#define R8A7792_CLK_IICDVFS		26
> +#define R8A7792_CLK_I2C4		27
> +#define R8A7792_CLK_I2C3		28
> +#define R8A7792_CLK_I2C2		29
> +#define R8A7792_CLK_I2C1		30
> +#define R8A7792_CLK_I2C0		31
> +
> +/* MSTP10 */
> +#define R8A7792_CLK_SSI_ALL		5
> +#define R8A7792_CLK_SSI4		11
> +#define R8A7792_CLK_SSI3		12
> +
> +#endif /* __DT_BINDINGS_CLOCK_R8A7792_H__ */
> 
