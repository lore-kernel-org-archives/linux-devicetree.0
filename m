From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC][PATCH 1/2] dt/bindings: display: Add DT bindings for Mali
 Display Processors.
Date: Mon, 4 Apr 2016 00:16:02 -0500
Message-ID: <20160404051602.GJ17806@rob-hp-laptop>
References: <1459527712-9488-1-git-send-email-Liviu.Dudau@arm.com>
 <1459527712-9488-2-git-send-email-Liviu.Dudau@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1459527712-9488-2-git-send-email-Liviu.Dudau@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: Dave Airlie <airlied@gmail.com>, Daniel Stone <daniel@fooishbar.org>, David Brown <David.Brown@arm.com>, Brian Starkey <Brian.Starkey@arm.com>, DRI devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 01, 2016 at 05:21:51PM +0100, Liviu Dudau wrote:
> Add DT bindings documentation for the Mali Display Processor. The bindings
> describe the Mali DP500, DP550 and DP650 processors from ARM Ltd.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
> Cc: Kumar Gala <galak@codeaurora.org>
> 
> Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
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

I assume these have revisions and configuration options. These will need 
SoC specific properties as well. No need to add one now if you don't 
have an SoC to list, but just note something to this effect.

> +  - reg: Physical base address and size of the block of registers used by
> +    the processor.
> +  - interrupts: Interrupt list, as defined in ../interrupt-controller/interrupts.txt,
> +    interrupt client nodes.
> +  - interrupt-names: name of the engine inside the processor that will
> +    use the corresponding interrupt. Should be one of "DE" or "SE".

This is worded like it is either one, but the example shows both.

> +  - clocks: A list of phandle + clock-specifier pairs, one for each entry
> +    in 'clock-names'
> +  - clock-names: A list of clock names. It should contain:
> +      - "pclk": for the APB interface clock
> +      - "aclk": for the AXI interface clock
> +      - "mclk": for the main processor clock
> +      - "pxlclk": for the pixel clock feeding the output PLL of the processor.
> +  - arm,malidp-output-port-lines: Array of u8 values describing the number
> +    of output lines per channel (R, G and B).

This should be a function of the type of panel you connect and 
shouldn't be needed.

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

display-controller@

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
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
