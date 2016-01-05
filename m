From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of/platform: export of_default_bus_match_table
Date: Tue, 5 Jan 2016 08:21:33 -0600
Message-ID: <CAL_JsqLrt5s1igeA3=9kWDy+BD1Dvd6DfmBgU0Nc6PxUwdRG4w@mail.gmail.com>
References: <1451960273-19934-1-git-send-email-yamada.masahiro@socionext.com>
 <2748326.r4zEhnPneC@wuerfel> <CAK7LNAR3yxRoQ-qLCASAaCwzCZaSiXMbRjasfWf=X1O9P49fgw@mail.gmail.com>
 <4336094.nx25lSVlfU@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4336094.nx25lSVlfU@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 5, 2016 at 5:48 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Tuesday 05 January 2016 19:50:31 Masahiro Yamada wrote:
>> 2016-01-05 19:13 GMT+09:00 Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>:
>> > On Tuesday 05 January 2016 11:17:53 Masahiro Yamada wrote:
>>
>> This bus is used to connect external (on-board) devices with the SoC.
>>
>> So, no possibility for AMBA, but
>> I want "simple-bus" for grouping some device nodes.
>> Also, "simple-mfd" would be useful because an external device could be an MFD.
>>
>>
>> Please see arch/arm/boot/dts/uniphier-support-card.dtsi
>>
>> It describes an add-on card (expansion board)
>> which has ETHER, UART, etc. on it.
>>
>> I implemented it as "simple-bus".
>>
>> This card is connected to the chip select 1
>> of the UniPhier System Bus.
>>
>
> Ok, got it. So you could alternatively define your own match table
> in the driver with just "simple-bus" and  "simple-mfd". I think either
> way is fine, let's see what the DT maintainers prefer.

I'd like a wrapper function here and try to eliminate non-default
matches (as well as auxdata). All but a few callers pass either
of_default_bus_match_table or NULL (populate only the immediate
children). So no, I don't want to see more match tables. It shouldn't
hurt to have extra entries in the match table (BTW, we should also
kill off "amba-bus" which is an ambiguous term).

If the wrapper was done as a static inline, we'd still need this
export, so I'm fine with this change and will apply it.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
