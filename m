From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 5/5] dmaengine: mediatek: fix zalloc-simple.cocci
 warnings
Date: Tue, 13 Feb 2018 12:16:59 +0530
Message-ID: <20180213064659.GD3666@localhost>
References: <cover.1518110810.git.sean.wang@mediatek.com>
 <ede5702c460a5b4b41186a8cff1e3c29b2380c08.1518110810.git.sean.wang@mediatek.com>
 <20180209125817.GB3666@localhost>
 <alpine.DEB.2.20.1802091555290.2944@hadrien>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.1802091555290.2944@hadrien>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Cc: sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fengguang Wu <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 09, 2018 at 03:55:58PM +0100, Julia Lawall wrote:
> 
> > > -	ring->txd = dma_alloc_coherent(hsdma2dev(hsdma),
> > > -				       pc->sz_ring, &ring->tphys,
> > > -				       GFP_ATOMIC | __GFP_ZERO);
> > > +	ring->txd = dma_zalloc_coherent(hsdma2dev(hsdma), pc->sz_ring,
> > > +					&ring->tphys, GFP_ATOMIC);
> > >  	if (!ring->txd)
> > >  		return -ENOMEM;
> > >
> > > -	memset(ring->txd, 0, pc->sz_ring);
> >
> > This should be folded back..
> 
> Sorry, I'm not sure what you mean by "folded back".

Since the original patch is also up for review in this series, it doesn't
help much to add a change and fix on top in a series. The fix should be
folded back into the original commit. IIRC Fengguang's bot also recommends
so..

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
