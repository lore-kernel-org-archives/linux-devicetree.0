From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH v2 10/23] ARM: MM: Add DT binding for Feroceon L2 cache
Date: Tue, 18 Feb 2014 10:31:31 +0100
Message-ID: <20140218093131.GC17984@lunn.ch>
References: <1392459621-24003-1-git-send-email-andrew@lunn.ch>
 <1392459621-24003-11-git-send-email-andrew@lunn.ch>
 <20140217233855.GI7862@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140217233855.GI7862-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

> > +Required properties:
> > +- compatible : Should be either "marvell,ferocean-cache" or
> > +  	       "marvell,kirkwood-cache".
> > +
> > +Optional properties:
> > +- wt-override: If present then L2 is forced to Write through mode
> > +- reg        : Address of the L2 cache control register. Mandatory for
> > +  	       "marvell,kirkwood-cache", not used by "marvell,ferocean-cache"
> 
> s/ferocean/feroceon/

Arg. I thought i had fixed all of those.
 
> If there's nothing else deserving a new series, I'll tweak this (and the
> other spelling nits that matter) when I pull in the series.

This patch needs a major bit of re-working. There will definitely be a
new series.

    Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
