Return-Path: <SRS0=Of4m=MW=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20181008162349.42957-1-chris.brandt@renesas.com> <20181008162349.42957-4-chris.brandt@renesas.com>
In-Reply-To: <20181008162349.42957-4-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Oct 2018 10:42:37 +0200
Message-ID: <CAMuHMdXRKOggSQo8uX3iKXF+6y+6HgkgoP7m0xKUsTmZ8STVVw@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: mmc: tmio_mmc: Document Renesas R7S9210
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-clk <linux-clk@vger.kernel.org>, Linux MMC List <linux-mmc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Mon, Oct 8, 2018 at 6:24 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Document support for the RZ/A2 (R7S9210) SoC.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> +++ b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> @@ -13,6 +13,7 @@ Required properties:
>  - compatible: should contain one or more of the following:
>                 "renesas,sdhi-sh73a0" - SDHI IP on SH73A0 SoC
>                 "renesas,sdhi-r7s72100" - SDHI IP on R7S72100 SoC
> +               "renesas,sdhi-r7s9210" - SDHI IP on R7S9210 SoC
>                 "renesas,sdhi-r8a73a4" - SDHI IP on R8A73A4 SoC
>                 "renesas,sdhi-r8a7740" - SDHI IP on R8A7740 SoC
>                 "renesas,sdhi-r8a7743" - SDHI IP on R8A7743 SoC

With

          Devices which have more than 1 clock are listed below:
-         2: R7S72100
+         2: R7S72100, R7S9210

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
