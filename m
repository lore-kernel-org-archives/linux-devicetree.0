From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/5] dmaengine: dw_dmac: move to generic DMA binding
Date: Tue, 29 Jan 2013 15:28:41 +0000
Message-ID: <201301291528.42176.arnd@arndb.de>
References: <1359395857-1235-1-git-send-email-arnd@arndb.de>
 <201301291331.48427.arnd@arndb.de> <1359467140.31148.41.camel@smile>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1359467140.31148.41.camel@smile>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Vinod Koul <vinod.koul-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, spear-devel <spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 29 January 2013, Andy Shevchenko wrote:
> On Tue, 2013-01-29 at 13:31 +0000, Arnd Bergmann wrote: 
> > On Tuesday 29 January 2013, Viresh Kumar wrote:
> > Ah, good. So I guess the "dma-requests" property should actually
> > be "16" then.
> > 
> > Does this mean that an implicit zero request line means memory?
> 
> No, it doesn't.
> When dma is doing mem2mem transfers the request line field is ignored by
> the hw.

Ok.

> > Could we have device-to-device DMAs with this controller, and if
> > we can, should we have both 'src' and 'dst' fields?
> 
> As far as I know there is no driver under dmaengine that supports
> per2per transfers.

Well, I'm asking because we need to describe the hardware properly,
even if drivers today don't do this does not mean that it is not
possible. We can always change the Linux implementation, but we
cannot as easily change an established DT binding, just like
we don't change user space interfaces.

Of course, if that is a thing we don't expect anyone to do,
we don't have to describe it, or we could make a compatible
extension to the binding later.

> >  Are the
> > two number ranges sharing the same address space, i.e. is
> > request '7' as the destination guaranteed to be the same device
> > as request '7' in the source?
> 
> Request line should be unique. It means a real wire from slave
> hw to the dmac.

Ok, good.

	Arnd
