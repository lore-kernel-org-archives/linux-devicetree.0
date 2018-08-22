Return-Path: <SRS0=qwJ1=LF=linaro.org=ulf.hansson@kernel.org>
MIME-Version: 1.0
In-Reply-To: <5a57cacd-2fdc-f1ab-d59f-859a709356cc@cogentembedded.com>
References: <5a57cacd-2fdc-f1ab-d59f-859a709356cc@cogentembedded.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 22 Aug 2018 11:49:01 +0200
Message-ID: <CAPDyKFpKuzSZi2nXPs03edfOHV+bfR_GJLcqv=7DDnfsvWrCDA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: tmio_mmc: document Renesas R8A77970 bindings
Content-Type: text/plain; charset="UTF-8"
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On 21 August 2018 at 21:14, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Document the R-Car V3M (R8A77970) SoC in the R-Car SDHI bindings -- it's
> the usual R-Car gen3 compatible controller with the internal DMA engine.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks, queued for v4.20!

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
> @@ -27,6 +27,7 @@ Required properties:
>                 "renesas,sdhi-r8a7795" - SDHI IP on R8A7795 SoC
>                 "renesas,sdhi-r8a7796" - SDHI IP on R8A7796 SoC
>                 "renesas,sdhi-r8a77965" - SDHI IP on R8A77965 SoC
> +               "renesas,sdhi-r8a77970" - SDHI IP on R8A77970 SoC
>                 "renesas,sdhi-r8a77980" - SDHI IP on R8A77980 SoC
>                 "renesas,sdhi-r8a77990" - SDHI IP on R8A77990 SoC
>                 "renesas,sdhi-r8a77995" - SDHI IP on R8A77995 SoC
