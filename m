From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/4] arm64: dts: renesas: Add Support for R-Car D3 and Draak
Date: Thu, 20 Jul 2017 15:00:49 +0200
Message-ID: <CAMuHMdXhTVLfp_j0SA4u8A0q0GhBrX7sGKNDEQu9=2jfaKMkUA@mail.gmail.com>
References: <1500555277-22921-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1500555277-22921-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 20, 2017 at 2:54 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> This patch series adds minimal support for the R-Car D3 SoC and the
> Draak development board, allowing to boot from a ramdisk using a serial
> console.

>   arm64: dts: renesas: r8a77995: Use r8a7795-sysc binding definitions
>   arm64: dts: renesas: r8a77995: Use r8a7795-cpg-mssr binding
                                       ^^^^^^^
                                       r8a77995

Bummer, these were the first (and definitely not the last :-( typos for R-Car
D3 part numbers...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
