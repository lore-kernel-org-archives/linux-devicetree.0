From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH v2 3/3 pci/next] PCI: rcar: Add gen3 fallback
 compatibility string for pcie-rcar
Date: Fri, 2 Dec 2016 22:50:19 +0100
Message-ID: <20161202215016.GA21497@verge.net.au>
References: <1480675020-26346-1-git-send-email-horms+renesas@verge.net.au>
 <1480675020-26346-4-git-send-email-horms+renesas@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1480675020-26346-4-git-send-email-horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Phil Edworthy <phil.edworthy-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 02, 2016 at 11:37:00AM +0100, Simon Horman wrote:
> Add fallback compatibility string for the  R-Car Gen 3 family.  This is in
> keeping with the both the existing fallback compatibility string for the
> R-Car Gen 2 family and the fallback scheme being adopted wherever
> appropriate for drivers for Renesas SoCs.
> 
> Signed-off-by: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
> ---
> v2
> * Move fallback binding to below SoC specific bindings it covers
>   in implementation
> ---
>  Documentation/devicetree/bindings/pci/rcar-pci.txt | 1 +
>  drivers/pci/host/pcie-rcar.c                       | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/rcar-pci.txt b/Documentation/devicetree/bindings/pci/rcar-pci.txt
> index 6cf99690eef9..eee518db90b9 100644
> --- a/Documentation/devicetree/bindings/pci/rcar-pci.txt
> +++ b/Documentation/devicetree/bindings/pci/rcar-pci.txt
> @@ -7,6 +7,7 @@ compatible: "renesas,pcie-r8a7779" for the R8A7779 SoC;
>  	    "renesas,pcie-r8a7793" for the R8A7793 SoC;
>  	    "renesas,pcie-r8a7795" for the R8A7795 SoC;
>  	    "renesas,pcie-rcar-gen2" for a generic R-Car Gen2 compatible device.
> +	    "renesas,pcie-rcar-gen3" for a generic R-Car Gen3 compatible device.
>  
>  	    When compatible with the generic version, nodes must list the
>  	    SoC-specific version corresponding to the platform first
> diff --git a/drivers/pci/host/pcie-rcar.c b/drivers/pci/host/pcie-rcar.c
> index 85971bc276c6..72058bc7af5c 100644
> --- a/drivers/pci/host/pcie-rcar.c
> +++ b/drivers/pci/host/pcie-rcar.c
> @@ -1078,6 +1078,8 @@ static const struct of_device_id rcar_pcie_of_match[] = {
>  	{ .compatible = "renesas,pcie-rcar-gen2",
>  	  .data = rcar_pcie_hw_init_gen2 },
>  	{ .compatible = "renesas,pcie-r8a7795", .data = rcar_pcie_hw_init },
> +	{ .compatible = "renesas,pcie-rcar-gen3",
> +		.data = rcar_pcie_hw_init_hw_init },

It looks like I failed to compile-test this.

s/rcar_pcie_hw_init_hw_init/rcar_pcie_hw_init/

>  	{},
>  };
>  
> -- 
> 2.7.0.rc3.207.g0ac5344
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
