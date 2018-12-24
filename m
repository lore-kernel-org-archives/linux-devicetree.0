From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v3 2/9] dt/bindings: drm/komeda: Add DT bindings for ARM
 display processor D71
Date: Mon, 24 Dec 2018 12:00:49 +0000
Message-ID: <20181224120049.GD22341@e110455-lin.cambridge.arm.com>
References: <20181221095757.15510-1-james.qian.wang@arm.com>
 <20181221095757.15510-3-james.qian.wang@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181221095757.15510-3-james.qian.wang@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Cc: "Jonathan Chai (Arm Technology China)" <Jonathan.Chai@arm.com>, Brian Starkey <Brian.Starkey@arm.com>, "Julien Yin (Arm Technology China)" <Julien.Yin@arm.com>, "thomas Sun (Arm Technology China)" <thomas.Sun@arm.com>, Alexandru-Cosmin Gheorghe <Alexandru-Cosmin.Gheorghe@arm.com>, "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Tiannan Zhu (Arm Technology China)" <Tiannan.Zhu@arm.com>, "Jin Gao (Arm Technology China)" <Jin.Gao@arm.com>, "Yiqi Kang (Arm Technology China)" <Yiqi.Kang@arm.com>, nd <nd@arm.com>, "malidp@foss.arm.com" <malidp@foss.arm.com>, "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, "sean@poorly.run" <sean@poorly.run>, corbet
List-Id: devicetree@vger.kernel.org

On Fri, Dec 21, 2018 at 09:59:12AM +0000, james qian wang (Arm Technology China) wrote:
> Add DT bindings documentation for the ARM display processor D71 and later
> IPs.
> 
> Signed-off-by: James (Qian) Wang <james.qian.wang@arm.com>
> 
> Changes in v3:
> - Deleted unnecessary property: interrupt-names.
> - Dropped 'ports' and moving 'port' up a level.
> ---
>  .../bindings/display/arm/arm,komeda.txt       | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/arm/arm,komeda.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/arm/arm,komeda.txt b/Documentation/devicetree/bindings/display/arm/arm,komeda.txt
> new file mode 100644
> index 000000000000..b4e450243c7d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/arm/arm,komeda.txt
> @@ -0,0 +1,79 @@
> +Device Tree bindings for ARM Komeda display driver
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
> +			#address-cells = <1>;
> +			#size-cells = <0>;

These are undocumented and not necessary anyway, as the pipelines will
inherit display's attributes.

> +
> +			port@0 {
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
> +			#address-cells = <1>;
> +			#size-cells = <0>;

same here.

> +
> +			port@0 {
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

With these changes:

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu


-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
