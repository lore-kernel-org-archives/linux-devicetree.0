From: jmondi <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 02/10] pinctrl: generic: Add macros to unpack
 properties
Date: Fri, 28 Apr 2017 14:49:02 +0200
Message-ID: <20170428124902.GA29046@w540>
References: <1493281194-5200-1-git-send-email-jacopo+renesas@jmondi.org>
 <1493281194-5200-3-git-send-email-jacopo+renesas@jmondi.org>
 <CACRpkdbkBtJGJ_5MVy2QSAa0zcKVm=_H+vC_kH4AUcX58TiaLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbkBtJGJ_5MVy2QSAa0zcKVm=_H+vC_kH4AUcX58TiaLg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On Fri, Apr 28, 2017 at 10:16:22AM +0200, Linus Walleij wrote:
> On Thu, Apr 27, 2017 at 10:19 AM, Jacopo Mondi
> <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org> wrote:
>
> > Add PIN_CONF_UNPACK_PARAM and PIN_CONF_UNPACK_ARGS macros useful to
> > unpack generic properties and their arguments
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
>
> (...)
>
> /*
>   * Helpful configuration macro to be used in tables etc.
>
> Then this should say "macros" rather than "macro".
>
> > -#define PIN_CONF_PACKED(p, a) ((a << 8) | ((unsigned long) p & 0xffUL))
> > +#define PIN_CONF_PACKED(p, a) (((a) << 8) | ((unsigned long) (p) & 0xffUL))
>
> Also adding some extra parantheses I see.
>
> > +#define PIN_CONF_UNPACK_PARAM(c) ((c) & 0xffUL)
> > +#define PIN_CONF_UNPACK_ARGS(c) ((c) >> 8)
>
> But why.
>
> I have these two static inlines just below your new macros:
>
> static inline enum pin_config_param pinconf_to_config_param(unsigned
> long config)
> {
>         return (enum pin_config_param) (config & 0xffUL);
> }
>
> static inline u32 pinconf_to_config_argument(unsigned long config)
> {
>         return (u32) ((config >> 8) & 0xffffffUL);
> }
>
> Why can't you use this in your code instead of macros?
>
> We generally prefer static inlines over macros because they are easier
> to read.
>

Right. I haven't noticed them.
I'll drop this patch, sorry for noise

> Yours,
> Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
