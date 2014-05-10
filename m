From: Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH v2] DMA: add a driver for AMBA AXI NBPF DMAC IP cores
Date: Sat, 10 May 2014 15:44:00 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.1405101541230.30489@axis700.grange>
References: <Pine.LNX.4.64.1404261344520.21367@axis700.grange>
 <20140507064453.GJ28638@intel.com> <Pine.LNX.4.64.1405101009220.29796@axis700.grange>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.64.1405101009220.29796-0199iw4Nj15frtckUFj5Ag@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Shevchenko, Andriy" <andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Phil Edworthy <phil.edworthy-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, 10 May 2014, Guennadi Liakhovetski wrote:

[snip]

> > > +	nbpf = devm_kzalloc(dev, sizeof(*nbpf) + num_channels *
> > > +			    sizeof(nbpf->chan[0]), GFP_KERNEL);
> > I think we have devm_kcalloc for these things?
> 
> Ah, ok, missed this, thanks, will update!

Sorry, don't think it's suitable here. The allocation size is "y + x * n" 
and not just "x * n."

Thanks
Guennadi
---
Guennadi Liakhovetski, Ph.D.
Freelance Open-Source Software Developer
http://www.open-technology.de/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
