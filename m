From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: net: wiznet: add w5x00 support
Date: Thu, 2 May 2019 16:09:57 -0500
Message-ID: <20190502210957.GA12202@bogus>
References: <20190430185215.21685-1-nsaenzjulienne@suse.de>
 <20190430185215.21685-2-nsaenzjulienne@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190430185215.21685-2-nsaenzjulienne@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc: "David S. Miller" <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 30, 2019 at 08:52:14PM +0200, Nicolas Saenz Julienne wrote:
> Add bindings for Wiznet's w5x00 series of SPI interfaced Ethernet chips.
> 
> Based on the bindings for microchip,enc28j60.
> 
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> ---
>  .../devicetree/bindings/net/wiznet,w5x00.txt  | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/wiznet,w5x00.txt
> 
> diff --git a/Documentation/devicetree/bindings/net/wiznet,w5x00.txt b/Documentation/devicetree/bindings/net/wiznet,w5x00.txt
> new file mode 100644
> index 000000000000..2cbedefb1607
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/wiznet,w5x00.txt
> @@ -0,0 +1,48 @@
> +* Wiznet w5x00
> +
> +This is a standalone 10/100 MBit Ethernet controller with SPI interface.
> +
> +For each device connected to a SPI bus, define a child node within
> +the SPI master node.
> +
> +Required properties:
> +- compatible: Should be "wiznet,w5100", "wiznet,w5200" or "wiznet,w5500"

One per line please.

> +- reg: Specify the SPI chip select the chip is wired to.
> +- interrupts: Specify the interrupt index within the interrupt controller (referred
> +              to above in interrupt-parent) and interrupt type. w5x00 natively
> +              generates falling edge interrupts, however, additional board logic
> +              might invert the signal.
> +- pinctrl-names: List of assigned state names, see pinctrl binding documentation.
> +- pinctrl-0: List of phandles to configure the GPIO pin used as interrupt line,
> +             see also generic and your platform specific pinctrl binding
> +             documentation.
> +
> +Optional properties:
> +- spi-max-frequency: Maximum frequency of the SPI bus when accessing the w5500.
> +  According to the w5500 datasheet, the chip allows a maximum of 80 MHz, however,
> +  board designs may need to limit this value.
> +- local-mac-address: See ethernet.txt in the same directory.
> +
> +
> +Example (for Raspberry Pi with pin control stuff for GPIO irq):
> +
> +&spi {
> +	eth1: w5500@0 {

ethernet@0

> +		compatible = "wiznet,w5500";
> +		reg = <0>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&eth1_pins>;
> +		interrupt-parent = <&gpio>;
> +		interrupts = <25 IRQ_TYPE_EDGE_FALLING>;
> +		spi-max-frequency = <30000000>;
> +	};
> +};
> +
> +&gpio {
> +	eth1_pins: eth1_pins {
> +		brcm,pins = <25>;
> +		brcm,function = <0>; /* in */
> +		brcm,pull = <0>; /* none */
> +	};
> +};
> +
> -- 
> 2.21.0
> 
