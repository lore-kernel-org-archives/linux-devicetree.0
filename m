From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/4] dt: bindings: Add bindings for bcm2835-aux-intc
Date: Mon, 12 Jun 2017 11:21:19 -0700
Message-ID: <5093ed34-a930-dea5-6642-03e1e4910362@gmail.com>
References: <d097e5d9-0ee6-9ea4-184f-1dd997849892@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d097e5d9-0ee6-9ea4-184f-1dd997849892-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/12/2017 07:25 AM, Phil Elwell wrote:
> Add bindings documentation for brcm,bcm2835-aux-intc and human-readable
> declarations for the BCM2835 AUX IRQs.
> 
> Signed-off-by: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
> ---
>  .../interrupt-controller/brcm,bcm2835-aux-intc.txt | 28 ++++++++++++++++++++++
>  .../interrupt-controller/bcm2835-aux-intc.h        | 20 ++++++++++++++++
>  2 files changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-aux-intc.txt
>  create mode 100644 include/dt-bindings/interrupt-controller/bcm2835-aux-intc.h
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-aux-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-aux-intc.txt
> new file mode 100644
> index 0000000..f3f895c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-aux-intc.txt
> @@ -0,0 +1,28 @@
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
> +  include/dt-bindings/interrupt-controller/bcm2835-aux-intc.h. Valid values
> +  are 0..2.

This last sentence is sort of doomed for failure in case there are
additional interrupts being added in the future, referring to
bcm2835-aux-intc.h seems to be good enough IMHO.

Reviewed-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
