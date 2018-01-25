From: Bartosz Golaszewski <brgl-ARrdPY/1zhM@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: use a correct at24 fallback for at91-nattis-2-natte-2
Date: Thu, 25 Jan 2018 08:48:59 +0100
Message-ID: <CAMRc=MfVpWKctrgovF2hAnxjiXP4TqzLqqyVCPrQiudg8DHwtA@mail.gmail.com>
References: <20180124213412.4612-1-brgl@bgdev.pl> <bd9bdd00-d7ce-e925-2d63-d0fbb86e07e9@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bd9bdd00-d7ce-e925-2d63-d0fbb86e07e9-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

2018-01-24 23:12 GMT+01:00 Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>:
> Hi Bartosz,
>
> On 2018-01-24 22:34, Bartosz Golaszewski wrote:
>> We now require all at24 users to use the "atmel,<model>" fallback in
>> device tree for different manufacturers.
>
> I think my patch [3/4] from about a week ago was just a tiny bit
> better.
> https://lkml.org/lkml/2018/1/16/609
>
> Can we please pick that one directly instead of doing this partial
> step?
>
> Cheers,
> Peter

Hi Peter,

oh yes, sorry - I just grepped the entire code base from next for
invalid compatibles and didn't notice this was already fixed by you.
Let's drop it.

Thanks,
Bartosz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
