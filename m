From: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 4/4] Update device tree Synopsys DW DMAC documentation
Date: Wed, 16 Nov 2016 17:10:42 +0200
Message-ID: <1479309042.24056.40.camel@linux.intel.com>
References: <1479304615-11360-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
         <1479304615-11360-5-git-send-email-Eugeniy.Paltsev@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479304615-11360-5-git-send-email-Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vireshk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2016-11-16 at 16:56 +0300, Eugeniy Paltsev wrote:
>  * Rename is_private to is-private as ordered by DT policy.
>  The change leaves the support for the old format.
> 
>  * Add is-memcpu property, so it is possible to
>  enable memory-to-memory transfers support via DT.
> 
>  * Add hw-llp property, so it is possible to enable
>  hardware multi block transfers support via DT.
> 
>  Fix white spaces.
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/dma/snps-dma.txt | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/snps-dma.txt
> b/Documentation/devicetree/bindings/dma/snps-dma.txt
> index 0f55832..d41d960 100644
> --- a/Documentation/devicetree/bindings/dma/snps-dma.txt
> +++ b/Documentation/devicetree/bindings/dma/snps-dma.txt
> @@ -20,13 +20,19 @@ Required properties:
>  Deprecated properties:
>  - data_width: Maximum data width supported by hardware per AHB master
>    (0 - 8bits, 1 - 16bits, ..., 5 - 256bits)

> +- is_private: The device channels should be marked as private and not
> for by the
> +  general purpose DMA channel allocator. False if not passed.

This...

>  
>  
>  Optional properties:
>  - interrupt-parent: Should be the phandle for the interrupt
> controller
>    that services interrupts for this device

> -- is_private: The device channels should be marked as private and not
> for by the
> +- is-private: The device channels should be marked as private and not
> for by the
>    general purpose DMA channel allocator. False if not passed.

...and this is a part of patch 1.

> +- is-memcpu: The device channels do support memory-to-memory 

memcpy

> transfers. 

> False
> +  if not passed.
> +- hw-llp: Multi block transfers supported by hardware per AHB master.
> +  0 (default): not supported, 1: supported.

Overall, since we are going to expose some properties to the Device Tree
I would really think twice about naming. Better if we reuse something
existing already.

So, what I can see is

dmacap,private
dmacap,memcpy

Here is a selling point as well, i.e. standardization.

'hw-llp' sounds too tricky, perhaps 'multi-block' is better and could be
re-used.

>  
>  Example:
>  
> @@ -56,7 +62,7 @@ The four cells in order are:
>  4. Peripheral master for transfers on allocated channel
>  

>  Example:
> -	
> +

No, no need to touch this.

-- 
Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Intel Finland Oy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
