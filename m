From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH 0/4] Migrate PXA27x platforms to clock framework
Date: Fri, 04 Jul 2014 00:14:49 +0200
Message-ID: <87lhsanl7q.fsf@free.fr>
References: <1404066744-13416-1-git-send-email-robert.jarzmik@free.fr>
	<7034630.fvV46PN35C@wuerfel> <877g3yp7ie.fsf@free.fr>
	<CAN1soZyu192Y7z-HJHo+3_bddFcf=H0udgJSWez1=Lmrb5wVfg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAN1soZyu192Y7z-HJHo+3_bddFcf=H0udgJSWez1=Lmrb5wVfg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Haojian Zhuang's message of "Thu, 3 Jul 2014 14:21:14 +0800")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

>> Haojian, are you ok with that ? And BTW, does a combined kernel for PXA
>> platforms even exists (mixing pxa3xx and pxa2xx for example) ?
>>
>
> It's acceptable to me that different silicons are queued in different stages.
> I only request that it won't break the compiler building & bootup.
OK.

>
> But I think that the pxa clock driver may be shared among all PXA silicons
> except for the clock table. What's your opinion?
I don't think so because of the core clocks.
These ones are specific to each pxa, and so their computation is :
 - pxa25x plays with CCCR and specific L, M and N2 multiplication tables
 - pxa27x plays with CCCR and specific L, M and N2 multiplication tables
 - pxa3xx plays with ASCR, MEMCLKCFG, and AC97 div

I don't see very well how a clock table could describe that. Do you have
something specific in mind ?

>>> Also (for my understanding) when you say that you plan to do
>>> pxa25x and pxa3xx next, does that include pxa26x and pxa93x?
>> I don't have the Technical Reference Manuals for these ones so the answer is
>> no. And Google wasn't a great friend at providing them.
>>
>
> Converting them into new clock driver may not rely on the reference manual.
Actually I went through the code and :
 - pxa26x is only a superset of pxa25x with one more clock : pxa26x-gpio
 - pxa93x is the same clock set as pxa3xx, right ?
So if I convert pxa25x, pxa27x and pxa3xx I'll cover everything, right ?

>>> I assume it does as they are apparently minor revisions of the
>>> former, but it's not completely clear from your description.
>> My description doesn't mention them, as I have no information about them, nor
>> any hardware to test on.
>>
>
> We can request others to help testing in the mailing list.
That's exactly what will enable pxa25x and pxa3xx. I have them converted in my
tree, but I don't want to mix these patches in as I can't test them, and testing
brings in bigger delays.

Cheers.

-- 
Robert
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
