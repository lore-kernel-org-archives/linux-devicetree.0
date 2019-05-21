From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 3/4] dmaengine: fsl-edma: support little endian for edma
 driver
Date: Tue, 21 May 2019 10:08:07 +0530
Message-ID: <20190521043807.GN15118@vkoul-mobl>
References: <20190506090344.37784-1-peng.ma@nxp.com>
 <20190506090344.37784-3-peng.ma@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190506090344.37784-3-peng.ma@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peng Ma <peng.ma@nxp.com>
Cc: robh+dt@kernel.org, shawnguo@kernel.org, mark.rutland@arm.com, leoyang.li@nxp.com, dan.j.williams@intel.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 06-05-19, 09:03, Peng Ma wrote:
> improve edma driver to support little endian.

Can you explain a bit more how adding the below lines adds little endian
support...

> 
> Signed-off-by: Peng Ma <peng.ma@nxp.com>
> ---
>  drivers/dma/fsl-edma-common.c |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
> index 680b2a0..6bf238e 100644
> --- a/drivers/dma/fsl-edma-common.c
> +++ b/drivers/dma/fsl-edma-common.c
> @@ -83,9 +83,14 @@ void fsl_edma_chan_mux(struct fsl_edma_chan *fsl_chan,
>  	u32 ch = fsl_chan->vchan.chan.chan_id;
>  	void __iomem *muxaddr;
>  	unsigned int chans_per_mux, ch_off;
> +	int endian_diff[4] = {3, 1, -1, -3};
>  
>  	chans_per_mux = fsl_chan->edma->n_chans / DMAMUX_NR;
>  	ch_off = fsl_chan->vchan.chan.chan_id % chans_per_mux;
> +
> +	if (!fsl_chan->edma->big_endian)
> +		ch_off += endian_diff[ch_off % 4];
> +
>  	muxaddr = fsl_chan->edma->muxbase[ch / chans_per_mux];
>  	slot = EDMAMUX_CHCFG_SOURCE(slot);
>  
> -- 
> 1.7.1

-- 
~Vinod
