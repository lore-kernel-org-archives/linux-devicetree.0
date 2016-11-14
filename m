From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH RFC] ARM: dts: add support for Turris Omnia
Date: Mon, 14 Nov 2016 21:28:32 +0100
Message-ID: <20161114202832.GG24546@lunn.ch>
References: <20161105203841.9661-1-uwe@kleine-koenig.org>
 <1479126185.15557.5@smtp.gmail.com>
 <20161114201640.rr32iyjf5a53v33t@perseus.defre.kleine-koenig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161114201640.rr32iyjf5a53v33t-jgopVnDzZD+b0XQX99//ntPVjbGH4+40kFgPdswSElo@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
Cc: tomas.hlavacek-x+rMaJPWets@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, marex-ynQEQJNshbs@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Martin Strba??ka <martin.strbacka-x+rMaJPWets@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> 
> +               i2c@7 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <7>;
> +
> +                       pcawan: gpio@71 {
> +                               compatible = "nxp,pca9538";
> +                               reg = <0x71>;
> +
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&pcawan_pins>;
> +
> +                               interrupt-parent = <&gpio1>;
> +                               interrupts = <14 IRQ_TYPE_LEVEL_LOW>;
> +
> +                               gpio-controller;
> +                               #gpio-cells = <2>;
> +
> +                               interrupt-controller;
> +                               #interrupt-cells = <2>;
> +                       };
> +               };
> 
> The interrupt-controller part doesn't seem to work though, at least
> 
> +               interrupt-parent = <&pcawan>;
> +               interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
> 
> in the phy node gives an error.

Interrupts don't seem to work very well with the nxp,pca9538. Which
is probably why it is disabled by default.

   Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
