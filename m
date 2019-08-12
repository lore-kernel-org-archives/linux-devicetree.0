From: Rob Herring <robh@kernel.org>
Subject: Re: [v2 1/4] dt-bindings: display: Add DT bindings for LS1028A
 HDP-TX PHY.
Date: Mon, 12 Aug 2019 17:29:34 -0600
Message-ID: <20190812232934.GA1219@bogus>
References: <20190719100942.12016-1-wen.he_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190719100942.12016-1-wen.he_1@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wen He <wen.he_1@nxp.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, leoyang.li@nxp.com
List-Id: devicetree@vger.kernel.org

On Fri, Jul 19, 2019 at 06:09:39PM +0800, Wen He wrote:
> Add DT bindings documentmation for the HDP-TX PHY controller. The describes
> which could be found on NXP Layerscape ls1028a platform.

Not required, but please consider converting to DT schema (YAML) format.

> 
> Signed-off-by: Wen He <wen.he_1@nxp.com>
> ---
> change in v2:
>         - correction the node name.
> 
>  .../devicetree/bindings/display/fsl,hdp.txt   | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/fsl,hdp.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/fsl,hdp.txt b/Documentation/devicetree/bindings/display/fsl,hdp.txt
> new file mode 100644
> index 000000000000..53ca08337587
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/fsl,hdp.txt
> @@ -0,0 +1,56 @@
> +NXP Layerscpae ls1028a HDP-TX PHY Controller

typo

> +============================================
> +
> +The following bindings describe the Cadence HDP TX PHY on ls1028a that
> +offer multi-protocol support of standars such as eDP and Displayport,

s/offer/offers/

and another typo.

> +supports for 25-600MHz pixel clock and up to 4k2k at 60MHz resolution.
> +The HDP transmitter is a Cadence HDP TX controller IP with a companion
> +PHY IP.
> +
> +Required properties:
> +  - compatible:   Should be "fsl,ls1028a-dp" for ls1028a.
> +  - reg:          Physical base address and size of the block of registers used
> +  by the processor.

The example shows 2 regions, what are they?

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

'clk_' is redundant.

> +
> +Required sub-nodes:
> +  - port: The HDP connection to an encoder output port. The connection
> +    is modelled using the OF graph bindings specified in
> +    Documentation/devicetree/bindings/graph.txt

I'm still confused as to what this block does? The 'encoder output' is 
DisplayPort? If this is just a phy, then use the phy binding.

Normally, a DisplayPort encoder/bridge OF graph output would be 
connected to a DP connector node or a panel.

Rob
