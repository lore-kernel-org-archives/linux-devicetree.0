From: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH RFC v6 4/5] dma: mpc512x: register for device tree
 channel lookup
Date: Thu, 26 Dec 2013 13:48:28 +0100
Message-ID: <20131226124828.GK8064@book.gsilab.sittig.org>
References: <1387886789-20249-1-git-send-email-a13xp0p0v88@gmail.com>
 <1387886789-20249-5-git-send-email-a13xp0p0v88@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1387886789-20249-5-git-send-email-a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

[ dropping devicetree, we're DMA specific here ]

On Tue, Dec 24, 2013 at 16:06 +0400, Alexander Popov wrote:
> 
> --- a/drivers/dma/mpc512x_dma.c
> +++ b/drivers/dma/mpc512x_dma.c
> [ ... ]
> @@ -950,6 +951,7 @@ static int mpc_dma_probe(struct platform_device *op)
>  	INIT_LIST_HEAD(&dma->channels);
>  	dma_cap_set(DMA_MEMCPY, dma->cap_mask);
>  	dma_cap_set(DMA_SLAVE, dma->cap_mask);
> +	dma_cap_set(DMA_PRIVATE, dma->cap_mask);
>  
>  	for (i = 0; i < dma->chancnt; i++) {
>  		mchan = &mdma->channels[i];

What are the implications of this?  Is a comment due?

I haven't found documentation about the DMA_PRIVATE flag, only
saw commit 59b5ec21446b9 "dmaengine: introduce
dma_request_channel and private channels".  Alex, unless I'm
missing something this one-line change is quite a change in
semantics, and has dramatic influence on the code's behaviour
(ignores the DMA controller when looking for channels that can do
mem-to-mem transfers).

Please reason about this change some more, and explain what it
does and why it's needed.  Consider the fact that this driver
handles both MPC5121 as well as MPC8308 hardware.


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office-ynQEQJNshbs@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
