From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v4 1/7] Documentation: Add device tree bindings for Freescale i.MX GPC
Date: Tue, 18 Feb 2014 19:10:03 +0100
Message-ID: <2328803.HhaG6blXIR@wuerfel>
References: <1392737687-25003-1-git-send-email-p.zabel@pengutronix.de> <1392737687-25003-2-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392737687-25003-2-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 18 February 2014 16:34:41 Philipp Zabel wrote:
> +
> +Example of a device that is part of a power domain:
> +
> +       vpu: vpu@02040000 {
> +               reg = <0x02040000 0x3c000>;
> +               /* ... */
> +               fsl,power-domain = <&pd_pu>;
> +               /* ... */
> +       };
> +

I'm really not too happy about platforms starting to add random
bindings for power domains. Unfortunately I didn't catch exynos
doing this first, but I don't want to see another platform like
that.

Can we please come up with a proper generic power domain binding
first and then add platform specific users?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
