From: Jayachandran C <jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v6 2/2] arm64: dts: move from ARCH_VULCAN to ARCH_THUNDER2
Date: Wed, 15 Mar 2017 08:15:12 +0000
Message-ID: <20170315081431.GA2415@localhost>
References: <1489313015-4783-1-git-send-email-jnair@caviumnetworks.com>
 <1489495634-2920-1-git-send-email-jnair@caviumnetworks.com>
 <1489495634-2920-3-git-send-email-jnair@caviumnetworks.com>
 <8262c276-c39c-17b6-dcb6-d087d68d3df5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <8262c276-c39c-17b6-dcb6-d087d68d3df5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 14, 2017 at 11:16:47AM -0700, Florian Fainelli wrote:
> On 03/14/2017 05:47 AM, Jayachandran C wrote:
> > Move and update device tree files as part of transition from Broadcom
> > Vulcan to Cavium ThunderX2.
> > 
> > The changes are to:
> >  * rename dts/broadcom/vulcan.dtsi to cavium/thunder2-99xx.dtsi,
> >    update cpu cores to be "cavium,thunder2", and update SoC to be
> >    "cavium,thunderx2-cn9900"
> >  * move SoC dts/broadcom/vulcan-eval.dtsi to cavium/thunder2-99xx.dtsi
> >    and update board name string
> >  * Update dts/broadcom/Makefile not to build vulcan dtbs
> >  * Update dts/cavium/Makefile to build thunder2 dtbs
> > 
> > No changes to the dts contents except the updated "compatible" and
> > "model" properties.
> > 
> > Signed-off-by: Jayachandran C <jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
> > Reviewed-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> Can you also change the relevant entry in the MAINTAINERS file:
> 
> BROADCOM VULCAN ARM64 SOC
> M:      Jayachandran C. <c.jayachandran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> M:      bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
> L:      linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org (moderated for non-subscribers)
> S:      Maintained
> F:      arch/arm64/boot/dts/broadcom/vulcan*

I was planning to remove this entry in the later patchset that removes
ARCH_VULCAN. But, as you suggest, it makes more sense to do that now.

I will post an updated patchset with a new patch to update the entry.
 
> With that fixed:
> 
> Acked-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Thanks,
JC.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
