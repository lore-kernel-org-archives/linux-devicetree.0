From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v4] pinctrl: sh-pfc: r8a7791: add R8A7743 support
Date: Tue, 16 May 2017 13:52:41 +0200
Message-ID: <CAMuHMdXFT9TUfKJH9+d22r9iEf2SYrKrK8jBqGYP4x4Zd8Wzdw@mail.gmail.com>
References: <20170420184615.615357989@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170420184615.615357989@cogentembedded.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Thu, Apr 20, 2017 at 8:46 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Renesas RZ/G1M (R8A7743) is pin compatible with R-Car M2-W/N (R8A7791/3),
> however it doesn't have several automotive specific peripherals. Annotate
> all the items that only exist on the R-Car SoCs and only supply  the pin
> groups/functions existing on a given SoC...
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Acked-by: Rob Herring <robh@kernel.org>

Thank you!

Queuing in sh-pfc-for-v4.13 after dropping the annotations, as they are
implied by pin groups/functions

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
