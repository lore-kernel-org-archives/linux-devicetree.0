From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH] powerpc: dts: use #include "..." to include local DT
Date: Wed, 21 Jun 2017 10:39:50 +0900
Message-ID: <CAK7LNAQ2Ek3VEou_adaH3g8efSnJ7JgvHynzqR9Br4M+q8Mccw@mail.gmail.com>
References: <1495602744-18874-1-git-send-email-yamada.masahiro@socionext.com>
 <CAK7LNARnkHTyAMXjPZnOxOkP_b8vc6qvYOv-wf_Fn0eaPSdpeA@mail.gmail.com>
 <87r2yogpc6.fsf@concordia.ellerman.id.au> <CAK7LNAS0tkpCuCjjCe=P_Qc2Q12B-+7YgAipko5n+AoeASpQnQ@mail.gmail.com>
 <87y3sv2hky.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87y3sv2hky.fsf-W0DJWXSxmBNbyGPkN3NxC2scP1bn1w/D@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2017-06-14 15:45 GMT+09:00 Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>:
> Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> writes:
>> 2017-06-13 19:21 GMT+09:00 Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>:
>>> Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> writes:
>>>>
>>>> (+Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>)
>>>>
>>>> Ping.
>>>> I am not 100% sure who is responsible for this,
>>>> but somebody, could take a look at this patch, please?
>>>
>>> Have you tested it actually works?
>>>
>>> It sounds reasonable, and if it behaves as you describe there is no
>>> change in behaviour, right?
>>
>> I do not have access to hardware,
>> but it is pretty easy to test this patch.
>>
>> $ make O=foo ARCH=powerpc CROSS_COMPILE=powerpc-linux-  dts/ac14xx.dtb
>>
>> gave me the DTB output.
>>
>> The binary comparison matched with/without this patch,
>> so I am sure there is no change in behavior.
>>
>> Likewise for mpc5121ads and pdm360ng.
>
> Thanks.
>
> Acked-by: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
>
>

I have not seen it in linux-next yet.

Who will pick it up?



-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
