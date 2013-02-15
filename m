From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/5] dmaengine: dw_dmac: move to generic DMA binding
Date: Fri, 15 Feb 2013 11:17:42 +0000
Message-ID: <201302151117.43187.arnd@arndb.de>
References: <1359395857-1235-1-git-send-email-arnd@arndb.de>
 <1359410300-26113-2-git-send-email-arnd@arndb.de>
 <1360918222.28241.20.camel@smile>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1360918222.28241.20.camel@smile>
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
Cc: Vinod Koul <vinod.koul-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 15 February 2013, Andy Shevchenko wrote:
> Have one question and one comment.
> 
> So, what is the status of this work? Do you manage to provide something
> for v3.9? (Oh, two questions :-) )

I was going to bring it up today myself. Unfortunately the patches have
never been tested on real hardware and I have not posted a version that
includes the feedback I got, so I don't think it's a good idea to
use this in v3.9. However, not doing it causes problems since Vinod's
dma-slave tree still contains Viresh's earlier patches, causing
a few problems:

* With these patches, the spear3xx platform currently does not build.
  (this one is easy to fix though)
* There is a conflict between these patches and my spear multiplatform
  series, which I have not yet queued up for 3.9 because of this,
  since that would have meant that Stephen Rothwell would have to
  discard either the arm-soc tree or the dma-slave tree from linux-next.
* I really don't want the broken binding to appear in 3.9.

I believe the best way out at this point is that I do an updated
version of my patch, and Vinod first reverts the patch f9965aa20
"ARM: SPEAr13xx: Pass DW DMAC platform data from DT" in his tree
and then applies my update. This will give us the right DT binding
for dw-dmac but no in-tree users, which means that nothing breaks
if I get it wrong.

I can then decide with Olof whether or not to take the spear multiplatform
changes that no longer conflict with the dma slave tree as a "late"
branch into 3.9 or wait until 3.10, but that is something you don't
need to worry about then. Also the conversion of spear to use
the new binding (patch 5 of this series) can go through the arm-soc
tree for 3.10 after the ST folks have tested that it works.

> > --- a/drivers/dma/dw_dmac.c
> > +++ b/drivers/dma/dw_dmac.c
> 
> > @@ -1765,7 +1753,11 @@ static int dw_probe(struct platform_device *pdev)
> >  
> >       dma_async_device_register(&dw->dma);
> >  
> > -     return 0;
> > +     err = of_dma_controller_register(pdev->dev.of_node, dw_dma_xlate, dw);
> > +     if (err)
> > +             dma_async_device_unregister(&dw->dma);
> 
> I don't think this is a good idea. The impossibility to register in the
> of-dma helper is not critical. Just printing debug message is enough.

Ok, makes sense. Thanks!

	Arnd
