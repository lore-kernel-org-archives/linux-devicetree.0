From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v1 0/2] rsnd: dts: change to use extended audio dmac register
Date: Wed, 20 Feb 2019 09:04:13 +0100
Message-ID: <CAMuHMdX1OqmwtCAtx8mxQtrG0D6bxkJ-trkA50qw=t16kBfdTQ@mail.gmail.com>
References: <20190220052435.20508-1-jiada_wang@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190220052435.20508-1-jiada_wang@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiada Wang <jiada_wang@mentor.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Jiada,

On Wed, Feb 20, 2019 at 6:25 AM Jiada Wang <jiada_wang@mentor.com> wrote:
> According to user reference manual for R-CAR H3 and M3-W SoCs,
> in order to access busif4 ~ busif7, extended audio dmac registers
> (PDMASAREn, PDMADAREn, PDMACHCREn)
> need to be used, rather than basic audio dmac registers
> (PDMASARn, PDMADARn, PDMACHCRn)
>
> This patch set updates H3 (= r8a7795) and M3-W (= r8a7796)
> to use extended audio dmac registers

The same change should be applied for M3-N and RZ/G2M, right?

R-Car E3 and RZ/G2E already use the extended register set, as they do not
have the basic set.

For SoCs having both, this feels a bit like describing software policy, instead
of hardware, to me. Would it make sense to extend the audio bindings, and
allow describing both the basic and extended register sets, and let the driver
make the decision which one to use?

Thanks!

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
