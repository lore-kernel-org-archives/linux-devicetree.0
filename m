From: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [PATCH] powerpc: dts: use #include "..." to include local DT
Date: Mon, 03 Jul 2017 22:35:13 +1000
Message-ID: <87o9t1bsvy.fsf@concordia.ellerman.id.au>
References: <1495602744-18874-1-git-send-email-yamada.masahiro@socionext.com> <CAK7LNARnkHTyAMXjPZnOxOkP_b8vc6qvYOv-wf_Fn0eaPSdpeA@mail.gmail.com> <87r2yogpc6.fsf@concordia.ellerman.id.au> <CAK7LNAS0tkpCuCjjCe=P_Qc2Q12B-+7YgAipko5n+AoeASpQnQ@mail.gmail.com> <87y3sv2hky.fsf@concordia.ellerman.id.au> <CAK7LNAQ2Ek3VEou_adaH3g8efSnJ7JgvHynzqR9Br4M+q8Mccw@mail.gmail.com> <87bmphu0vq.fsf@concordia.ellerman.id.au> <CAK7LNAQBbZ7WcXN=3rxi0AQGJC8W_WKtGtmapEziLUre075J=g@mail.gmail.com> <CAK7LNASvupxqXnwm3hyEq7iGpHyActRbYjZ3v9xyd4qpxdVmLA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK7LNASvupxqXnwm3hyEq7iGpHyActRbYjZ3v9xyd4qpxdVmLA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> writes:

> Hi Michael,
>
> Ping.  Please apply this patch.
>
> I need this to clean up Makefiles in the next development cycle.

Sorry for some reason it didn't land in patchwork, so I keep forgetting
about it.

Have merged it now for 4.13.

cheers
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
