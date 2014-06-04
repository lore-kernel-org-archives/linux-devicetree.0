From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH 01/21] irq: add devres version of OF IRQ mapping
 routines
Date: Wed, 4 Jun 2014 15:39:32 +0200 (CEST)
Message-ID: <alpine.DEB.2.10.1406041538270.3319@nanos>
References: <1401880402-30091-1-git-send-email-nyushchenko@dev.rtsoft.ru> <1401880402-30091-2-git-send-email-nyushchenko@dev.rtsoft.ru>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401880402-30091-2-git-send-email-nyushchenko-jFhMxQ4mL6a2X5qOxWx28w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nikita Yushchenko <nyushchenko-jFhMxQ4mL6a2X5qOxWx28w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lugovskoy-jFhMxQ4mL6a2X5qOxWx28w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 4 Jun 2014, nyushchenko-jFhMxQ4mL6a2X5qOxWx28w@public.gmane.org wrote:

> From: Nikita Yushchenko <nyushchenko-jFhMxQ4mL6a2X5qOxWx28w@public.gmane.org>
> 
> Many drivers use devres to manage their resources, and at the same time
> use irq_of_parse_and_map() / irq_dispose_mapping(). This creates problem
> on driver unload paths and on error paths:
> - it is invalid to call irq_dispose_mapping() while IRQ handler is still
>   installed,
> - devres moves removal of IRQ handler out of driver,
> - without explicit devres support for IRQ mapping, irq_dispose_mapping()
>   stays in driver and thus gets called while IRQ handler is still
>   installed.
> 
> This patch adds devm_irq_create_of_mapping() and devm_irq_of_parse_and_map()
> routines to be used by drivers for correct release of resources.
> 
> Signed-off-by: Nikita Yushchenko <nyushchenko-jFhMxQ4mL6a2X5qOxWx28w@public.gmane.org>

Reviewed-by: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
