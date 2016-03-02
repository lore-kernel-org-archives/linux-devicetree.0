From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] devicetree: document NXP LPC1850 PINT irq controller
 binding
Date: Wed, 2 Mar 2016 12:13:14 -0600
Message-ID: <20160302181314.GA25030@rob-hp-laptop>
References: <1456437887-24432-1-git-send-email-manabian@gmail.com>
 <1456437887-24432-3-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1456437887-24432-3-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 25, 2016 at 11:04:47PM +0100, Joachim Eastwood wrote:
> Add binding documentation for NXP LPC1850 GPIO Pin Interrupt (PINT)
> controller.
> 
> Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../interrupt-controller/nxp,lpc1850-gpio-pint.txt | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/nxp,lpc1850-gpio-pint.txt
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/nxp,lpc1850-gpio-pint.txt b/Documentation/devicetree/bindings/interrupt-controller/nxp,lpc1850-gpio-pint.txt
> new file mode 100644
> index 000000000000..dc43f187ebda
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/nxp,lpc1850-gpio-pint.txt
> @@ -0,0 +1,22 @@
> +NXP LPC18xx/43xx GPIO Pin Interrupt (PINT) controller
> +
> +Required properties:
> +
> +- compatible : should be "nxp,lpc1850-gpio-pint".
> +- reg : Specifies base physical address and size of the registers.
> +- interrupt-controller : Identifies the node as an interrupt controller
> +- #interrupt-cells : Specifies the number of cells needed to encode an
> +  interrupt source. The value shall be 2.
> +- interrupts : Specifies the CPU interrupts the controller is connected to.

How many (8?) and what's the ordering?

> +- clocks: Must contain a reference to the functional clock.
> +
> +Example:
> +
> +pint: interrupt-controller@40087000 {
> +	compatible = "nxp,lpc1850-gpio-pint";
> +	reg = <0x40087000 0x1000>;
> +	interrupt-controller;
> +	#interrupt-cells = <2>;
> +	interrupts = <32 33 34 35 36 37 38 39>;
> +	clocks = <&ccu1 CLK_CPU_GPIO>;
> +};
> -- 
> 1.8.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
