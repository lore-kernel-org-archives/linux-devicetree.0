From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] MIPS: dts: remove bogus bcm96358nb4ser.dtb from dtb-y entry
Date: Thu, 9 Nov 2017 17:06:25 -0600
Message-ID: <CAL_JsqJF=AV_m7DJyc4GGX0xrbvn+yJ05Oy8EWoM+FO8qr=k2g@mail.gmail.com>
References: <1509859853-27473-1-git-send-email-yamada.masahiro@socionext.com>
 <1509859853-27473-2-git-send-email-yamada.masahiro@socionext.com>
 <CAK7LNAQfK_BWQcVW-ScrpAwNAHav3MrrzV-tjn_YUjsuvd7U5A@mail.gmail.com>
 <20171106095139.GG15260@jhogan-linux> <CAK7LNAQ_bugEP8hHKmCif5QCz2=Pw_GpXzYz4zJeXO0HXaT_ag@mail.gmail.com>
 <CAL_JsqJ8taCKnr_79UumiH2GFYq-fMzzkYm2iYevTOgUUWuzvg@mail.gmail.com>
 <CAK7LNATZ9O4cCpxLrG3MJoKYF+RnURkY4-tY2MdiZb90eGPtQg@mail.gmail.com> <CAK7LNARzRUA6ZGQUiebZ+nmLBSAVdYONsozHBf0VQb83KqSx1g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK7LNARzRUA6ZGQUiebZ+nmLBSAVdYONsozHBf0VQb83KqSx1g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: James Hogan <jhogan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kbuild mailing list <linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michal Marek <michal.lkml-yyZNWGI4GtDR7s880joybQ@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 8, 2017 at 6:38 PM, Masahiro Yamada
<yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:
> 2017-11-09 9:11 GMT+09:00 Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>:
>> 2017-11-09 1:51 GMT+09:00 Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
>>> On Mon, Nov 6, 2017 at 5:00 AM, Masahiro Yamada
>>> <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:
>>>> 2017-11-06 19:41 GMT+09:00 James Hogan <jhogan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
>>>>> Hi,
>>>>>
>>>>> On Sun, Nov 05, 2017 at 11:11:38PM +0900, Masahiro Yamada wrote:
>>>>>> +CC Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
>>>>>> +CC linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
>>>>>> +CC Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>>>> +CC Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>>>>
>>>>>>
>>>>>> I missed to CC MIPS maintainers.
>>>>>
>>>>> Yes, please resend the patch so it lands in patchwork.linux-mips.org.
>>>>
>>>>
>>>> This is a part of clean-up series of DT building.
>>>>
>>>> I want Acked-by from MIPS maintainers
>>>> so that the whole series can go to a different tree.
>>>> (DT or Kbuild).
>>>>
>>>>
>>>> Sam addressed more clean-up candidates in MIPS Makefiles
>>>> https://patchwork.kernel.org/patch/10041879/
>>>>
>>>> So, I will probably end up with touching those Makefiles more.
>>>>
>>>> All patches must go to the same tree.
>>>>
>>>>
>>>>>> 2017-11-05 14:30 GMT+09:00 Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>:
>>>>>> > arch/mips/boot/dts/brcm/bcm96358nb4ser.dts does not exist, so
>>>>>> > we cannot build bcm96358nb4ser.dtb .
>>>>>
>>>>> This appears to be due to the file being renamed in commit 695835511f96
>>>>> ("MIPS: BMIPS: rename bcm96358nb4ser to bcm6358-neufbox4-sercom").
>>>>> Please can you update the commit message when you resend to mention the
>>>>> cause of the problem.
>>>>>
>>>>> You could also add the following if you like while you're at it:
>>>>>
>>>>> Fixes: 695835511f96 ("MIPS: BMIPS: rename bcm96358nb4ser to bcm6358-neufbox4-sercom")
>>>>> Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # 4.9+
>>>
>>> I think this one can be applied independently and we'd want it to if
>>> we tag for stable. So I think it can go thru the MIPS tree.
>>>
>>
>>
>> As I said to MIPS folks, this patch must go before 2/2.
>>
>> You picked up only 2/2, so your dt/kbuild branch is broken.
>>
>>
>> make ARCH=mips allyesconfig
>> && make ARCH=mips CROSS_COMPILE=mips-linux- dtbs
>>
>>
>> will produce the following error.
>>
>>
>> make[2]: *** No rule to make target
>> 'arch/mips/boot/dts/brcm/bcm96358nb4ser.dtb', needed by '__build'.
>> Stop.
>> scripts/Makefile.build:570: recipe for target 'arch/mips/boot/dts/brcm' failed
>> make[1]: *** [arch/mips/boot/dts/brcm] Error 2
>> arch/mips/Makefile:413: recipe for target 'dtbs' failed
>> make: *** [dtbs] Error 2
>>
>
>
> Looking into it, probably
> bmips_dtb_defconfig was already broken regardless my patches.
>
> But, I am not comfortable with breaking all{yes,mod}config
> because they are often used for build test.
>
>
> I hope you can apply this in the order as I sent,
> with the following tag.
>
> Fixes: 695835511f96 ("MIPS: BMIPS: rename bcm96358nb4ser to
> bcm6358-neufbox4-sercom")
> Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # 4.9+

Okay, now applied.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
