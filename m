From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC][PATCH 1/2] dt/bindings: display: Add DT bindings for Mali
 Display Processors.
Date: Fri, 1 Apr 2016 17:47:57 +0100
Message-ID: <20160401164757.GB7395@leverpostej>
References: <1459527712-9488-1-git-send-email-Liviu.Dudau@arm.com>
 <1459527712-9488-2-git-send-email-Liviu.Dudau@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1459527712-9488-2-git-send-email-Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Cc: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>, David Brown <David.Brown-5wv7dgnIgG8@public.gmane.org>, Brian Starkey <Brian.Starkey-5wv7dgnIgG8@public.gmane.org>, DRI devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 01, 2016 at 05:21:51PM +0100, Liviu Dudau wrote:
> Add DT bindings documentation for the Mali Display Processor. The bindings
> describe the Mali DP500, DP550 and DP650 processors from ARM Ltd.
> 
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> 
> Signed-off-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
> ---
>  .../devicetree/bindings/display/arm,malidp.txt     | 65 ++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/arm,malidp.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/arm,malidp.txt b/Documentation/devicetree/bindings/display/arm,malidp.txt
> new file mode 100644
> index 0000000..ed70de3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/arm,malidp.txt
> @@ -0,0 +1,65 @@
> +ARM Mali-DP
> +
> +The following bindings apply to a family of Display Processors sold as
> +licensable IP by ARM Ltd. The bindings describe the Mali DP500, DP550 and
> +DP650 processors that offer multiple composition layers, support for
> +rotation and scaling output.
> +
> +Required properties:
> +  - compatible: should be one of
> +	"arm,mali-dp500"
> +	"arm,mali-dp550"
> +	"arm,mali-dp650"
> +    depending on the particular implementation present in the hardware
> +  - reg: Physical base address and size of the block of registers used by
> +    the processor.
> +  - interrupts: Interrupt list, as defined in ../interrupt-controller/interrupts.txt,
> +    interrupt client nodes.
> +  - interrupt-names: name of the engine inside the processor that will
> +    use the corresponding interrupt. Should be one of "DE" or "SE".

s/be one of/contain/, s/or/and/, judging by the example.

Otherwise this generally looks fine to me.

Mark.

> +  - clocks: A list of phandle + clock-specifier pairs, one for each entry
> +    in 'clock-names'
> +  - clock-names: A list of clock names. It should contain:
> +      - "pclk": for the APB interface clock
> +      - "aclk": for the AXI interface clock
> +      - "mclk": for the main processor clock
> +      - "pxlclk": for the pixel clock feeding the output PLL of the processor.
> +  - arm,malidp-output-port-lines: Array of u8 values describing the number
> +    of output lines per channel (R, G and B).
> +
> +Required sub-nodes:
> +  - port: The Mali DP connection to an encoder input port. The connection
> +    is modelled using the OF graph bindings specified in
> +    Documentation/devicetree/bindings/graph.txt
> +
> +Optional properties:
> +  - memory-region: phandle to a node describing memory (see
> +    Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt)
> +    to be used for the framebuffer; if not present, the framebuffer may
> +    be located anywhere in memory.
> +
> +
> +Example:
> +
> +/ {
> +	...
> +
> +	dp0: malidp@6f200000 {
> +		compatible = "arm,mali-dp650";
> +		reg = <0 0x6f200000 0 0x20000>;
> +		memory-region = <&display_reserved>;
> +		interrupts = <0 168 IRQ_TYPE_LEVEL_HIGH>,
> +			     <0 168 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "DE", "SE";
> +		clocks = <&oscclk2>, <&fpgaosc0>, <&fpgaosc1>, <&fpgaosc1>;
> +		clock-names = "pxlclk", "mclk", "aclk", "pclk";
> +		arm,malidp-output-port-lines = /bits/ 8 <8 8 8>;
> +		port {
> +			dp0_output: endpoint {
> +				remote-endpoint = <&tda998x_2_input>;
> +			};
> +		};
> +	};
> +
> +	...
> +};
> -- 
> 2.7.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
