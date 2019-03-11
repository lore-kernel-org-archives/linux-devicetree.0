Return-Path: <SRS0=xffc=RO=ideasonboard.com=laurent.pinchart@kernel.org>
Date: Mon, 11 Mar 2019 11:09:41 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: rcar-csi2: List resets as a
 mandatory property
Message-ID: <20190311090941.GH4775@pendragon.ideasonboard.com>
References: <20190308234722.25775-1-niklas.soderlund+renesas@ragnatech.se>
 <20190308234722.25775-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190308234722.25775-2-niklas.soderlund+renesas@ragnatech.se>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Niklas,

Thank you for the patch.

On Sat, Mar 09, 2019 at 12:47:21AM +0100, Niklas Söderlund wrote:
> The resets property will become mandatory to operate the device, list it
> as such. All device tree source files have always included the reset
> property so making it mandatory will not introduce any regressions.
> 
> While at it improve the description for the clocks property.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt b/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
> index d63275e17afdd180..9a0d0531c67df48c 100644
> --- a/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
> +++ b/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
> @@ -18,7 +18,8 @@ Mandatory properties
>  
>   - reg: the register base and size for the device registers
>   - interrupts: the interrupt for the device
> - - clocks: reference to the parent clock
> + - clocks: A phandle + clock specifier for the module clock
> + - resets: A phandle + reset specifier for the module reset
>  
>  The device node shall contain two 'port' child nodes according to the
>  bindings defined in Documentation/devicetree/bindings/media/

-- 
Regards,

Laurent Pinchart
