From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: uniphier: add outer cache support
Date: Tue, 8 Sep 2015 15:09:54 +0200
Message-ID: <CACRpkdan0+rywnSR8Rs=aw63QAm3nN99ujqPcZwfpoh4_Dwc-w@mail.gmail.com>
References: <1440382692-3855-1-git-send-email-yamada.masahiro@socionext.com>
	<1440382692-3855-2-git-send-email-yamada.masahiro@socionext.com>
	<CACRpkdbJppuA6ZyciNAGfSgrf4M2THVHggzuZYSqORjy2JBp_A@mail.gmail.com>
	<CAK7LNATWsa8AhyFGzsR0HAODmQD8yBPidTE0Lx2ACh4_PeQW9w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK7LNATWsa8AhyFGzsR0HAODmQD8yBPidTE0Lx2ACh4_PeQW9w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jungseung Lee <js07.lee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jiri Slaby <jslaby-IBi9RG/b67k@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Nathan Lynch <nathan_lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime
List-Id: devicetree@vger.kernel.org

On Fri, Aug 28, 2015 at 12:24 PM, Masahiro Yamada
<yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:
> 2015-08-26 22:39 GMT+09:00 Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:

>> cache-unified and cache-level are *not* optional and should be required.
>
> "cache-unified" is mentioned in "3.7.3 Internal (L1) Cache Properties"
> (Table 3-8),
> but it is not in "3.8 Multi-level and Shared Caches" (Table 3-9)
>
> Are the rules in Table 3-8 also applied for L2?

Your guess is as good as mine unless someone involved in
actually writing that spec says something :/

>> (I'm just assuming this cache is unified, anything else would be baffling.)
>
> In fact, unified/harvard is configurable thru a register of this cache
> controller.

Jesus Christ.

> It is usually used as a unified cached, though.

I would, too.

> So,I am planning to use the same compatible for L2 and L3, like this:
>
>
>        l2-cache@500c0000 {
>                compatible = "socionext,uniphier-cache";
>                reg = <0x500c0000 0x2000>, <0x503c0100 0x8>,
>                      <0x506c0000 0x400>;
>                cache-unified;
>                cache-level = <2>;
>                next-level-cache = <&L2>;
>                cache-size = <0x200000>;
>                cache-sets = <256>;
>                cache-line-size = <128>;
>             };
>
>        /* Not all of UniPhier SoCs have L3 cache */
>        l3-cache@500c8000 {
>                compatible = "socionext,uniphier-cache";
>                reg = <0x500c8000 0x2000>, <0x503c8100 0x8>,
>                      <0x506c8000 0x400>;
>                cache-unified;
>                cache-level = <3>;
>                cache-size = <0x400000>;
>                cache-sets = <256>;
>                cache-line-size = <256>;
>        };

This LooksGoodToMe.

> The Table 3-9 in ePAPR v1.1 says
> the compatible should be "cache", but I do not think it makes sense here.

Agree.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
