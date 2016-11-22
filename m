From: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
Subject: Re: fsldma: t4240qds: drop "SG" CAP for DMA3
Date: Tue, 22 Nov 2016 01:25:41 -0600
Message-ID: <20161122072541.GA10135@home.buserror.net>
References: <1479703969-15413-1-git-send-email-yanjiang.jin@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1479703969-15413-1-git-send-email-yanjiang.jin-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: yanjiang.jin-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org, zw-aYo+Mbtxn2uXDw4h08c5KA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jinyanjiang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, yao.yuan-3arQi8VN3Tc@public.gmane.org, hongbo.zhang-3arQi8VN3Tc@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 21, 2016 at 12:52:49PM +0800, yanjiang.jin-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org wrote:
> From: Yanjiang Jin <yanjiang.jin-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
> 
> T4240QDS DMA controller uses the external DMA control signals to start or
> restart a paused DMA transfer, acknowledge a DMA transfer in progress and
> also indicates a transfer completion.
> "scatterlist copy" depends on these signals.

How specifically does sg depend on these signals?

What about chips other than t4240?

> But as "T4240 Reference Manual" shown:
> "The external DMA control signals are available on DMA1 and DMA2. They are
>  not supported by DMA3."
> 
> So add an of_node property "fsl,external-dma-control-signals" to only DMA1
> and DMA2, it can prevent DMA3 from doing DMA_SG operations. Else we would
> get the below errors during doing dmatest:
> 
> modprobe dmatest run=1 iterations=42
> 
> dmatest: Started 1 threads using dma2chan0
> fsl-elo-dma ffe102300.dma: chan0: Transfer Error!
> fsl-elo-dma ffe102300.dma: chan0: irq: unhandled sr 0x00000080
> dmatest: dma2chan0-sg0: dstbuf[0x3954] not copied! Expected d8, got 2b
> ........................
> dmatest: dma2chan7-sg0: dstbuf[0x1c51] not copied! Expected df, got 2e
> dmatest: dma2chan7-sg0: 1301 errors suppressed
> dmatest: dma2chan7-sg0: result #42: 'data error' with
> src_off=0xf21 dst_off=0x1c32 len=0x535 (1333)
> dmatest: dma2chan7-sg0: summary 42 tests, 42 failures 2952 iops 23968 KB/s
> 
> Signed-off-by: Yanjiang Jin <yanjiang.jin-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
> ---
>  arch/powerpc/boot/dts/fsl/t4240si-post.dtsi |  6 ++++++
>  drivers/dma/fsldma.c                        | 11 +++++++++--
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/boot/dts/fsl/t4240si-post.dtsi b/arch/powerpc/boot/dts/fsl/t4240si-post.dtsi
> index 68c4ead..155997d 100644
> --- a/arch/powerpc/boot/dts/fsl/t4240si-post.dtsi
> +++ b/arch/powerpc/boot/dts/fsl/t4240si-post.dtsi
> @@ -1029,7 +1029,13 @@
>  	};
>  
>  /include/ "elo3-dma-0.dtsi"
> +	dma@100300 {
> +		fsl,external-dma-control-signals;
> +	};
>  /include/ "elo3-dma-1.dtsi"
> +	dma@101300 {
> +		fsl,external-dma-control-signals;
> +	};
>  /include/ "elo3-dma-2.dtsi"
>  
>  /include/ "qoriq-espi-0.dtsi"

Where is the binding for this property?

> diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c

The device tree update should be a separate patch from the driver, as
they would likely be merged via different trees.

> index 51c75bf..f7054f4 100644
> --- a/drivers/dma/fsldma.c
> +++ b/drivers/dma/fsldma.c
> @@ -1354,12 +1354,19 @@ static int fsldma_of_probe(struct platform_device *op)
>  	fdev->irq = irq_of_parse_and_map(op->dev.of_node, 0);
>  
>  	dma_cap_set(DMA_MEMCPY, fdev->common.cap_mask);
> -	dma_cap_set(DMA_SG, fdev->common.cap_mask);
> +
>  	dma_cap_set(DMA_SLAVE, fdev->common.cap_mask);
> +
> +	if (of_get_property(op->dev.of_node,
> +		"fsl,external-dma-control-signals", NULL)) {
> +		dma_cap_set(DMA_SG, fdev->common.cap_mask);
> +		fdev->common.device_prep_dma_sg = fsl_dma_prep_sg;
> +	} else
> +		dma_cap_clear(DMA_SG, fdev->common.cap_mask);

This indentation is not very readable (continuation line aligned with
if-body).

How about:

	if (of_property_read_bool(op->dev.of_node,
				  "fsl,external-dma-control-signals")) {
		dma_cap_set(...);
		...
	} else {
		dma_cap_clear(...);
	}

Shortening the property name would also help (e.g. "fsl,dma-ext-ctrl").

I assume nothing bad will happen (other than performance loss) if the
updated driver is used with an existing device tree, and thus none of the
channels get DMA_SG?

Is there any need to explicitly clear the capablitity in the else path? 
Wouldn't it be clear by default?

-Scott
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
