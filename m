From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] ARM: dts: wheat: add support for tactile switches
Date: Tue, 6 Sep 2016 09:11:41 +0200
Message-ID: <CAMuHMdUyF6+T3EumGy5eyfqcio+n506fCTn1N40LEsbD2o_UYg@mail.gmail.com>
References: <5383928.8UnDsUpmkz@wasted.cogentembedded.com> <10465663.8teCsXZU7y@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <10465663.8teCsXZU7y@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 5, 2016 at 11:33 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add  support for the  tactile switches  SW2/3 (on the debug board) as a
> virtual keyboard like it  was done with the Blanche board).
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

DT syntax looks OK to me, I have no board schematics or documentation.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
