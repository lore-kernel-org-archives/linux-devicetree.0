From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] ARM: dts: iwg20m: Add MMCIF0 support
Date: Thu, 13 Jul 2017 18:31:33 +0200
Message-ID: <CAMuHMdV2f1oyi9dNGdGmqx7x7RNk10jomKQ4jHJ9wXNSEBKtNA@mail.gmail.com>
References: <1499853805-5915-4-git-send-email-chris.paterson2@renesas.com> <1499960340-25310-1-git-send-email-chris.paterson2@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1499960340-25310-1-git-send-email-chris.paterson2@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Paterson <chris.paterson2@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Biju Das <biju.das@bp.renesas.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 13, 2017 at 5:39 PM, Chris Paterson
<chris.paterson2@renesas.com> wrote:
> Define the iwg20m board dependent part of the MMCIF0 device node.
>
> Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> v1->v2:
>  - Corrected data pin group to mmc_data8_b - Thanks Geert.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
