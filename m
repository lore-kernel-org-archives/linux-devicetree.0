From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v4 2/3] dt-bindings: usb: renesas_usbhs: Add support for
 RZ/A1
Date: Tue, 9 Jan 2018 10:01:02 +0100
Message-ID: <20180109090101.ggn56dgrzyw5xihc@verge.net.au>
References: <20180108123055.64890-1-chris.brandt@renesas.com>
 <20180108123055.64890-3-chris.brandt@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180108123055.64890-3-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 08, 2018 at 07:30:54AM -0500, Chris Brandt wrote:
> Document support for RZ/A1 SoCs
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> v4:
>  * Re-added "renesas,usbhs-r7s72100"
> v3:
>  * Removed "renesas,usbhs-r7s72100"
> v2:
>  * Added Reviewed-by
> ---
>  Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> index 47394ab788e3..d060172f1529 100644
> --- a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> +++ b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> @@ -13,8 +13,10 @@ Required properties:
>  	- "renesas,usbhs-r8a7795" for r8a7795 (R-Car H3) compatible device
>  	- "renesas,usbhs-r8a7796" for r8a7796 (R-Car M3-W) compatible device
>  	- "renesas,usbhs-r8a77995" for r8a77995 (R-Car D3) compatible device
> +	- "renesas,usbhs-r7s72100" for r7s72100 (RZ/A1) compatible device
>  	- "renesas,rcar-gen2-usbhs" for R-Car Gen2 or RZ/G1 compatible devices
>  	- "renesas,rcar-gen3-usbhs" for R-Car Gen3 compatible device
> +	- "renesas,rza1-usbhs" for RZ/A1 compatible device
>  
>  	When compatible with the generic version, nodes must list the
>  	SoC-specific version corresponding to the platform first followed
> -- 
> 2.15.1
> 
> 
