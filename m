From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/2] GPIO: Add TB10x GPIO driver
Date: Wed, 17 Apr 2013 12:37:35 -0600
Message-ID: <516EEBEF.9010003@wwwdotorg.org>
References: <1365608728-30494-1-git-send-email-christian.ruppert@abilis.com> <1365608728-30494-2-git-send-email-christian.ruppert@abilis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1365608728-30494-2-git-send-email-christian.ruppert@abilis.com>
Sender: linux-doc-owner@vger.kernel.org
To: Christian Ruppert <christian.ruppert@abilis.com>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Sascha Leuenberger <sascha.leuenberger@abilis.com>, Pierrick Hascoet <pierrick.hascoet@abilis.com>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/10/2013 09:45 AM, Christian Ruppert wrote:
> The GPIO driver for the Abilis Systems TB10x series of SOCs based on ARC700
> CPUs. It supports GPIO control and GPIO interrupt generation. This driver
> works in conjunction with the TB10x pinctrl driver.

I have a couple comments beyond what Linus already said,

> diff --git a/Documentation/devicetree/bindings/gpio/abilis,tb10x-gpio.txt b/Documentation/devicetree/bindings/gpio/abilis,tb10x-gpio.txt

> +Required Properties:
> +- compatible: Should be "abilis,tb10x-gpio"
> +- reg: Address and length of the register set for the device
> +- gpio-controller: Marks the device node as a gpio controller.
> +- #gpio-cells: Should be <1>;

I think this value should be at least two. The extra cell should be used
to represent flags. Bit 0 of that cell is customarily used to represent
"active low", which is information for SW to use to interpret the port,
so it doesn't matter if your HW supports that or not. See for example:

Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.txt

- #gpio-cells : Should be two. The first cell is the pin number and the
  second cell is used to specify optional parameters:
  - bit 0 specifies polarity (0 for normal, 1 for inverted)

> +Optional Properties:
> +- interrupt-controller: Marks the device node as an interrupt controller.
> +- #interrupt-cells: Should be <1>.

Equally here, I imagine you want 2 here not 1, so that IRQ flags can be
defined. For the customary values in the second cell, see:
Documentation/devicetree/bindings/interrupt-controller/interrupts.txt's
"two cells" description. Of course, if your HW can't configure this,
then ignore this comment.

> +Example:
> +
> +gpioa: gpio@FF140000 {
> +	compatible = "abilis,tb10x-gpio";
> +	interrupt-controller;
> +	#interrupt-cells = <1>;
> +	interrupt-parent = <&tb10x_ictl>;
> +	interrupts = <27 1>;
> +	reg = <0xFF140000 0x1000>;
> +	gpio-controller;
> +	#gpio-cells = <1>;
> +	gpio-count = <3>;

The gpio-count property isn't defined above.

> +	gpio-base  = <0>;
> +	gpio-pins = <&pctl_gpio_a>;
> +};

Finally, Documentation/devicetree/bindings/vendor-prefixes.txt should be
updated to define the abilis vendor prefix.
