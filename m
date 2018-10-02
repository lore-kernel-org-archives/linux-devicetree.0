Return-Path: <SRS0=TQfs=MO=arm.com=lorenzo.pieralisi@kernel.org>
Date: Tue, 2 Oct 2018 11:04:26 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH] DT: pci: rcar-pci: document R8A77990 bindings
Message-ID: <20181002100426.GA24071@red-moon>
References: <20180922150252.18754-1-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180922150252.18754-1-marek.vasut+renesas@gmail.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: devicetree@vger.kernel.org, linux-pci@vger.kernel.org, Tho Vu <tho.vu.wh@rvc.renesas.com>, Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Phil Edworthy <phil.edworthy@renesas.com>, Rob Herring <robh@kernel.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Simon Horman <horms+renesas@verge.net.au>, Wolfram Sang <wsa@the-dreams.de>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Sat, Sep 22, 2018 at 05:02:52PM +0200, Marek Vasut wrote:
> From: Tho Vu <tho.vu.wh@rvc.renesas.com>
> 
> Document the R-Car E3 (R8A77990) SoC in the R-Car PCIe bindings.
> 
> Signed-off-by: Tho Vu <tho.vu.wh@rvc.renesas.com>
> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Phil Edworthy <phil.edworthy@renesas.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/pci/rcar-pci.txt | 1 +
>  1 file changed, 1 insertion(+)

Applied to pci/controller-misc for v4.20, thanks.

Lorenzo

> diff --git a/Documentation/devicetree/bindings/pci/rcar-pci.txt b/Documentation/devicetree/bindings/pci/rcar-pci.txt
> index a5f7fc62d10e..5f2f9e380efb 100644
> --- a/Documentation/devicetree/bindings/pci/rcar-pci.txt
> +++ b/Documentation/devicetree/bindings/pci/rcar-pci.txt
> @@ -9,6 +9,7 @@ compatible: "renesas,pcie-r8a7743" for the R8A7743 SoC;
>  	    "renesas,pcie-r8a7795" for the R8A7795 SoC;
>  	    "renesas,pcie-r8a7796" for the R8A7796 SoC;
>  	    "renesas,pcie-r8a77980" for the R8A77980 SoC;
> +	    "renesas,pcie-r8a77990" for the R8A77990 SoC;
>  	    "renesas,pcie-rcar-gen2" for a generic R-Car Gen2 or
>  				     RZ/G1 compatible device.
>  	    "renesas,pcie-rcar-gen3" for a generic R-Car Gen3 compatible device.
> -- 
> 2.18.0
> 
