Return-Path: <SRS0=snf9=N6=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1540542307-63158-1-git-send-email-biju.das@bp.renesas.com> <1be47ef6-1a92-e032-12c1-1deae5b67960@linaro.org>
In-Reply-To: <1be47ef6-1a92-e032-12c1-1deae5b67960@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Nov 2018 11:32:38 +0100
Message-ID: <CAMuHMdUq-5NuBPFirw=3xk8r9voTcAqPnL0eL1LQYESAQzONCQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a7796: Add CMT device nodes
Content-Type: text/plain; charset="UTF-8"
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Thomas Gleixner <tglx@linutronix.de>, John Stultz <john.stultz@linaro.org>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Daniel,

On Mon, Nov 19, 2018 at 11:26 AM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
> On 26/10/2018 10:25, Biju Das wrote:
> > This patch adds CMT{0|1|2|3} device nodes for r8a7796 SoC.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> > This patch is tested against renesas-dev
> >
> > I have executed on inconsistency-check, nanosleep and clocksource_switch
> > selftests on this arm64 SoC. The inconsistency-check and nanosleep tests
> > are working fine.The clocksource_switch asynchronous test is failing due
> > to inconsistency-check failure on "arch_sys_counter".
> >
> > But if i skip the clocksource_switching of "arch_sys_counter", the
> > asynchronous test is passing for CMT0/1/2/3 timer.
> >
> > Has any one noticed this issue?
>
> So now that you mention that, I've been through the clocksource_switch
> on another ARM64 platform (hikey960) and disabled the
> ARM64_ERRATUM_858921 config option. I can see the same issue.
>
> Is this option set on your config ?

Note that r8a7796 does not have Cortex-A73, but A57/A53.
But let's wait for Biju's answer, to see if it makes a difference...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
