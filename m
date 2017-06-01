From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCHv1] dt-bindings: reset: Add reset manager offsets for
 Stratix10
Date: Thu, 01 Jun 2017 19:17:15 +0200
Message-ID: <1496337435.27771.1.camel@pengutronix.de>
References: <1496327039-21942-1-git-send-email-richard.gong@linux.intel.com>
         <1496327039-21942-2-git-send-email-richard.gong@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496327039-21942-2-git-send-email-richard.gong-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: richard.gong-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Gong <richard.gong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Richard,

On Thu, 2017-06-01 at 09:23 -0500, richard.gong-VuQAYsv1563Yd54FQh9/CA@public.gmane.org wrote:
> From: Richard Gong <richard.gong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> 
> There are several changes in reset manager offsets from Arria10 to
> Stratix10. This patch is based on one from Arria10 and adds offset
> updates for Stratix10
> 
> Signed-off-by: Richard Gong <richard.gong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> ---
>  include/dt-bindings/reset/altr,rst-mgr-s10.h | 108 +++++++++++++++++++++++++++
>  1 file changed, 108 insertions(+)
>  create mode 100644 include/dt-bindings/reset/altr,rst-mgr-s10.h
> 
> diff --git a/include/dt-bindings/reset/altr,rst-mgr-s10.h b/include/dt-bindings/reset/altr,rst-mgr-s10.h
> new file mode 100644
> index 0000000..7978c21
> --- /dev/null
> +++ b/include/dt-bindings/reset/altr,rst-mgr-s10.h
> @@ -0,0 +1,108 @@
> +/*
> + * Copyright (C) 2016 Intel Corporation. All rights reserved
> + * Copyright (C) 2016 Altera Corporation. All rights reserved
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + *
> + * derived from Steffen Trumtrar's "altr,rst-mgr-a10.h"
> + */
> +
> +#ifndef _DT_BINDINGS_RESET_ALTR_RST_MGR_S10_H
> +#define _DT_BINDINGS_RESET_ALTR_RST_MGR_S10_H
> +
> +/* MPUMODRST */
> +#define CPU0_RESET		0
> +#define CPU1_RESET		1
> +#define CPU2_RESET		2
> +#define CPU3_RESET		3
> +
> +/* PER0MODRST */
> +#define EMAC0_RESET		32
> +#define EMAC1_RESET		33
> +#define EMAC2_RESET		34
> +#define USB0_RESET		35
> +#define USB1_RESET		36
> +#define NAND_RESET		37
> +/* 38 is empty */
> +#define SDMMC_RESET		39
> +#define EMAC0_OCP_RESET		40
> +#define EMAC1_OCP_RESET		41
> +#define EMAC2_OCP_RESET		42
> +#define USB0_OCP_RESET		43
> +#define USB1_OCP_RESET		44
> +#define NAND_OCP_RESET		45
> +/* 46 is empty */
> +#define SDMMC_OCP_RESET		47
> +#define DMA_RESET		48
> +#define SPIM0_RESET		49
> +#define SPIM1_RESET		50
> +#define SPIS0_RESET		51
> +#define SPIS1_RESET		52
> +#define DMA_OCP_RESET		53
> +#define EMAC_PTP_RESET		54
> +/* 55 is empty*/
> +#define DMAIF0_RESET		56
> +#define DMAIF1_RESET		57
> +#define DMAIF2_RESET		58
> +#define DMAIF3_RESET		59
> +#define DMAIF4_RESET		60
> +#define DMAIF5_RESET		61
> +#define DMAIF6_RESET		62
> +#define DMAIF7_RESET		63
> +
> +/* PER1MODRST */
> +#define WATCHDOG0_RESET		64
> +#define WATCHDOG1_RESET		65
> +#define WATCHDOG2_RESET		66
> +#define WATCHDOG3_RESET		67
> +#define L4SYSTIMER0_RESET	68
> +#define L4SYSTIMER1_RESET	69
> +#define SPTIMER0_RESET		70
> +#define SPTIMER1_RESET		71
> +#define I2C0_RESET		72
> +#define I2C1_RESET		73
> +#define I2C2_RESET		74
> +#define I2C3_RESET		75
> +#define I2C4_RESET		76
> +/* 77-79 is empty */
> +#define UART0_RESET		80
> +#define UART1_RESET		81
> +/* 82-87 is empty */
> +#define GPIO0_RESET		88
> +#define GPIO1_RESET		89
> +
> +/* BRGMODRST */
> +#define SOC2FPGA_RESET		96
> +#define LWHPS2FPGA_RESET	97
> +#define FPGA2SOC_RESET		98
> +#define F2SSDRAM0_RESET		99
> +#define F2SSDRAM1_RESET		100
> +#define F2SSDRAM2_RESET		101
> +#define DDRSCH_RESET		102
> +
> +/* COLDMODRST */
> +#define CPUPO0_RESET		160
> +#define CPUPO1_RESET		161
> +#define CPUPO2_RESET		162
> +#define CPUPO3_RESET		163
> +/* 164-167 is empty */
> +#define L2_RESET		168
> +
> +/* DBGMODRST */
> +#define DBG_RESET		224
> +#define CSDAP_RESET		225
> +
> +/* TAPMODRST */
> +#define TAP_RESET		256
> +
> +#endif
> -- 
> 2.7.4

Applied, thanks.

regards
Philipp


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
