From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/2] phy: rcar-gen3-usb2: add fallback binding
Date: Fri, 4 Mar 2016 22:28:03 -0600
Message-ID: <20160305042803.GQ13525@rob-hp-laptop>
References: <1456965518-13615-1-git-send-email-horms+renesas@verge.net.au>
 <1456965518-13615-3-git-send-email-horms+renesas@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1456965518-13615-3-git-send-email-horms+renesas@verge.net.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 03, 2016 at 09:38:38AM +0900, Simon Horman wrote:
> In the case of Renesas R-Car hardware we know that there are generations of
> SoCs, e.g. Gen 2 and Gen 3. But beyond that its not clear what the
> relationship between IP blocks might be. For example, I believe that
> r8a7790 is older than r8a7791 but that doesn't imply that the latter is a
> descendant of the former or vice versa.
> 
> We can, however, by examining the documentation and behaviour of the
> hardware at run-time observe that the current driver implementation appears
> to be compatible with the IP blocks on SoCs within a given generation.
> 
> For the above reasons and convenience when enabling new SoCs a
> per-generation fallback compatibility string scheme being adopted for
> drivers for Renesas SoCs.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> v2
> * Use renesas,rcar-gen3-usb-phy rather than renesas,usb-phy-gen3 as
>   the new compatibility string to fit in with the preferred scheme
>   for new compatibility string names.
> ---
>  Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 10 ++++++++--
>  drivers/phy/phy-rcar-gen3-usb2.c                             |  1 +
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> index eaf7e9b7ce6b..86826ca2fdef 100644
> --- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> @@ -6,6 +6,12 @@ This file provides information on what the device node for the R-Car generation
>  Required properties:
>  - compatible: "renesas,usb2-phy-r8a7795" if the device is a part of an R8A7795
>  	      SoC.
> +	      "renesas,rcar-gen3-usb2-phy" for a generic R-Car Gen3 compatible device.
> +
> +	      When compatible with the generic version, nodes must list the
> +	      SoC-specific version corresponding to the platform first
> +	      followed by the generic version.
> +
>  - reg: offset and length of the partial USB 2.0 Host register block.
>  - clocks: clock phandle and specifier pair(s).
>  - #phy-cells: see phy-bindings.txt in the same directory, must be <0>.
> @@ -19,14 +25,14 @@ channel as USB OTG:
>  Example (R-Car H3):
>  
>  	usb-phy@ee080200 {
> -		compatible = "renesas,usb2-phy-r8a7795";
> +		compatible = "renesas,usb2-phy-r8a7795","renesas,rcar-gen3-usb2-phy";

space...

>  		reg = <0 0xee080200 0 0x700>;
>  		interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
>  		clocks = <&mstp7_clks R8A7795_CLK_EHCI0>;
>  	};
>  
>  	usb-phy@ee0a0200 {
> -		compatible = "renesas,usb2-phy-r8a7795";
> +		compatible = "renesas,usb2-phy-r8a7795","renesas,rcar-gen3-usb2-phy";

space...

Otherwise,

Acked-by: Rob Herring <robh@kernel.org>
