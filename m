From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 2/2] dt-bindings: display: bridge: TI FPD-Link III
 Serializer/Deserializer
Date: Wed, 13 Mar 2019 20:49:02 +0200
Message-ID: <20190313184902.GR4722@pendragon.ideasonboard.com>
References: <20190313183527.22883-1-vince.k.kim@gmail.com>
 <20190313183527.22883-2-vince.k.kim@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190313183527.22883-2-vince.k.kim@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vince Kim <vince.k.kim@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrzej Hajda <a.hajda@samsung.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Vince,

Thank you for the patch.

Are you aware of the "[PATCH 0/7] mfd/pinctrl: add initial support of TI
DS90Ux9xx ICs" patch series
(https://lore.kernel.org/lkml/20181012060314.GU4939@dell/T/) ?

On Wed, Mar 13, 2019 at 11:34:58AM -0700, Vince Kim wrote:
> Add documments of device tree bindings for TI FPD-Link III Serializer
> and Deserializer chips;  DS90UB927, DS90UB949, DS90UB948
> 
> Signed-off-by: Vince Kim <vince.k.kim@gmail.com>
> ---
>  .../bindings/display/bridge/ti,ds90ub9xx.txt  | 39 +++++++++++++++++++
>  .../bindings/display/bridge/ti,fpdlink.txt    | 25 ++++++++++++
>  2 files changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,ds90ub9xx.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,fpdlink.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,ds90ub9xx.txt b/Documentation/devicetree/bindings/display/bridge/ti,ds90ub9xx.txt
> new file mode 100644
> index 000000000000..351d9cb79ebd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,ds90ub9xx.txt
> @@ -0,0 +1,39 @@
> +Binding for TI FPD-Link III Bridge Serializers; TI DS90UB927, DS90UB949
> +TI FPD-Link III Bridge Deserializer; DS90UB948
> +
> +Required properties:
> +- compatible: shall be one of
> +		"ti,ds90ub927"
> +		"ti,ds90ub948"
> +		"ti,ds90ub949"
> +- reg: i2c device address
> +
> +
> +Optional properties:
> +- power-en-pin: GPIO pin for power enable
> +- reg_config: register address and value to be written during initialization

That property is a software policy, not a system description. It doesn't
belong in DT.

> +
> +
> +Example:
> +--------
> +I2c-master-node {
> +...
> +	fpdlink_serializer_i2c3: serializer@0c {
> +		status = "okay";
> +		compatible = "ti,ds90ub949";
> +		reg = <0x0c>;
> +	/* Enabling passthrough for GPIO0 on serializer for touchscreen IRQ */
> +		reg_config = <0x0d 0x25>;
> +	};
> +
> +	fpdlink_deserializer_i2c3: deserializer@2c {
> +		status = "okay";
> +		compatible = "ti,ds90ub948";
> +		power-en-pin =  <&gpio9 8  GPIO_ACTIVE_HIGH>;
> +		reg = <0x2c>;
> +		/* 0x90 for DISP enable, 0x9 is for Touch enable on GPIO1 and 2*/
> +		reg_config = <0x1e 0x99>;
> +	};

The connection between the serializer and deserializer, as well as
between those two chips and the other part of the display (or camera)
pipeline should be described using ports (see the OF graph bindings).

> +...
> +}
> +
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,fpdlink.txt b/Documentation/devicetree/bindings/display/bridge/ti,fpdlink.txt
> new file mode 100644
> index 000000000000..2f2e1a269722
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,fpdlink.txt
> @@ -0,0 +1,25 @@
> +Binding for TI FPD-Link III Bridge driver
> +
> +Wrapper DRM Bridge driver for TI FPD-Link III Serializer and Deserializer
> +
> +Required properties:
> +- compatible: "ti,fpdlink"
> +- fpdlink-serializer-i2c-handle: i2c node for TI FPD-Link III serializer driver
> +- fpdlink-deserializer-i2c-handle: i2c node for TI FPD-Link III deserializer driver
> +
> +
> +Example:
> +--------
> +fpdlink_lvds: fpdlink_bridge@0 {
> +	status = "okay";
> +	compatible = "ti,fpdlink";
> +	fpdlink-serializer-i2c-handle = <&fpdlink_serializer_i2c0>;
> +	fpdlink-deserializer-i2c-handle = <&fpdlink_deserializer_i2c0>;
> +};

This doesn't correspond to hardware, you shouldn't have such a node in
DT. Instead your drivers should operate properly using the two nodes
above, corresponding to the serializer and deserializer.

> +
> +consumer: {
> +...
> +	fpdlink-bridge-handle = <&fpdlink_lvds>;

This is very device-specific and would require the consumer to be aware
of fpdlink. You should instead use OF graph to describe connections.

> +...
> +}
> +

-- 
Regards,

Laurent Pinchart
