From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 2/3] nvmem: imx-ocotp: Add i.MX6 OCOTP driver
Date: Thu, 06 Aug 2015 18:28:10 +0200
Message-ID: <1438878490.3223.10.camel@pengutronix.de>
References: <1438693342-605-1-git-send-email-p.zabel@pengutronix.de>
	 <1438693342-605-2-git-send-email-p.zabel@pengutronix.de>
	 <55C38941.9090709@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55C38941.9090709-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Srinivas,

Am Donnerstag, den 06.08.2015, 17:20 +0100 schrieb Srinivas Kandagatla:
> Few Nits..
> 
> On 04/08/15 14:02, Philipp Zabel wrote:
> > +#include <linux/clk.h>
> May be you can drop this?

Yes, that's a left-over and can be removed.

> BTW, who is taking care of the gated peripheral clock controlled for 
> this driver?

Nobody. I had initially copied the code that actually senses the fuses,
but since this happens during power-on reset anyway (all values are
stored in shadow registers), I didn't see the point and dropped it for
now.
The shadow registers are clocked directly by the ungated ipg_root clock.

[...]
> > +MODULE_LICENSE("GPL");
> 
> GPL v2 ?

Will do.

thanks
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
