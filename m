From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v1 1/2] arm64: dts: renesas: r8a7795: use extended audio
 dmac register
Date: Wed, 20 Feb 2019 09:04:48 +0100
Message-ID: <CAMuHMdX7P_qeSSfWeUV1skkkD5BTCaZO8ys9FhdtjPZ4mP_UJA@mail.gmail.com>
References: <20190220052435.20508-1-jiada_wang@mentor.com> <20190220052435.20508-2-jiada_wang@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190220052435.20508-2-jiada_wang@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiada Wang <jiada_wang@mentor.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 20, 2019 at 6:25 AM Jiada Wang <jiada_wang@mentor.com> wrote:
> Basic audio dmac register only supports busif from 0 to 3,
> in order to use busif4 ~ busif7, extended audio dmac register
> need to be used.
>
> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
but please consider my comments to the cover letter.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
