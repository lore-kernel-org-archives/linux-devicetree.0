From: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH] MIPS: Octeon: mark GPIO controller node not populated
 IRQ, init.
Date: Fri, 26 Aug 2016 01:40:33 +0300
Message-ID: <20160825224033.GH12169@raspberrypi.musicnaut.iki.fi>
References: <422712ab-4b0d-2b6d-4600-b917c2d327a9@cavium.com>
 <57BF6F47.4030803@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <57BF6F47.4030803-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: "Steven J. Hill" <steven.hill-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Aug 25, 2016 at 03:20:55PM -0700, David Daney wrote:
> On 08/25/2016 02:22 PM, Steven J. Hill wrote:
> >We clear the OF_POPULATED flag for the GPIO controller node, otherwise
> >the GPIO lines used by the MMC driver are never probed.

Please also mention that gpio-leds failed to probe.

> >Fixes: 15cc2ed6dcf9 ("of/irq: Mark initialised interrupt controllers as populated")
> >Signed-off-by: Steven J. Hill <Steven.Hill-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> >---
> >  arch/mips/cavium-octeon/octeon-irq.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> >diff --git a/arch/mips/cavium-octeon/octeon-irq.c b/arch/mips/cavium-octeon/octeon-irq.c
> >index 5a9b87b..41d12d4 100644
> >--- a/arch/mips/cavium-octeon/octeon-irq.c
> >+++ b/arch/mips/cavium-octeon/octeon-irq.c
> >@@ -1619,6 +1619,13 @@ static int __init octeon_irq_init_gpio(
> >  		return -ENOMEM;
> >  	}
> >
> >+	/*
> >+	 * Clear the OF_POPULATED flag that was set above for the
> 
> Can we s/above/in of_irq_init()/ to be less ambiguous?
> 
> >+	 * GPIO controller so that the lines used by the MMC driver
> 
> I suspect that it is not just MMC that was broken by commit 15cc2ed6dcf9.
> Can we get a real description of exactly which kernel facilities are
> impacted?  Is it all GPIO, or what?

For me it fixes gpio-leds breakage, so I think it's all GPIO. Referring
to MMC driver is not appropriate anyway as the OCTEON MMC is not yet
merged. :-)

> >+	 * will not be skipped.
> >+	 */
> >+	of_node_clear_flag(gpio_node, OF_POPULATED);
> >+
> >  	return 0;

For this actual code change, you can add:

Tested-by: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>

Thanks,

A.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
