From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] powerpc: dts: use #include "..." to include local DT
Date: Wed, 21 Jun 2017 18:52:27 +0900
Message-ID: <CAK7LNAQBbZ7WcXN=3rxi0AQGJC8W_WKtGtmapEziLUre075J=g@mail.gmail.com>
References: <1495602744-18874-1-git-send-email-yamada.masahiro@socionext.com>
 <CAK7LNARnkHTyAMXjPZnOxOkP_b8vc6qvYOv-wf_Fn0eaPSdpeA@mail.gmail.com>
 <87r2yogpc6.fsf@concordia.ellerman.id.au> <CAK7LNAS0tkpCuCjjCe=P_Qc2Q12B-+7YgAipko5n+AoeASpQnQ@mail.gmail.com>
 <87y3sv2hky.fsf@concordia.ellerman.id.au> <CAK7LNAQ2Ek3VEou_adaH3g8efSnJ7JgvHynzqR9Br4M+q8Mccw@mail.gmail.com>
 <87bmphu0vq.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87bmphu0vq.fsf@concordia.ellerman.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, Anatolij Gustschin <agust@denx.de>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

2017-06-21 18:48 GMT+09:00 Michael Ellerman <mpe@ellerman.id.au>:
> Masahiro Yamada <yamada.masahiro@socionext.com> writes:
>> 2017-06-14 15:45 GMT+09:00 Michael Ellerman <mpe@ellerman.id.au>:
>>>
>>> Acked-by: Michael Ellerman <mpe@ellerman.id.au>
>>
>> I have not seen it in linux-next yet.
>>
>> Who will pick it up?
>
> In the original patch you said:
>
>   Fix them to remove -I$(srctree)/arch/$(SRCARCH)/boot/dts path from
>   dtc_cpp_flags.
>
> So I assumed there was a series somewhere that did that and included
> this patch.
>
> But if there isn't then I can just merge it.
>

Yes, please apply.


At first, I sent a series including ARM, PowerPC, Makefile changes,
but I decided to split per-subsystem after all.

Sorry for confusion.



-- 
Best Regards
Masahiro Yamada
