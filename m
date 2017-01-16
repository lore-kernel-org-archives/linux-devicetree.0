From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: document renesas-ostm timer
Date: Mon, 16 Jan 2017 11:30:19 +0100
Message-ID: <CAMuHMdVC2BV6=jT1CZ+X92=_th-cEc0=hsiyRYxU5qMLoMVPMw@mail.gmail.com>
References: <20170112185952.2780-1-chris.brandt@renesas.com>
 <20170112185952.2780-2-chris.brandt@renesas.com> <CAMuHMdX_hx2M8Q4y7gptJvad4cbb+M54DZVCmbhunKuk4esbGA@mail.gmail.com>
 <SG2PR06MB1165BA49D82D9C0835DC0FB38A7B0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <SG2PR06MB1165BA49D82D9C0835DC0FB38A7B0-ESzmfEwOt/xoAsOJh7vwSm0DtJ1/0DrXvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Brandt <Chris.Brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Chris,

On Sat, Jan 14, 2017 at 4:30 AM, Chris Brandt <Chris.Brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org> wrote:
> On Friday, January 13, 2017, Geert Uytterhoeven wrote:
>> > +The OSTM comes with 2 independent channels.
>> > +We will use the first channel (OSTM0) as a free running clocksource
>> > +and the second channel (OSTM1) as a interrupt driven clock event.
>> > +
>> > +Additionally we will use the clocksource channel (OTSM0) for the
>> > +system schedule timer sched_clock().
>>
>> The above two sentences are software policy, not hardware description.
>> Hence they do not belong in the DT bindings document.
>> You can move them to the commit description, though.
>
> OK.
>
>> > +Required Properties:
>> > +
>> > +  - compatible: must be one or more of the following:
>> > +    - "renesas,ostm-r7s72100" for the r7s72100 OSTM
>>
>> Please use "renesas,r7s72100-ostm" instead, to match current practices.
>
> If I look at the current r7s72100.dtsi:
>
> compatible = "renesas,r7s72100-cpg-clocks", "renesas,rz-cpg-clocks";
> compatible = "renesas,r7s72100-mstp-clocks", "renesas,cpg-mstp-clocks";
> compatible = "renesas,scif-r7s72100", "renesas,scif";
> compatible = "renesas,rspi-r7s72100", "renesas,rspi-rz";
> compatible = "renesas,riic-r7s72100", "renesas,riic-rz";
> compatible = "renesas,mtu2-r7s72100", "renesas,mtu2";
> compatible = "renesas,mmcif-r7s72100", "renesas,sh-mmcif";
> compatible = "renesas,sdhi-r7s72100";
>
> Is "renesas,xxx-r7s7210" the old way, and "renesas,r7s72100-xxx" is the new way??

Yes, we settled on "<vendor>,<family|soc>-<device>", per request of the
DT maintainers.

>> > +  - reg: base address and length of the registers block for each timer
>> channel.
>> > +    There should be 2 sets of addresses, one for each channel.
>> > +
>> > +  - interrupts: interrupt specifiers for the timers. There should be 2
>> > +    interupts, one for each channel.
>> > +
>> > +  - clocks: a list of phandle + clock-specifier pairs, one for each
>> entry
>> > +    channel. There should be 2 sets, one for each channel.
>>
>> Are the channels truly independent? If yes, I think it's better to have
>> two separate device nodes, one for each channel.
>> Each channel has its own module clock, so using separate devices means
>> Runtime PM can manage both channels through their module clocks as soon as
>> you add a "power-domains" property pointing to the clock domain controller.
>
> Yes, technically they are independent channels.
> The way the driver is currently written, 1 instance of the driver uses 2 channels
> for different things. Ch0 will be set up as a 'clocksource', and ch1 will be set up
> as a 'clock event'.
>
> As in:
>
> static int __init ostm_timer_init(struct ostm_device *ostm)
> {
>         int ret = 0;
>
>         /* ostm0 will be clock source */
>         ret = ostm_init_clksrc(ostm);
>         if (ret)
>                 goto err;
>
>         /* use ostm0 as system scheduling clock */
>         ret = ostm_init_sched_clock(&ostm->clksrc);
>         if (ret)
>                 goto err;
>
>         /* ostm1 will be clock event */
>         ret = ostm_init_clkevt(ostm);
> err:
>         return ret;
> }
>
>
>
> Do you think it would be better if a driver instance only does 1 thing: Either
> 'clocksource' or 'clock event'??
> Then, I would make 2 ostm nodes and pass in the mode I would like it operate in?
>
> For example:
>
> &ostm0 {
>         mode = "clocksource";
>         status = "okay";
> };
>
> &ostm1 {
>         mode = "clock-event";
>         status = "okay";
> };

Again, that's software policy, not hardware description.

As they're independent channels, it doesn't matter which one is used for
which function, right?

You could use the first probed channel for the most important function
(clocksource?), and the second one for the other function (clockevent).
So there's no need for specifying this in DT.

Does that make sense?

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
