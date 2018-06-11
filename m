Return-Path: <SRS0=Nmb7=I5=verge.net.au=horms@kernel.org>
Date: Mon, 11 Jun 2018 10:12:24 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: Renesas R-Car Gen3 PCIe PHY
 bindings
Message-ID: <20180611081224.bxb5zeo3gczyzyw3@verge.net.au>
References: <04384ce6-b696-715d-2072-345654e3fccf@cogentembedded.com>
 <9293ae00-8684-962a-346e-13cb12e5cddb@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9293ae00-8684-962a-346e-13cb12e5cddb@cogentembedded.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Sun, Jun 10, 2018 at 09:22:46PM +0300, Sergei Shtylyov wrote:
> This PHY is  still  mostly undocumented --  the only documented registers
> exist on R-Car V3H (R8A77980) SoC.  Add the corresponding device tree
> bindings.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> Changes in version 2:
> - split from the big driver/bindings patch;
> - got rid of the generic R-Car gen3 "compatible" prop value.
> 
>  Documentation/devicetree/bindings/phy/rcar-gen3-phy-pcie.txt |   24 +++++++++++
>  1 file changed, 24 insertions(+)

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> 
> Index: linux-phy/Documentation/devicetree/bindings/phy/rcar-gen3-phy-pcie.txt
> ===================================================================
> --- /dev/null
> +++ linux-phy/Documentation/devicetree/bindings/phy/rcar-gen3-phy-pcie.txt
> @@ -0,0 +1,24 @@
> +* Renesas R-Car generation 3 PCIe PHY
> +
> +This file provides information on what the device node for the R-Car
> +generation 3 PCIe PHY contains.
> +
> +Required properties:
> +- compatible: "renesas,r8a77980-pcie-phy" if the device is a part of the
> +	      R8A77980 SoC.
> +- reg: offset and length of the register block.
> +- clocks: clock phandle and specifier pair.
> +- power-domains: power domain phandle and specifier pair.
> +- resets: reset phandle and specifier pair.
> +- #phy-cells: see phy-bindings.txt in the same directory, must be <0>.
> +
> +Example (R-Car V3H):
> +
> +	pcie-phy@e65d0000 {
> +		compatible = "renesas,r8a77980-pcie-phy";
> +		reg = <0 0xe65d0000 0 0x8000>;
> +		#phy-cells = <0>;
> +		clocks = <&cpg CPG_MOD 319>;
> +		power-domains = <&sysc 32>;
> +		resets = <&cpg 319>;
> +	};
> 
