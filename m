Return-Path: <devicetree-owner@vger.kernel.org>
Received: from tx2ehsobe005.messaging.microsoft.com ([65.55.88.15]:31925 "EHLO
	tx2outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753329Ab3GXTds convert rfc822-to-8bit
	(ORCPT <rfc822;devicetree@vger.kernel.org>);
	Wed, 24 Jul 2013 15:33:48 -0400
Date: Wed, 24 Jul 2013 14:33:31 -0500
From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH v5 4/4] DMA: Freescale: eliminate a compiling warning
References: <1374646870-5162-1-git-send-email-hongbo.zhang@freescale.com>
	<1374646870-5162-5-git-send-email-hongbo.zhang@freescale.com>
In-Reply-To: <1374646870-5162-5-git-send-email-hongbo.zhang@freescale.com>
	(from hongbo.zhang@freescale.com on Wed Jul 24 01:21:09 2013)
Message-ID: <1374694411.15592.63@snotra>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; delsp=Yes; format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
Sender: devicetree-owner@vger.kernel.org
To: hongbo.zhang@freescale.com
Cc: vinod.koul@intel.com, djbw@fb.com, leoli@freescale.com, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 07/24/2013 01:21:09 AM, hongbo.zhang@freescale.com wrote:
> From: Hongbo Zhang <hongbo.zhang@freescale.com>
> 
> The variable cookie is initialized in a list_for_each_entry loop,  
> if(unlikely)
> the list is empty, this variable will be used uninitialized, so we  
> get a gcc
> compiling warning about this. This patch fixes this defect by setting  
> an
> initial value to the varialble cookie.
> 
> Signed-off-by: Hongbo Zhang <hongbo.zhang@freescale.com>
> ---
>  drivers/dma/fsldma.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
> index 16a9a48..14d68a4 100644
> --- a/drivers/dma/fsldma.c
> +++ b/drivers/dma/fsldma.c
> @@ -406,7 +406,7 @@ static dma_cookie_t fsl_dma_tx_submit(struct  
> dma_async_tx_descriptor *tx)
>  	struct fsl_desc_sw *desc = tx_to_fsl_desc(tx);
>  	struct fsl_desc_sw *child;
>  	unsigned long flags;
> -	dma_cookie_t cookie;
> +	dma_cookie_t cookie = 0;
> 
>  	spin_lock_irqsave(&chan->desc_lock, flags);

This patch is unrelated to the rest of the patch series...

What are the semantics of this function if there are multiple entries  
in the list?  Returning the last cookie seems a bit odd.

Is zero the proper error value?  include/linux/dmaengine.h suggests  
that cookies should be < 0 to indicate error.

-Scott
