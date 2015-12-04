From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] clk: Add brcm,bcm63xx-gate-clk device tree binding
Date: Fri, 4 Dec 2015 08:30:37 -0600
Message-ID: <20151204143037.GA3667@rob-hp-laptop>
References: <565CB727.7030209@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <565CB727.7030209@simon.arlott.org.uk>
Sender: linux-clk-owner@vger.kernel.org
To: Simon Arlott <simon@fire.lp0.eu>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org, linux-mips@linux-mips.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 30, 2015 at 08:52:55PM +0000, Simon Arlott wrote:
> Add device tree binding for the BCM63xx's gated clocks.
> 
> The BCM63xx contains clocks gated with a register. Clocks are indexed
> by bits in the register and are active high. Clock gate bits are
> interleaved with other status bits and configurable clocks in the same
> register.
> 
> Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
> ---
>  .../bindings/clock/brcm,bcm63xx-gate-clk.txt       | 58 ++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm63xx-gate-clk.txt
> 
> diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm63xx-gate-clk.txt b/Documentation/devicetree/bindings/clock/brcm,bcm63xx-gate-clk.txt
> new file mode 100644
> index 0000000..3f4ead1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/brcm,bcm63xx-gate-clk.txt
> @@ -0,0 +1,58 @@
> +Broadcom BCM63xx clocks
> +
> +This binding uses the common clock binding:
> +	Documentation/devicetree/bindings/clock/clock-bindings.txt
> +
> +The BCM63xx contains clocks gated with a register. Clocks are indexed
> +by bits in the register and are active high. Clock gate bits are
> +interleaved with other status bits and configurable clocks in the same
> +register.
> +
> +Required properties:
> +- compatible:	Should be "brcm,bcm<soc>-gate-clk", "brcm,bcm63xx-gate-clk"
> +- #clock-cells:	Should be <1>.
> +- regmap:	The register map phandle
> +- offset:	Offset in the register map for the reboot register (in bytes)
> +- clocks:	The external oscillator clock phandle
> +
> +Example:
> +
> +periph_clk: periph_clk {
> +	compatible = "brcm,bcm63168-gate-clk", "brcm,bcm63xx-gate-clk";
> +	regmap = <&periph_cntl>;

What else is in periph_cntrl? Could this all just be part of that node?

Rob
