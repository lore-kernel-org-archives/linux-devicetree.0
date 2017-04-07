From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC] Documentation: pinctrl: Add "pinmux" property
Date: Fri, 7 Apr 2017 12:11:37 +0200
Message-ID: <CACRpkdaik7T7vZx0meJUvLiJJe6Wq_PaOAh9eWB892NjMKX=4A@mail.gmail.com>
References: <1491474955-25605-1-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1491474955-25605-1-git-send-email-jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 6, 2017 at 12:35 PM, Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org> wrote:

> Document "pinmux" property as part of generic pin controller
> documentation.
> Fix 2 minor typos in documentation while at there.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>

Patch applied. This is documenting what is already the case
and is as such very helpful.

> Sending this one as RFC to collect feedback.

I just applied it. It is already much better than what we have.

If more adjustments are needed, people can send additional patches.

> If the change is not rejected is it
> worth adding to pin controller core helper functions to parse the newly
> documented property, as this commit
> <https://patchwork.kernel.org/patch/9411231/>
> did for "pinctrl-pin-array" one?
>
> All drivers using "pinmux" exhibit the same behavior which is fine as long as
> "pinmux" only accepts a list of u32 parameters.
>
>         ...
>         pins = of_find_property(node, "pinmux", NULL);
>         ...
>         npins = pins->length / sizeof(u32);
>         ...
>         of_property_read_u32_index(node, "pinmux",
>                                    i, &pinfunc);
>         ...

It makes sense. Just make sure to move users over to use the helpers.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
