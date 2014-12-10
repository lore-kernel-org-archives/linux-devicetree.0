From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 2/4] irqchip: mediatek: Add support for mt8173
Date: Wed, 10 Dec 2014 15:41:15 +0100
Message-ID: <4428865.bnDr16Yqvr@wuerfel>
References: <1418208602-35584-1-git-send-email-eddie.huang@mediatek.com> <2545975.QDuBFbG7BN@wuerfel> <1418222233.21309.17.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418222233.21309.17.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Robert Richter <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, yh.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 10 December 2014 22:37:13 Yingjoe Chen wrote:
> OK, I'll change to something like this in next version:

I've just taken another look at the driver and have a different
suggestion:

> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sysirq.txt
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sysirq.txt
> @@ -17,12 +17,17 @@ Required properties:
>    use the same interrupt-cells format as GIC.
>  - reg: Physical base address of the intpol registers and length of memory
>    mapped region.
> 
> +Optional properties:
> +- mediatek,intpol-number: The number of interrupts supported by intpol,
> +  default 224 if omitted.
> +
>  Example:
>         sysirq: interrupt-controller@10200100 {
>                 compatible = "mediatek,mt6589-sysirq", "mediatek,mt6577-sysirq";
>                 interrupt-controller;
>                 #interrupt-cells = >;
>                 interrupt-parent = <&gic>;
>                 reg = <0 0x10200100 0 0x1c>;
> +               mediatek,intpol-number = <224>;
>         };

The number of interrupt pins directly corresponds to the size of the reg
property in bits, so I think you can just use that and don't even need
another property.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
