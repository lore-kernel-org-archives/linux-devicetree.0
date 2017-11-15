From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] usb: dwc3: Enable the USB snooping
Date: Wed, 15 Nov 2017 10:52:12 +0200
Message-ID: <87ineb9b5v.fsf@linux.intel.com>
References: <20171115060459.45375-1-ran.wang_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171115060459.45375-1-ran.wang_1-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "open list:DESIGNWARE USB3 DRD IP DRIVER" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Changming Huang <jerry.huang-3arQi8VN3Tc@public.gmane.org>, Rajesh Bhagat <rajesh.bhagat-3arQi8VN3Tc@public.gmane.org>, Li Yang <leoyang.li-3arQi8VN3Tc@public.gmane.org>, Ran Wang <ran.wang_1-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


Hi,

Ran Wang <ran.wang_1-3arQi8VN3Tc@public.gmane.org> writes:
> Add support for USB3 snooping by asserting bits
> in register DWC3_GSBUSCFG0 for data and descriptor.

we know *how* to enable a feature :-) It's always the same, you fiddle
with some registers and it works. What you failed to tell us is:

a) WHY do you need this?
b) WHY do we need another DT property for this?
c) WHAT does this mean for PCI devices?

> Signed-off-by: Changming Huang <jerry.huang-3arQi8VN3Tc@public.gmane.org>
> Signed-off-by: Rajesh Bhagat <rajesh.bhagat-3arQi8VN3Tc@public.gmane.org>
> Signed-off-by: Ran Wang <ran.wang_1-3arQi8VN3Tc@public.gmane.org>
> ---
>  drivers/usb/dwc3/core.c | 24 ++++++++++++++++++++++++
>  drivers/usb/dwc3/core.h | 10 ++++++++++
>  2 files changed, 34 insertions(+)
>
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 07832509584f..ffc078ab4a1c 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -236,6 +236,26 @@ static int dwc3_core_soft_reset(struct dwc3 *dwc)
>  	return -ETIMEDOUT;
>  }
>  
> +/*
> + * dwc3_enable_snooping - Enable snooping feature
> + * @dwc3: Pointer to our controller context structure
> + */
> +static void dwc3_enable_snooping(struct dwc3 *dwc)
> +{
> +	u32 cfg;
> +
> +	cfg = dwc3_readl(dwc->regs, DWC3_GSBUSCFG0);
> +	if (dwc->dma_coherent) {
> +		cfg &= ~DWC3_GSBUSCFG0_SNP_MASK;
> +		cfg |= (AXI3_CACHE_TYPE_SNP << DWC3_GSBUSCFG0_DATARD_SHIFT) |
> +			(AXI3_CACHE_TYPE_SNP << DWC3_GSBUSCFG0_DESCRD_SHIFT) |
> +			(AXI3_CACHE_TYPE_SNP << DWC3_GSBUSCFG0_DATAWR_SHIFT) |
> +			(AXI3_CACHE_TYPE_SNP << DWC3_GSBUSCFG0_DESCWR_SHIFT);

This "value << shift" looks super clumsy. I would rather have something
akin to:

	cfg |= DWC3_GSBUSCFG0_DATARD_CACHEABLE |
        	DWC3_GSBUSCFG0_DESCRD_CACHEABLE ...

and so on.

> +	}
> +
> +	dwc3_writel(dwc->regs, DWC3_GSBUSCFG0, cfg);

this will *always* read and write GSBUSCFG0 even for those platforms
which don't need to change anything on this register. You should just
bail out early if !dwc->dma_coherent

Also, I think dma_coherent is likely not the best name for this property.

Another question is: Why wasn't this setup properly during
coreConsultant instantiation of the RTL? Do you have devices on the
market already that need this or is this some early FPGA model or
test-only ASIC?

> @@ -776,6 +796,8 @@ static int dwc3_core_init(struct dwc3 *dwc)
>  	/* Adjust Frame Length */
>  	dwc3_frame_length_adjustment(dwc);
>  
> +	dwc3_enable_snooping(dwc);
> +
>  	usb_phy_set_suspend(dwc->usb2_phy, 0);
>  	usb_phy_set_suspend(dwc->usb3_phy, 0);
>  	ret = phy_power_on(dwc->usb2_generic_phy);
> @@ -1021,6 +1043,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>  				&hird_threshold);
>  	dwc->usb3_lpm_capable = device_property_read_bool(dev,
>  				"snps,usb3_lpm_capable");
> +	dwc->dma_coherent = device_property_read_bool(dev,
> +				"dma-coherent");
>  
>  	dwc->disable_scramble_quirk = device_property_read_bool(dev,
>  				"snps,disable_scramble_quirk");
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 4a4a4c98508c..6e6a66650e53 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -153,6 +153,14 @@
>  
>  /* Bit fields */
>  
> +/* Global SoC Bus Configuration Register 0 */
> +#define AXI3_CACHE_TYPE_SNP		0x2 /* cacheable */
> +#define DWC3_GSBUSCFG0_DATARD_SHIFT	28
> +#define DWC3_GSBUSCFG0_DESCRD_SHIFT	24
> +#define DWC3_GSBUSCFG0_DATAWR_SHIFT	20
> +#define DWC3_GSBUSCFG0_DESCWR_SHIFT	16
> +#define DWC3_GSBUSCFG0_SNP_MASK		0xffff0000



> +
>  /* Global Debug Queue/FIFO Space Available Register */
>  #define DWC3_GDBGFIFOSPACE_NUM(n)	((n) & 0x1f)
>  #define DWC3_GDBGFIFOSPACE_TYPE(n)	(((n) << 5) & 0x1e0)
> @@ -859,6 +867,7 @@ struct dwc3_scratchpad_array {
>   * 	3	- Reserved
>   * @imod_interval: set the interrupt moderation interval in 250ns
>   *                 increments or 0 to disable.
> + * @dma_coherent: set if enable dma-coherent.

you're not enabling dma coherency, you're enabling cache snooping. And
this property should describe that. Also, keep in mind that different
devices may want different cache types for each of those fields, so your
property would have to be a lot more complex. Something like:

	snps,cache-type = <foobar "cacheable">, <baz "cacheable">, ...

Then driver would have to parse this properly to setup GSBUSCFG0. In any
case, I still want to know why do you really need this? What's the
reason? What happens if you don't fix GSBUSCFG0? What's the value you
have there by default? Why isn't that default good enough?

ps: since you're fiddling with DT, you should also include
devicetree@vger

-- 
balbi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
