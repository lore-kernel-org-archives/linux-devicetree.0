From: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [PATCH] powerpc: dts: use #include "..." to include local DT
Date: Wed, 21 Jun 2017 19:48:57 +1000
Message-ID: <87bmphu0vq.fsf@concordia.ellerman.id.au>
References: <1495602744-18874-1-git-send-email-yamada.masahiro@socionext.com> <CAK7LNARnkHTyAMXjPZnOxOkP_b8vc6qvYOv-wf_Fn0eaPSdpeA@mail.gmail.com> <87r2yogpc6.fsf@concordia.ellerman.id.au> <CAK7LNAS0tkpCuCjjCe=P_Qc2Q12B-+7YgAipko5n+AoeASpQnQ@mail.gmail.com> <87y3sv2hky.fsf@concordia.ellerman.id.au> <CAK7LNAQ2Ek3VEou_adaH3g8efSnJ7JgvHynzqR9Br4M+q8Mccw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK7LNAQ2Ek3VEou_adaH3g8efSnJ7JgvHynzqR9Br4M+q8Mccw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> writes:
> 2017-06-14 15:45 GMT+09:00 Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>:
>>
>> Acked-by: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
>
> I have not seen it in linux-next yet.
>
> Who will pick it up?

In the original patch you said:

  Fix them to remove -I$(srctree)/arch/$(SRCARCH)/boot/dts path from
  dtc_cpp_flags.

So I assumed there was a series somewhere that did that and included
this patch.

But if there isn't then I can just merge it.

cheers
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
