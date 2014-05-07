From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 5/6] powerpc/corenet: Add DPAA FMan support to the SoC
 device tree(s)
Date: Wed, 7 May 2014 18:14:02 -0500
Message-ID: <1399504442.15726.353.camel@snotra.buserror.net>
References: <1397823693-27977-1-git-send-email-Shruti@Freescale.com>
	 <1397823693-27977-5-git-send-email-Shruti@Freescale.com>
	 <1398118442.1694.190.camel__272.432543761347$1398129129$gmane$org@snotra.buserror.net>
	 <53661DAB.10808@Freescale.com>
	 <1399332886.15726.161.camel@snotra.buserror.net>
	 <5368811A.3060609@Freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5368811A.3060609-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Cc: Kanetkar Shruti-B44454 <Shruti-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2014-05-06 at 01:28 -0500, Emil Medve wrote:
> Hello Scott,
> 
> 
> On 05/05/2014 06:34 PM, Scott Wood wrote:
> > On Sun, 2014-05-04 at 05:59 -0500, Emil Medve wrote:
> >>  Anyway, most days PHYs can be discovered so they don't use/need
> >> compatible properties. That's I guess part of the reason we don't have
> >> bindings for them PHY nodes
> > 
> > I don't see why there couldn't be a compatible that describes the
> > standard programming interface.
> 
> Because it can be detected at runtime and I guess stuff like that should
> stay out of the device tree. I'm using PCI as an analogy here

But in this case aren't you using a standardized component of the
programming model itself to probe the specific PHY type?  I think a
better analogy is the "cfi-flash" compatible.

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
