From: Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH v4 2/2] dmaengine: add a driver for AMBA AXI NBPF DMAC
 IP cores
Date: Wed, 30 Jul 2014 23:23:36 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.1407302319460.21427@axis700.grange>
References: <Pine.LNX.4.64.1407191239400.3062@axis700.grange>
 <Pine.LNX.4.64.1407191243360.3062@axis700.grange> <20140725141621.GT8181@intel.com>
 <Pine.LNX.4.64.1407251635070.13523@axis700.grange> <20140725163417.GV8181@intel.com>
 <Pine.LNX.4.64.1407262105150.24257@axis700.grange> <20140728142510.GF8181@intel.com>
 <Pine.LNX.4.64.1407281634150.32592@axis700.grange>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.64.1407281634150.32592-0199iw4Nj15frtckUFj5Ag@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Shevchenko, Andriy" <andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Phil Edworthy <phil.edworthy-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Vinod,

On Mon, 28 Jul 2014, Guennadi Liakhovetski wrote:

> > Looking at the code again, I think we need to free irq (you can call
> > devm_free_irq()) and call syncronize_irq so that anything pending is
> > flushed.  So if you can send follow up patch doing these in .remove, we can
> > merge these
> 
> This is a nice offer, thanks! But to accept it I'd like to understand: why 
> do you think we need that? In my previous email I presented to you a 
> theoretical and improbable race situation, that I can foresee. You erased 
> it in your reply, but it was dealing with the 
> .device_free_chan_resources() method, so, your suspected race is a 
> different one. Could you please explain to me, why do you think interrupts 
> are possible during .release()? Aren't all channels guaranteed to have 
> been freed by that time?

It would be great to get an explanation for your comment, please? How can 
interrupts come after all channels have been freed? Or how can .release() 
be called while some channels are still in use?

Thanks
Guennadi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
