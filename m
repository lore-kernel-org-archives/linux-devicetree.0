Return-Path: <robherring2@gmail.com>
Date: Thu, 5 Jul 2018 17:22:01 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: sram: Add 'clocks' as an optional
 property
Message-ID: <20180705232201.GA12977@rob-hp-laptop>
References: <1530658276-32630-1-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1530658276-32630-1-git-send-email-festevam@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, p.zabel@pengutronix.de, vz@mleia.com, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Jul 03, 2018 at 07:51:16PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> Some SoCs (like i.MX53) need to specify the SRAM clock in the
> device tree via the clocks property.
> 
> Add an entry to the optional property section.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
> Changes since v1:
> - Make it clear that it is a single SRAM clock (Rob)
> 
>  Documentation/devicetree/bindings/sram/sram.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sram/sram.txt b/Documentation/devicetree/bindings/sram/sram.txt
> index 267da44..e98908b 100644
> --- a/Documentation/devicetree/bindings/sram/sram.txt
> +++ b/Documentation/devicetree/bindings/sram/sram.txt
> @@ -50,6 +50,8 @@ Optional properties in the area nodes:
>  		 manipulation of the page attributes.
>  - label : the name for the reserved partition, if omitted, the label
>            is taken from the node name excluding the unit address.
> +- clocks : a list of phandle and clock specifier pair that controls the
> +	   single SRAM clock.

I guess a list of one entry is still a list...

Anyway, applied.

Rob
