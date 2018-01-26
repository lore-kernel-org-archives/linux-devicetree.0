From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC 08/37] ARM: dts: r8a7794: Adjust SMP routine size
Date: Fri, 26 Jan 2018 10:54:14 +0100
Message-ID: <CAMuHMdUFQKsLdw5XT6MGztH8o8FT69gxuZZyW1R_sdth7bw=tQ@mail.gmail.com>
References: <1516903391-30467-1-git-send-email-fabrizio.castro@bp.renesas.com> <1516903391-30467-9-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1516903391-30467-9-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-clk-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wim Van Sebroeck <wim@iguana.be>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Guenter Roeck <linux@roeck-us.net>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.orglinux-clk <l>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 25, 2018 at 7:02 PM, Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> This patch adjusts the definition of the SMP routine size according
> to the latest changes made by commit:
> "ARM: shmobile: Add watchdog support"
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>

I would make it a bit larger, though. "0x64" is the strict minimum =>
0x80? 0x100?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
