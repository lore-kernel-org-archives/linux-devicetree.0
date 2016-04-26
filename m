From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/5] dmaengine: mv_xor: make the code 64 bits compliant
Date: Tue, 26 Apr 2016 22:03:19 +0530
Message-ID: <20160426163319.GO2274@localhost>
References: <1460652818-14647-1-git-send-email-gregory.clement@free-electrons.com>
 <1460652818-14647-2-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1460652818-14647-2-git-send-email-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Romain Perier <romain.perier-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Omri Itach <omrii-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Marcin Wojtas <mw-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 14, 2016 at 06:53:34PM +0200, Gregory CLEMENT wrote:
> Fix two warnings which appear when building for 64 bits target.

It is a good practice to post the warnings in log so that people know what
is being fixed

> 
> Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/dma/mv_xor.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
> index 3922a5d56806..a6ec82776cbc 100644
> --- a/drivers/dma/mv_xor.c
> +++ b/drivers/dma/mv_xor.c
> @@ -477,7 +477,7 @@ mv_xor_prep_dma_xor(struct dma_chan *chan, dma_addr_t dest, dma_addr_t *src,
>  	BUG_ON(len > MV_XOR_MAX_BYTE_COUNT);
>  
>  	dev_dbg(mv_chan_to_devp(mv_chan),
> -		"%s src_cnt: %d len: %u dest %pad flags: %ld\n",
> +		"%s src_cnt: %d len: %zu dest %pad flags: %ld\n",
>  		__func__, src_cnt, len, &dest, flags);
>  
>  	sw_desc = mv_chan_alloc_slot(mv_chan);
> @@ -1220,7 +1220,7 @@ static int mv_xor_probe(struct platform_device *pdev)
>  			struct mv_xor_chan *chan;
>  			dma_cap_mask_t cap_mask;
>  			int irq;
> -			op_in_desc = (int)of_id->data;
> +			op_in_desc = (uintptr_t)of_id->data;
>  
>  			if (i >= max_channels)
>  				continue;
> -- 
> 2.5.0
> 

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
