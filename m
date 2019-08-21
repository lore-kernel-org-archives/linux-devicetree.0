From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 03/19] dt-bindings: mrvl,intc: Add a MMP3 interrupt
 controller
Date: Wed, 21 Aug 2019 16:11:03 -0500
Message-ID: <20190821211103.GA32263@bogus>
References: <20190809093158.7969-1-lkundrak@v3.sk>
 <20190809093158.7969-4-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190809093158.7969-4-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: Olof Johansson <olof@lixom.net>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 09, 2019 at 11:31:42AM +0200, Lubomir Rintel wrote:
> Similar to MMP2 one, but has an extra range for the other core. The
> muxes stay the same.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  .../interrupt-controller/mrvl,intc.txt        | 23 ++++++++++++++-----
>  1 file changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.txt b/Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.txt
> index 608fee15a4cfc..41c131d026f94 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.txt
> @@ -1,13 +1,15 @@
>  * Marvell MMP Interrupt controller
>  
>  Required properties:
> -- compatible : Should be "mrvl,mmp-intc", "mrvl,mmp2-intc" or
> -  "mrvl,mmp2-mux-intc"
> +- compatible : Should be "mrvl,mmp-intc", "mrvl,mmp2-intc",
> +  "marvell,mmp3-intc", "mrvl,mmp2-mux-intc"

Reformat to 1 valid combination per line.

>  - reg : Address and length of the register set of the interrupt controller.
>    If the interrupt controller is intc, address and length means the range
> -  of the whole interrupt controller. If the interrupt controller is mux-intc,
> -  address and length means one register. Since address of mux-intc is in the
> -  range of intc. mux-intc is secondary interrupt controller.
> +  of the whole interrupt controller. The "marvell,mmp3-intc" controller
> +  also has a secondary range for the second CPU core.  If the interrupt
> +  controller is mux-intc, address and length means one register. Since
> +  address of mux-intc is in the range of intc. mux-intc is secondary
> +  interrupt controller.
>  - reg-names : Name of the register set of the interrupt controller. It's
>    only required in mux-intc interrupt controller.
>  - interrupts : Should be the port interrupt shared by mux interrupts. It's
> @@ -20,7 +22,7 @@ Required properties:
>  - mrvl,clr-mfp-irq : Specifies the interrupt that needs to clear MFP edge
>    detection first.
>  
> -Example:
> +Examples:
>  	intc: interrupt-controller@d4282000 {
>  		compatible = "mrvl,mmp2-intc";
>  		interrupt-controller;
> @@ -29,6 +31,15 @@ Example:
>  		mrvl,intc-nr-irqs = <64>;
>  	};
>  
> +	intc: interrupt-controller@d4282000 {

What's special about this to warrant another example. Examples aren't 
supposed to be an enumeration of all possible dts entries.

> +		compatible = "marvell,mmp3-intc";
> +		interrupt-controller;
> +		#interrupt-cells = <1>;
> +		reg = <0xd4282000 0x1000>,
> +		      <0xd4284000 0x100>;
> +		mrvl,intc-nr-irqs = <64>;
> +	};
> +
>  	intcmux4@d4282150 {
>  		compatible = "mrvl,mmp2-mux-intc";
>  		interrupts = <4>;
> -- 
> 2.21.0
> 
