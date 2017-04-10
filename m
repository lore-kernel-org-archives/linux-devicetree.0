From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/8] dt-bindings: Document STM32 DCMI bindings
Date: Mon, 10 Apr 2017 10:20:25 -0500
Message-ID: <20170410152025.nx4zrnbth6wgamro@rob-hp-laptop>
References: <1491320678-17246-1-git-send-email-hugues.fruchet@st.com>
 <1491320678-17246-2-git-send-email-hugues.fruchet@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1491320678-17246-2-git-send-email-hugues.fruchet-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 04, 2017 at 05:44:31PM +0200, Hugues Fruchet wrote:
> This adds documentation of device tree bindings for the STM32 DCMI
> (Digital Camera Memory Interface).
> 
> Signed-off-by: Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>
> ---
>  .../devicetree/bindings/media/st,stm32-dcmi.txt    | 46 ++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/st,stm32-dcmi.txt

One nit below, otherwise:

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> 
> diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.txt b/Documentation/devicetree/bindings/media/st,stm32-dcmi.txt
> new file mode 100644
> index 0000000..c0f6f4b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.txt
> @@ -0,0 +1,46 @@
> +STMicroelectronics STM32 Digital Camera Memory Interface (DCMI)
> +
> +Required properties:
> +- compatible: "st,stm32-dcmi"
> +- reg: physical base address and length of the registers set for the device
> +- interrupts: should contain IRQ line for the DCMI
> +- resets: reference to a reset controller,
> +          see Documentation/devicetree/bindings/reset/st,stm32-rcc.txt
> +- clocks: list of clock specifiers, corresponding to entries in
> +          the clock-names property
> +- clock-names: must contain "mclk", which is the DCMI peripherial clock
> +- pinctrl: the pincontrol settings to configure muxing properly
> +           for pins that connect to DCMI device.
> +           See Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt.
> +- dmas: phandle to DMA controller node,
> +        see Documentation/devicetree/bindings/dma/stm32-dma.txt
> +- dma-names: must contain "tx", which is the transmit channel from DCMI to DMA
> +
> +DCMI supports a single port node with parallel bus. It should contain one
> +'port' child node with child 'endpoint' node. Please refer to the bindings
> +defined in Documentation/devicetree/bindings/media/video-interfaces.txt.
> +
> +Example:
> +
> +	dcmi: dcmi@50050000 {
> +		compatible = "st,stm32-dcmi";
> +		reg = <0x50050000 0x400>;
> +		interrupts = <78>;
> +		resets = <&rcc STM32F4_AHB2_RESET(DCMI)>;
> +		clocks = <&rcc 0 STM32F4_AHB2_CLOCK(DCMI)>;
> +		clock-names = "mclk";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&dcmi_pins>;
> +		dmas = <&dma2 1 1 0x414 0x3>;
> +		dma-names = "tx";
> +		port {
> +			dcmi_0: endpoint@0 {

Unit address in not valid without a reg prop, so drop it.

> +				remote-endpoint = <...>;
> +				bus-width = <8>;
> +				hsync-active = <0>;
> +				vsync-active = <0>;
> +				pclk-sample = <1>;
> +			};
> +		};
> +	};
> +
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
