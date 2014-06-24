From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH v3 3/7] irqchip: atmel-aic: add new atmel AIC driver
Date: Tue, 24 Jun 2014 16:00:36 -0400
Message-ID: <20140624200036.GP10202@titan.lakedaemon.net>
References: <1403276487-8792-1-git-send-email-boris.brezillon@free-electrons.com>
 <1403276487-8792-4-git-send-email-boris.brezillon@free-electrons.com>
 <53A74316.5080509@free-electrons.com>
 <20140624125653.GN10202@titan.lakedaemon.net>
 <53A9A3E3.5020409@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53A9A3E3.5020409-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 24, 2014 at 06:14:27PM +0200, Boris BREZILLON wrote:
> On 24/06/2014 14:56, Jason Cooper wrote:
...
> > Once you post the new series, I assume it's ok to apply patches 1-3 to
> > irqchip/core, or are there some dependency considerations?
> 
> Patches 6 and 7 depend on the 3 first patches, but we should be able to
> merge them through the at91/arm-soc tree (Nicolas might have to rebase
> its tree for 3.17 on irqchip/core after you have applied patches 1-3).

I'll create a topic branch for you when the time comes.  That way
arm-soc doesn't have to pull in any code it doesn't actually need (helps
with for-next testing).

Please give me a gentle reminder in the coverletter or comments when you
send the next version.

> Anyway, I'd like to wait for at91 maintainers/developers reviews before
> posting a new version.

Sure.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
