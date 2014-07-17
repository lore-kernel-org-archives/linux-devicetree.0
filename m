From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH v4 0/7] ARM: at91: move aic driver to drivers/irqchips
Date: Thu, 17 Jul 2014 09:34:49 -0400
Message-ID: <20140717133449.GP13108@titan.lakedaemon.net>
References: <1405012462-766-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1405012462-766-1-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 10, 2014 at 07:14:15PM +0200, Boris BREZILLON wrote:
> Hello,
> 
> This series moves the AIC driver to the irqchip directory and make use of
> the generic chip framework whenever possible.
> 
> This driver only support DT boards (all legacy board files should be soon
> replaced by their DT versions).
> 
> Since the last version AIC and AIC5 code have been split and common
> functions have been moved to irq-atmel-aic-common.c.
> I know there is not much code in this file and it could have been
> duplicated in AIC and AIC5 drivers, but I'm planning to add more common
> stuff soon (AIC irq fixups previously done in
> arch/arm/mach-at91/sysirq_mask.c).
> 
> Jason, if everybody is fine with this version could you share a topic
> branch  containing patch 1 to 3 with Nicolas ?

I've now applied patches 1-3 to irqchip/atmel-aic.  You can find the
branch here:

  git://git.infradead.org/users/jcooper/linux.git irqchip/atmel-aic

It will be merged into -next today, and I'll merge it into irqchip/core
after a few days.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
