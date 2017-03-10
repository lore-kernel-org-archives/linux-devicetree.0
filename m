From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCHv3 06/15] atmel-isi: document device tree bindings
Date: Fri, 10 Mar 2017 11:19:00 +0200
Message-ID: <20170310091900.GV3220@valkosipuli.retiisi.org.uk>
References: <20170306145616.38485-1-hverkuil@xs4all.nl>
 <20170306145616.38485-7-hverkuil@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170306145616.38485-7-hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guennadi Liakhovetski <guennadi.liakhovetski-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Songjun Wu <songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Hans,

On Mon, Mar 06, 2017 at 03:56:07PM +0100, Hans Verkuil wrote:
> From: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
> 
> Document the device tree bindings for this hardware.
> 
> Mostly copied from the atmel-isc bindings.
> 
> Signed-off-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
> ---
>  .../devicetree/bindings/media/atmel-isi.txt        | 90 +++++++++++++---------
>  1 file changed, 55 insertions(+), 35 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/atmel-isi.txt b/Documentation/devicetree/bindings/media/atmel-isi.txt
> index 251f008f220c..d6e93e8216af 100644
> --- a/Documentation/devicetree/bindings/media/atmel-isi.txt
> +++ b/Documentation/devicetree/bindings/media/atmel-isi.txt
> @@ -1,51 +1,71 @@
> -Atmel Image Sensor Interface (ISI) SoC Camera Subsystem
> -----------------------------------------------
> +Atmel Image Sensor Interface (ISI)
> +----------------------------------
>  
> -Required properties:
> -- compatible: must be "atmel,at91sam9g45-isi"
> -- reg: physical base address and length of the registers set for the device;
> -- interrupts: should contain IRQ line for the ISI;
> -- clocks: list of clock specifiers, corresponding to entries in
> -          the clock-names property;
> -- clock-names: must contain "isi_clk", which is the isi peripherial clock.
> +Required properties for ISI:
> +- compatible: must be "atmel,at91sam9g45-isi".
> +- reg: physical base address and length of the registers set for the device.
> +- interrupts: should contain IRQ line for the ISI.
> +- clocks: list of clock specifiers, corresponding to entries in the clock-names
> +	property; please refer to clock-bindings.txt.
> +- clock-names: required elements: "isi_clk".
> +- pinctrl-names, pinctrl-0: please refer to pinctrl-bindings.txt.
>  
>  ISI supports a single port node with parallel bus. It should contain one

s/should/shall/ ?

>  'port' child node with child 'endpoint' node. Please refer to the bindings
>  defined in Documentation/devicetree/bindings/media/video-interfaces.txt.
>  
> -Example:
> -	isi: isi@f0034000 {
> -		compatible = "atmel,at91sam9g45-isi";
> -		reg = <0xf0034000 0x4000>;
> -		interrupts = <37 IRQ_TYPE_LEVEL_HIGH 5>;
> -
> -		clocks = <&isi_clk>;
> -		clock-names = "isi_clk";
> +Endpoint node properties
> +------------------------
>  
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&pinctrl_isi>;
> +- bus-width: <8> or <10> (mandatory)
> +- hsync-active
> +- vsync-active
> +- pclk-sample
> +- remote-endpoint: A phandle to the bus receiver's endpoint node.

Are these required or are they optional?

The remote-endpoint is at least mandatory, isn't it?

>  
> -		port {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> +Example:
>  
> -			isi_0: endpoint {
> -				remote-endpoint = <&ov2640_0>;
> -				bus-width = <8>;
> -			};
> +isi: isi@f0034000 {
> +	compatible = "atmel,at91sam9g45-isi";
> +	reg = <0xf0034000 0x4000>;
> +	interrupts = <37 IRQ_TYPE_LEVEL_HIGH 5>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_isi_data_0_7>;
> +	clocks = <&isi_clk>;
> +	clock-names = "isi_clk";
> +	status = "ok";
> +	port {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		isi_0: endpoint {
> +			remote-endpoint = <&ov2640_0>;
> +			bus-width = <8>;
> +			vsync-active = <1>;
> +			hsync-active = <1>;
>  		};
>  	};
> +};
> +
> +i2c1: i2c@f0018000 {
> +	status = "okay";
>  
> -	i2c1: i2c@f0018000 {
> -		ov2640: camera@0x30 {
> -			compatible = "ovti,ov2640";
> -			reg = <0x30>;
> +	ov2640: camera@30 {
> +		compatible = "ovti,ov2640";
> +		reg = <0x30>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_pck0_as_isi_mck &pinctrl_sensor_power &pinctrl_sensor_reset>;
> +		resetb-gpios = <&pioE 11 GPIO_ACTIVE_LOW>;
> +		pwdn-gpios = <&pioE 13 GPIO_ACTIVE_HIGH>;
> +		clocks = <&pck0>;
> +		clock-names = "xvclk";
> +		assigned-clocks = <&pck0>;
> +		assigned-clock-rates = <25000000>;
>  
> -			port {
> -				ov2640_0: endpoint {
> -					remote-endpoint = <&isi_0>;
> -					bus-width = <8>;
> -				};
> +		port {
> +			ov2640_0: endpoint {
> +				remote-endpoint = <&isi_0>;
> +				bus-width = <8>;
>  			};
>  		};
>  	};
> +};

-- 
Kind regards,

Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org	XMPP: sailus-PCDdDYkjdNMDXYZnReoRVg@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
