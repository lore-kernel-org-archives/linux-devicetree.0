From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: uniphier: add outer cache support
Date: Wed, 26 Aug 2015 14:52:45 +0200
Message-ID: <4027826.UsiXogeDbt@wuerfel>
References: <1440382692-3855-1-git-send-email-yamada.masahiro@socionext.com> <2021253.vgeYqalDfp@wuerfel> <CAK7LNAQ_oymnQNEcP+FDqyxNKtMyiCwgxSRMmg5HAKQW9C6eRg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK7LNAQ_oymnQNEcP+FDqyxNKtMyiCwgxSRMmg5HAKQW9C6eRg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Jiri Slaby <jslaby-IBi9RG/b67k@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jungseung Lee <js07.lee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Nathan Lynch <nathan_lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 26 August 2015 10:38:59 Masahiro Yamada wrote:
> 
> 2015-08-25 4:59 GMT+09:00 Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>:
> > On Monday 24 August 2015 11:18:10 Masahiro Yamada wrote:

> Nothing.
> 
> This outer cache is not a variant of l2x0/pl310.
> It was designed only for our SoCs from scratch.

Ok, I see.

> > Would it make sense to at least share the
> > common entry point at l2x0_of_init() so you don't need to call it from
> > the platform file?
> 
> I do not think so.
> 
> 
> l2x0_of_init() checks L2X0_AUX_CTRL register,
> but the cache-uniphier does not have such register,
> so the boot code crashes.
> 
> 
> 
> BTW, what makes l2x0_of_init() so special?
> 
> Only L2x0/L310 and variants can be initialized
> directly from init_IRQ().

The only thing that is special about it is that almost everyone
uses it because it is often licensed together with the Cortex-A
cores from ARM. There are a few variants that are closely related
(tauros3 and aurora, both from Marvell. All other outer_cache
implementations (feroceon, xscale, tauros2) are for older
Marvell (or Intel) cores that have since been replaced with
Cortex-A cores in newer products.

> Moreover, outer-cache init seems to be unrelated to
> IRQ init.

Agreed, this is also just a historic artifact, as we don't really
have a place to put cache controller initialization, and the
irq init callback was already there at the time when people
added code to init their outer caches. It often does not matter
much where you call it, but doing it early speeds up the boot
time.

It would be nice to unify the cache initialization a bit further,
apparently only a few older platforms still call the l2x0 init
manually and we can probably all convert them to the implicit
configuration in one way or another.

As we now have three kinds of cache controllers (l2x0, tauros2
and uniphier) that we need to support using DT, it would be nice
for generalize that init sequence a bit more.

A first step would be to add the tauros2 and uniphier outer cache
init to the init_IRQ() function, and then have another patch
that moves all the outercache initialization into a new place
like arch/arm/mm/outercache.c so we don't clutter up irq.c
with unrelated stuff.

Russell probably also has some ideas on this topic, in doubt
just do what he suggests.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
