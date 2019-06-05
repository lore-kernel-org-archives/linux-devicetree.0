Return-Path: <SRS0=qvV9=UE=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20190604200914.64896-1-chris.brandt@renesas.com> <20190604200914.64896-3-chris.brandt@renesas.com>
In-Reply-To: <20190604200914.64896-3-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Jun 2019 15:19:06 +0200
Message-ID: <CAMuHMdXd=BSUbOYm1tshZBd76m=k3+tBeM62Z9Z7YN=_fJnGqw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: rza2mevb: Add input switch
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Jun 4, 2019 at 10:09 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Add support for input switch SW3 on the Renesas RZ/A2M EVB
> development board.
>
> Note that this uses the IRQ interrupt, as the RZ/A2 GPIO controller
> does not include interrupt support
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
