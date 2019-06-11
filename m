From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v1 08/11] dt-bindings: display/bridge: Add bindings for
 ti949
Date: Tue, 11 Jun 2019 21:13:51 +0300
Message-ID: <20190611181351.GW5016@pendragon.ideasonboard.com>
References: <20190611140412.32151-1-michael.drake@codethink.co.uk>
 <20190611140412.32151-9-michael.drake@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190611140412.32151-9-michael.drake@codethink.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Drake <michael.drake@codethink.co.uk>
Cc: Andrzej Hajda <a.hajda@samsung.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@lists.codethink.co.uk, Patrick Glaser <pglaser@tesla.com>, Nate Case <ncase@tesla.com>
List-Id: devicetree@vger.kernel.org

Hi Michael,

Thank you for the patch.

On Tue, Jun 11, 2019 at 03:04:09PM +0100, Michael Drake wrote:
> Adds device tree bindings for:
> 
>   TI DS90UB949-Q1 1080p HDMI to FPD-Link III bridge serializer
> 
> It supports instantiation via device tree / ACPI table.
> 
> The device has the compatible string "ti,ds90ub949", and
> and allows an arrray of strings to be provided as regulator
> names to enable for operation of the device.

All the comments I made regarding the ds90ub948 DT bindings apply here
too. Same for the comments related to the driver, they apply to the
subsequent patches in this series.

> Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
> Cc: Patrick Glaser <pglaser@tesla.com>
> Cc: Nate Case <ncase@tesla.com>
> ---
>  .../bindings/display/bridge/ti,ds90ub949.txt  | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,ds90ub949.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,ds90ub949.txt b/Documentation/devicetree/bindings/display/bridge/ti,ds90ub949.txt
> new file mode 100644
> index 000000000000..3ba3897d5e81
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,ds90ub949.txt
> @@ -0,0 +1,24 @@
> +TI DS90UB949-Q1 1080p HDMI to FPD-Link III bridge serializer
> +============================================================
> +
> +This is the binding for Texas Instruments DS90UB949-Q1 bridge serializer.
> +
> +This device supports I2C only.
> +
> +Required properties:
> +
> +- compatible: "ti,ds90ub949"
> +
> +Optional properties:
> +
> +- regulators: List of regulator name strings to enable for operation of device.
> +
> +Example
> +-------
> +
> +ti949: ds90ub949@0 {
> +	compatible = "ti,ds90ub949";
> +
> +	regulators: "vcc",
> +	            "vcc_hdmi";
> +};

-- 
Regards,

Laurent Pinchart
