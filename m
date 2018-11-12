Return-Path: <SRS0=ZvLY=NX=linaro.org=ulf.hansson@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20181024222301.21455-4-chris.brandt@renesas.com>
References: <20181024222301.21455-1-chris.brandt@renesas.com> <20181024222301.21455-4-chris.brandt@renesas.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 12 Nov 2018 12:05:15 +0100
Message-ID: <CAPDyKFoTa4mUQmKrn+T_Qu5sbWCFxZZWYL1U9daA+bTJMYU3nw@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] dt-bindings: mmc: tmio_mmc: Document Renesas R7S9210
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-clk <linux-clk@vger.kernel.org>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 25 October 2018 at 00:23, Chris Brandt <chris.brandt@renesas.com> wrote:
> Document support for the RZ/A2 (R7S9210) SoC.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Applied for next, thanks!

Kind regards
Uffe

> ---
> v3:
>  * Added Reviewed-by from Rob and Simon
> v2:
>  * Documented that R7S9210 has 2 clocks
> ---
>  Documentation/devicetree/bindings/mmc/tmio_mmc.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> index 27f2eab2981d..9391ae9a1d9d 100644
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
> @@ -56,7 +57,7 @@ Required properties:
>           "core" and "cd". If the controller only has 1 clock, naming is not
>           required.
>           Devices which have more than 1 clock are listed below:
> -         2: R7S72100
> +         2: R7S72100, R7S9210
>
>  Optional properties:
>  - pinctrl-names: should be "default", "state_uhs"
> --
> 2.16.1
>
