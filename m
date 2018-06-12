Return-Path: <robherring2@gmail.com>
Date: Tue, 12 Jun 2018 16:04:05 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] csirx updated doc for csirx with dphy supported
Message-ID: <20180612220405.GB14085@rob-hp-laptop>
References: <20180608103304.16054-1-kwitos@cadence.com>
 <20180608103304.16054-2-kwitos@cadence.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180608103304.16054-2-kwitos@cadence.com>
To: Krzysztof Witos <kwitos@cadence.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:CADENCE MIPI-CSI2 BRIDGES" <linux-media@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Fri, Jun 08, 2018 at 11:33:03AM +0100, Krzysztof Witos wrote:
> Signed-off-by: Krzysztof Witos <kwitos@cadence.com>
> ---
>  .../devicetree/bindings/media/cdns,csi2rx.txt      | 32 +++++++++++++++++++---
>  1 file changed, 28 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/cdns,csi2rx.txt b/Documentation/devicetree/bindings/media/cdns,csi2rx.txt
> index 6b02a0657ad9..753b967863c0 100644
> --- a/Documentation/devicetree/bindings/media/cdns,csi2rx.txt
> +++ b/Documentation/devicetree/bindings/media/cdns,csi2rx.txt
> @@ -13,8 +13,7 @@ Required properties:
>      * p_clk: register bank clock
>      * pixel_if[0-3]_clk: pixel stream output clock, one for each stream
>                           implemented in hardware, between 0 and 3
> -
> -Optional properties:
> +    * hs_clock: dphy module clock
>    - phys: phandle to the external D-PHY, phy-names must be provided
>    - phy-names: must contain "dphy", if the implementation uses an
>                 external D-PHY
> @@ -38,18 +37,43 @@ Required subnodes:
>             in the design.Since there is only one endpoint per port,
>             the endpoints are not numbered.
>  
> +Cadence DPHY
> +============
> +
> +Cadence DPHY block.
> +
> +Required properties:
> +- compatible: should be set to "cdns,dphy".

Also, needs to be more specific. Only 1 version of this h/w?
