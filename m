From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v1 01/11] dt-bindings: display/bridge: Add bindings for
 ti948
Date: Tue, 11 Jun 2019 21:03:16 +0300
Message-ID: <20190611180316.GS5016@pendragon.ideasonboard.com>
References: <20190611140412.32151-1-michael.drake@codethink.co.uk>
 <20190611140412.32151-2-michael.drake@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190611140412.32151-2-michael.drake@codethink.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Drake <michael.drake@codethink.co.uk>
Cc: Andrzej Hajda <a.hajda@samsung.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@lists.codethink.co.uk, Patrick Glaser <pglaser@tesla.com>, Nate Case <ncase@tesla.com>
List-Id: devicetree@vger.kernel.org

Hi Michael,

Thank you for the patch.

On Tue, Jun 11, 2019 at 03:04:02PM +0100, Michael Drake wrote:
> Adds device tree bindings for:
> 
>   TI DS90UB948-Q1 2K FPD-Link III to OpenLDI Deserializer
> 
> The device has the compatible string "ti,ds90ub948", and
> and allows an arrray of strings to be provided as regulator

s/arrray/array/

> names to enable for operation of the device.
> 
> Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
> Cc: Patrick Glaser <pglaser@tesla.com>
> Cc: Nate Case <ncase@tesla.com>
> ---
>  .../bindings/display/bridge/ti,ds90ub948.txt  | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,ds90ub948.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,ds90ub948.txt b/Documentation/devicetree/bindings/display/bridge/ti,ds90ub948.txt
> new file mode 100644
> index 000000000000..f9e86cb22900
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,ds90ub948.txt
> @@ -0,0 +1,24 @@
> +TI DS90UB948-Q1 2K FPD-Link III to OpenLDI Deserializer
> +=======================================================
> +
> +This is the binding for Texas Instruments DS90UB948-Q1 bridge deserializer.
> +
> +This device supports I2C only.

Then the DT node should be a child of its I2C controller, and have a reg
property.

> +
> +Required properties:
> +
> +- compatible: "ti,ds90ub948"
> +
> +Optional properties:
> +
> +- regulators: List of regulator name strings to enable for operation of device.

There's a standard binding for regulators, using *-supply properties.
Please use them.

You should also use the OF graph DT bindings to model the data
connections.

> +
> +Example
> +-------
> +
> +ti948: ds90ub948@0 {
> +	compatible = "ti,ds90ub948";
> +
> +	regulators: "vcc",
> +	            "vcc_disp";
> +};

-- 
Regards,

Laurent Pinchart
