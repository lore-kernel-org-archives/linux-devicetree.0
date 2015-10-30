From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 2/2] dma: add Qualcomm Technologies HIDMA channel driver
Date: Fri, 30 Oct 2015 23:47:46 +0100
Message-ID: <5126606.XdciyP3Dft@wuerfel>
References: <1446174501-8870-1-git-send-email-okaya@codeaurora.org> <5633E442.3010003@codeaurora.org> <5633E744.6040202@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5633E744.6040202-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 30 October 2015 16:55:16 Timur Tabi wrote:
> 
> On 10/30/2015 04:42 PM, Sinan Kaya wrote:
> >>
> >>     if (WARN_ON(!pdev->dev.dma_mask))
> >>         return -ENXIO;
> >>
> >> The dma mask has to always be set by the platform code before probe()
> >> is called. If it is not set, you are not allowed to perform DMA.
> >
> > I tested this on an ACPI platform BTW when I was working on the initial
> > implementation.
> 
> PowerPC sets the mask to 32 bits by default:
> 
> http://lxr.free-electrons.com/ident?i=arch_setup_pdev_archdata
> 
> Should we do something similar in ARM64?  Today, we have to manually set 
> the DMA mask in all drivers.

We set the dma mask from the 'dma-ranges' property of the parent device,
but fall back to 32-bit because we did not manage to mandate this property
in time for all arm64 machines to use.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
