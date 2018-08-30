Return-Path: <SRS0=QYpu=LN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:33558 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727796AbeH3Njp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 30 Aug 2018 09:39:45 -0400
Received: by mail-oi0-f68.google.com with SMTP id 8-v6so14334852oip.0
        for <devicetree@vger.kernel.org>; Thu, 30 Aug 2018 02:38:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <ba334f02-ac37-0908-ec0c-da8a6459fab4@linaro.org>
References: <20180829132954.64862-1-chris.brandt@renesas.com>
 <20180829132954.64862-2-chris.brandt@renesas.com> <1ff04fa1-ee3b-6095-bcd8-f16dbb99b57a@linaro.org>
 <TY1PR01MB156202DC354E70F1C8C5B18A8A090@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <c16b82c0-e675-8f86-19e6-75cb5995813b@linaro.org> <CAMuHMdX9nXYan-m14k6h7OU1UCGW_irDLvMMi==dnM0cdUR_nA@mail.gmail.com>
 <c4bd550f-5319-9d92-a30a-1d12fc9bbcab@linaro.org> <CAMuHMdUs-YNQk1wmbqQvz_n9xq04=gkyL1uBJdg9ExA9Lmg5uw@mail.gmail.com>
 <a160b76b-8dca-81e8-e958-d8b92bdc8928@linaro.org> <CAMuHMdV3Ai+CLHBJ_GH9d=JN0cmiaQT3eSfNGRgiiMffgK7stg@mail.gmail.com>
 <ba334f02-ac37-0908-ec0c-da8a6459fab4@linaro.org>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Thu, 30 Aug 2018 11:38:28 +0200
Message-ID: <CAMpxmJUhEWZzzML3Wv1aiSuhioJAg9sN14DW=FoQVoMKTW9xzg@mail.gmail.com>
Subject: Re: [PATCH 1/2] clocksource/drivers/ostm: Delay driver registration
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Chris Brandt <Chris.Brandt@renesas.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, Arnd Bergmann <arnd.bergmann@linaro.org>, Mark Brown <broonie@linaro.org>
List-ID: <devicetree@vger.kernel.org>

2018-08-30 11:16 GMT+02:00 Daniel Lezcano <daniel.lezcano@linaro.org>:
>
> [Added Arnd Bergmann, Bartosz Golaszewski and Mark Brown]
>
> On 30/08/2018 10:48, Geert Uytterhoeven wrote:
>> Hi Daniel,
>
> [ ... ]
>
>>> Yeah, I got this point. But it is the meaning of your sentence: "...
>>> which causes issues with complex dependencies.".
>>>
>>> It is ambiguous *what* causes the issues.
>>>
>>> Did you meant an attempt was done to support EPROBE_DEFER with
>>> *_OF_DECLARE but caused too much issues with the complex dependencies?
>>>
>>> Or the current situation is causing too much issues with the complex
>>> dependencies?
>>>
>>> (I know the latter is true, it is about the meaning of the sentence).
>>
>> I meant the latter.
>>
>> AFAIK no attempt was done to support EPROBE_DEFER with *_OF_DECLARE.
>> IMHO it would be pointless, as it would be much easier to just switch to=
 real
>> platform drivers.
>
> May be, may be not.
>
> From your point of view, the change is simple because it touches only a
> single driver.
>
> From my point of view, the change implies a split in the approach while
> I'm trying to unify the drivers little by little and there are hundred
> of them.
>
> It is not the first time we face this situation and Bartosz Golaszewski
> has a similar problem [1].
>

Hi,

thanks for Cc'in me on that.

This was my latest proposal for early platform drivers:

    https://lkml.org/lkml/2018/5/11/488

I still intend on continuing this work, I just don't have the time right no=
w.

Best regards,
Bartosz Golaszewski

> We have all the frameworks we need to solve this properly but I would
> like something we can propagate to all drivers (OF and !OF) so we end up
> with unified code.
>
> It is time we clearly state the dependency issues and we find a proper
> way to solve it.
>
>
>
>
> [1] https://lkml.org/lkml/2018/4/26/657
>
> --
>  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for A=
RM SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
>
