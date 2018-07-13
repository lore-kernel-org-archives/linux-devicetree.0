Return-Path: <SRS0=mbb1=J5=verge.net.au=horms@kernel.org>
Date: Fri, 13 Jul 2018 09:28:21 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] dt-bindings: usb-xhci: Add r8a77990 support
Message-ID: <20180713072820.mrcfs22d3fkscvju@verge.net.au>
References: <1530615107-7733-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1530615107-7733-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Jul 03, 2018 at 07:51:47PM +0900, Yoshihiro Shimoda wrote:
> This patch adds r8a77990 xhci support. The driver will use
> the fallback compatible string "renesas,rcar-gen3-xhci".
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  After we applied the following patches, the driver will use
> the fallback compatible string "renesas,rcar-gen3-xhci" on
> r8a77990. (If we doesn't apply the patches, the driver cannot
> get the firmware name, and then the probe on r8a77990 failed.)
> 
>  https://patchwork.kernel.org/patch/10503777/
>  https://patchwork.kernel.org/patch/10503781/

Thanks.

FWIW I think we can still merge DTS patches to enable USB3 on E3 in
parallel with the above driver patches as enabling a device that was
previously not enabled won't cause a regression so long as the probe
failure doesn't cause other problems - f.e. kernel panic

> 
>  Documentation/devicetree/bindings/usb/usb-xhci.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> index bd1dd31..ac4cd0d 100644
> --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> @@ -14,6 +14,7 @@ Required properties:
>      - "renesas,xhci-r8a7795" for r8a7795 SoC
>      - "renesas,xhci-r8a7796" for r8a7796 SoC
>      - "renesas,xhci-r8a77965" for r8a77965 SoC
> +    - "renesas,xhci-r8a77990" for r8a77990 SoC
>      - "renesas,rcar-gen2-xhci" for a generic R-Car Gen2 or RZ/G1 compatible
>        device
>      - "renesas,rcar-gen3-xhci" for a generic R-Car Gen3 compatible device
> -- 
> 1.9.1
> 
