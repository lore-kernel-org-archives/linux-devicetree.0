From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] dmaengine: Add support for the Analog Devices
 AXI-DMAC DMA controller
Date: Thu, 20 Aug 2015 06:29:56 +0530
Message-ID: <20150820005956.GR13546@localhost>
References: <20150819171234.GP13546@localhost>
 <55D4C06A.8070902@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55D4C06A.8070902-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 19, 2015 at 07:44:10PM +0200, Lars-Peter Clausen wrote:
> On 08/19/2015 07:12 PM, Vinod Koul wrote:
> > On Tue, Jul 28, 2015 at 11:38:06AM +0200, Lars-Peter Clausen wrote:
> >>> where is device side programming ?
> >>
> >> in the start_transfer() function.
> > 
> > I must have missed that but still don't see it here, can you point me
> 
> Oh you mean the DMA address for the device? It's a dedicated bus on the
> device side, so there is no address to program on the device side.

Yes but that was not very clear from the patch. Please document that, also
the unidirectional feature of the channels here

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
