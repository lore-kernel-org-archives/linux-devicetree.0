From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH V3 1/1] drivers/gpio: Altera soft IP GPIO driver
Date: Wed, 23 Oct 2013 23:46:10 -0500
Message-ID: <2768383C-CD3B-4873-9EA8-81F99CE3E21E@codeaurora.org>
References: <1382582652-21057-1-git-send-email-thloh@altera.com>
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1382582652-21057-1-git-send-email-thloh@altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: thloh@altera.com
Cc: linus.walleij@linaro.org, rob.herring@calxeda.com, rob@landley.net, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, thloh.linux@gmail.com, lftan@altera.com
List-Id: devicetree@vger.kernel.org


On Oct 23, 2013, at 9:44 PM, thloh@altera.com wrote:

> From: Tien Hock Loh <thloh@altera.com>
> 
> Add driver support for Altera GPIO soft IP, including interrupts and I/O.
> Tested on Altera CV SoC board using dipsw and LED using LED framework.
> 
> Signed-off-by: Tien Hock Loh <thloh@altera.com>
> ---
> .../devicetree/bindings/gpio/gpio-altera.txt       |  34 ++
> drivers/gpio/Kconfig                               |   7 +
> drivers/gpio/Makefile                              |   1 +
> drivers/gpio/gpio-altera.c                         | 395 +++++++++++++++++++++
> 4 files changed, 437 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/gpio/gpio-altera.txt
> create mode 100644 drivers/gpio/gpio-altera.c
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-altera.txt b/Documentation/devicetree/bindings/gpio/gpio-altera.txt
> new file mode 100644
> index 0000000..641cec2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-altera.txt
> @@ -0,0 +1,34 @@
> +Altera GPIO controller bindings
> +
> +Required properties:
> +- compatible:
> +  - "altr,pio-1.0"

any reason not to be "altr,gpio-1.0"?

> +- reg: Physical base address and length of the controller's registers.
> +- #gpio-cells : Should be 1
> +  - first cell is the gpio offset number
> +- gpio-controller : Marks the device node as a GPIO controller.
> +- #interrupt-cells : Should be 1.
> +- interrupts: Specify the interrupt.
> +- interrupt-controller: Mark the device node as an interrupt controller
> +  The first cell is the local interrupt offset number to the GPIO controller.
> +
> +Altera GPIO specific properties:
> +- width: Width of the GPIO bank, range from 1-32

This description isn't terrible helpful.  I'm not at all sure what this means.

> +- interrupt_trigger: Specifies the interrupt trigger type the GPIO hardware is
> +  synthesized. This field is required if the Altera GPIO controller used has
> +  IRQ enabled as the interrupt type is not software controlled, but hardware
> +  synthesized.

Any vendor specific properties should be vendor prefixed:

"altr,width"
"altr,interrupt_trigger"

I'd also recommend that "altr,width" be a bit more specific like "altr,gpio-bank-width"

> +
> +Example:
> +
> +gpio_altr: gpio_altr {
> +    compatible = "altr,pio-1.0";
> +    reg = <0xff200000 0x10>;
> +    interrupts = <0 45 4>;
> +    width = <32>;
> +    interrupt_trigger = <0>;
> +    #gpio-cells = <1>;
> +    gpio-controller;
> +    #interrupt-cells = <1>;
> +    interrupt-controller;
> +};

- k

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

