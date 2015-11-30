From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] reset: Add brcm,bcm63xx-reset device tree binding
Date: Mon, 30 Nov 2015 16:24:40 -0600
Message-ID: <20151130222440.GA3420@rob-hp-laptop>
References: <565CB83B.7010000@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <565CB83B.7010000@simon.arlott.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Arlott <simon@fire.lp0.eu>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kernel@vger.kernel.org, MIPS Mailing List <linux-mips@linux-mips.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 30, 2015 at 08:57:31PM +0000, Simon Arlott wrote:
> Add device tree binding for the BCM63xx soft reset controller.
> 
> The BCM63xx contains a soft-reset controller activated by setting
> a bit (that must previously have cleared).
> 
> Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
> ---
>  .../bindings/reset/brcm,bcm63xx-reset.txt          | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/brcm,bcm63xx-reset.txt
> 
> diff --git a/Documentation/devicetree/bindings/reset/brcm,bcm63xx-reset.txt b/Documentation/devicetree/bindings/reset/brcm,bcm63xx-reset.txt
> new file mode 100644
> index 0000000..48e9daf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/brcm,bcm63xx-reset.txt
> @@ -0,0 +1,37 @@
> +BCM63xx reset controller
> +
> +The BCM63xx contains a basic soft reset controller in the perf register
> +set which resets components using a bit in a register.
> +
> +Please also refer to reset.txt in this directory for common reset
> +controller binding usage.
> +
> +Required properties:
> +- compatible:	Should be "brcm,bcm<soc>-reset", "brcm,bcm63xx-reset"
> +- regmap:	The register map phandle
> +- offset:	Offset in the register map for the reset register (in bytes)
> +- #reset-cells:	Must be set to 1
> +
> +Optional properties:
> +- mask:		Mask of valid reset bits in the reset register (32 bit access)
> +		(Defaults to all bits)

The bits correspond to the cell values in resets properties? If so then, 
is this really needed? If you are only validating cell values against 
this mask, then drop it (assume the DT does not have crap).

Rob

> +
> +Example:
> +
> +periph_soft_rst: reset-controller {
> +	compatible = "brcm,bcm63168-reset", "brcm,bcm63xx-reset";
> +	regmap = <&periph_cntl>;
> +	offset = <0x10>;
> +
> +	#reset-cells = <1>;
> +};
> +
> +usbh: usbphy@10002700 {
> +	compatible = "brcm,bcm63168-usbh";
> +	reg = <0x10002700 0x38>;
> +	clocks = <&periph_clk 13>, <&timer_clk 18>;
> +	resets = <&periph_soft_rst 6>;
> +	power-supply = <&power_usbh>;
> +	#phy-cells = <0>;
> +};
> +
> -- 
> 2.1.4
> 
> -- 
> Simon Arlott
