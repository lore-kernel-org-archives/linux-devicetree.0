From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [v2] powerpc/fsl: Update fman dt binding with pcs-phy and tbi-phy
Date: Wed, 30 Dec 2015 10:27:33 -0600
Message-ID: <20151230162733.GA2518@rob-hp-laptop>
References: <1450921331-25309-1-git-send-email-igal.liberman@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1450921331-25309-1-git-send-email-igal.liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: igal.liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, madalin.bucur-KZfg59tc24xl57MIdRCFDg@public.gmane.org, shaohui.xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 24, 2015 at 03:42:11AM +0200, igal.liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org wrote:
> From: Igal Liberman <igal.liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> The FMan contains internal PHY devices used for SGMII connections
> to external PHYs. When these PHYs are in use a reference is needed
> for both the external PHY and the internal one. For the external
> PHY phy-handle provides the reference. For the internal PHY a new
> handle is required.
> In dTSEC, the internal PHY is a TBI (Ten Bit Interface) PHY,
> the handle used will be tbi-handle.
> In mEMAC, the internal PHY is a PCS (Physical Coding Sublayer) PHY,
> the handle used will be pcsphy-handle.

This is fairly commom for 10G eth I think. Can't you use the common PHY 
binding here in the case without internal MDIO bus? Just because you use 
it that doesn't mean you have to use the generic phy subsystem in the 
kernel. 

Perhaps phy-handle should be deprecated in favor of doing something like 
this if you need a phandle to both:

phys = <&internal-phy>, <&external-phy>;

> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/fman.txt b/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
> index 1fc5328..55c2c03 100644
> --- a/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
> +++ b/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
> @@ -315,6 +315,16 @@ PROPERTIES
>  		Value type: <phandle>
>  		Definition: A phandle for 1EEE1588 timer.
>  
> +- pcsphy-handle
> +		Usage required for "fsl,fman-memac" MACs
> +		Value type: <phandle>
> +		Definition: A phandle for pcsphy.
> +
> +- tbi-handle
> +		Usage required for "fsl,fman-dtsec" MACs
> +		Value type: <phandle>
> +		Definition: A phandle for tbiphy.
> +
>  EXAMPLE
>  
>  fman1_tx28: port@a8000 {
> @@ -340,6 +350,7 @@ ethernet@e0000 {
>  	reg = <0xe0000 0x1000>;
>  	fsl,fman-ports = <&fman1_rx8 &fman1_tx28>;
>  	ptp-timer = <&ptp-timer>;
> +	tbi-handle = <&tbi0>;

What does the tbi0 node contain? It should be present in the example.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
