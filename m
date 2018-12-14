From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] dt-bindings: PCI: rcar: Add device tree support for r8a774c0
Date: Fri, 14 Dec 2018 11:29:19 +0100
Message-ID: <CAMuHMdUqNR5jKQXvC5gy5r44Jp+cbo8iorfCFpwBHNCu16RH0w@mail.gmail.com>
References: <1544732500-6866-1-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544732500-6866-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci <linux-pci@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Fabrizio,

On Thu, Dec 13, 2018 at 9:21 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Add PCIe support for the RZ/G2E (a.k.a. R8A774C0).
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

One question below.

> --- a/Documentation/devicetree/bindings/pci/rcar-pci.txt
> +++ b/Documentation/devicetree/bindings/pci/rcar-pci.txt

> @@ -37,7 +39,8 @@ compatible: "renesas,pcie-r8a7743" for the R8A7743 SoC;
>
>  Optional properties:
>  - phys: from common PHY binding: PHY phandle and specifier (only make sense
> -       for R-Car gen3 SoCs where the PCIe PHYs have their own register blocks).
> +       for R-Car gen3 and RZ/G2 SoCs where the PCIe PHYs have their own

Gen3, while at it?

> +       register blocks).

The RZ/G2 Hardware User Manual I have lacks the table specifying which SoCs
have which PHY registers.  So I cannot verify if the above paragraph applies to
RZ/G2(E).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
