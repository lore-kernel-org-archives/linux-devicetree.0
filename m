Return-Path: <SRS0=qchw=UL=verge.net.au=horms@kernel.org>
Date: Wed, 12 Jun 2019 13:46:29 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] dt-bindings: PCI: rcar: Add device tree support for
 r8a774a1
Message-ID: <20190612114629.wpazihf5ea3g4wjn@verge.net.au>
References: <1559891016-56157-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559891016-56157-1-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Jun 07, 2019 at 08:03:36AM +0100, Biju Das wrote:
> Add PCIe support for the RZ/G2M (a.k.a. R8A774A1).
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  Documentation/devicetree/bindings/pci/rcar-pci.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/rcar-pci.txt b/Documentation/devicetree/bindings/pci/rcar-pci.txt
> index 6904882..45bba9f 100644
> --- a/Documentation/devicetree/bindings/pci/rcar-pci.txt
> +++ b/Documentation/devicetree/bindings/pci/rcar-pci.txt
> @@ -3,6 +3,7 @@
>  Required properties:
>  compatible: "renesas,pcie-r8a7743" for the R8A7743 SoC;
>  	    "renesas,pcie-r8a7744" for the R8A7744 SoC;
> +	    "renesas,pcie-r8a774a1" for the R8A774A1 SoC;
>  	    "renesas,pcie-r8a774c0" for the R8A774C0 SoC;
>  	    "renesas,pcie-r8a7779" for the R8A7779 SoC;
>  	    "renesas,pcie-r8a7790" for the R8A7790 SoC;
> -- 
> 2.7.4
> 
