Return-Path: <SRS0=TwA5=IA=verge.net.au=horms@kernel.org>
Date: Sun, 13 May 2018 09:52:39 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] dt-bindings: gpio: rcar: Add support for r8a77990
Message-ID: <20180513075238.6kasdqt4ylgeghst@verge.net.au>
References: <1526008386-26420-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1526008386-26420-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, May 11, 2018 at 12:13:05PM +0900, Yoshihiro Shimoda wrote:
> Add compatible string for R-Car E3 (r8a77990) in gpio-rcar.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> diff --git a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
> index 9744d42..378f132 100644
> --- a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
> +++ b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
> @@ -17,6 +17,7 @@ Required Properties:
>      - "renesas,gpio-r8a7796": for R8A7796 (R-Car M3-W) compatible GPIO controller.
>      - "renesas,gpio-r8a77965": for R8A77965 (R-Car M3-N) compatible GPIO controller.
>      - "renesas,gpio-r8a77970": for R8A77970 (R-Car V3M) compatible GPIO controller.
> +    - "renesas,gpio-r8a77990": for R8A77990 (R-Car E3) compatible GPIO controller.
>      - "renesas,gpio-r8a77995": for R8A77995 (R-Car D3) compatible GPIO controller.
>      - "renesas,rcar-gen1-gpio": for a generic R-Car Gen1 GPIO controller.
>      - "renesas,rcar-gen2-gpio": for a generic R-Car Gen2 or RZ/G1 GPIO controller.
> -- 
> 1.9.1
> 
