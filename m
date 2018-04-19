Return-Path: <SRS0=AqS/=HI=linaro.org=ulf.hansson@kernel.org>
MIME-Version: 1.0
In-Reply-To: <cee91fe1-7bf0-e4c8-d6a9-5653be3358b0@cogentembedded.com>
References: <cee91fe1-7bf0-e4c8-d6a9-5653be3358b0@cogentembedded.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 19 Apr 2018 15:18:21 +0200
Message-ID: <CAPDyKFo2Q12dtjyDAjTgLwEHi_91AC3Gn3JYU42cR9e11jF8cQ@mail.gmail.com>
Subject: Re: [PATCH] DT: mmc: tmio_mmc: document R8A77980 bindings
Content-Type: text/plain; charset="UTF-8"
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Mark Rutland <mark.rutland@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 16 April 2018 at 20:30, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Document the R-Car V3H (R8A77980) SoC in the Renesas SDHI bindings.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks, applied for next!

Kind regards
Uffe

>
> ---
> This patch is against the 'next' branch of Ulf Hansson's 'mmc.git' repo.
>
>  Documentation/devicetree/bindings/mmc/tmio_mmc.txt |    1 +
>  1 file changed, 1 insertion(+)
>
> Index: mmc/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> ===================================================================
> --- mmc.orig/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> +++ mmc/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> @@ -26,6 +26,7 @@ Required properties:
>                 "renesas,sdhi-r8a7794" - SDHI IP on R8A7794 SoC
>                 "renesas,sdhi-r8a7795" - SDHI IP on R8A7795 SoC
>                 "renesas,sdhi-r8a7796" - SDHI IP on R8A7796 SoC
> +               "renesas,sdhi-r8a77980" - SDHI IP on R8A77980 SoC
>                 "renesas,sdhi-r8a77995" - SDHI IP on R8A77995 SoC
>                 "renesas,sdhi-shmobile" - a generic sh-mobile SDHI controller
>                 "renesas,rcar-gen1-sdhi" - a generic R-Car Gen1 SDHI controller
