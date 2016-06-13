From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 07/13] ARM: dts: r8a7792: initial SoC device tree
Date: Mon, 13 Jun 2016 13:48:33 +0200
Message-ID: <CAMuHMdWbkdaDZPfwe7r0=bDbF-RcvddihAJi4VFGonqUnuvTkw@mail.gmail.com>
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
 <2539026.OyU5nvpxa6@wasted.cogentembedded.com> <20160601005751.GG20527@verge.net.au>
 <fdab2628-60bd-c41b-296b-38cd71a6c5da@cogentembedded.com> <CAMuHMdUkOpEp+YCbZVZppdN4C7KKpDS9_gEuXi_WKZXM9YHgEQ@mail.gmail.com>
 <ab5e3a98-7ff2-dc8f-d255-f6da26f43527@cogentembedded.com> <20160610010245.GA10152@verge.net.au>
 <8efb1c7e-5463-2556-744c-d327886d92d4@cogentembedded.com> <CAMuHMdUK=y2kZY1kA97QpCDyUZXFejpXTpO9ZVNQoBfDNoRgfg@mail.gmail.com>
 <1b9a4cf4-1101-ccbf-772b-49b8a689a1b6@cogentembedded.com> <CAMuHMdV6f5ZzPxySzCgi7L+Sr1_4Ph1sLLyQ_j-sJ0tmBOvrHg@mail.gmail.com>
 <7d93d81d-cca9-e434-6488-0ea839f81663@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7d93d81d-cca9-e434-6488-0ea839f81663-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Mon, Jun 13, 2016 at 1:24 PM, Sergei Shtylyov
<sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
> On 6/13/2016 10:12 AM, Geert Uytterhoeven wrote:
>>>>>    The only problem I'm seeing (again) is the RCAN clock failing to
>>>>> register:
>>>>>
>>>>> rcar_gen2_cpg_clocks_init: failed to register cpg_clocks rcan clock
>>>>> (-12)
>>>>>
>>>>>    I was going to look at it yesterday but (wrongly) thought it somehow
>>>>> cured itself... I'll look at it now.
>>>>
>>>>
>>>> The RCAN parent is the second clock in the CPG node's "clocks" property,
>>>> which you didn't provide.
>>>
>>>
>>>    Actually, the things are more complex. The figure 7.1c suggests that
>>> the
>>> RCAN clock has different parent on R8A7792 than on the other SoCs --
>>> namely
>>> PLL1/VCO 1/4. That may be, since there's just no USB_EXTAL signal on this
>>> SoC (it doesn't seem to support any USB IPs). Which means the
>>> 'clk-rcar-gen2' driver can't work with the RCAN clock in its current
>>> form.
>>
>> Right, I had forgotten about that.
>> Fortunately the clk-rcar-gen2 driver has a sane failure mode for this case
>> ;-)
>
>    What do you mean?

I mean that it failed due to the missing parent clock, instead of continuing
silently with a wrong clock rate.

>> it seems the RCAN clock can just be modeled as a fixed clock. However,
>> its divider value isn't clear to me,
>
>    IIRC, the fixed RCAN divisor was equal to 6.

1560 / 6 != 15.9.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
