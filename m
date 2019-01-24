Return-Path: <SRS0=CXjO=QA=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1540542307-63158-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1540542307-63158-1-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Jan 2019 11:15:56 +0100
Message-ID: <CAMuHMdW-qt+3iNit1wVxN2JyRwCArJzBNvvjDZJyxYRjvDkLuA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a7796: Add CMT device nodes
Content-Type: text/plain; charset="UTF-8"
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, John Stultz <john.stultz@linaro.org>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Samuel Holland <samuel@sholland.org>
List-ID: <devicetree@vger.kernel.org>

Hi Biju,

On Fri, Oct 26, 2018 at 10:32 AM Biju Das <biju.das@bp.renesas.com> wrote:
> This patch adds CMT{0|1|2|3} device nodes for r8a7796 SoC.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> This patch is tested against renesas-dev
>
> I have executed on inconsistency-check, nanosleep and clocksource_switch
> selftests on this arm64 SoC. The inconsistency-check and nanosleep tests
> are working fine.The clocksource_switch asynchronous test is failing due
> to inconsistency-check failure on "arch_sys_counter".
>
> But if i skip the clocksource_switching of "arch_sys_counter", the
> asynchronous test is passing for CMT0/1/2/3 timer.
>
> Has any one noticed this issue?

clockevents/next now has commit 7cd6dca3600d8d71
("clocksource/drivers/arch_timer: Workaround for Allwinner A64 timer
instability").  Perhaps this is related, and the same test program may
indicate similar issues?

See also https://lore.kernel.org/lkml/20190113021719.46457-2-samuel@sholland.org/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
