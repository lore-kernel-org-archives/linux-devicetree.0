From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: Document STM32 DCMI bindings
Date: Mon, 3 Apr 2017 11:23:10 -0500
Message-ID: <20170403162309.eikbsmfbxw6admdc@rob-hp-laptop>
References: <1490887667-8880-1-git-send-email-hugues.fruchet@st.com>
 <1490887667-8880-2-git-send-email-hugues.fruchet@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1490887667-8880-2-git-send-email-hugues.fruchet-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 30, 2017 at 05:27:40PM +0200, Hugues Fruchet wrote:
> This adds documentation of device tree bindings for the STM32 DCMI
> (Digital Camera Memory Interface).
> 
> Signed-off-by: Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>
> ---
>  .../devicetree/bindings/media/st,stm32-dcmi.txt    | 85 ++++++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/st,stm32-dcmi.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.txt b/Documentation/devicetree/bindings/media/st,stm32-dcmi.txt
> new file mode 100644
> index 0000000..8180f63
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.txt
> @@ -0,0 +1,85 @@
> +STMicroelectronics STM32 Digital Camera Memory Interface (DCMI)
> +
> +Required properties:
> +- compatible: "st,stm32-dcmi"

Same block and same errata on all stm32 variants?

> +- reg: physical base address and length of the registers set for the device
> +- interrupts: should contain IRQ line for the DCMI
> +- clocks: list of clock specifiers, corresponding to entries in
> +          the clock-names property
> +- clock-names: must contain "mclk", which is the DCMI peripherial clock
> +- resets: reference to a reset controller
> +- reset-names: see Documentation/devicetree/bindings/reset/st,stm32-rcc.txt
> +
> +DCMI supports a single port node with parallel bus. It should contain one
> +'port' child node with child 'endpoint' node. Please refer to the bindings
> +defined in Documentation/devicetree/bindings/media/video-interfaces.txt.
> +
> +Example:
> +
> +Device node example
> +-------------------
> +	dcmi: dcmi@50050000 {
> +		compatible = "st,stm32-dcmi";
> +		reg = <0x50050000 0x400>;
> +		interrupts = <78>;
> +		resets = <&rcc STM32F4_AHB2_RESET(DCMI)>;
> +		clocks = <&rcc 0 STM32F4_AHB2_CLOCK(DCMI)>;
> +		clock-names = "mclk";

> +		pinctrl-names = "default";
> +		pinctrl-0 = <&dcmi_pins>;

Not documented.

> +		dmas = <&dma2 1 1 0x414 0x3>;
> +		dma-names = "tx";

Not documented.

> +		status = "disabled";

Drop status from examples.

> +	};
> +
> +Board setup example

Please don't split examples. That's just source level details and not 
part of the ABI.

> +-------------------
> +This example is extracted from STM32F429-EVAL board devicetree.
> +Please note that on this board, the camera sensor reset & power-down
> +line level are inverted (so reset is active high and power-down is
> +active low).
> +
> +/ {
> +	[...]
> +	clocks {
> +		clk_ext_camera: clk-ext-camera {
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <24000000>;
> +		};
> +	};
> +	[...]
> +};
> +
> +&dcmi {
> +	status = "okay";
> +
> +	port {
> +		dcmi_0: endpoint@0 {
> +			remote-endpoint = <&ov2640_0>;
> +			bus-width = <8>;
> +			hsync-active = <0>;
> +			vsync-active = <0>;
> +			pclk-sample = <1>;
> +		};
> +	};
> +};
> +
> +&i2c@1 {
> +	[...]
> +	ov2640: camera@30 {
> +		compatible = "ovti,ov2640";
> +		reg = <0x30>;
> +		resetb-gpios = <&stmpegpio 2 GPIO_ACTIVE_HIGH>;
> +		pwdn-gpios = <&stmpegpio 0 GPIO_ACTIVE_LOW>;
> +		clocks = <&clk_ext_camera>;
> +		clock-names = "xvclk";
> +		status = "okay";
> +
> +		port {
> +			ov2640_0: endpoint {
> +				remote-endpoint = <&dcmi_0>;
> +			};
> +		};
> +	};
> +};
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
