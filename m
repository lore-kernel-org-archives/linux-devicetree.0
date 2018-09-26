Return-Path: <SRS0=waES=MI=linaro.org=ulf.hansson@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1537896187-35013-1-git-send-email-biju.das@bp.renesas.com>
References: <1537896187-35013-1-git-send-email-biju.das@bp.renesas.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 27 Sep 2018 01:49:04 +0200
Message-ID: <CAPDyKFq6LwoXYGRQNbvWRBxttO4kqBrTvUwLpOj6W2VmUaeZmQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: renesas_sdhi: Add r8a7744 support
Content-Type: text/plain; charset="UTF-8"
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 25 September 2018 at 19:23, Biju Das <biju.das@bp.renesas.com> wrote:
> Add support for r8a7744 SoC. Renesas RZ/G1N (R8A7744) SDHI is identical
> to the R-Car Gen2 family.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Applied for next, thanks!

Kind regards
Uffe

> ---
>  Documentation/devicetree/bindings/mmc/tmio_mmc.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> index 8f3a113..21d671a 100644
> --- a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> +++ b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> @@ -16,6 +16,7 @@ Required properties:
>                 "renesas,sdhi-r8a73a4" - SDHI IP on R8A73A4 SoC
>                 "renesas,sdhi-r8a7740" - SDHI IP on R8A7740 SoC
>                 "renesas,sdhi-r8a7743" - SDHI IP on R8A7743 SoC
> +               "renesas,sdhi-r8a7744" - SDHI IP on R8A7744 SoC
>                 "renesas,sdhi-r8a7745" - SDHI IP on R8A7745 SoC
>                 "renesas,sdhi-r8a77470" - SDHI IP on R8A77470 SoC
>                 "renesas,sdhi-r8a7778" - SDHI IP on R8A7778 SoC
> --
> 2.7.4
>
