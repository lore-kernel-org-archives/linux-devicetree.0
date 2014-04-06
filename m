From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] mfd: sec-core: Fix uninitialized 'regmap_rtc' on S2MPA01
Date: Sun, 6 Apr 2014 15:23:09 +0200
Message-ID: <CAMuHMdX2yCCSUn=t9BZ_+bHMcV11O35b2PDj1hS=NNHmiiG0eA@mail.gmail.com>
References: <20140318110947.GR25478@lee--X1>
	<1395148286-32002-1-git-send-email-k.kozlowski@samsung.com>
	<CAK9yfHwNmN+M8ncSGjUwnfXs1p-e7pCy5Y-K7uX6JV5JyWYhEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK9yfHwNmN+M8ncSGjUwnfXs1p-e7pCy5Y-K7uX6JV5JyWYhEg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 19, 2014 at 9:27 AM, Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On 18 March 2014 18:41, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>> Initialize the 'regmap_rtc' on S2MPA01 to some sane value. Sane at least
>> for S5M87X chipsets, not S2MPS/S2MPA but it won't be used because
>> rtc-s5m driver does not support S2MPA01.
>>
>> This fixes following error:
>> drivers/mfd/sec-core.c:342:45: warning: 'regmap_rtc' may be used uninitialized in this function [-Wuninitialized]
>>
>> Signed-off-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>
> From the point of suppressing this warning and considering how it is
> done for S2MPS11,
> Acked-by: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

This is not just about suppressing a warning. The following may crash when
passed a random pointer:

sec_pmic->regmap_rtc = devm_regmap_init_i2c(sec_pmic->rtc, regmap_rtc);

and if regmap_rtc happens to be NULL, devm_regmap_init_i2c() will
return -EINVAL.

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
