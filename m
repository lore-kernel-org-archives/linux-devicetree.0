From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] DT: pinctrl: Add binding documentation for Spreadtrum
 pin controller
Date: Mon, 29 May 2017 18:18:29 +0200
Message-ID: <CACRpkdZFUDrfoyvk-CramNP2OVwVAazVsw3S-wCayx8HP6cSZQ@mail.gmail.com>
References: <a1fa5b612de318213bab4404997d133ed118f5d2.1495863824.git.baolin.wang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a1fa5b612de318213bab4404997d133ed118f5d2.1495863824.git.baolin.wang@spreadtrum.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@spreadtrum.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Baolin Wang <baolin.wang@linaro.org>
List-Id: devicetree@vger.kernel.org

On Sat, May 27, 2017 at 7:56 AM, Baolin Wang <baolin.wang@spreadtrum.com> wrote:

> This patch adds the binding documentation for Spreadtrum SC9860 pin
> controller device.
>
> Signed-off-by: Baolin Wang <baolin.wang@spreadtrum.com>
(...)

> +* Spreadtrum Pin Controller
> +
> +The Spreadtrum pin controller are organized in 3 blocks (types).
> +
> +The first block comprises some global control registers, and each
> +register contains several feilds with one bit or several bits to

feilds -> fields

Do you mean "bitfields", i.e a few bits inside a configuration register
word?

> +configurate for some global common configuration, such as domain

configurate -> configure

> +pad driving level, system control select

Actually I do not understand at all what "domain pad driving level"
or "system control select" means, those are very generic terms.
Can you describe precisely what it means? What domain? What
is a domain pad? What kind of system control? What is it selecting
between?

>  and so on. We recognise
> +every feild comprising one bit or several bits in one global control

feild -> field

> +register as one pin, thus we should record every pin's bit offset,
> +bit width and register offset to configurate this feild (pin).

feild -> field

> +The second block comprises some common registers which have unified
> +register definition, and each register described one pin is used
> +to configurate pin sleep mode and function select.

OK

> +The last block comprises some misc registers which also have unified
> +register definition, and each register described one pin is used to
> +configurate drive strength, pull up/down and so on.

configurate -> configure

OK that is pin configuration.

> +This driver supports the generic pin multiplexing and configuration
> +bindings. For details on each properties, you can refer to
> +./pinctrl-bindings.txt.

Do not talk about the driver in the bindings. Talk about the bindings per
se, these bindings are supposed to be OS neutral.

> +Required properties for Spreadtrum pin controller:
> +- compatible: "sprd,<soc>-pinctrl"
> +  Please refer to each sprd,<soc>-pinctrl.txt binding doc for supported SoCs.
> +
> +Required properties for pin configuration node:
> +- sprd,pins: each entry consists of 2 integers and represents the pin
> +  id and config setting for one pin.

Do not use the custom property "sprd,pins" for this, if you want to set up pin
muxing with a magic value use the generic binding "pinmux", see:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt?id=8d5e7c5df0a6c442373628be5221321172b1badf

But consider using groups+functions for defining multiplexing instead.

But please do NOT combine pin configuration into a magic value. Use
the generic pin control bindings, er have bindings for all kinds of pin
config, and using them makes the driver much more readable for
humans.

I understand that you may have a lot of magic number tables around that
you are using today, but it is necessary to decompose that into the proper
generic pin configuration properties to make it usable.

> +++ b/Documentation/devicetree/bindings/pinctrl/sprd,sc9860-pinctrl.txt
> @@ -0,0 +1,26 @@
> +* Spreadtrum SC9860 Pin Controller
> +
> +Please refer to sprd,pinctrl.txt in this directory for common binding part
> +and usage.
> +
> +Required properties:
> +- compatible: must be "sprd,sc9860-pinctrl".
> +- reg: the register address of pin controller device.
> +- sprd,pins: two integers array, represents a group of pins id and config
> +  setting. The format is sprd,pins = <PIN_ID CONFIG>, PIN_ID can be found
> +  from pinctrl-sprd-sc9860.c file or spec file, CONFIG is the pad setting
> +  value like pull-up for this pin.

Same comments.

> +Example:
> +pin_controller: pinctrl@402a0000 {
> +       compatible = "sprd,sc9860-pinctrl";
> +       reg = <0x402a0000 0x10000>;
> +
> +       vio_sd0_ms_0: sd0_ms0 {
> +               sprd,pins = <8 0x1>;
> +       };
> +
> +       vbc_iis0_0: iis0_c {
> +               sprd,pins = <34 0xc>;
> +       };
> +};

Magic numbers are very hard to understand. Compare to this
from Qualcomm APQ8064 using just standard bindings:

pinmux@800000 {
        i2c4_pins: i2c4_pinmux {
               pins = "gpio12", "gpio13";
               function = "gsbi4";
               bias-disable;
        };

        spi_pins: spi_pins {
               mux {
                      pins = "gpio18", "gpio19", "gpio21";
                      function = "gsbi5";
                      drive-strength = <10>;
                      bias-none;
                };
        };
};

Please try go get rid of the magic numbers and get to use pins, function,
drive-strength bias etc from the standard bindings. We also have a lot
of helper code available to use this.

Yours,
Linus Walleij
