From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 22/41] Documentation: dt: soc: fix spelling mistakes
Date: Mon, 25 Apr 2016 08:51:39 -0500
Message-ID: <20160425135139.GA9501@rob-hp-laptop>
References: <1461543878-3639-1-git-send-email-eric@engestrom.ch>
 <1461543878-3639-23-git-send-email-eric@engestrom.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1461543878-3639-23-git-send-email-eric-op+oiCINJLTt9jDmeYuA0g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Engestrom <eric-op+oiCINJLTt9jDmeYuA0g@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 25, 2016 at 01:24:19AM +0100, Eric Engestrom wrote:
> Signed-off-by: Eric Engestrom <eric-op+oiCINJLTt9jDmeYuA0g@public.gmane.org>

Applied, thanks.

Rob

> ---
>  .../devicetree/bindings/soc/ti/keystone-navigator-qmss.txt          | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/ti/keystone-navigator-qmss.txt b/Documentation/devicetree/bindings/soc/ti/keystone-navigator-qmss.txt
> index d1ce21a..64c66a5 100644
> --- a/Documentation/devicetree/bindings/soc/ti/keystone-navigator-qmss.txt
> +++ b/Documentation/devicetree/bindings/soc/ti/keystone-navigator-qmss.txt
> @@ -42,7 +42,7 @@ Required properties:
>  - queue-pools	: child node classifying the queue ranges into pools.
>  		  Queue ranges are grouped into 3 type of pools:
>  		  - qpend	    : pool of qpend(interruptible) queues
> -		  - general-purpose : pool of general queues, primarly used
> +		  - general-purpose : pool of general queues, primarily used
>  				      as free descriptor queues or the
>  				      transmit DMA queues.
>  		  - accumulator	    : pool of queues on PDSP accumulator channel
> @@ -50,7 +50,7 @@ Required properties:
>    -- qrange		: number of queues to use per queue range, specified as
>  			  <"base queue #" "# of queues">.
>    -- interrupts		: Optional property to specify the interrupt mapping
> -			  for interruptible queues. The driver additionaly sets
> +			  for interruptible queues. The driver additionally sets
>  			  the interrupt affinity hint based on the cpu mask.
>    -- qalloc-by-id	: Optional property to specify that the queues in this
>  			  range can only be allocated by queue id.
> @@ -80,7 +80,7 @@ Required properties:
>  			  latency     : time to delay the interrupt, specified
>  					in microseconds.
>    -- multi-queue	: Optional property to specify that the channel has to
> -			  monitor upto 32 queues starting at the base queue #.
> +			  monitor up to 32 queues starting at the base queue #.
>  - descriptor-regions	: child node describing the memory regions for keystone
>  			  navigator packet DMA descriptors. The memory for
>  			  descriptors will be allocated by the driver.
> -- 
> 2.8.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
