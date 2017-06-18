From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH v3 2/4] dt: bindings: Add bindings for bcm2835-aux-intc
Date: Sun, 18 Jun 2017 18:48:24 +0200 (CEST)
Message-ID: <1541919875.136051.1497804504643@email.1und1.de>
References: <4ceb6c92-f752-180e-6a6e-a94dcd120737@raspberrypi.org>
 <1497457750-35585-1-git-send-email-phil@raspberrypi.org>
 <1497457750-35585-3-git-send-email-phil@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1497457750-35585-3-git-send-email-phil@raspberrypi.org>
Sender: linux-clk-owner@vger.kernel.org
To: Phil Elwell <phil@raspberrypi.org>
Cc: linux-clk@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Eric Anholt <eric@anholt.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Florian Fainelli <f.fainelli@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Jason Cooper <jason@lakedaemon.net>, linux-rpi-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Phil,

> Phil Elwell <phil@raspberrypi.org> hat am 14. Juni 2017 um 18:29 geschrieben:
> 
> 
> Add bindings documentation for brcm,bcm2835-aux-intc and human-readable
> declarations for the BCM2835 AUX IRQs.
> 
> Signed-off-by: Phil Elwell <phil@raspberrypi.org>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  .../interrupt-controller/brcm,bcm2835-aux-intc.txt | 27 ++++++++++++++++++++++
>  .../interrupt-controller/bcm2835-aux-intc.h        | 20 ++++++++++++++++
>  2 files changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-aux-intc.txt
>  create mode 100644 include/dt-bindings/interrupt-controller/bcm2835-aux-intc.h
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-aux-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-aux-intc.txt
> new file mode 100644
> index 0000000..9cbbab6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-aux-intc.txt
> @@ -0,0 +1,27 @@
> +BCM2835 Auxiliary ("AUXIRQ") Interrupt Controller
> +
> +The BCM2835 family of SoCs multiplexes the interrupts for peripherals in
> +the AUX block into a single IRQ. The AUXIRQ register shows the IRQ status
> +of each of the peripherals. Note that there are no masking or clearing
> +facilities - interrupts must be enabled and acknowledged in the
> +individual peripherals.
> +
> +Required properties:
> +- compatible :	     Should be "brcm,bcm2835-aux-intc".
> +- reg :		     Specifies base physical address and size of the registers.
> +- interrupts :	     The interrupt number - see
> +		     bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
> +- interrupt-controller : Identifies the node as an interrupt controller
> +- #interrupt-cells : Specifies the number of cells needed to encode an
> +		     interrupt source. The value shall be 1.
> +
> +  The cell contains the interrupt specifier, as found in
> +  include/dt-bindings/interrupt-controller/bcm2835-aux-intc.h.
> +
> +Example:
> +
> +	auxintc: interrupt-controller@7e215000 {
> +		compatible = "brcm,bcm2835-aux-intc";
> +		reg = <0x7e215000 0x4>;
> +		interrupts = <1 29>;
> +		interrupt-controller;

looks like the end of the file has been truncated and example misses some lines.

> diff --git a/include/dt-bindings/interrupt-controller/bcm2835-aux-intc.h b/include/dt-bindings/interrupt-controller/bcm2835-aux-intc.h
> new file mode 100644
> index 0000000..8b9fc12
