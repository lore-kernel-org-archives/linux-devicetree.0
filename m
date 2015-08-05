From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 2/2] doc: dt: add documentation for nxp,lpc1788-rtc
Date: Wed, 5 Aug 2015 10:50:44 +0200
Message-ID: <20150805085044.GC3486@piout.net>
References: <1436635730-15617-1-git-send-email-manabian@gmail.com>
 <1436635730-15617-3-git-send-email-manabian@gmail.com>
 <20150727133720.GA15004@beef>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150727133720.GA15004@beef>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, joshc-acOepvfBmUk@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 27/07/2015 at 09:37:20 -0400, Matt Porter wrote :
> > +Required properties:
> > +- compatible	: must contain "nxp,lpc1788-rtc"
> > +- reg		: Specifies base physical address and size of the registers.
> > +- interrupts	: A single interrupt specifier.
> > +- clocks	: Must contain entries for rtc and register clock
> 
> "Must contain clock specifiers for rtc and register clock" ?
> 

I fixed it up in the patch.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
