From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: uniphier: add outer cache support
Date: Mon, 24 Aug 2015 21:59:51 +0200
Message-ID: <2021253.vgeYqalDfp@wuerfel>
References: <1440382692-3855-1-git-send-email-yamada.masahiro@socionext.com> <1440382692-3855-2-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440382692-3855-2-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Jiri Slaby <jslaby-IBi9RG/b67k@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jungseung Lee <js07.lee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nathan Lynch <nathan_lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kl>
List-Id: devicetree@vger.kernel.org

On Monday 24 August 2015 11:18:10 Masahiro Yamada wrote:
> diff --git a/Documentation/devicetree/bindings/arm/uniphier/cache-uniphier.txt b/Documentation/devicetree/bindings/arm/uniphier/cache-uniphier.txt
> new file mode 100644
> index 0000000..6428289
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/uniphier/cache-uniphier.txt
> @@ -0,0 +1,30 @@
> +UniPhier outer cache controller
> +
> +UniPhier SoCs are integrated with a level 2 cache controller that resides
> +outside of the ARM cores, some of them also have a level 3 cache controller.
> +
> +Required properties:
> +- compatible: should be one of the followings:
> +       "socionext,uniphier-l2-cache"   (L2 cache)
> +       "socionext,uniphier-l3-cache"   (L3 cache)
> +- reg: offsets and lengths of the register sets for the device.  It should
> +  contain 3 regions: control registers, revision registers, operation
> +  registers, in this order.
> +
> +The L2 cache must exist to use the L3 cache; adding only an L3 cache device
> +node to the device tree causes the initialization failure of the whole outer
> +cache system.
> 

How much does this outer cache have in common with the l2x0/pl310 cache
controller model? Would it make sense to at least share the
common entry point at l2x0_of_init() so you don't need to call it from
the platform file?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
