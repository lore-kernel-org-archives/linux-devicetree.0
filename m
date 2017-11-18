From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: iio: at91-sama5d2_adc: add optional
 dma property
Date: Sat, 18 Nov 2017 16:07:12 +0000
Message-ID: <20171118160712.36414451@archlinux>
References: <1510750608-8697-1-git-send-email-eugen.hristev@microchip.com>
        <1510750608-8697-2-git-send-email-eugen.hristev@microchip.com>
        <20171115152746.w4giwt7kdqm4i3yl@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171115152746.w4giwt7kdqm4i3yl@rob-hp-laptop>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Eugen Hristev <eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 15 Nov 2017 09:27:46 -0600
Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> On Wed, Nov 15, 2017 at 02:56:45PM +0200, Eugen Hristev wrote:
> > Added property for DMA configuration of the device.
> > 
> > Signed-off-by: Eugen Hristev <eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> > ---
> >  Changes in v3:
> > None, but we discussed on the ML about whether we should have "dma-names"
> > present in the binding even if it's only one.
> > The helpers in the kernel to retrieve the channel info rely on the
> > presence of this property, so I am resending the patch based on this.
> > If another solution is better, please advise and I can try it and
> > resend the patch.  
> 
> Really the kernel APIs should accept a NULL name and return the DMA 
> channel when there is only one. This is how the clk_get API works for 
> example.
> 
> >  Documentation/devicetree/bindings/iio/adc/at91-sama5d2_adc.txt | 7 +++++++
> >  1 file changed, 7 insertions(+)  
> 
> In any case, not really a big deal.
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Applied to the togreg branch of iio.git and pushed out as testing.

Thanks,

Jonathan
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
