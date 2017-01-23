From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 4/8] clk: renesas: cpg-mssr: Add support for reset control
Date: Mon, 23 Jan 2017 11:14:11 +0100
Message-ID: <CAMuHMdUu=FwygW168GLVp2JtKbbB_R2wQLzq_3_TxLiu5ww6kA@mail.gmail.com>
References: <1484921306-9967-1-git-send-email-geert+renesas@glider.be>
 <1484921306-9967-5-git-send-email-geert+renesas@glider.be> <20170120220302.GA20610@bigcity.dyn.berto.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170120220302.GA20610@bigcity.dyn.berto.se>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Philipp Zabel <p.zabel@pengutronix.de>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Niklas,

On Fri, Jan 20, 2017 at 11:03 PM, Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
> Nice patch! It took me a while to understand why you didn't need to read
> the register before writing to it in cpg_mssr_deassert() :-)

Yeah, deassertion and assertion are asymmetrical.

Note that on older (not yet supported) SH/R-Mobile parts, there are no
reset clear registers, and deassertion is symmetrical.

> Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se=
>

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
