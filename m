From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH (v6) 1/2] mtd: brcmnand: Add brcm,bcm63268-nand device
 tree binding
Date: Wed, 25 Nov 2015 14:06:16 -0600
Message-ID: <20151125200616.GG30473@rob-hp-laptop>
References: <56506D55.3000907@simon.arlott.org.uk>
 <20151122215945.GA5930@rob-hp-laptop>
 <56523E85.905@simon.arlott.org.uk>
 <56523EFF.9050502@simon.arlott.org.uk>
 <56535977.9050201@gmail.com>
 <56541BD3.4070202@simon.arlott.org.uk>
 <5654AF69.7040901@gmail.com>
 <afc6fb02d51a5378e315ade84a134eaf7a58a94f@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <afc6fb02d51a5378e315ade84a134eaf7a58a94f@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Arlott <simon@fire.lp0.eu>
Cc: Florian Fainelli <f.fainelli@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonas Gorski <jogo@openwrt.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 24, 2015 at 08:19:37PM -0000, Simon Arlott wrote:
> Add device tree binding for NAND on the BCM63268.
> 
> The BCM63268 has a NAND interrupt register with combined status and enable
> registers.
> 
> Signed-off-by: Simon Arlott <simon@fire.lp0.eu>

Acked-by: Rob Herring <robh@kernel.org>

> ---
>  .../devicetree/bindings/mtd/brcm,brcmnand.txt      | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
> b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
> index 4ff7128..f2a71c8 100644
> --- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
> +++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
> @@ -72,6 +72,14 @@ we define additional 'compatible' properties and associated register resources w
>         and enable registers
>       - reg-names: (required) "nand-int-base"
> 
> +   * "brcm,nand-bcm63268"
> +     - compatible: should contain "brcm,nand-bcm<soc>", "brcm,nand-bcm63268"
> +     - reg: (required) the 'NAND_INTR_BASE' register range, with combined status
> +       and enable registers, and boot address registers
> +     - reg-names: (required) "nand-intr-base"
> +     - clock: (required) reference to the clock for the NAND controller
> +     - clock-names: (required) "nand"
> +
>     * "brcm,nand-iproc"
>       - reg: (required) the "IDM" register range, for interrupt enable and APB
>         bus access endianness configuration, and the "EXT" register range,
> @@ -148,3 +156,30 @@ nand@f0442800 {
>  		};
>  	};
>  };
> +
> +nand@10000200 {
> +	compatible = "brcm,nand-bcm63168", "brcm,nand-bcm63268",
> +		"brcm,brcmnand-v4.0", "brcm,brcmnand";
> +	reg = <0x10000200 0x180>,
> +	      <0x10000600 0x200>,
> +	      <0x100000b0 0x10>;
> +	reg-names = "nand", "nand-cache", "nand-intr-base";
> +	interrupt-parent = <&periph_intc>;
> +	interrupts = <50>;
> +	clocks = <&periph_clk 20>;
> +	clock-names = "nand";
> +
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	nand0: nandcs@0 {
> +		compatible = "brcm,nandcs";
> +		reg = <0>;
> +		nand-on-flash-bbt;
> +		nand-ecc-strength = <1>;
> +		nand-ecc-step-size = <512>;
> +
> +		#address-cells = <0>;
> +		#size-cells = <0>;
> +	};
> +};
> -- 
> 2.1.4
> 
> -- 
> Simon Arlott
