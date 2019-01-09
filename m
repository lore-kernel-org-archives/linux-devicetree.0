Return-Path: <SRS0=ECh7=PR=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <038a791d-aa57-9c3d-eaea-09c5704ecb54@cogentembedded.com> <f9c6b067-80ba-c3c6-abcb-57d9524972fc@cogentembedded.com>
In-Reply-To: <f9c6b067-80ba-c3c6-abcb-57d9524972fc@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Jan 2019 09:29:12 +0100
Message-ID: <CAMuHMdWV92SY2VOXBObr56nf=kA4C4G1jn1QQK7UizcF02v9ig@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: v3msk: specify EtherAVB PHY IRQ
Content-Type: text/plain; charset="UTF-8"
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Jan 8, 2019 at 8:57 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Specify EtherAVB PHY IRQ in the V3M Starter Kit board's device tree, now
> that we have the GPIO support (previously phylib had to resort to polling).
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
