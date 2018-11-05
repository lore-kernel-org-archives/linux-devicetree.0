Return-Path: <SRS0=UXaX=NQ=linux.intel.com=andriy.shevchenko@kernel.org>
Date: Mon, 5 Nov 2018 16:22:54 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 2/2] dmaengine: dw: implement per-channel protection
 control setting
Message-ID: <20181105142254.GG10650@smile.fi.intel.com>
References: <6b18bcf33d6473c166b607a5fa31ba63727cf6bb.1541350844.git.chunkeey@gmail.com>
 <19ee8f8992a364d826680ee86f3a965c395a672d.1541350844.git.chunkeey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19ee8f8992a364d826680ee86f3a965c395a672d.1541350844.git.chunkeey@gmail.com>
To: Christian Lamparter <chunkeey@gmail.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Thanks for the patch, my comments below.

On Sun, Nov 04, 2018 at 06:01:39PM +0100, Christian Lamparter wrote:
> This patch adds a new device-tree property that allows to
> specify the protection control bits for each DMA channel
> individually.
> 
> Setting the "correct" bits can have a huge impact on the
> PPC460EX and APM82181 that use this DMA engine in combination
> with a DesignWare' SATA-II core (sata_dwc_460ex driver).
> 
> In the OpenWrt Forum, the user takimata reported that:
> |<https://forum.lede-project.org/t/wd-mybook-live-duo-two-disks/16195/55>

You may use BugLink: tag at the end of commit message.

> |It seems your patch unleashed the full power of the SATA port.
> |Where I was previously hitting a really hard limit at around
> |82 MB/s for reading and 27 MB/s for writing, I am now getting this:
> |
> |root@OpenWrt:/mnt# time dd if=/dev/zero of=tempfile bs=1M count=1024
> |1024+0 records in
> |1024+0 records out
> |real    0m 13.65s
> |user    0m 0.01s
> |sys     0m 11.89s
> |
> |root@OpenWrt:/mnt# time dd if=tempfile of=/dev/null bs=1M count=1024
> |1024+0 records in
> |1024+0 records out
> |real    0m 8.41s
> |user    0m 0.01s
> |sys     0m 4.70s
> |
> |This means: 121 MB/s reading and 75 MB/s writing!
> |
> |The drive is a WD Green WD10EARX taken from an older MBL Single.
> |I repeated the test a few times with even larger files to rule out
> |any caching, I'm still seeing the same great performance. OpenWrt is
> |now completely on par with the original MBL firmware's performance.
> 
> Another user And.short reported in the same thread:
> |<https://forum.openwrt.org/t/solved-wd-mybook-live-duo-two-disks/16195/50>

Another BugLink: tag entry :-)

> |I can report that your fix worked! Boots up fine with two
> |drives even with more partitions, and no more reboot on
> |concurrent disk access!
> 
> A closer look into the sata_dwc_460ex code revealed that
> the driver did initally set the correct protection control
> bits. 

> However, this feature was lost when the sata_dwc_460ex
> driver was converted to the generic DMA driver framework with:
> 8b3444852a2 ("sata_dwc_460ex: move to generic DMA driver").

Fixes: tag.

> 
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> ---
>  drivers/dma/dw/core.c                |  3 +++
>  drivers/dma/dw/platform.c            | 12 +++++++++---
>  drivers/dma/dw/regs.h                |  4 ++++
>  include/linux/platform_data/dma-dw.h |  6 ++++++
>  4 files changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
> index f43e6dafe446..2db15e9b33a8 100644
> --- a/drivers/dma/dw/core.c
> +++ b/drivers/dma/dw/core.c
> @@ -160,12 +160,15 @@ static void dwc_initialize_chan_idma32(struct dw_dma_chan *dwc)
>  
>  static void dwc_initialize_chan_dw(struct dw_dma_chan *dwc)
>  {
> +	struct dw_dma *dw = to_dw_dma(dwc->chan.device);
> +	size_t chanidx = (size_t)(dwc - dw->chan);

We have mask field, so, index is a first set bit out of mask, __ffs(mask).

	unsigned int protctl = dw->pdata->protctl[__ffs(mask)];


>  	u32 cfghi = DWC_CFGH_FIFO_MODE;
>  	u32 cfglo = DWC_CFGL_CH_PRIOR(dwc->priority);
>  	bool hs_polarity = dwc->dws.hs_polarity;
>  
>  	cfghi |= DWC_CFGH_DST_PER(dwc->dws.dst_id);
>  	cfghi |= DWC_CFGH_SRC_PER(dwc->dws.src_id);
> +	cfghi |= DWC_CFGH_PROTCTL(dw->pdata->protctl[chanidx]);
>  
>  	/* Set polarity of handshake interface */
>  	cfglo |= hs_polarity ? DWC_CFGL_HS_DST_POL | DWC_CFGL_HS_SRC_POL : 0;
> diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
> index f62dd0944908..078cca6576c3 100644
> --- a/drivers/dma/dw/platform.c
> +++ b/drivers/dma/dw/platform.c
> @@ -102,7 +102,7 @@ dw_dma_parse_dt(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
>  	struct dw_dma_platform_data *pdata;
> -	u32 tmp, arr[DW_DMA_MAX_NR_MASTERS], mb[DW_DMA_MAX_NR_CHANNELS];
> +	u32 tmp, arr[DW_DMA_MAX_NR_MASTERS], val[DW_DMA_MAX_NR_CHANNELS];
>  	u32 nr_masters;
>  	u32 nr_channels;
>  
> @@ -154,14 +154,20 @@ dw_dma_parse_dt(struct platform_device *pdev)
>  			pdata->data_width[tmp] = BIT(arr[tmp] & 0x07);
>  	}
>  
> -	if (!of_property_read_u32_array(np, "multi-block", mb, nr_channels)) {
> +	if (!of_property_read_u32_array(np, "multi-block", val, nr_channels)) {
>  		for (tmp = 0; tmp < nr_channels; tmp++)
> -			pdata->multi_block[tmp] = mb[tmp];
> +			pdata->multi_block[tmp] = val[tmp];
>  	} else {
>  		for (tmp = 0; tmp < nr_channels; tmp++)
>  			pdata->multi_block[tmp] = 1;
>  	}
>  
> +	if (!of_property_read_u32_array(np, "snps,dma-protection-control",
> +					val, nr_channels)) {
> +		for (tmp = 0; tmp < nr_channels; tmp++)
> +			pdata->protctl[tmp] = val[tmp];
> +	}
> +
>  	return pdata;
>  }
>  #else
> diff --git a/drivers/dma/dw/regs.h b/drivers/dma/dw/regs.h
> index 09e7dfdbb790..646c9c960c07 100644
> --- a/drivers/dma/dw/regs.h
> +++ b/drivers/dma/dw/regs.h
> @@ -200,6 +200,10 @@ enum dw_dma_msize {
>  #define DWC_CFGH_FCMODE		(1 << 0)
>  #define DWC_CFGH_FIFO_MODE	(1 << 1)
>  #define DWC_CFGH_PROTCTL(x)	((x) << 2)

> +#define DWC_CFGH_PROTCTL_DATA	(0 << 2)	/* data access - always set */
> +#define DWC_CFGH_PROTCTL_PRIV	(1 << 2)	/* privileged -> AHB HPROT[1] */
> +#define DWC_CFGH_PROTCTL_BUFFER	(2 << 2)	/* bufferable -> AHB HPROT[2] */
> +#define DWC_CFGH_PROTCTL_CACHE	(4 << 2)	/* cacheable  -> AHB HPROT[3] */

>  #define DWC_CFGH_DS_UPD_EN	(1 << 5)
>  #define DWC_CFGH_SS_UPD_EN	(1 << 6)
>  #define DWC_CFGH_SRC_PER(x)	((x) << 7)
> diff --git a/include/linux/platform_data/dma-dw.h b/include/linux/platform_data/dma-dw.h
> index 896cb71a382c..df65e3311a56 100644
> --- a/include/linux/platform_data/dma-dw.h
> +++ b/include/linux/platform_data/dma-dw.h
> @@ -49,6 +49,7 @@ struct dw_dma_slave {
>   * @data_width: Maximum data width supported by hardware per AHB master
>   *		(in bytes, power of 2)
>   * @multi_block: Multi block transfers supported by hardware per channel.
> + * @protctl:	Protection control signals setting per channel.
>   */
>  struct dw_dma_platform_data {
>  	unsigned int	nr_channels;
> @@ -65,6 +66,11 @@ struct dw_dma_platform_data {
>  	unsigned char	nr_masters;
>  	unsigned char	data_width[DW_DMA_MAX_NR_MASTERS];
>  	unsigned char	multi_block[DW_DMA_MAX_NR_CHANNELS];
> +#define CHAN_PROTCTL_PRIVILEGED		BIT(0)
> +#define CHAN_PROTCTL_BUFFERABLE		BIT(1)
> +#define CHAN_PROTCTL_CACHEABLE		BIT(2)

> +#define	CHAN_PROTCTL_MASK		0x7

GENMASK()

> +	unsigned char	protctl[DW_DMA_MAX_NR_CHANNELS];
>  };
>  
>  #endif /* _PLATFORM_DATA_DMA_DW_H */
> -- 
> 2.19.1
> 

-- 
With Best Regards,
Andy Shevchenko
