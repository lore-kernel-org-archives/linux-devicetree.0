From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/2] get pinctrl more flexible for per pin muxing controllers
Date: Wed, 10 Jun 2015 09:33:20 +0200
Message-ID: <CACRpkdawFrfzHf+8vMLz07-r4J48bAVibV++K31dNQ+D-85ZMg@mail.gmail.com>
References: <1430729776-27797-1-git-send-email-ludovic.desroches@atmel.com>
	<556F01CC.8020305@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <556F01CC.8020305-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 3, 2015 at 3:31 PM, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>=
 wrote:
> Le 04/05/2015 10:56, Ludovic Desroches a =C3=A9crit :
>>
>> The way pins, groups and functions are tied is too constraining for =
some
>> controllers. It concerns mainly the ones we don't care about groups =
and
>> functions, each pin can be muxed to any functions.
>> The goal of these two patches is too remove some of the constraints.
>>
>> I have added the prototype of a pin controller and device tree to sh=
ow the
>> way I want to use these changes. I couldn't test it on boards using =
generic
>> pinconf so I am not sure that I don't break something...
>>
>>
>> Ludovic Desroches (4):
>>   pinctrl: change function behavior for per pin muxing controllers
>>   pinctrl: introduce complex pin description
>
> Linus,
>
> Ludovic sent this series nearly one month ago. It was posted after a =
RFC
> series on the same topic two months ago. As we don't see any comment =
on
> neither of them we assume that it's okay to include them.

It's a quite big patch and I need help reviewing it and thinking of
some possible consequences.

Stephen, can you give me a hand with this?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
