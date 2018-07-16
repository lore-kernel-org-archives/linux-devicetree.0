From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: pfuze100: add optional disable
 switch-regulators binding
Date: Mon, 16 Jul 2018 11:55:35 -0600
Message-ID: <20180716175535.GA10835@rob-hp-laptop>
References: <20180713125002.24331-1-m.felsch@pengutronix.de>
 <20180713125002.24331-2-m.felsch@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180713125002.24331-2-m.felsch@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: lgirdwood@gmail.com, broonie@kernel.org, mark.rutland@arm.com, fabio.estevam@nxp.com, Anson.Huang@nxp.com, kernel@pengutronix.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 13, 2018 at 02:50:01PM +0200, Marco Felsch wrote:
> This binding is used to keep the backward compatibility with the current
> dtb's [1]. The binding informs the driver that the unused switch regulators
> can be disabled.
> If it is not specified, the driver doesn't disable the switch regulators.
> 
> [1] https://patchwork.kernel.org/patch/10490381/
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> 
> ---
> Changes in V2:
>   - add more information about the binding
>   - rename binding and add vendor prefix
> 
>  .../devicetree/bindings/regulator/pfuze100.txt        | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/pfuze100.txt b/Documentation/devicetree/bindings/regulator/pfuze100.txt
> index 672c939045ff..2c46b8d368db 100644
> --- a/Documentation/devicetree/bindings/regulator/pfuze100.txt
> +++ b/Documentation/devicetree/bindings/regulator/pfuze100.txt
> @@ -4,6 +4,17 @@ Required properties:
>  - compatible: "fsl,pfuze100", "fsl,pfuze200", "fsl,pfuze3000", "fsl,pfuze3001"
>  - reg: I2C slave address
>  
> +Optional properties:
> +- fsl,pfuze-support-disable: Boolean, if present disable all unused switch
> +  regulators to save power consumption. Attention, till 4.18 these regulators

You shouldn't have kernel version info in bindings.

> +  were always on without specifying "regulator-always-on". So be sure to mark
> +  import regulators as "regulator-always-on" (e.g. DDR ref, DDR supply). If

s/import/important/

> +  not present, the switched regualtors are always on and can't be disabled.
> +  This binding is a workaround to keep backward compatibility with old dtb's
> +  which rely on the fact that the switched regulators are always on and don't
> +  mark them explicit as "regulator-always-on". On new dtbs this property should
> +  always be present.
> +
>  Required child node:
>  - regulators: This is the list of child nodes that specify the regulator
>    initialization data for defined regulators. Please refer to below doc
> -- 
> 2.18.0
> 
