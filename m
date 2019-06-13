From: Rob Herring <robh@kernel.org>
Subject: Re: [v1 1/4] dt-bindings: display: Add DT bindings for LS1028A
 HDP-TX PHY.
Date: Thu, 13 Jun 2019 14:08:13 -0600
Message-ID: <20190613200813.GA895@bogus>
References: <20190508103703.40885-1-wen.he_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190508103703.40885-1-wen.he_1@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wen He <wen.he_1@nxp.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>
List-Id: devicetree@vger.kernel.org

On Wed, May 08, 2019 at 10:35:25AM +0000, Wen He wrote:
> Add DT bindings documentmation for the HDP-TX PHY controller. The describes
> which could be found on NXP Layerscape ls1028a platform.

Drop the hard stop (.) from the subject.

> 
> Signed-off-by: Wen He <wen.he_1@nxp.com>
> ---
>  .../devicetree/bindings/display/fsl,hdp.txt   | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/fsl,hdp.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/fsl,hdp.txt b/Documentation/devicetree/bindings/display/fsl,hdp.txt
> new file mode 100644
> index 000000000000..36b5687a1261
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/fsl,hdp.txt
> @@ -0,0 +1,56 @@
> +NXP Layerscpae ls1028a HDP-TX PHY Controller
> +============================================
> +
> +The following bindings describe the Cadence HDP TX PHY on ls1028a that
> +offer multi-protocol support of standars such as eDP and Displayport,
> +supports for 25-600MHz pixel clock and up to 4k2k at 60MHz resolution.
> +The HDP transmitter is a Cadence HDP TX controller IP with a companion
> +PHY IP.

I'm confused. This binding covers both blocks or is just one of them?

> +
> +Required properties:
> +  - compatible:   Should be "fsl,ls1028a-dp" for ls1028a.
> +  - reg:          Physical base address and size of the block of registers used
> +  by the processor.
> +  - interrupts:   HDP hotplug in/out detect interrupt number
> +  - clocks:       A list of phandle + clock-specifier pairs, one for each entry
> +  in 'clock-names'
> +  - clock-names:  A list of clock names. It should contain:
> +      - "clk_ipg": inter-Integrated circuit clock
> +      - "clk_core": for the Main Display TX controller clock
> +      - "clk_pxl": for the pixel clock feeding the output PLL of the processor
> +      - "clk_pxl_mux": for the high PerfPLL bypass clock
> +      - "clk_pxl_link": for the link rate pixel clock
> +      - "clk_apb": for the APB interface clock
> +      - "clk_vif": for the Video pixel clock

The 'clk_' part is redundant.

> +
> +Required sub-nodes:
> +  - port: The HDP connection to an encoder output port. The connection
> +    is modelled using the OF graph bindings specified in
> +    Documentation/devicetree/bindings/graph.txt
> +
> +
> +Example:
> +
> +/ {
> +        ...
> +
> +	hdp: display@f200000 {
> +                compatible = "fsl,ls1028a-dp";
> +		reg = <0x0 0xf1f0000 0x0 0xffff>,
> +		    <0x0 0xf200000 0x0 0xfffff>;
> +                interrupts = <0 221 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&sysclk>, <&hdpclk>, <&dpclk>,
> +                         <&dpclk>, <&dpclk>, <&pclk>, <&dpclk>;
> +		clock-names = "clk_ipg", "clk_core", "clk_pxl",
> +                              "clk_pxl_mux", "clk_pxl_link", "clk_apb",
> +                              "clk_vif";
> +
> +		port {
> +			dp1_output: endpoint {
> +				remote-endpoint = <&dp0_input>;
> +			};
> +		};
> +        };
> +
> +        ...
> +};
> -- 
> 2.17.1
> 
