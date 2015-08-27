From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [RFC PATCH] arm/arm64: build all dtbs for CONPILE_TEST
Date: Thu, 27 Aug 2015 22:46:38 +0200
Message-ID: <CAMuHMdXYBBxi6Y+ZW6nLP7+NEBcjvOtNWQGCgwArqUV95JyZTw@mail.gmail.com>
References: <1440690994-5978-1-git-send-email-robh@kernel.org>
	<CAOesGMjzBaobpLsS77UziWeYO9wo21SkdpWT=Pib6AM7DDKTnA@mail.gmail.com>
	<CAL_JsqK+QHgCu4x-X+ShyWhj6g=+X-AC5AeCLm1DNYfFdCpH5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqK+QHgCu4x-X+ShyWhj6g=+X-AC5AeCLm1DNYfFdCpH5A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Thu, Aug 27, 2015 at 9:07 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> It would be useful to build all files, but it's not the behavior that
>> COMPILE_TEST usually has.
>
> Just changing to dtb-n would be equivalent because there is no other
> dependency to enable building. Code has other dependencies typically.
> What dtb do we not want to built in an allyesconfig build? If dtb's
> have any dependencies, that would be a bug. To really make this
> equivalent to a driver using COMPILE_TEST, we would need kconfig
> symbols specifically for each platform's dtbs. Then we would have the
> 2 stage unhide (setting COMPILE_TEST) then enable the option.
>
> I was also thinking that perhaps we don't want to require a kconfig
> symbol for every platform family. Adding a kconfig entry is the only
> way to enable building a dtb ATM. I know there are 2 camps to this
> policy though.

I think it would be good to have a single Kconfig option (depending on
COMPILE_TEST) to build all dtbs.

For drivers, COMPILE_TEST doesn't enable anything by itself, it just
relaxes dependencies. Hence if any driver is broken, I can still
disable that driver in the .config.

If any dtb is broken, I cannot disable it, except by disabling COMPILE_TEST,
which I may not want to do for other reasons (e.g. I'm compile testing my
driver). If there would be an extra Kconfig symbol for building all dtbs,
I can still disable it.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
