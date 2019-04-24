Return-Path: <SRS0=Wr9D=S2=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1555379752-5980-1-git-send-email-cv-dong@jinso.co.jp>
In-Reply-To: <1555379752-5980-1-git-send-email-cv-dong@jinso.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Apr 2019 09:49:09 +0200
Message-ID: <CAMuHMdV42AY-ihUpfoOYraTWn6Pf=b6W15pq5sp97OdeZSGebw@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add TPU support for R-Car H3/M3-W/M3-N
Content-Type: text/plain; charset="UTF-8"
To: Cao Van Dong <cv-dong@jinso.co.jp>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>, Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>, Hoan Nguyen An <na-hoan@jinso.co.jp>
List-ID: <devicetree@vger.kernel.org>

Hi Cao,

On Tue, Apr 16, 2019 at 3:56 AM Cao Van Dong <cv-dong@jinso.co.jp> wrote:
> This series adds tpu support for r8a7795/r8a7796/r8a77965 SoCs.
> Based on the renesas-drivers-2019-04-02-v5.1-rc3 tag of renesas-drivers tree.
>
> For test: After booting, I found the device was registered in the boot log.

Thanks for your series!

> Cao Van Dong (4):
>   arm64: dts: renesas: r8a7795: Add TPU support
>   arm64: dts: renesas: r8a7796: Add TPU support
>   arm64: dts: renesas: r8a77965: Add TPU support
>   dt-bindings: pwm: renesas: tpu: Document R8A779{5|6|65} bindings
>
>  Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt |  3 +++
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi                  | 11 +++++++++++
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi                  | 11 +++++++++++
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi                 | 11 +++++++++++
>  drivers/clk/renesas/r8a7795-cpg-mssr.c                    |  1 +
>  drivers/clk/renesas/r8a7796-cpg-mssr.c                    |  1 +
>  drivers/clk/renesas/r8a77965-cpg-mssr.c                   |  1 +
>  7 files changed, 39 insertions(+)

Please split off the clock driver changes into separate patches, as DTS and
clock driver changes go in through different subsystem/maintainer paths.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
