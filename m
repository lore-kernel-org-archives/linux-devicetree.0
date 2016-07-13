From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] ARM: dts: r8a7792: remove ADSP clock
Date: Wed, 13 Jul 2016 03:23:10 +0200
Message-ID: <CAMuHMdVkWPrfA0dc_pS1w2C7AB9mO+D59RiL1RLcFBg9W_tecQ@mail.gmail.com>
References: <1529351.Fac5N2tKoF@wasted.cogentembedded.com> <6927311.Po2EPBmxEp@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <6927311.Po2EPBmxEp@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 11, 2016 at 11:52 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Simon Horman told  me  that R8A7792 had ADSP clock (based on the most recent

... based on a probably incorrect table in ...

> R-Car gen2 manual) but when I  got that manual as well, this claim proved
> to be false: R8A7792 is the only gen2 SoC that doesn't  have ADSP at all.
> Remove that  clock  for good...
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
