From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 6/7] clocksource/drivers/sh_cmt: r8a7740 and sh73a0
 SoC-specific match
Date: Thu, 22 Aug 2019 09:10:09 +0200
Message-ID: <CAMuHMdWSKvZqdrpwzMTMHu2cYg=-8ZpRYJi25ZxZ=CKdPy7v5w@mail.gmail.com>
References: <156630449239.17444.11157306180861080402.sendpatchset@octo> <156630455678.17444.15308898250025256159.sendpatchset@octo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <156630455678.17444.15308898250025256159.sendpatchset@octo>
Sender: linux-kernel-owner@vger.kernel.org
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Daniel Lezcano <daniel.lezcano@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Simon Horman <horms+renesas@verge.net.au>, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 20, 2019 at 2:34 PM Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Add SoC-specific matching for CMT1 on r8a7740 and sh73a0.
>
> This allows us to move away from the old DT bindings such as
>  - "renesas,cmt-48-sh73a0"
>  - "renesas,cmt-48-r8a7740"
>  - "renesas,cmt-48"
> in favour for the now commonly used format "renesas,<soc>-<device>"
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
