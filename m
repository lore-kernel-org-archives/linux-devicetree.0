From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 2/2] xilinx_dma: Add reset support
Date: Fri, 23 Dec 2016 11:26:41 +0100
Message-ID: <1482488801.2394.22.camel@pengutronix.de>
References: <cover.1481735244.git.roliveir@synopsys.com>
         <5658430.jXmKZEXWrS@avalon>
         <380d1b11-814d-0164-3d49-e976f2deb3f9@synopsys.com>
         <4539024.0pO4eXcfb0@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4539024.0pO4eXcfb0@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Ramiro Oliveira <Ramiro.Oliveira-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, appana.durga.rao-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, anuragku-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, CARLOS.PALMINHA-HKixBCOQz3hWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, den 15.12.2016, 15:56 +0200 schrieb Laurent Pinchart:
> Hi Ramiro,
> 
> (CC'ing Philipp Zabel)
> 
> On Thursday 15 Dec 2016 11:26:54 Ramiro Oliveira wrote:
> > On 12/14/2016 8:16 PM, Laurent Pinchart wrote:
> > > Hi Ramiro,
> > > 
> > > Thank you for the patch.
> > > 
> > > On Wednesday 14 Dec 2016 17:18:24 Ramiro Oliveira wrote:
> > >> Add a DT property to control an optional external reset line
> > >> 
> > >> Signed-off-by: Ramiro Oliveira <roliveir-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> > >> ---
> > >> 
> > >>  drivers/dma/xilinx/xilinx_dma.c | 23 +++++++++++++++++++++++
> > >>  1 file changed, 23 insertions(+)
> > >> 
> > >> diff --git a/drivers/dma/xilinx/xilinx_dma.c
> > >> b/drivers/dma/xilinx/xilinx_dma.c index 5c9f11b..b845224 100644
> > >> --- a/drivers/dma/xilinx/xilinx_dma.c
> > >> +++ b/drivers/dma/xilinx/xilinx_dma.c
> > >> @@ -46,6 +46,7 @@
> > >>  #include <linux/slab.h>
> > >>  #include <linux/clk.h>
> > >>  #include <linux/io-64-nonatomic-lo-hi.h>
> > >> +#include <linux/reset.h>
> > > 
> > > I had neatly sorted the header alphabetically until someone added clk.h
> > > and io-64-nonatomic-lo-hi.h :-( Could you please move reset.h just before
> > > slab.h ?
> >
> > Sure. Actually I was tempted to reorder it, but I decided not to do it. I'll
> > do it now
> 
> Yeah, I'll sleep better tonight :-D
> 
> > >>  #include "../dmaengine.h"
> > >> 
> > >> @@ -409,6 +410,7 @@ struct xilinx_dma_device {
> > >>  	struct clk *rxs_clk;
> > >>  	u32 nr_channels;
> > >>  	u32 chan_id;
> > >> +	struct reset_control *rst;
> > >>  };
> > >>  
> > >>  /* Macros */
> > >> @@ -2543,6 +2545,27 @@ static int xilinx_dma_probe(struct platform_device
> > >> *pdev) if (IS_ERR(xdev->regs))
> > >>  		return PTR_ERR(xdev->regs);
> > >> 
> > >> +	xdev->rst = devm_reset_control_get_optional(&pdev->dev, "reset");
> > > 
> > > devm_reset_control_get_optional() is deprecated as explained in
> > > linux/reset.h, you should use devm_reset_control_get_optional_exclusive()
> > > or devm_reset_control_get_optional_shared() instead, as applicable.
> > > 
> > > This being said, I'm wondering why the optional versions of those
> > > functions exist, as they do exactly the same as the non-optional versions.
> > > The API feels wrong, it should have been modelled like the GPIO API. Feel
> > > free to fix it if you want :-) But that's out of scope for this patch.
> > 
> > I missed the comment stating that devm_reset_control_get_optional() was
> > deprecated.
> > 
> > I could fix it. Your sugestion is modelling these functions like the GPIO
> > API?
> 
> I think it would be better for driver if the _get_optional functions would 
> return an ERR_PTR() for errors and NULL when reset control is not available, 
> and then have the rest of the reset controller API accept NULL as a no-op. 
> Your implementation would then be
> 
> 	xdev->rst = devm_reset_control_get_optional_exclusive(&pdev->dev,
> 							      "reset");
> 	if (IS_ERR(xdev->rst)) {
> 		err = PTR_ERR(xdev->rst);
> 		if (err != -EPROBE_DEFER)
> 			dev_err(xdev->dev, "error getting reset %d\n", err);
> 		return err;
> 	}
> 
> 	err = reset_control_deassert(xdev->rst);
> 	if (err) {
> 		dev_err(xdev->dev, "failed to deassert reset: %d\n", err);
> 		return err;
> 	}
> 
> That requires modifying the reset controller API, so it's a bit out-of-scope, 
> but if you could give it a go, it would be great.

Seeing that the clk and gpiod APIs behave in the same way, I think it
would be good to align the reset API with the common behaviour.

regards
Philipp
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
