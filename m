From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v2 4/7] dmaengine: fsl-edma-common: version check for v2
 instead
Date: Mon, 27 May 2019 11:08:14 +0200
Message-ID: <20190527090814.qfjiksqi24x2jrs3@pengutronix.de>
References: <20190527085118.40423-1-yibin.gong@nxp.com>
 <20190527085118.40423-5-yibin.gong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190527085118.40423-5-yibin.gong@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: yibin.gong@nxp.com
Cc: robh@kernel.org, shawnguo@kernel.org, festevam@gmail.com, mark.rutland@arm.com, vkoul@kernel.org, dan.j.williams@intel.com, linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Mon, May 27, 2019 at 04:51:15PM +0800, yibin.gong@nxp.com wrote:
> From: Robin Gong <yibin.gong@nxp.com>
> 
> The next v3 i.mx7ulp edma is based on v1, so change version
> check logic for v2 instead.
> 
> Signed-off-by: Robin Gong <yibin.gong@nxp.com>
> ---
>  drivers/dma/fsl-edma-common.c | 40 ++++++++++++++++++++--------------------
>  1 file changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
> index bb24251..45d70d3 100644
> --- a/drivers/dma/fsl-edma-common.c
> +++ b/drivers/dma/fsl-edma-common.c
> @@ -657,26 +657,26 @@ void fsl_edma_setup_regs(struct fsl_edma_engine *edma)
>  	edma->regs.erql = edma->membase + EDMA_ERQ;
>  	edma->regs.eeil = edma->membase + EDMA_EEI;
>  
> -	edma->regs.serq = edma->membase + ((edma->version == v1) ?
> -			EDMA_SERQ : EDMA64_SERQ);
> -	edma->regs.cerq = edma->membase + ((edma->version == v1) ?
> -			EDMA_CERQ : EDMA64_CERQ);
> -	edma->regs.seei = edma->membase + ((edma->version == v1) ?
> -			EDMA_SEEI : EDMA64_SEEI);
> -	edma->regs.ceei = edma->membase + ((edma->version == v1) ?
> -			EDMA_CEEI : EDMA64_CEEI);
> -	edma->regs.cint = edma->membase + ((edma->version == v1) ?
> -			EDMA_CINT : EDMA64_CINT);
> -	edma->regs.cerr = edma->membase + ((edma->version == v1) ?
> -			EDMA_CERR : EDMA64_CERR);
> -	edma->regs.ssrt = edma->membase + ((edma->version == v1) ?
> -			EDMA_SSRT : EDMA64_SSRT);
> -	edma->regs.cdne = edma->membase + ((edma->version == v1) ?
> -			EDMA_CDNE : EDMA64_CDNE);
> -	edma->regs.intl = edma->membase + ((edma->version == v1) ?
> -			EDMA_INTR : EDMA64_INTL);
> -	edma->regs.errl = edma->membase + ((edma->version == v1) ?
> -			EDMA_ERR : EDMA64_ERRL);
> +	edma->regs.serq = edma->membase + ((edma->version == v2) ?
> +			EDMA64_SERQ : EDMA_SERQ);
> +	edma->regs.cerq = edma->membase + ((edma->version == v2) ?
> +			EDMA64_CERQ : EDMA_CERQ);
> +	edma->regs.seei = edma->membase + ((edma->version == v2) ?
> +			EDMA64_SEEI : EDMA_SEEI);
> +	edma->regs.ceei = edma->membase + ((edma->version == v2) ?
> +			EDMA64_CEEI : EDMA_CEEI);
> +	edma->regs.cint = edma->membase + ((edma->version == v2) ?
> +			EDMA64_CINT : EDMA_CINT);
> +	edma->regs.cerr = edma->membase + ((edma->version == v2) ?
> +			EDMA64_CERR : EDMA_CERR);
> +	edma->regs.ssrt = edma->membase + ((edma->version == v2) ?
> +			EDMA64_SSRT : EDMA_SSRT);
> +	edma->regs.cdne = edma->membase + ((edma->version == v2) ?
> +			EDMA64_CDNE : EDMA_CDNE);
> +	edma->regs.intl = edma->membase + ((edma->version == v2) ?
> +			EDMA64_INTL : EDMA_INTR);
> +	edma->regs.errl = edma->membase + ((edma->version == v2) ?
> +			EDMA64_ERRL : EDMA_ERR);

Following to what I have said to 6/7 you can put the register offsets
into that new struct aswell.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
