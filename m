Return-Path: <robherring2@gmail.com>
Date: Tue, 10 Apr 2018 08:59:38 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] phy: Renesas R-Car gen3 PCIe PHY driver
Message-ID: <20180410135938.m7c4trmgho6p43tk@rob-hp-laptop>
References: <0f28c74d-f35a-5ccb-eeba-f21ae39c3857@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f28c74d-f35a-5ccb-eeba-f21ae39c3857@cogentembedded.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: kishon@ti.com, devicetree@vger.kernel.org, mark.rutland@arm.com, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Apr 04, 2018 at 10:31:26PM +0300, Sergei Shtylyov wrote:
> This PHY is still mostly undocumented -- the only documented registers
> exist on R-Car V3H (R8A77980) SoC  where this PHY stays in a powered-down
> state after a reset and thus  we must power it on for PCIe to work...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> The patch is against the 'next' branch of Kishon's 'linux-phy.git' repo.
> 
>  Documentation/devicetree/bindings/phy/rcar-gen3-phy-pcie.txt |   32 ++

Separate patch please.

>  drivers/phy/renesas/Kconfig                                  |    7 
>  drivers/phy/renesas/Makefile                                 |    1 
>  drivers/phy/renesas/phy-rcar-gen3-pcie.c                     |  158 +++++++++++
>  4 files changed, 198 insertions(+)
> 
> Index: linux-phy/Documentation/devicetree/bindings/phy/rcar-gen3-phy-pcie.txt
> ===================================================================
> --- /dev/null
> +++ linux-phy/Documentation/devicetree/bindings/phy/rcar-gen3-phy-pcie.txt
> @@ -0,0 +1,32 @@
> +* Renesas R-Car generation 3 PCIe PHY
> +
> +This file provides information on what the device node for the R-Car
> +generation 3 PCIe PHY contains.
> +
> +Required properties:
> +- compatible: "renesas,r8a77980-pcie-phy" if the device is a part of R8A77980
> +	      SoC.
> +	      "renesas,rcar-gen3-pcie-phy" for a generic R-Car Gen3 compatible
> +	      device.
> +
> +	      When compatible with the generic version, nodes must list the
> +	      SoC-specific version corresponding to the platform first
> +	      followed by the generic version.
> +
> +- reg: offset and length of the register block.
> +- clocks: clock phandle and specifier pair.
> +- power-domains: power domain phandle and specifier pair.
> +- resets: reset phandle and specifier pair.
> +- #phy-cells: see phy-bindings.txt in the same directory, must be <0>.
> +
> +Example (R-Car V3H):
> +
> +	pcie-phy@e65d0000 {
> +		compatible = "renesas,r8a77980-pcie-phy",
> +			     "renesas,rcar-gen3-pcie-phy";
> +		reg = <0 0xe65d0000 0 0x8000>;
> +		#phy-cells = <0>;
> +		clocks = <&cpg CPG_MOD 319>;
> +		power-domains = <&sysc 32>;
> +		resets = <&cpg 319>;
> +	};
