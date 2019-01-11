From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/9] dt/bindings: drm/komeda: Add DT bindings for ARM
 display processor D71
Date: Fri, 11 Jan 2019 10:15:27 -0600
Message-ID: <20190111161527.GA9669@bogus>
References: <20190103113841.15403-1-james.qian.wang@arm.com>
 <20190103113841.15403-3-james.qian.wang@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190103113841.15403-3-james.qian.wang@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Cc: Liviu Dudau <Liviu.Dudau@arm.com>, "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>, "rdunlap@infradead.org" <rdunlap@infradead.org>, Mark Rutland <Mark.Rutland@arm.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, "Jonathan Chai (Arm Technology China)" <Jonathan.Chai@arm.com>, Alexandru-Cosmin Gheorghe <Alexandru-Cosmin.Gheorghe@arm.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>, "Yiqi Kang (Arm Technology China)" <Yiqi.Kang@arm.com>, "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>, "Tiannan Zhu (Arm Technology China)" <Tiannan.Zhu@arm.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 03, 2019 at 11:40:04AM +0000, james qian wang (Arm Technology China) wrote:
> From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
> 
> Add DT bindings documentation for the ARM display processor D71 and later
> IPs.
> 
> Changes in v4:
> - Deleted unnecessary address-cells, size-cells [Liviu Dudau]
> 
> Changes in v3:
> - Deleted unnecessary property: interrupt-names.
> - Dropped 'ports' and moving 'port' up a level.
> 
> Signed-off-by: James Qian Wang (Arm Technology China) <james.qian.wang@arm.com>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> ---
>  .../bindings/display/arm/arm,komeda.txt       | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/arm/arm,komeda.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/arm/arm,komeda.txt b/Documentation/devicetree/bindings/display/arm/arm,komeda.txt
> new file mode 100644
> index 000000000000..919d651d3e8c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/arm/arm,komeda.txt
> @@ -0,0 +1,73 @@
> +Device Tree bindings for Arm Komeda display driver
> +
> +Required properties:
> +- compatible: Should be "arm,mali-d71"
> +- reg: Physical base address and length of the registers in the system
> +- interrupts: the interrupt line number of the device in the system
> +- clocks: A list of phandle + clock-specifier pairs, one for each entry
> +    in 'clock-names'
> +- clock-names: A list of clock names. It should contain:
> +      - "mclk": for the main processor clock
> +      - "pclk": for the APB interface clock
> +- #address-cells: Must be 1
> +- #size-cells: Must be 0
> +
> +Required properties for sub-node: pipeline@nq
> +Each device contains one or two pipeline sub-nodes (at least one), each
> +pipeline node should provide properties:
> +- reg: Zero-indexed identifier for the pipeline
> +- clocks: A list of phandle + clock-specifier pairs, one for each entry
> +    in 'clock-names'
> +- clock-names: should contain:
> +      - "pxclk": pixel clock
> +      - "aclk": AXI interface clock
> +
> +- port: each pipeline connect to an encoder input port. The connection is
> +    modeled using the OF graph bindings specified in
> +    Documentation/devicetree/bindings/graph.txt
> +
> +Optional properties:
> +  - memory-region: phandle to a node describing memory (see
> +    Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt)
> +    to be used for the framebuffer; if not present, the framebuffer may
> +    be located anywhere in memory.
> +
> +Example:
> +/ {
> +	...
> +
> +	dp0: display@c00000 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible = "arm,mali-d71";
> +		reg = <0xc00000 0x20000>;
> +		interrupts = <0 168 4>;
> +		clocks = <&dpu_mclk>, <&dpu_aclk>;
> +		clock-names = "mclk", "pclk";
> +
> +		dp0_pipe0: pipeline@0 {
> +			clocks = <&fpgaosc2>, <&dpu_aclk>;
> +			clock-names = "pxclk", "aclk";
> +			reg = <0>;
> +
> +			port@0 {

Drop the '@0'

> +				dp0_pipe0_out: endpoint {
> +					remote-endpoint = <&db_dvi0_in>;
> +				};
> +			};
> +		};
> +
> +		dp0_pipe1: pipeline@1 {
> +			clocks = <&fpgaosc2>, <&dpu_aclk>;
> +			clock-names = "pxclk", "aclk";
> +			reg = <1>;
> +
> +			port@0 {

And here.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +				dp0_pipe1_out: endpoint {
> +					remote-endpoint = <&db_dvi1_in>;
> +				};
> +			};
> +		};
> +	};
> +	...
> +};
> -- 
> 2.17.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
