From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] Documentation: gpio: Add APM X-Gene SoC GPIO
 controller DTS binding
Date: Tue, 27 May 2014 10:30:14 +0200
Message-ID: <CACRpkdY9VN8=4FsszzVqezWPOOi7eAk6VXxb577_67VinQtzHw@mail.gmail.com>
References: <1400263432-922-1-git-send-email-fkan@apm.com>
	<1400263432-922-4-git-send-email-fkan@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1400263432-922-4-git-send-email-fkan@apm.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Feng Kan <fkan@apm.com>
Cc: patches <patches@apm.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 16, 2014 at 8:03 PM, Feng Kan <fkan@apm.com> wrote:

> Documentation for APM X-Gene SoC GPIO controller DTS binding.
>
> Signed-off-by: Feng Kan <fkan@apm.com>
(...)
> ---
>  .../devicetree/bindings/gpio/gpio-xgene.txt        | 57 ++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-xgene.txt
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-xgene.txt b/Documentation/devicetree/bindings/gpio/gpio-xgene.txt
> new file mode 100644
> index 0000000..e19eb5f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-xgene.txt
> @@ -0,0 +1,57 @@
> +APM X-Gene SoC GPIO controller bindings
> +
> +This is a gpio controller that is part of the flash controller.
> +All registers are 32bit and in little endian format.
> +
> +Required properties:
> +- compatible: "apm,xgene-gpio" for X-Gene GPIO controller
> +- reg: Physical base address and length of the controller's registers
> +
> +The gpio controller has multiple banks, each bank will have 16 or less
> +gpio pins. All cfg field will be little endian and least significant
> +bit indicate lowest number of gpio.
> +
> +Required properties:
> +- #gpio-cells: Should be two.
> +       - first cell is the pin number
> +       - second cell is used to specify optional parameters (unused)
> +- gpio-controller: Marks the device node as a GPIO controller.
> +- bank:  This is to specifiy which gpio bank the dts node is describing.

A lot of stuff like the separate compatible-string on the sub-banks
in the example, is undocumented.

> +Optional properties:
> +- ngpio: Specify the number of GPIOs per bank. It is defaulted to 16
> +        if not specified. Number of gpio can't be greater than 16 or
> +        0.

If this is always 16 I don't see why you need the binding at all,
until there is such a system out there that use < 16 of the gpios.

> +- odcfg: This is gpio open drain/normal configuration. It is a 16 bit
> +        field, setting 1 will mean the pin is set in open drain
> +        configuration, 0 will mean normal configuration. Default will
> +        be normal configuration.

NAK: this shall be handled by pin config.

> +Example:
> +       gpio: gpio@1701c000 {
> +               compatible = "apm,xgene-gpio";
> +               reg = <0x0 0x1701c000 0x0 0x1000>;
> +
> +               banka: gpio-controller@0 {
> +                       compatible = "apm,xgene-gpio-port";
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +                       ngpios = <16>;
> +                       bank = <0>;
> +                       odcfg = <0xffff>;   /* Optional */
> +               };
> +               bankb: gpio-controller@1 {
> +                       compatible = "apm,xgene-gpio-port";
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +                       ngpios = <16>;
> +                       bank = <1>;
> +               };
> +               bankc: gpio-controller@2 {
> +                       compatible = "apm,xgene-gpio-port";
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +                       ngpios = <16>;
> +                       bank = <2>;
> +               };
> +       };

And as mentioned before, please create three independent
GPIOs instead of three subbanks.

Yours,
Linus Walleij
