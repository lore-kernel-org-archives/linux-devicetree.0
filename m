Return-Path: <SRS0=F8cI=J4=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180712030149.91385-1-chris.brandt@renesas.com>
 <20180712030149.91385-2-chris.brandt@renesas.com> <CAMuHMdX4BPxQY__2DYrUGMBFZPMm_x_jxaBvG+EAPR0fWreAew@mail.gmail.com>
 <TY1PR01MB156277033682C5749AE209368A590@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB156277033682C5749AE209368A590@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jul 2018 19:20:37 +0200
Message-ID: <CAMuHMdU6HwCF_W71D=kJn8DEzMjJepM19-3tO3dkVPKKJbYmQg@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: shmobile: Add basic RZ/A2 SoC support
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Thu, Jul 12, 2018 at 5:40 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Thursday, July 12, 2018, Geert Uytterhoeven wrote:
> > I'm wondering if you could do without any board code, i.e. without
> > setup-r7s9210.c?
>
> I think I see them being removed for R-Car.
> But....I'm not sure how that actually works.
>
> I'll have a look.
>
> As you can see, there's really nothing in the RZ/A1 setup file either.

Yeah, that's why I asked: setup-r7s72100.c is the smallest setup file.

It uses shmobile_init_delay() to preset loops-per-jiffy, to avoid
calibrating the
delay loop, and shmobile_init_late() to make s2ram do more than s2idle.
As RZ/A doesn't have SMP, and thus there's no use for disabling secondary
CPU cores, the impact of the latter is small (read: I don't know what's the real
impact of calling cpu_idle_poll_ctrl()).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
