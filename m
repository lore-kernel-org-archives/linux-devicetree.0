From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 0/3] new Atmel DMA controller
Date: Wed, 19 Nov 2014 16:37:18 +0530
Message-ID: <20141119110718.GC2074@intel.com>
References: <1413991340-11617-1-git-send-email-ludovic.desroches@atmel.com>
 <20141106052748.GR1870@intel.com>
 <546C7903.8090901@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <546C7903.8090901-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 19, 2014 at 12:03:31PM +0100, Nicolas Ferre wrote:
> On 06/11/2014 06:27, Vinod Koul :
> > On Wed, Oct 22, 2014 at 05:22:17PM +0200, Ludovic Desroches wrote:
> >> Hi,
> >>
> >> This set of patches introduces support for the new Atmel DMA controller know as
> >> XDMAC and available on SAMA5D4.
> > 
> > Applied all, thanks
> 
> Vinod,
> 
> I saw that you had created a topic branch for this driver: topic/at_xdmac.
> 
> If this branch is stable, can I use it for my work on at91 support and
> merge it in my at91-3.19-dt branch before sending it to the arm-soc tree?
> In fact I need the binding definitions that are created by the
> patch:(dmaengine: at_xdmac: creation of the atmel eXtended DMA
> Controller driver).
Yup please pull this, this wont be rebased

Thanks

-- 
~Vinod

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
