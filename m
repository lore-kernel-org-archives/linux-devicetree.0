From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v5 2/7] dt-bindings: media: Add MAX2175 binding
 description
Date: Wed, 10 May 2017 00:05:04 +0300
Message-ID: <20170509210503.GA19170@kekkonen.localdomain>
References: <20170509133738.16414-1-ramesh.shanmugasundaram@bp.renesas.com>
 <20170509133738.16414-3-ramesh.shanmugasundaram@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170509133738.16414-3-ramesh.shanmugasundaram@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org, hverkuil@xs4all.nl, crope@iki.fi, chris.paterson2@renesas.com, laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Ramesh,

On Tue, May 09, 2017 at 02:37:33PM +0100, Ramesh Shanmugasundaram wrote:
> Add device tree binding documentation for MAX2175 RF to bits tuner
> device.
> 
> Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> v5:
>  - pF in property-units.txt is renamed to pico-farads (Geert)
>  - "maxim,refout-load-pF" is renamed to "maxim,refout-load".
> ---
>  .../devicetree/bindings/media/i2c/max2175.txt      | 61 ++++++++++++++++++++++
>  .../devicetree/bindings/property-units.txt         |  1 +
>  2 files changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/max2175.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/max2175.txt b/Documentation/devicetree/bindings/media/i2c/max2175.txt
> new file mode 100644
> index 000000000000..dce421857efe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/max2175.txt
> @@ -0,0 +1,61 @@
> +Maxim Integrated MAX2175 RF to Bits tuner
> +-----------------------------------------
> +
> +The MAX2175 IC is an advanced analog/digital hybrid-radio receiver with
> +RF to Bits® front-end designed for software-defined radio solutions.
> +
> +Required properties:
> +--------------------
> +- compatible: "maxim,max2175" for MAX2175 RF-to-bits tuner.
> +- clocks: phandle to the fixed xtal clock.

How about "clock specifier"

> +- clock-names: name of the fixed xtal clock, shall be "xtal".

If you have a single clock you could drop clock-names. You can obtain it
in the driver using  clk_get(dev, NULL) . Up to you.

> +- port: child port node corresponding to the I2S output, in accordance with
> +	the video interface bindings defined in
> +	Documentation/devicetree/bindings/media/video-interfaces.txt. The port
> +	node must contain at least one endpoint.
> +
> +Optional properties:
> +--------------------
> +- maxim,master	      : phandle to the master tuner if it is a slave. This
> +			is used to define two tuners in diversity mode
> +			(1 master, 1 slave). By default each tuner is an
> +			individual master.
> +- maxim,refout-load   : load capacitance value (in pico-farads) on reference
> +			output drive level. The possible load values are:
> +			 0 (default - refout disabled)
> +			10
> +			20
> +			30
> +			40
> +			60
> +			70
> +- maxim,am-hiz-filter : empty property indicates the AM Hi-Z filter is used
> +			in this hardware for AM antenna input.
> +
> +Example:
> +--------
> +
> +Board specific DTS file
> +
> +/* Fixed XTAL clock node */
> +maxim_xtal: clock {
> +	compatible = "fixed-clock";
> +	#clock-cells = <0>;
> +	clock-frequency = <36864000>;
> +};
> +
> +/* A tuner device instance under i2c bus */
> +max2175_0: tuner@60 {
> +	compatible = "maxim,max2175";
> +	reg = <0x60>;
> +	clocks = <&maxim_xtal>;
> +	clock-names = "xtal";
> +	maxim,refout-load = <10>;
> +
> +	port {
> +		max2175_0_ep: endpoint {
> +			remote-endpoint = <&slave_rx_device>;
> +		};
> +	};
> +
> +};
> diff --git a/Documentation/devicetree/bindings/property-units.txt b/Documentation/devicetree/bindings/property-units.txt
> index 0849618a9df0..2d1d28843c96 100644
> --- a/Documentation/devicetree/bindings/property-units.txt
> +++ b/Documentation/devicetree/bindings/property-units.txt
> @@ -30,6 +30,7 @@ Electricity
>  -micro-ohms	: micro Ohms
>  -microwatt-hours: micro Watt-hours
>  -microvolt	: micro volts
> +-pico-farads	: picofarads

Why pico-farads and not picofarads? Most of the existing definitions have
no dash. (Just wondering.)

-- 
Kind regards,

Sakari Ailus
sakari.ailus@linux.intel.com
