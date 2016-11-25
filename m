From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 3/3] pinctrl: sx150x: add support for sx1501, sx1504,
 sx1505 and sx1507
Date: Fri, 25 Nov 2016 16:24:42 +0100
Message-ID: <2612aff9-d7cf-e026-35ab-1b76c7bd9135@baylibre.com>
References: <1480020320-28354-1-git-send-email-peda@axentia.se>
 <1480020320-28354-4-git-send-email-peda@axentia.se>
 <CACRpkdZb5Tsbet994UNhQfPw3bojtisU0CC-RWw4DBuK79HzLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdZb5Tsbet994UNhQfPw3bojtisU0CC-RWw4DBuK79HzLQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/25/2016 02:45 PM, Linus Walleij wrote:
> On Thu, Nov 24, 2016 at 9:45 PM, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org> wrote:
> 
>> Untested, register offsets carefully copied from datasheets.
>>
>> Signed-off-by: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
> 
> Why not. Nice to support all of them.
> 
> Patch applied, fixing the typ you mentioned in the follow
> up in the process.
> 
> Yours,
> Linus Walleij
> 

Thanks peter,

Semtech should definitely provide some samples to test these variants !
I had a very hard time to find a (cheap) breakout board for one of these chips...

But it's better than nothing to have them supported by the kernel even if some bug may appear.

Neil
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
