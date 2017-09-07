From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH v3] gpio: uniphier: add UniPhier GPIO controller driver
Date: Thu, 7 Sep 2017 10:11:42 +0900
Message-ID: <CAK7LNAS0CEcS=DReDWj2xhKKy4_QMSu_m=Rc-DELsaj3T73uPg@mail.gmail.com>
References: <1503418601-9728-1-git-send-email-yamada.masahiro@socionext.com> <CACRpkdYG3BFhhpouwAkQN+x0YpC5EhsVhTkqyuNdRd26Ne-r9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdYG3BFhhpouwAkQN+x0YpC5EhsVhTkqyuNdRd26Ne-r9A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Masami Hiramatsu <mhiramat-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,


2017-08-31 22:41 GMT+09:00 Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
> On Tue, Aug 22, 2017 at 6:16 PM, Masahiro Yamada
> <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:
>
>> This GPIO controller device is used on UniPhier SoCs.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
>> ---
>>
>> Changes in v3:
>>   - Add .irq_set_affinity() hook
>>   - Use irq_domain_create_hierarchy() instead of legacy
>>     irq_domain_add_hierarchy().
>
> This is getting better and better.
>
>> +static const u32 uniphier_gpio_irq_parent_hwirqs[] = {
>> +       48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63,
>> +       154, 155, 156, 157, 158, 217, 218, 219,
>> +};
>
> This array which is used when allocating the hierarchical domain
> looks like configuration data. Why is it not in the device tree?
>


Another solution might be
to use the brand-new irq_domain_push_irq().


With a quick look at it, the hierarchy IRQ domain can work with
#interrupts property by inserting the outer-most irq_data with
irq_domain_push_irq().


If you are unhappy with hard-coded configuration parameters,
I will switch to generic compatible + DT properties approach.


-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
