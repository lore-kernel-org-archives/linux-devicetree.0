From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 4/5] ARM: at91/dt: add AIC irq1 muxed peripheral id
 definitions
Date: Wed, 14 Jan 2015 14:21:47 +0100
Message-ID: <54B66D6B.9050205@atmel.com>
References: <1421174781-4340-1-git-send-email-boris.brezillon@free-electrons.com> <1421174781-4340-5-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421174781-4340-5-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 13/01/2015 19:46, Boris Brezillon a =E9crit :
> These ids will be used to define irqs multiplexed on the first irq li=
ne.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  .../dt-bindings/interrupt-controller/atmel-aic.h   | 22 ++++++++++++=
++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 include/dt-bindings/interrupt-controller/atmel-ai=
c.h
>=20
> diff --git a/include/dt-bindings/interrupt-controller/atmel-aic.h b/i=
nclude/dt-bindings/interrupt-controller/atmel-aic.h
> new file mode 100644
> index 0000000..e14a94f
> --- /dev/null
> +++ b/include/dt-bindings/interrupt-controller/atmel-aic.h
> @@ -0,0 +1,22 @@
> +#ifndef _DT_BINDINGS_INTERRUPT_CONTROLLER_ARM_GIC_H
> +#define _DT_BINDINGS_INTERRUPT_CONTROLLER_ARM_GIC_H

Nit.: why ARM_GIC?

> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +#define AIC_IRQ1_PMC		0
> +#define AIC_IRQ1_ST		1
> +#define AIC_IRQ1_PIT		1
> +#define AIC_IRQ1_DBGU		2
> +#define AIC_IRQ1_RTC		3
> +#define AIC_IRQ1_RTT		4
> +#define AIC_IRQ1_WATCHDOG	5
> +#define AIC_IRQ1_MC		6
> +#define AIC_IRQ1_SDRAMC		6
> +#define AIC_IRQ1_DDRSDRC	6
> +#define AIC_IRQ1_RSTC		7
> +#define AIC_IRQ1_PMERRLOC	8
> +#define AIC_IRQ1_PMECC		9




> +
> +#define AIC_IRQ_MASK(x)		(1 << x)
> +
> +#endif
>=20


--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
