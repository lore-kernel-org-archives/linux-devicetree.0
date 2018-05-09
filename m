Return-Path: <SRS0=7nnO=H4=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1524227264-24896-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1524227264-24896-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1524227264-24896-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 May 2018 18:56:44 +0200
Message-ID: <CAMuHMdW52m=N4mTbdnQGT=O-vH3AMdbQ_H8b+PsxVZ_nukxrcw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: renesas: cpg-mssr: Add support for R-Car E3
Content-Type: text/plain; charset="UTF-8"
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Shimoda-san,

On Fri, Apr 20, 2018 at 2:27 PM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> --- /dev/null
> +++ b/drivers/clk/renesas/r8a77990-cpg-mssr.c
> @@ -0,0 +1,289 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

For the record: SPDX lines in C source files should use C++-style comments,
as recent checkpatch complains about.

Fixed for the pull request.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
