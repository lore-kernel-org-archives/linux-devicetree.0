From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] of: amba: use of_dma_configure for AMBA devices
Date: Fri, 26 Sep 2014 00:36:51 +0200
Message-ID: <201409260036.51545.arnd@arndb.de>
References: <90bd1ff3c93b827c12e1b3dc9ad3f227632d0f6e.1410954967.git.robin.murphy@arm.com> <20140918125535.GB17701@e104818-lin.cambridge.arm.com> <20140922105515.GI30085@e104818-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140922105515.GI30085-M2fw3Uu6cmfZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Cc: Robin Murphy <Robin.Murphy-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Salter <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 22 September 2014, Catalin Marinas wrote:
> On Thu, Sep 18, 2014 at 01:55:36PM +0100, Catalin Marinas wrote:
> > On Thu, Sep 18, 2014 at 12:35:32PM +0100, Robin Murphy wrote:
> > > On 17/09/14 19:05, Will Deacon wrote:
> > > > On Wed, Sep 17, 2014 at 06:47:19PM +0100, Rob Herring wrote:
> > > >> On Wed, Sep 17, 2014 at 12:03 PM, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org> wrote:
> > > >>> On Wed, Sep 17, 2014 at 12:56:07PM +0100, Robin Murphy wrote:
> > > >>>> Commit 591c1e ("of: configure the platform device dma parameters)
> > > >>>> introduced a common mechanism to configure DMA from DT properties.
> > > >>>> AMBA devices created from DT can take advantage of this, too.
> > > >>>>
> > > >>>> Signed-off-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
> > > >>>
> > > >>>    Acked-by: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
> > > >>>
> > > >>> It would be great if the arm-soc guys can pick this up.
> > > >>
> > > >> Is this a dependency for something else? If so,
> > > >>
> > > >> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > > >
> > > > Yeah, it's going to be needed by my IOMMU init rework so that AMBA devices
> > > > get registered with their IOMMUs.
> > > 
> > > Noob question: Does that mean I should resend (with ACKs) to 
> > > arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org? (I wasn't entirely sure where this should go, hence just 
> > > throwing at the list with CCs)
> > 
> > If it is not part of a larger series you want to merge, Rob could pick
> > it up (he could add the acks as well).
> > 
> > Alternatively, I can get it via the arm64 tree together with an
> > additional patch removing the bus hooks in dma-mapping.c (maybe that's a
> > better option if no-one objects).
> 
> So I plan to take this patch via the arm64 tree together with the patch
> below (after some more testing):

Sounds good to me. If you haven't already done so, please add

Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>


	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
