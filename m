Return-Path: <SRS0=ScCE=SL=verge.net.au=horms@kernel.org>
Date: Tue, 9 Apr 2019 13:02:04 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH V3 06/13] dt-bindings: usb: renesas_usbhs: Add support
 for r8a77470
Message-ID: <20190409110203.6faiquud4v7flhxh@verge.net.au>
References: <1554287324-22312-1-git-send-email-biju.das@bp.renesas.com>
 <1554287324-22312-7-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554287324-22312-7-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Apr 03, 2019 at 11:28:37AM +0100, Biju Das wrote:
> Document support for RZ/G1C (R8A77470) SoC.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> V2-->V3
>   * No change
> V1-->V2
>   * New patch
> ---
>  Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> index d93b6a1..b8acc2a 100644
> --- a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> +++ b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> @@ -6,6 +6,7 @@ Required properties:
>  	- "renesas,usbhs-r8a7743" for r8a7743 (RZ/G1M) compatible device
>  	- "renesas,usbhs-r8a7744" for r8a7744 (RZ/G1N) compatible device
>  	- "renesas,usbhs-r8a7745" for r8a7745 (RZ/G1E) compatible device
> +	- "renesas,usbhs-r8a77470" for r8a77470 (RZ/G1C) compatible device
>  	- "renesas,usbhs-r8a774a1" for r8a774a1 (RZ/G2M) compatible device
>  	- "renesas,usbhs-r8a774c0" for r8a774c0 (RZ/G2E) compatible device
>  	- "renesas,usbhs-r8a7790" for r8a7790 (R-Car H2) compatible device
> -- 
> 2.7.4
> 
