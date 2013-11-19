From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: ux500: decomission the non-DT MTU init sequence
Date: Wed, 20 Nov 2013 00:33:09 +0100
Message-ID: <528BF535.1030504@linaro.org>
References: <1384896471-9384-1-git-send-email-linus.walleij@linaro.org>	<528BE8F2.3030507@linaro.org> <CACRpkdab=1xJtcAg-_oUBr_jC5DgDre-f9jxuzDnZmXGFShvLw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdab=1xJtcAg-_oUBr_jC5DgDre-f9jxuzDnZmXGFShvLw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/19/2013 11:55 PM, Linus Walleij wrote:
> On Tue, Nov 19, 2013 at 11:40 PM, Daniel Lezcano
> <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> On 11/19/2013 10:27 PM, Linus Walleij wrote:
>
>>> -       if (!of_have_populated_dt())
>>> -               nmdk_timer_init(mtu_timer_base, IRQ_MTU0);
>>
>> If no timer have been defined in the dt [or wrongly defined], is the=
re a
>> message to tell the user what is wrong ?
>
> Isn't that a question to be asked about a whole lot of such
> clocksource drivers and ARM platforms?

Yes, I did the comment based on your patch but I agree it must be=20
addressed in a global manner.

> Most DT-only ARM platforms rely on
> arch/arm/kernel/time.c to call clocksource_of_init() if the
> machine_desc->init_time() hook is not set and has zero
> code to handle any such situation.
>
> So I guess what you're asking is whether we should patch
> clocksource_of_init() to warn if it cannot find any
> matching clock sources, like this:
>
>  From e55cf038b238d96b28d9fb01b5b6cdf345990d53 Mon Sep 17 00:00:00 20=
01
> From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Date: Tue, 19 Nov 2013 23:52:56 +0100
> Subject: [PATCH] clksrc-of: warn if no clock sources are found
>
> Many platforms rely on clocksource_of_init() being implicitly
> called for registering clock sources and will get zero warnings
> if no working clock source is available. Let's print a critical
> error message if no clock source is found.
>
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Yes, it sounds right to do this.

Thanks !

   -- Daniel

> ---
>   drivers/clocksource/clksrc-of.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/clocksource/clksrc-of.c b/drivers/clocksource/cl=
ksrc-of.c
> index 35639cf4e5a2..a30b42c3ac3b 100644
> --- a/drivers/clocksource/clksrc-of.c
> +++ b/drivers/clocksource/clksrc-of.c
> @@ -28,6 +28,7 @@ void __init clocksource_of_init(void)
>       struct device_node *np;
>       const struct of_device_id *match;
>       clocksource_of_init_fn init_func;
> +    unsigned clocksources =3D 0;
>
>       for_each_matching_node_and_match(np, __clksrc_of_table, &match)=
 {
>           if (!of_device_is_available(np))
> @@ -36,5 +37,8 @@ void __init clocksource_of_init(void)
>           init_func =3D match->data;
>           init_func(np);
>           of_node_put(np);
> +        clocksources++;
>       }
> +    if (!clocksources)
> +        pr_crit("%s: no matching clocksources found\n", __func__);
>   }
>


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
