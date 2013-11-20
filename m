From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] clksrc: delete nomadik MTU non-DT boot path
Date: Wed, 20 Nov 2013 10:03:36 +0100
Message-ID: <528C7AE8.1040204@linaro.org>
References: <1384896499-9428-1-git-send-email-linus.walleij@linaro.org>	<528BE9C1.8000409@linaro.org>	<20131120085218.GE19953@lee--X1>	<528C79E5.2020209@linaro.org> <CACRpkdbZeHDj_jgcJ7QH_+mwQqP6ZaKqGNjP6j37txAeq2DnsQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdbZeHDj_jgcJ7QH_+mwQqP6ZaKqGNjP6j37txAeq2DnsQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/20/2013 10:01 AM, Linus Walleij wrote:
> On Wed, Nov 20, 2013 at 9:59 AM, Daniel Lezcano
> <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> On 11/20/2013 09:52 AM, Lee Jones wrote:
>
>>>> A sidenote: there is a comment in arch/arm/mach-ux500/timer.c
>>>> "/* TODO: Once MTU has been DT:ed place code above into else. */"
>>>> but I did not see any changes related to this TODO.
>>>
>>> You mean similar to this one:
>>>     https://lkml.org/lkml/2013/11/6/118
>>
>> Yes :)
>
> It's applied in my tree as well, problem solved!

Ok, cool.

Thanks !
   -- Daniel

--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
