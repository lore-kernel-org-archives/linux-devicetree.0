Return-Path: <SRS0=3cpq=MK=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1536580430-17432-1-git-send-email-fabrizio.castro@bp.renesas.com> <1536580430-17432-2-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1536580430-17432-2-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Sep 2018 11:44:07 +0200
Message-ID: <CAMuHMdVmkLSVoUPX8QcPp5AWeae7iD4Vpz8QjA3nJw=T4J7Pkg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: arm: Document RZ/G2E SoC DT bindings
Content-Type: text/plain; charset="UTF-8"
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Sep 10, 2018 at 1:54 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Add device tree bindings documentation for Renesas RZ/G2E (r8a774c0)
> SoC.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
> index 4a03a6b..f5e0f82 100644
> --- a/Documentation/devicetree/bindings/arm/shmobile.txt
> +++ b/Documentation/devicetree/bindings/arm/shmobile.txt
> @@ -27,6 +27,8 @@ SoCs:
>      compatible = "renesas,r8a77470"
>    - RZ/G2M (R8A774A1)
>      compatible = "renesas,r8a774a1"
> +  - RZ/G2E (RA8774C0)

Silly typo no one noticed before: s/A8/8A/

> +    compatible = "renesas,r8a774c0"
>    - R-Car M1A (R8A77781)
>      compatible = "renesas,r8a7778"
>    - R-Car H1 (R8A77790)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
