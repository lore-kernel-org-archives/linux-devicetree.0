From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: gpio: Add binding documentation for
 gpio-thunderx
Date: Wed, 4 Jan 2017 08:33:50 -0600
Message-ID: <20170104143350.7clanzqrxg4pchr6@rob-hp-laptop>
References: <1483491334-167095-1-git-send-email-ddaney.cavm@gmail.com>
 <1483491334-167095-2-git-send-email-ddaney.cavm@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1483491334-167095-2-git-send-email-ddaney.cavm@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Daney <ddaney.cavm@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 03, 2017 at 04:55:32PM -0800, David Daney wrote:
> From: David Daney <david.daney@cavium.com>
> 
> Signed-off-by: David Daney <david.daney@cavium.com>
> ---
>  .../devicetree/bindings/gpio/gpio-thunderx.txt     | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-thunderx.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-thunderx.txt b/Documentation/devicetree/bindings/gpio/gpio-thunderx.txt
> new file mode 100644
> index 0000000..ba3cdae
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-thunderx.txt
> @@ -0,0 +1,33 @@
> +Cavium ThunderX/OCTEON-TX GPIO controller bindings
> +
> +Required Properties:
> +- reg: The controller bus address.
> +- gpio-controller: Marks the device node as a GPIO controller.
> +- #gpio-cells: Must be 2.
> +  - First cell is the GPIO pin number relative to the controller.
> +  - Second cell is standard of_gpio_flags:
> +     1 - Active Low.
> +     2 - Single Ended.

Just reference where these are defined.

> +
> +Optional Properties:
> +- compatible: "cavium,thunder-8890-gpio", unused as PCI driver binding is used.
> +- interrupt-controller: Marks the device node as an interrupt controller.
> +- #interrupt-cells: Must be present and have value of 2 if
> +                    "interrupt-controller" is present.
> +  - First cell is the GPIO pin number relative to the controller.
> +  - Second cell is triggering flags, one of:
> +    1 - Edge Rising
> +    2 - Edge Falling
> +    4 - Level High
> +    8 - Level Low

Just reference interrupt-controller/interrupts.txt or the header 
defining these.

> +
> +Example:
> +
> +gpio_6_0: gpio0@6,0 {

gpio@6,0

> +	compatible = "cavium,thunder-8890-gpio";
> +	reg = <0x3000 0 0 0 0>; /*  DEVFN = 0x30 (6:0) */
> +	gpio-controller;
> +	#gpio-cells = <2>;
> +	interrupt-controller;
> +	#interrupt-cells = <2>;
> +};
> -- 
> 1.8.3.1
> 
