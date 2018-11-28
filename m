From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3] reset: Exclusive resets must be dedicated to a single
 hardware block
Date: Wed, 28 Nov 2018 10:28:25 +0100
Message-ID: <CAMuHMdX-X6dTJi6WgRKYVs-w+rxO3cJP8kX5AZwOXNO4qpgcqQ@mail.gmail.com>
References: <20181113133520.20889-1-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181113133520.20889-1-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 13, 2018 at 2:35 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> In some SoCs multiple hardware blocks may share a reset control.
> The reset control API for shared resets will only assert such a reset
> when the drivers for all hardware blocks agree.
> The exclusive reset control API still allows to assert such a reset, but
> that impacts all other hardware blocks sharing the reset.
>
> While the kernel doc comments clearly state that the API for shared
> resets applies to reset controls which are shared between hardware
> blocks, the exact meaning of exclusive resets is not documented.
> Fix the semantic ambiguity with respect to exclusive access vs.
> exclusive reset lines by:
>   1. Clarifying that exclusive resets really are intended for use with
>      reset controls which are dedicated to a single hardware block,
>   2. Ensuring that obtaining an exclusive reset control will fail if the
>      reset is shared by multiple hardware blocks, for both DT-based and
>      lookup-based reset controls.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Question from Philipp for the DT maintainers:
>
>    "I'd still like to hear the device tree maintainers' opinion on
>     parsing the whole DT for "resets" phandle properties to find shared
>     resets like this."

Mark, Rob: Ping?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
