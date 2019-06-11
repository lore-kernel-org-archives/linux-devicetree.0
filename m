From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v1 03/11] dt-bindings: display/bridge: Add config
 property for ti948
Date: Tue, 11 Jun 2019 21:07:10 +0300
Message-ID: <20190611180710.GT5016@pendragon.ideasonboard.com>
References: <20190611140412.32151-1-michael.drake@codethink.co.uk>
 <20190611140412.32151-4-michael.drake@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190611140412.32151-4-michael.drake@codethink.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Drake <michael.drake@codethink.co.uk>
Cc: Andrzej Hajda <a.hajda@samsung.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@lists.codethink.co.uk, Patrick Glaser <pglaser@tesla.com>, Nate Case <ncase@tesla.com>
List-Id: devicetree@vger.kernel.org

Hi Michael,

Thank you for the patch.

On Tue, Jun 11, 2019 at 03:04:04PM +0100, Michael Drake wrote:
> The config property can be used to provide an array of
> register addresses and values to be written to configure
> the device for the board.

Please don't. DT describes the hardware (or more accurately the system),
it's not meant to store arbitrary configuration data. All the registers
specified below should instead be set by the driver based on a
combination of hardware description and information obtained at runtime.

> Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
> Cc: Patrick Glaser <pglaser@tesla.com>
> Cc: Nate Case <ncase@tesla.com>
> ---
>  .../bindings/display/bridge/ti,ds90ub948.txt  | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,ds90ub948.txt b/Documentation/devicetree/bindings/display/bridge/ti,ds90ub948.txt
> index f9e86cb22900..1e7033b0f3b7 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,ds90ub948.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,ds90ub948.txt
> @@ -12,6 +12,8 @@ Required properties:
>  Optional properties:
>  
>  - regulators: List of regulator name strings to enable for operation of device.
> +- config: List of <register address>,<value> pairs to be set to configure
> +  device on powerup.  The register addresses and values are 8bit.
>  
>  Example
>  -------
> @@ -21,4 +23,23 @@ ti948: ds90ub948@0 {
>  
>  	regulators: "vcc",
>  	            "vcc_disp";
> +	config:
> +	        /* set error count to max */
> +	        <0x41>, <0x1f>,
> +	        /* sets output mode, no change noticed */
> +	        <0x49>, <0xe0>,
> +	        /* speed up I2C, 0xE is around 480KHz */
> +	        <0x26>, <0x0e>,
> +	        /* speed up I2C, 0xE is around 480KHz */
> +	        <0x27>, <0x0e>,
> +	        /* sets GPIO0 as an input */
> +	        <0x1D>, <0x13>,
> +	        /* set GPIO2 high, backlight PWM (set to 0x50 for normal use) */
> +	        <0x1E>, <0x50>,
> +	        /* sets GPIO3 as an output with remote control for touch XRES */
> +	        <0x1F>, <0x05>,
> +	        /* set GPIO5 high, backlight enable on new display */
> +	        <0x20>, <0x09>,
> +	        /* set GPIO7 and GPIO8 high to enable touch power and prox sense */
> +	        <0x21>, <0x91>;
>  };

-- 
Regards,

Laurent Pinchart
