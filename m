From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH V2 1/2] clk: vc5: Add bindings for IDT VersaClock 5P49V5923 and 5P49V5933
Date: Thu, 12 Jan 2017 03:31:34 +0200
Message-ID: <9473276.tbXASbKZcx@avalon>
References: <20170112010324.28068-1-marek.vasut@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170112010324.28068-1-marek.vasut@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Marek,

Thank you for the patch.

On Thursday 12 Jan 2017 02:03:23 Marek Vasut wrote:
> Add bindings for IDT VersaClock 5 5P49V5923 and 5P49V5933 chips.
> These are I2C clock generators with optional clock source from
> either XTal or dedicated clock generator and, depending on the
> model, two or more clock outputs.
> 
> Signed-off-by: Marek Vasut <marek.vasut@gmail.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Please add this tag if you submit a v3.

> ---
> V2: Add mapping between the clock specifier and physical pins of the chip
> ---
>  .../devicetree/bindings/clock/idt,versaclock5.txt  | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/clock/idt,versaclock5.txt
> 
> diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.txt
> b/Documentation/devicetree/bindings/clock/idt,versaclock5.txt new file mode
> 100644
> index 000000000000..87e9c47a89a3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.txt
> @@ -0,0 +1,65 @@
> +Binding for IDT VersaClock5 programmable i2c clock generator.
> +
> +The IDT VersaClock5 are programmable i2c clock generators providing
> +from 3 to 12 output clocks.
> +
> +==I2C device node==
> +
> +Required properties:
> +- compatible:	shall be one of "idt,5p49v5923" , "idt,5p49v5933".
> +- reg:		i2c device address, shall be 0x68 or 0x6a.
> +- #clock-cells:	from common clock binding; shall be set to 1.
> +- clocks:	from common clock binding; list of parent clock handles,
> +		- 5p49v5923: (required) either or both of XTAL or CLKIN
> +					reference clock.
> +		- 5p49v5933: (optional) property not present (internal
> +					Xtal used) or CLKIN reference
> +					clock.
> +- clock-names:	from common clock binding; clock input names, can be
> +		- 5p49v5923: (required) either or both of "xin", "clkin".
> +		- 5p49v5933: (optional) property not present or "clkin".
> +
> +==Mapping between clock specifier and physical pins==
> +
> +When referencing the provided clock in the DT using phandle and
> +clock specifier, the following mapping applies:
> +
> +5P49V5923:
> +	0 -- OUT0_SEL_I2CB
> +	1 -- OUT1
> +	2 -- OUT2
> +
> +5P49V5933:
> +	0 -- OUT0_SEL_I2CB
> +	1 -- OUT1
> +	2 -- OUT4
> +
> +==Example==
> +
> +/* 25MHz reference crystal */
> +ref25: ref25m {
> +	compatible = "fixed-clock";
> +	#clock-cells = <0>;
> +	clock-frequency = <25000000>;
> +};
> +
> +i2c-master-node {
> +
> +	/* IDT 5P49V5923 i2c clock generator */
> +	vc5: clock-generator@6a {
> +		compatible = "idt,5p49v5923";
> +		reg = <0x6a>;
> +		#clock-cells = <1>;
> +
> +		/* Connect XIN input to 25MHz reference */
> +		clocks = <&ref25m>;
> +		clock-names = "xin";
> +	};
> +};
> +
> +/* Consumer referencing the 5P49V5923 pin OUT1 */
> +consumer {
> +	...
> +	clocks = <&vc5 1>;
> +	...
> +}

-- 
Regards,

Laurent Pinchart

