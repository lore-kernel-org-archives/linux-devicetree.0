From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 5/8] pinctrl: Add core support for Aspeed SoCs
Date: Mon, 22 Aug 2016 15:45:48 +0200
Message-ID: <CACRpkdaBuwqGPbfLK8bR5A4NSefifw8VqPyUbgtAtweqoEnD7g@mail.gmail.com>
References: <20160819124414.24242-1-andrew@aj.id.au> <20160819124414.24242-6-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160819124414.24242-6-andrew-zrmu5oMJ5Fs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Cc: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 19, 2016 at 2:44 PM, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org> wrote:

> +++ b/drivers/pinctrl/aspeed/Kconfig
> @@ -0,0 +1,8 @@
> +config PINCTRL_ASPEED
> +       bool
> +       depends on (ARCH_ASPEED || COMPILE_TEST) && OF
> +       select PINMUX
> +       select PINCONF
> +       select GENERIC_PINCONF
> +       select MFD_SYSCON
> +       select REGMAP_MMIO

Since this device is spawn from the syscon, should it not be
"depends on MFD_SYSCON"?

(No big deal, if you think this is right then go with it.)

> +#include <linux/io.h>

What is this include for?

> +#include <linux/mfd/syscon.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include "../core.h"
> +#include "pinctrl-aspeed.h"

No #include <linux/regmap.h>?

Maybe some #includes are centralized to pinctrl-aspeed.h
I don't know, just make sure you don't have implicit includes.

> +               if (regmap_read(map, desc->reg, &val) < 0)
> +                       return false;
> +
> +               val &= ~desc->mask;
> +               val |= pattern << __ffs(desc->mask);
> +
> +               if (regmap_write(map, desc->reg, val) < 0)
> +                       return false;

Use:

regmap_update_bits(map,
                              desc->reg,
                              desc->mask,
                              pattern << __ffs->desc->mask);

Or something like that instead of reimplementing
mask-and-set. Regmap already knows how to do the
business.

(Applied everywhere in the driver where you have a
mask-and-set like this).

The expression core engine is still a complete mystery
for me, I will just trust you that it works as intended.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
