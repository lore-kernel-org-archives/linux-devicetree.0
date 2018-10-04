Return-Path: <SRS0=ZZW+=MQ=arm.com=lorenzo.pieralisi@kernel.org>
Date: Thu, 4 Oct 2018 11:34:55 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH] dt-bindings: PCI: rcar: Add device tree support for
 r8a7744
Message-ID: <20181004103455.GA5233@e107981-ln.cambridge.arm.com>
References: <1538051331-14860-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1538051331-14860-1-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, Sep 27, 2018 at 01:28:51PM +0100, Biju Das wrote:
> Add internal PCI bridge support for r8a7744 SoC.  The Renesas RZ/G1N
> (R8A7744) internal PCI bridge is identical to the R-Car Gen2 family.
> 
> This doesn't change the driver, so it does nothing by itself.  But it does
> mean that checkpatch won't complain about a future patch that adds
> "renesas,pci-r8a7744" to a DT, which helps ensure that shipped DTs use
> documented compatibility strings.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> ---
> This patch is tested against linux-next next-20180927
> ---
>  Documentation/devicetree/bindings/pci/pci-rcar-gen2.txt | 1 +
>  1 file changed, 1 insertion(+)

Applied to pci/controller-misc for v4.20.

Thanks,
Lorenzo

> diff --git a/Documentation/devicetree/bindings/pci/pci-rcar-gen2.txt b/Documentation/devicetree/bindings/pci/pci-rcar-gen2.txt
> index 9fe7e12..b94078f 100644
> --- a/Documentation/devicetree/bindings/pci/pci-rcar-gen2.txt
> +++ b/Documentation/devicetree/bindings/pci/pci-rcar-gen2.txt
> @@ -7,6 +7,7 @@ OHCI and EHCI controllers.
>  
>  Required properties:
>  - compatible: "renesas,pci-r8a7743" for the R8A7743 SoC;
> +	      "renesas,pci-r8a7744" for the R8A7744 SoC;
>  	      "renesas,pci-r8a7745" for the R8A7745 SoC;
>  	      "renesas,pci-r8a7790" for the R8A7790 SoC;
>  	      "renesas,pci-r8a7791" for the R8A7791 SoC;
> -- 
> 2.7.4
> 
