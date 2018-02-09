From: Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v1 2/2] clk: npcm: add NPCM7xx clock driver
Date: Thu, 8 Feb 2018 16:07:44 -0800
Message-ID: <CAFd5g44vTyOciaT5+YcVOdxd0=7sxWb3r+gO6_DFv3bmS=EL-w@mail.gmail.com>
References: <1517818975-11427-1-git-send-email-tmaimon77@gmail.com>
 <1517818975-11427-3-git-send-email-tmaimon77@gmail.com> <CAFd5g445Ae-uBO52sn1WH67tMgc0n_sbi6cS-SuKLhR__D98kg@mail.gmail.com>
 <CAHb3i=un-LjnV+DWBMkEcDKNFyEi63wh0RR0dHWsHpv2K9erTw@mail.gmail.com> <CAHb3i=uvj_KS4tZ_qZjQdMZ2CCg9_+11FbmvmF4D5DFGtaAW=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHb3i=uvj_KS4tZ_qZjQdMZ2CCg9_+11FbmvmF4D5DFGtaAW=g@mail.gmail.com>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tali Perry <tali.perry1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?UTF-8?Q?=E2=80=8B_Tomer_Maimon?= <tmaimon77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Avi Fishman <avifishman70-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, OpenBMC Maillist <openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

<snip>
>> +
>> +       /* Define fixed clocks.
>> +        * Notice: the following clocks are fixed value on NPCM7XX and should
>> +        * not be changed.
>> +        * therefor they are not exposed to the dev tree .
>
> I am not convinced. The top level .dtsi is usually SoC specific.
>
> - CLKREF should be fixed on 25MHz. I didn't want to put it in DT since
> it might appear as something that is changeable.
>  on npcm750 all clocks are set in ROM +BB (several possible settings)
> , so this entire driver is only used for reading the current clock
> settings. All clocks are read only and derived from CLKREF. CLKREF is
> fixed so no point in putting it in DT and exposing it outside of this
> driver.

I understand your rationale, but the *.dtsi is typically used to describe the
SoC, things that cannot change. For example, consider
arch/arm/boot/dts/nuvoton-npcm750.dtsi, it describes the CPU cores, cache
hierarchy, peripherals and what busses they reside on, memory layout, etc. None
of these things are configurable; the *.dtsi just describes the SoC. Typically,
a *.dts is made for a particular board and imports a *.dtsi and does some
configuration, but it is not supposed to override things like what I listed
above (amoung other things).

There are several reasons that you put this information that cannot change in a
*.dtsi. For one it is a convenient, all in one place description of the SoC that
serves as a form of documentation. But more importantly, if you were to create a
variation of the 750 with a different number of cores, a different memory
layout, a different reference clock, etc, you could potentiallly use the same
drivers for both SoCs, and you would only have to write a new *.dtsi. I know you
may have no intention to do this, but many other CPU vendors do. And for this
reason, this is how drivers are expected to be written.

I hope this makes sense.

>
>> +        */
>> +       pr_debug("\tclk register fixed clocks\n");
>> +       hw = clk_hw_register_fixed_rate(NULL, NPCM7XX_CLK_S_REFCLK,
>> +               NULL, 0, 25000000);
>> +       hw = clk_hw_register_fixed_rate(NULL, NPCM7XX_CLK_S_SYSBYPCK,
>> +               NULL, 0, 800000000); // rarely used. mostly testing. TBD: remove
>> +       hw = clk_hw_register_fixed_rate(NULL, NPCM7XX_CLK_S_MCBYPCK,
>> +               NULL, 0, 800000000); // rarely used.  mostly testing. TBD:remove
>> +
>> +
<snip>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
