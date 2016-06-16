From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/2] ARM: dts: utilite-pro: add mmc card slot support
Date: Thu, 16 Jun 2016 09:42:32 +0800
Message-ID: <20160616014232.GQ20243@tiger>
References: <20160612232456.1621-1-christopher.spinrath@rwth-aachen.de>
 <c25d8e5d113240c5ab78771f301d901a@rwthex-s1-b.rwth-ad.de>
 <089d827c9de9426eab79a907a2043828@rwthex-s1-a.rwth-ad.de>
 <712bda47d095416f8b69f4eecbf979a5@rwthex-s1-b.rwth-ad.de>
 <575994a0ec924e2db7282a2945d3355f@rwthex-s2-b.rwth-ad.de>
 <2160fa6084b94c839b339a663334ae65@rwthex-s1-b.rwth-ad.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2160fa6084b94c839b339a663334ae65-gtPewvpZjL8umhiu9RXYRl5UTUQ924AY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Cc: Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 15, 2016 at 04:40:26PM +0200, Christopher Spinrath wrote:
> >> Well, my board has revision 1.0. So I cannot test that and feel uneasy
> >> to put my Signed-off-by under such a patch. IMHO the best solution would
> >> be that someone with a revision >= 1.3 board sends a follow-up patch
> >> adding the cd-gpios.

This approach seems reasonable to me, so I just went ahead to apply the
patch, and wait a follow-up patch from someone who can test on 1.3 board.

> >>
> >> If I resend the patch with cd-gpios could you test it and provide a
> >> Tested-By?
> > 
> > Yes. Absolutely.
> > 
> 
> Can we have your opinion on that matter?

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
