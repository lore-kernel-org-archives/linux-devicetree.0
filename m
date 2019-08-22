From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 7/7] clocksource/drivers/sh_cmt: Document "cmt-48" as deprecated
Date: Thu, 22 Aug 2019 09:12:04 +0200
Message-ID: <CAMuHMdU6k5BJopgwTgKVVpbmmdN+nj24H5YUiJM8wCNP0fT9zQ@mail.gmail.com>
References: <156630449239.17444.11157306180861080402.sendpatchset@octo> <156630456771.17444.15687151782258703992.sendpatchset@octo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <156630456771.17444.15687151782258703992.sendpatchset@octo>
Sender: linux-kernel-owner@vger.kernel.org
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Daniel Lezcano <daniel.lezcano@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Simon Horman <horms+renesas@verge.net.au>, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 20, 2019 at 2:34 PM Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Update the CMT driver to mark "renesas,cmt-48" as deprecated.
>
> Instead of documenting a theoretical hardware device based on current software
> support level, define DT bindings top-down based on available data sheet
> information and make use of part numbers in the DT compat string.
>
> In case of the only in-tree users r8a7740 and sh73a0 the compat strings
> "renesas,r8a7740-cmt1" and "renesas,sh73a0-cmt1" may be used instead.
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
