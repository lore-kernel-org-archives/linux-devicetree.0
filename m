Return-Path: <SRS0=zYwW=IR=gmail.com=pku.leo@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20180525111920.24498-2-wen.he_1@nxp.com>
References: <20180525111920.24498-1-wen.he_1@nxp.com> <20180525111920.24498-2-wen.he_1@nxp.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Wed, 30 May 2018 13:51:17 -0500
Message-ID: <CADRPPNRx2ePL1eteMboAZ7ZvoxrVO1Jn+Koo7TatLQyquymTiQ@mail.gmail.com>
Subject: Re: [v5 2/6] dmaengine: fsl-qdma: Add qDMA controller driver for
 Layerscape SoCs
Content-Type: text/plain; charset="UTF-8"
To: Wen He <wen.he_1@nxp.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, jiafei.pan@nxp.com, jiaheng.fan@nxp.com
List-ID: <devicetree@vger.kernel.org>

On Fri, May 25, 2018 at 6:19 AM, Wen He <wen.he_1@nxp.com> wrote:
> NXP Queue DMA controller(qDMA) on Layerscape SoCs supports channel
> virtuallization by allowing DMA jobs to be enqueued into different
> command queues.
>
> Note that this module depends on NXP DPAA.
>
> Signed-off-by: Wen He <wen.he_1@nxp.com>
> Signed-off-by: Jiaheng Fan <jiaheng.fan@nxp.com>
> ---
> change in v5:
>         - Fixed the issues includes:
>                 * add error handler which every function
>                 * replace word to bit definition
>                 * move global variable to struct definition
>                 * add some comments to context
>
> change in v4:
>         - Fixed the issues that Vinod point out in the mail list.
>
> change in v3:
>         - Add 'depends on ARM || ARM64' in file 'drivers/dma/Kconfig'
>
> change in v2:
>         - Replace GPL V2 License details by SPDX tags
>         - Replace Freescale by NXP
>         - Reduce and optimize header file references
>         - Replace big_endian by feature in struct fsl_qdma_engine
>         - Replace struct fsl_qdma_format by struct fsl_qdma_ccdf
>           and struct fsl_qdma_csgf
>         - Remove empty line
>         - Replace 'if..else' by macro 'FSL_QDMA_IN/OUT' in function
>           qdma_readl() and qdma_writel()
>         - Remove function fsl_qdma_alloc_chan_resources()
>         - Replace 'prei' by 'pre'
>         - Replace '-1' by '-ENOMEM' in function fsl_qdma_pre_request_enqueue_desc()
>         - Fix dma pool allocation need to rolled back in function
>           fsl_qdma_request_enqueue_desc()
>         - Replace function of_property_read_u32_array() by device_property_read_u32_array()
>         - Add functions fsl_qdma_cleanup_vchan() and fsl_qdma_irq_exit() to ensure
>           irq and tasklets stopped
>         - Replace dts node element 'channels' by 'dma-channels'
>         - Replace function platform_driver_register() by module_platform_driver()
>
>  drivers/dma/Kconfig    |   13 +
>  drivers/dma/Makefile   |    1 +
>  drivers/dma/fsl-qdma.c | 1101 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 1115 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/dma/fsl-qdma.c
>
> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> index 6d61cd0..99aff33 100644
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@ -225,6 +225,19 @@ config FSL_EDMA
>           multiplexing capability for DMA request sources(slot).
>           This module can be found on Freescale Vybrid and LS-1 SoCs.
>
> +config FSL_QDMA
> +       tristate "NXP Layerscape qDMA engine support"
> +       depends on ARM || ARM64
> +       select DMA_ENGINE
> +       select DMA_VIRTUAL_CHANNELS
> +       select DMA_ENGINE_RAID
> +       select ASYNC_TX_ENABLE_CHANNEL_SWITCH
> +       help
> +         Support the NXP Layerscape qDMA engine with command queue and legacy mode.
> +         Channel virtualization is supported through enqueuing of DMA jobs to,
> +         or dequeuing DMA jobs from, different work queues.
> +         This module can be found on NXP Layerscape SoCs.
> +
>  config FSL_RAID
>          tristate "Freescale RAID engine Support"
>          depends on FSL_SOC && !ASYNC_TX_ENABLE_CHANNEL_SWITCH
> diff --git a/drivers/dma/Makefile b/drivers/dma/Makefile
> index 0f62a4d..93db0fc 100644
> --- a/drivers/dma/Makefile
> +++ b/drivers/dma/Makefile
> @@ -33,6 +33,7 @@ obj-$(CONFIG_DW_DMAC_CORE) += dw/
>  obj-$(CONFIG_EP93XX_DMA) += ep93xx_dma.o
>  obj-$(CONFIG_FSL_DMA) += fsldma.o
>  obj-$(CONFIG_FSL_EDMA) += fsl-edma.o
> +obj-$(CONFIG_FSL_QDMA) += fsl-qdma.o
>  obj-$(CONFIG_FSL_RAID) += fsl_raid.o
>  obj-$(CONFIG_HSU_DMA) += hsu/
>  obj-$(CONFIG_IMG_MDC_DMA) += img-mdc-dma.o
> diff --git a/drivers/dma/fsl-qdma.c b/drivers/dma/fsl-qdma.c
> new file mode 100644
> index 0000000..81df812
> --- /dev/null
> +++ b/drivers/dma/fsl-qdma.c
> @@ -0,0 +1,1101 @@

Not a critical issue, but the format of the file header looks a little
bit weird to me.  Would you mind clean it up?

> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright 2018 NXP

I know the SPDX tag is recommended to be the 1st line, but copyright
normally goes below the file description not above.

> +

No newline needed.

> +/*
> + * Driver for NXP Layerscape Queue Direct Memory Access Controller
> + *
> + * Author:
> + *  Wen He <wen.he_1@nxp.com>
> + *  Jiaheng Fan <jiaheng.fan@nxp.com>
> + *

No newline needed.

> + */
> +


Regards,
Leo
