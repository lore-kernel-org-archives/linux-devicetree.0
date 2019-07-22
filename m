From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 2/2] dt-bindings: mtd: Document Macronix raw NAND
 controller bindings
Date: Mon, 22 Jul 2019 17:46:14 -0600
Message-ID: <20190722234614.GA11971@bogus>
References: <1562138144-2212-1-git-send-email-masonccyang@mxic.com.tw>
 <1562138144-2212-3-git-send-email-masonccyang@mxic.com.tw>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1562138144-2212-3-git-send-email-masonccyang@mxic.com.tw>
Sender: linux-kernel-owner@vger.kernel.org
To: Mason Yang <masonccyang@mxic.com.tw>
Cc: miquel.raynal@bootlin.com, marek.vasut@gmail.com, bbrezillon@kernel.org, dwmw2@infradead.org, computersforpeace@gmail.com, vigneshr@ti.com, richard@nod.at, stefan@agner.ch, mark.rutland@arm.com, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, juliensu@mxic.com.tw, paul.burton@mips.com, liang.yang@amlogic.com, lee.jones@linaro.org, anders.roxell@linaro.org, christophe.kerello@st.com, paul@crapouillou.net, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 03, 2019 at 03:15:44PM +0800, Mason Yang wrote:
> Document the bindings used by the Macronix raw NAND controller.
> 
> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> ---
>  Documentation/devicetree/bindings/mtd/mxic-nand.txt | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/mxic-nand.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mxic-nand.txt b/Documentation/devicetree/bindings/mtd/mxic-nand.txt
> new file mode 100644
> index 0000000..ddd7660
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/mxic-nand.txt
> @@ -0,0 +1,20 @@
> +Macronix Raw NAND Controller Device Tree Bindings
> +-------------------------------------------------
> +
> +Required properties:
> +- compatible: should be "macronix,nand-controller"

That's not very specific. There's only 1 version of this h/w?

> +- reg: should contain 1 entrie for the registers

s/entrie/entry/

> +- interrupts: interrupt line connected to this raw NAND controller
> +- clock-names: should contain "ps_clk", "send_clk" and "send_dly_clk"
> +- clocks: should contain 3 phandles for the "ps_clk", "send_clk" and
> +	 "send_dly_clk" clocks

You can drop '_clk' as that is redundant.

> +
> +Example:
> +
> +	nand: mxic-nfc@43c30000 {
> +		compatible = "macronix,nand-controller";
> +		reg = <0x43c30000 0x10000>;
> +		reg-names = "regs";

Not documented. You can drop as *-names is not generally useful when 
there is only 1 entry.

> +		clocks = <&clkwizard 0>, <&clkwizard 1>, <&clkc 15>;
> +		clock-names = "send_clk", "send_dly_clk", "ps_clk";
> +	};
> -- 
> 1.9.1
> 
