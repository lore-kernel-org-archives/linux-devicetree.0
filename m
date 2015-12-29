From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] powerpc: fsl: update fman dt binding for PCS PHY
Date: Tue, 29 Dec 2015 12:34:36 -0600
Message-ID: <20151229183436.GB12450@rob-hp-laptop>
References: <1451274454-26091-1-git-send-email-shh.xie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1451274454-26091-1-git-send-email-shh.xie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shh.xie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, igal.liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Shaohui Xie <Shaohui.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 28, 2015 at 11:47:34AM +0800, shh.xie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: Shaohui Xie <Shaohui.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> PCS PHY can support backplane (1000BASE-KX and 10GBASE-KR), this needs
> to change corresponding serdes lane settings, so a reference is needed
> for serdes lane. This patch describes properties needed for PCS PHY to
> support backplane.
> 
> Signed-off-by: Shaohui Xie <Shaohui.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> based on: http://patchwork.ozlabs.org/patch/560936/
> 
>  Documentation/devicetree/bindings/powerpc/fsl/fman.txt | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/fman.txt b/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
> index 55c2c03..b38e727 100644
> --- a/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
> +++ b/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
> @@ -432,6 +432,16 @@ example of how to define a PHY (Internal PHY has no interrupt line).
>  - For "fsl,fman-mdio" compatible internal mdio bus, the PHY is TBI PHY.
>  - For "fsl,fman-memac-mdio" compatible internal mdio bus, the PHY is PCS PHY,
>    PCS PHY addr must be '0'.
> +  PCS PHY can support backplane (1000BASE-KX and 10GBASE-KR), this needs to
> +  change the corresponding serdes lane settings.
> +
> +  PCS PHY node properties required for backplane:
> +
> +  - compatible: must be "ethernet-phy-ieee802.3-c45".
> +  - phy-mode: string, operation mode of the PHY interface; must be "1000base-kx"
> +    for 1000BASE-KX, or "10gbase-kr" for 10GBASE-KR.

Seems like these should be in common ethernet phy binding.

> +  - lane-handle: phandle, specifies a reference to a node representing a Serdes.
> +  - lane-range: offset and length of the register set for the serdes lane.

These seem pretty FSL specific, so add vendor prefix.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
