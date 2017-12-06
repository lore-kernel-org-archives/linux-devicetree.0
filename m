From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] [linux][master][v1] devicetree: misc: Add binding for
 logicoreIP xlnx,vcu
Date: Wed, 6 Dec 2017 15:49:09 -0600
Message-ID: <20171206214909.jr2x6cdzs2577aee@rob-hp-laptop>
References: <1512472023-3957-1-git-send-email-dshah@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1512472023-3957-1-git-send-email-dshah@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dhaval Shah <dhaval.shah@xilinx.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, michal.simek@xilinx.com, hyunk@xilinx.com, Dhaval Shah <dshah@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 05, 2017 at 03:07:03AM -0800, Dhaval Shah wrote:
> From: Dhaval Shah <dhaval.shah@xilinx.com>
> 
> Added the txt file which contain the xlnx,vcu DT node
> properties information. This also provides the information
> of it's child node as well.
> 
> Signed-off-by: Dhaval Shah <dshah@xilinx.com>
> ---
>  .../devicetree/bindings/misc/xlnx,vcu.txt          | 59 ++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/xlnx,vcu.txt
> 
> diff --git a/Documentation/devicetree/bindings/misc/xlnx,vcu.txt b/Documentation/devicetree/bindings/misc/xlnx,vcu.txt
> new file mode 100644
> index 0000000..e722ff3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/xlnx,vcu.txt
> @@ -0,0 +1,59 @@
> +Xilinx VCU init Driver

Bindings don't describe drivers. Describe the h/w.

> +-----------------------------
> +
> +General concept
> +---------------
> +
> +Xilinx VCU init driver is developed to handle the LogiCore related
> +new implementation. In this directory, The DT node of the Xilinx
> +VCU init driver represents as a top level node.
> +
> +Required properties:
> +- compatible: Must be "xlnx,vcu".

Needs to be more specific.

> +- reg, reg-names: There are two sets of registers need to provide.
> +	1. vcu slcr
> +	2. Logicore
> +	reg-names should contain name for the each register sequence.
> +- clocks: phandle for aclk and pll_ref clocksource
> +- clock-names: The identification string, "aclk", is always required for
> +   the axi clock. "pll_ref" is required for pll.
> +- ranges
> +- VCU Init driver node define the following child nodes:
> +	* Allegro encoder driver node

encoder of what?

> +		- compatible: Must be "al,al5e"
> +		- reg: There is a one set of register.


> +		- interrupts: interrupt number to the cpu.
> +		- interrupt-parent: the phandle for the interrupt controller
> +		  that services interrupts for this device.
> +	* Allegro decoder driver node
> +		- compatible: Must be "al,al5d"
> +		- reg: There is a one set of register.
> +		- interrupts: interrupt number to the cpu.
> +		- interrupt-parent: the phandle for the interrupt controller
> +		  that services interrupts for this device.
> +Example:
> +
> +	xlnx_vcu: vcu@a0040000 {
> +		compatible = "xlnx,vcu";
> +		#address-cells = <2>;
> +		#size-cells = <2>;

There's no reason the child nodes need 64 bits of address or size. Use 
ranges.

> +		reg = <0x0 0xa0040000 0x0 0x1000>,
> +			 <0x0 0xa0041000 0x0 0x1000>;
> +		reg-names = "vcu_slcr", "logicore";
> +		clocks = <&si570_1>, <&clkc 71>;
> +		clock-names = "pll_ref", "aclk";
> +		ranges;
> +		encoder: al5e@a0000000 {
> +			compatible = "al,al5e";
> +			reg = <0x0 0xa0000000 0x0 0x10000>;
> +			interrupts = <0 89 4>;
> +			interrupt-parent = <&gic>;
> +		};
> +
> +		decoder: al5d@a0020000 {
> +			compatible = "al,al5d";
> +			reg = <0x0 0xa0020000 0x0 0x10000>;
> +			interrupts = <0 89 4>;

A shared interrupt? Are these really separate blocks? Seems like this 
could all be a single node.

> +			interrupt-parent = <&gic>;
> +		};
> +	};
> -- 
> 2.7.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
