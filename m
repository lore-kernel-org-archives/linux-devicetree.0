From: Stefano Stabellini <stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>
Subject: Re: [PATCH] of: set dma_mask to point to coherent_dma_mask
Date: Wed, 6 Nov 2013 16:46:31 +0000
Message-ID: <alpine.DEB.2.02.1311061642270.26077@kaball.uk.xensource.com>
References: <1383109522-6879-1-git-send-email-robherring2@gmail.com> <20131102180724.D8FC5C40F02@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131102180724.D8FC5C40F02-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, 2 Nov 2013, Grant Likely wrote:
> On Wed, 30 Oct 2013 00:05:22 -0500, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> > 
> > Platform devices created by DT code don't initialize dma_mask pointer to
> > anything. Set it to coherent_dma_mask by default if the architecture
> > code has not set it.
> > 
> > Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> 
> I believe this is okay. I haven't done any testing to back up that
> opinion though.

Tested-by: Stefano Stabellini <stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>

 
> > I think this is at least part of what is needed to fix dma_mask issue
> > raised by Stefano [1]. Things should work AFAICT with just this, but
> > I suppose the xgmac driver needs to set the mask as well (not relying
> > on the default), but some pointing the dma_mask to a valid value is
> > needed first.
> > 
> > Rob
> > 
> > [1] http://www.mail-archive.com/linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg528236.html
> > 
> >  drivers/of/platform.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> > index f6dcde2..fce088e 100644
> > --- a/drivers/of/platform.c
> > +++ b/drivers/of/platform.c
> > @@ -215,6 +215,8 @@ static struct platform_device *of_platform_device_create_pdata(
> >  	dev->archdata.dma_mask = 0xffffffffUL;
> >  #endif
> >  	dev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
> > +	if (!dev->dev.dma_mask)
> > +		dev->dev.dma_mask = &dev->dev.coherent_dma_mask;
> >  	dev->dev.bus = &platform_bus_type;
> >  	dev->dev.platform_data = platform_data;
> >  
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
