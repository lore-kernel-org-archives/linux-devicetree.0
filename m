Return-Path: <robherring2@gmail.com>
Date: Tue, 3 Jul 2018 16:21:42 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: sram: Add 'clocks' as an optional
 property
Message-ID: <20180703222142.GA15061@rob-hp-laptop>
References: <1530054453-10393-1-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1530054453-10393-1-git-send-email-festevam@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, p.zabel@pengutronix.de, vz@mleia.com, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Jun 26, 2018 at 08:07:33PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> Some SoCs (like i.MX53) need to specify the SRAM clock in the
> device tree via the clocks property.
> 
> Add an entry to the optional property section.
> 
> Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
> Changes since v1:
> - Add space before : and use the more common "list of phandle
> and clock specifier pairs" term - Vladimir
> 
>  Documentation/devicetree/bindings/sram/sram.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sram/sram.txt b/Documentation/devicetree/bindings/sram/sram.txt
> index 267da44..ae6ca34 100644
> --- a/Documentation/devicetree/bindings/sram/sram.txt
> +++ b/Documentation/devicetree/bindings/sram/sram.txt
> @@ -50,6 +50,8 @@ Optional properties in the area nodes:
>  		 manipulation of the page attributes.
>  - label : the name for the reserved partition, if omitted, the label
>            is taken from the node name excluding the unit address.
> +- clocks : a list of phandle and clock specifier pairs that controls the
> +	   SRAM clock.

A list controlling THE (single) SRAM clock?

Once we start needing clocks, power, or other setup, we really should 
have specific compatible strings (and binding docs) for the SRAM. I'll 
take a single clock though.

Rob
