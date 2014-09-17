From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] of: amba: use of_dma_configure for AMBA devices
Date: Wed, 17 Sep 2014 19:05:25 +0100
Message-ID: <20140917180524.GG18532@arm.com>
References: <90bd1ff3c93b827c12e1b3dc9ad3f227632d0f6e.1410954967.git.robin.murphy@arm.com>
 <20140917170338.GC18532@arm.com>
 <CAL_JsqKTZyPgbxy=pPmFPKRxa97oaWqC6u6pBvqvja_URLno4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKTZyPgbxy=pPmFPKRxa97oaWqC6u6pBvqvja_URLno4Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Robin Murphy <Robin.Murphy-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 17, 2014 at 06:47:19PM +0100, Rob Herring wrote:
> On Wed, Sep 17, 2014 at 12:03 PM, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org> wrote:
> > On Wed, Sep 17, 2014 at 12:56:07PM +0100, Robin Murphy wrote:
> >> Commit 591c1e ("of: configure the platform device dma parameters)
> >> introduced a common mechanism to configure DMA from DT properties.
> >> AMBA devices created from DT can take advantage of this, too.
> >>
> >> Signed-off-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
> >
> >   Acked-by: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
> >
> > It would be great if the arm-soc guys can pick this up.
> 
> Is this a dependency for something else? If so,
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Yeah, it's going to be needed by my IOMMU init rework so that AMBA devices
get registered with their IOMMUs.

Will
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
