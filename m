From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 04/11] soc: renesas: rcar-sysc: add R8A77980 support
Date: Thu, 15 Feb 2018 21:27:53 +0300
Message-ID: <23825513-3e8f-c36c-d557-78c9895abd9a@cogentembedded.com>
References: <46fca582-220d-e5a7-62cd-2fc77a29846b@cogentembedded.com>
 <0309d18d-d5d8-ab59-9c15-79b4093e0a51@cogentembedded.com>
 <CAMuHMdUQuUhbiPnO1L7t5W5F8wJ72iYLM5VtT4gg0RuePcx7RA@mail.gmail.com>
 <b61b4bd9-a1ac-8145-237f-71049a13b90f@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b61b4bd9-a1ac-8145-237f-71049a13b90f-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Content-Language: en-MW
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/15/2018 07:48 PM, Sergei Shtylyov wrote:

>>> Add support for R-Car V3H (R8A77980) SoC power areas to the R-Car SYSC
>>> driver.
>>>
>>> Based on the original (and large) patch by Vladimir Barinov.
>>>
>>> Signed-off-by: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
>>
>> Thanks for your patch!
>>
>>> --- /dev/null
>>> +++ renesas/drivers/soc/renesas/r8a77980-sysc.c
>>> @@ -0,0 +1,52 @@
> [...]
>>> +static const struct rcar_sysc_area r8a77980_areas[] __initconst = {
>>> +       { "always-on",      0, 0, R8A77980_PD_ALWAYS_ON, -1, PD_ALWAYS_ON },
>>> +       { "ca53-scu",   0x140, 0, R8A77980_PD_CA53_SCU, R8A77980_PD_ALWAYS_ON,
>>> +         PD_SCU },
>>> +       { "ca53-cpu0",  0x200, 0, R8A77980_PD_CA53_CPU0, R8A77980_PD_CA53_SCU,
>>> +         PD_CPU_NOCR },
>>> +       { "ca53-cpu1",  0x200, 1, R8A77980_PD_CA53_CPU1, R8A77980_PD_CA53_SCU,
>>> +         PD_CPU_NOCR },
>>> +       { "ca53-cpu2",  0x200, 2, R8A77980_PD_CA53_CPU2, R8A77980_PD_CA53_SCU,
>>> +         PD_CPU_NOCR },
>>> +       { "ca53-cpu3",  0x200, 3, R8A77980_PD_CA53_CPU3, R8A77980_PD_CA53_SCU,
>>> +         PD_CPU_NOCR },
>>> +       { "cr7",        0x240, 0, R8A77980_PD_CR7,      R8A77980_PD_ALWAYS_ON },
>>> +       { "a3ir",       0x180, 0, R8A77980_PD_A3IR,     R8A77980_PD_ALWAYS_ON },
>>> +       { "a2ir0",      0x400, 0, R8A77980_PD_A2IR0,    R8A77980_PD_ALWAYS_ON },
>>> +       { "a2ir1",      0x400, 1, R8A77980_PD_A2IR1,    R8A77980_PD_A2IR0 },
>>> +       { "a2ir2",      0x400, 2, R8A77980_PD_A2IR2,    R8A77980_PD_A2IR0 },
>>> +       { "a2ir3",      0x400, 3, R8A77980_PD_A2IR3,    R8A77980_PD_A2IR0 },
>>> +       { "a2ir4",      0x400, 4, R8A77980_PD_A2IR4,    R8A77980_PD_A2IR0 },
>>> +       { "a2ir5",      0x400, 5, R8A77980_PD_A2IR5,    R8A77980_PD_A2IR0 },
>>
>> Shouldn't all a2irN domains have a3ir as their parent?

   Finally found section 9.3 -- it seems you were right! :-)

>    Maybe.... I'd looked at the r8a77970-sysc.c and it also had A2IR0 as parent to all
> other A2IR<n> clocks.

   That one has the parenting wrong (after comparing to the manual) -- I'll prepare a fix.

>>> +       { "a3vip",      0x2c0, 0, R8A77980_PD_A3VIP,    R8A77980_PD_ALWAYS_ON },
>>> +       { "a3vip1",     0x300, 0, R8A77980_PD_A3VIP1,   R8A77980_PD_A3VIP },
>>> +       { "a3vip2",     0x280, 0, R8A77980_PD_A3VIP2,   R8A77980_PD_A3VIP },
>>
>> With the above fixed:
>> Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

   Thank you -- will add...

MBR, Sergei
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
