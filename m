Return-Path: <SRS0=f8OU=J5=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180712030149.91385-1-chris.brandt@renesas.com>
 <20180712030149.91385-2-chris.brandt@renesas.com> <CAMuHMdX4BPxQY__2DYrUGMBFZPMm_x_jxaBvG+EAPR0fWreAew@mail.gmail.com>
 <TY1PR01MB156277033682C5749AE209368A590@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdU6HwCF_W71D=kJn8DEzMjJepM19-3tO3dkVPKKJbYmQg@mail.gmail.com> <TY1PR01MB1562F7AD3087B21EBF325C0D8A590@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1562F7AD3087B21EBF325C0D8A590@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Jul 2018 12:06:03 +0200
Message-ID: <CAMuHMdWs=s4CHdYhj6BbFUPUkTNMv5r1mFJ8WAjnV6MtupLMTA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: shmobile: Add basic RZ/A2 SoC support
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Thu, Jul 12, 2018 at 7:34 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Thursday, July 12, 2018, Geert Uytterhoeven wrote:
> > Yeah, that's why I asked: setup-r7s72100.c is the smallest setup file.
> >
> > It uses shmobile_init_delay() to preset loops-per-jiffy, to avoid
> > calibrating the
> > delay loop, and shmobile_init_late() to make s2ram do more than s2idle.
> > As RZ/A doesn't have SMP, and thus there's no use for disabling secondary
> > CPU cores, the impact of the latter is small (read: I don't know what's
> > the real
> > impact of calling cpu_idle_poll_ctrl()).
>
> It's been quite a while, but I remember when porting RZ/A1 code that
> without those two functions, things didn't work right. Of course that was
> many releases ago.

Right, you may not have had an early timer running yet, causing the loop
calibration to hang. May have been fixed by ostm support.

> However, one thing that I know I need is
>
> +       .l2c_aux_val    = 0,
> +       .l2c_aux_mask   = ~0,
>
> Without that, I don't get my L2C driver loaded.
>
> Hence:
> a96bb197693e ("ARM: 8660/1: shmobile: r7s72100: Enable L2 cache")
>
> So at least for now, I would say I still need the setup file.

I forgot about the L2C. Yeah, it's a pity we still need board code to
enable the PL310 cache with default settings.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
