From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: Device-tree and Marvell vendor prefix
Date: Fri, 20 Jun 2014 15:53:38 -0400
Message-ID: <20140620195338.GF21711@titan.lakedaemon.net>
References: <8738f0so0m.fsf@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <8738f0so0m.fsf-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 19, 2014 at 09:22:17PM +0200, Robert Jarzmik wrote:
> 
> Hi Haojian, Grant and Rob,
> 
> I'm submitting various patches for Marvell PXA27x architecture to support
> device-tree.
> 
> In a review from Guennadi, he made me a comment that the official prefix for
> Marvell is "marvell" (according to
> Documentation/devicetree/bindings/vendor-prefixes.txt).
> 
> As a matter of fact, there are 2 prefixes used :
>  - "marvell" : 264 uses in *.c files
>  - "mrvl" : 64 uses in *.c files

Yes, that's unfortunate.  When we first started converting the Marvell
legacy platforms (kirwkood, etc) to DT, there was discussion on which
one to use.  We chose to stay with 'marvell', despite 'mrvl' being the
official stock ticker symbol.  This was to maintain reverse
compatibility with the binding for the marvell ethernet driver,
mv643xx_eth, which had been is use on powerpc for years before us.

So, my preference is to use 'marvell'.  I've attempted to correct any
new bindings I see that use 'mrvl', but apparently I didn't catch them
all. :(

> So which one should I use ?

I say 'marvell', but apparently there are others who think differently.

A check of the bindings docs and arch/*/boot/dts/ would be more telling
than the C files.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
