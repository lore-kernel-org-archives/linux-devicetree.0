From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v4 1/1] arm64: dts: renesas: use extended audio dmac register
Date: Tue, 26 Mar 2019 11:09:45 +0100
Message-ID: <CAMuHMdUOcPhy5D-RagprwZkqOOgNt+4bGfSLQzydydHBOt76kQ@mail.gmail.com>
References: <20190326095826.4987-1-jiada_wang@mentor.com> <20190326095826.4987-2-jiada_wang@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190326095826.4987-2-jiada_wang@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiada Wang <jiada_wang@mentor.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 26, 2019 at 10:59 AM Jiada Wang <jiada_wang@mentor.com> wrote:
> Basic audio dmac register only supports busif from 0 to 3,
> in order to use busif4 ~ busif7, extended audio dmac register
> need to be used.
>
> This patch updates H3 (= r8a7795), M3-W (= r8a7796) and
> M3-N (=r8a77965) to use extended audio dmac register set.
>
> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
