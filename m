From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH] dma: imx-sdma: Add a new DMATYPE for Shared Peripheral
 ASRC
Date: Fri, 25 Jul 2014 14:09:12 +0530
Message-ID: <20140725083912.GK8181@intel.com>
References: <1402889465-23797-1-git-send-email-nicoleotsuka@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1402889465-23797-1-git-send-email-nicoleotsuka@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: s.hauer@pengutronix.de, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rdunlap@infradead.org, dan.j.williams@intel.com, shawn.guo@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 16, 2014 at 11:31:05AM +0800, Nicolin Chen wrote:
> Shared Peripheral ASRC, running on SPBA, needs to use shp sciprts for
> DMA transfer. So this patch just adds a new DMATYPE for it.

Applied, thanks

-- 
~Vinod
> 
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  Documentation/devicetree/bindings/dma/fsl-imx-sdma.txt | 1 +
>  drivers/dma/imx-sdma.c                                 | 5 +++++
>  include/linux/platform_data/dma-imx.h                  | 1 +
>  3 files changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/fsl-imx-sdma.txt b/Documentation/devicetree/bindings/dma/fsl-imx-sdma.txt
> index ee9be99..d2e91f1 100644
> --- a/Documentation/devicetree/bindings/dma/fsl-imx-sdma.txt
> +++ b/Documentation/devicetree/bindings/dma/fsl-imx-sdma.txt
> @@ -47,6 +47,7 @@ The full ID of peripheral types can be found below.
>  	20	ASRC
>  	21	ESAI
>  	22	SSI Dual FIFO	(needs firmware ver >= 2)
> +	23	Shared ASRC
>  
>  The third cell specifies the transfer priority as below.
>  
> diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
> index fc04add..85561dc 100644
> --- a/drivers/dma/imx-sdma.c
> +++ b/drivers/dma/imx-sdma.c
> @@ -745,6 +745,11 @@ static void sdma_get_pc(struct sdma_channel *sdmac,
>  		emi_2_per = sdma->script_addrs->asrc_2_mcu_addr;
>  		per_2_per = sdma->script_addrs->per_2_per_addr;
>  		break;
> +	case IMX_DMATYPE_ASRC_SP:
> +		per_2_emi = sdma->script_addrs->shp_2_mcu_addr;
> +		emi_2_per = sdma->script_addrs->mcu_2_shp_addr;
> +		per_2_per = sdma->script_addrs->per_2_per_addr;
> +		break;
>  	case IMX_DMATYPE_MSHC:
>  		per_2_emi = sdma->script_addrs->mshc_2_mcu_addr;
>  		emi_2_per = sdma->script_addrs->mcu_2_mshc_addr;
> diff --git a/include/linux/platform_data/dma-imx.h b/include/linux/platform_data/dma-imx.h
> index bcbc6c3..7aa0e89 100644
> --- a/include/linux/platform_data/dma-imx.h
> +++ b/include/linux/platform_data/dma-imx.h
> @@ -40,6 +40,7 @@ enum sdma_peripheral_type {
>  	IMX_DMATYPE_ASRC,	/* ASRC */
>  	IMX_DMATYPE_ESAI,	/* ESAI */
>  	IMX_DMATYPE_SSI_DUAL,	/* SSI Dual FIFO */
> +	IMX_DMATYPE_ASRC_SP,	/* Shared ASRC */
>  };
>  
>  enum imx_dma_prio {
> -- 
> 1.8.4
> 

-- 
