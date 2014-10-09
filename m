From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 6/7] dt-bindings: add irq domain parent binding
Date: Thu, 9 Oct 2014 15:57:18 +0100
Message-ID: <20141009145718.GB18384@leverpostej>
References: <1412864980-20273-1-git-send-email-yingjoe.chen@mediatek.com>
 <1412864980-20273-7-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1412864980-20273-7-git-send-email-yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Joe.C" <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Marc Zyngier <Marc.Zyngier-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org" <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "yingjoe.chen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <yingjoe.chen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "hc.yen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org" <hc.yen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org" <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "nathan.chung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org" <nathan.chung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "yh.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org" <yh.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Oct 09, 2014 at 03:29:39PM +0100, Joe.C wrote:
> From: "Joe.C" <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> Add "arm,irq-domain-hierarchy" optional property.
> 
> Signed-off-by: Joe.C <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/gic.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/gic.txt b/Documentation/devicetree/bindings/arm/gic.txt
> index c7d2fa1..f0bb759 100644
> --- a/Documentation/devicetree/bindings/arm/gic.txt
> +++ b/Documentation/devicetree/bindings/arm/gic.txt
> @@ -68,6 +68,8 @@ Example:
>  		      <0xfff10100 0x100>;
>  	};
>  
> +- arm,irq-domain-hierarchy : When this property exists, gic will be used as
> +  parent for hierarchy irq domain.

IRQ domains are a Linux internal detail, and their description doesn't
belong in the DT. So this property does not look like it should be
described in the DT.

I don't see a description of any relationship between devices here, so
it's not clear to me what this property is intended to imply.

Why do you think you need this?

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
