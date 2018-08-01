From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH 2/2] dt-bindings: clock: Add bindings for the Clocking
 Wizard IP
Date: Wed, 1 Aug 2018 10:26:11 +0200
Message-ID: <a8620c93-cf99-719d-d2bb-7d0f0b567130@xilinx.com>
References: <20180801081950.10497-1-boris.brezillon@bootlin.com>
 <20180801081950.10497-2-boris.brezillon@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180801081950.10497-2-boris.brezillon@bootlin.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Boris Brezillon <boris.brezillon@bootlin.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Julien Su <juliensu@mxic.com.tw>, Michal Simek <michal.simek@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org, zhengxunli@mxic.com.tw
List-Id: devicetree@vger.kernel.org

Hi Boris,

On 1.8.2018 10:19, Boris Brezillon wrote:
> Document Xilinx Clocking Wizard bindings.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  .../devicetree/bindings/clock/xlnx,clk-wizard.txt  | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/xlnx,clk-wizard.txt
> 
> diff --git a/Documentation/devicetree/bindings/clock/xlnx,clk-wizard.txt b/Documentation/devicetree/bindings/clock/xlnx,clk-wizard.txt
> new file mode 100644
> index 000000000000..1bf7a764f4a9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/xlnx,clk-wizard.txt
> @@ -0,0 +1,28 @@
> +Device Tree Clock bindings for the "Clocking Wizard" IP provided by Xilinx
> +
> +This block can be used to generate up to 4 clock signals out of a single input
> +clock. It embeds a PLL to generate an intermediate clock which then feeds 4
> +clock dividers whose divider value can be adjusted based on the user needs.
> +
> +Required properties:
> + - #clock-cells: must be 1. The cell is encoding the id of the output clk
> +		 (from 0 to xlnx,clk-wizard-num-outputs - 1)
> + - compatible: must be "xlnx,clk-wizard-5.1"
> + - clocks: 2 clocks are required
> + - clock-names: should contain 2 clock names: "aclk" and "clkin".
> +		"aclk" is driving the register interface and "clk_in" is the
> +		input clock signal that is used by the PLL block
> + - xlnx,clk-wizard-num-outputs: this describe the number of output clocks
> +				(chosen at synthesization time)
> + - reg: registers used to configure the Clocking wizard block
> +
> +Example:
> +
> +	clkwizard: clkwizard@43c20000 {
> +		compatible = "xlnx,clk-wizard-5.1";
> +		reg = <0x43c20000 0x10000>;
> +		clocks = <&clkc 18>, <&clkc 18>;
> +		clock-names = "aclk", "clk_in1";
> +		#clock-cells = <1>;
> +		xlnx,clk-wizard-num-outputs = <2>;
> +	};
> 

First of all this should be 1/2.

The second is that this driver is already in staging area
(drivers/staging/clocking-wizard) for a while. That's why please use
this driver or send patches on the top of this.

I know we have been doing some changes in this driver recently but not
sure if they reach our tree or mainline.

Thanks,
Michal
