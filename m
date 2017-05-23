From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] arm: dts: r7s72100: Add support for GR-Peach
Date: Tue, 23 May 2017 21:25:40 +0200
Message-ID: <CAMuHMdUovD=6YfJYckoftWyJZ3eRjcKFkScj=wLhyTDSFPavgw@mail.gmail.com>
References: <1495567254-10226-1-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1495567254-10226-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 23, 2017 at 9:20 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> Add device tree source for Renesas GR-Peach board.
> GR-Peach is an RZ/A1H based board with 10MB of on-chip SRAM and 8MB
> QSPI flash storage.
> Add support for the board, and create a 2MB partition to use as rootfs.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
