From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: interrupts or interrupts-extended ?
Date: Thu, 7 May 2015 13:19:11 +0900
Message-ID: <CAK7LNASr0QwgvQqKsWbib0B79nznMjm0UzhVS1EHGc4YgrSWOg@mail.gmail.com>
References: <CAK7LNATcFzCV_3uaOnRDHLb=A+TPPDUeAoH_1QTUZDxYAB7VDg@mail.gmail.com>
	<3035159.qyhQB5YNxD@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3035159.qyhQB5YNxD@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Arnd,

2015-04-30 16:37 GMT+09:00 Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>:
> On Thursday 30 April 2015 14:57:19 Masahiro Yamada wrote:
>> Hello, device tree folks,
>>
>>
>> Can I ask a little piece of advice?
>>
>> Which is a preferred way for specifying an interrupt property,
>> interrupt-parent & interrupts, or interrupts-extended ?
>>
>>
>> There is only one interrupt controller on my SoC,
>> so I think either should work enough for me.
>>
>
> interrupts is well-understood by more people, I would pick that one normally,
> unless there is a need.
>
> The main purpose of interrupts-extended is to allow one device to have
> multiple interrupts that are handled by different controllers, without
> introducing a (more complex) interrupt-map property in the parent.

OK, I will use interrupt-parent & interrupts.
Thanks for you advice!


-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
