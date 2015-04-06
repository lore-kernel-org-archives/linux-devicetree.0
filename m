From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 2/3] of: OF_IRQ should depend on IRQ_DOMAIN
Date: Mon, 6 Apr 2015 17:26:57 +0200
Message-ID: <CAMuHMdVa5fe8bo=OA3chwpc3ysn4y4ga_nx2bOdKZErMe_7J0w@mail.gmail.com>
References: <1428245965-19618-1-git-send-email-geert@linux-m68k.org>
	<1428245965-19618-3-git-send-email-geert@linux-m68k.org>
	<4981781.UvXHorNsu5@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4981781.UvXHorNsu5@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On Mon, Apr 6, 2015 at 4:40 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>> --- a/drivers/of/Kconfig
>> +++ b/drivers/of/Kconfig
>> @@ -50,7 +50,7 @@ config OF_ADDRESS_PCI
>>
>>  config OF_IRQ
>>         def_bool y
>> -       depends on !SPARC
>> +       depends on !SPARC && IRQ_DOMAIN
>>
>>  config OF_NET
>>         depends on NETDEVICES
>>
>
> Sparc does not set IRQ_DOMAIN, so we can probably simplify this to
>
> config OF_IRQ
>         def_bool IRQ_DOMAIN
>
> unless you want to keep the sparc antidependency explicit.

Given drivers/base/platform.c:

int platform_get_irq(struct platform_device *dev, unsigned int num)
{
#ifdef CONFIG_SPARC
        ...
#else
        struct resource *r;
        if (IS_ENABLED(CONFIG_OF_IRQ) && dev->dev.of_node) {
                ...
        }
        ...
#endif
}

yes I do want to keep it explicit.

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
