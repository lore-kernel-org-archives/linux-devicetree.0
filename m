From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 2/5] dt-bindings: Add pinctrl bindings for mt65xx/mt81xx.
Date: Tue, 13 Jan 2015 11:11:57 +0100
Message-ID: <CACRpkdamBePQMR_b5g=t=9DvtuV3gE75=TjP7eURzD1NgHWqpQ@mail.gmail.com>
References: <1418772873-19747-1-git-send-email-hongzhou.yang@mediatek.com>
	<1418772873-19747-3-git-send-email-hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418772873-19747-3-git-send-email-hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Joe.C" <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Vladimir Murzin <vladimir.murzin-5wv7dgnIgG8@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, dandan.he-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, alan.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, toby.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, maoguang.meng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 17, 2014 at 12:34 AM, Hongzhou Yang
<hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:

> From: Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>
> Add devicetree bindings for Mediatek SoC pinctrl driver.
>
> Signed-off-by: Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

So following from the discussion with Sascha...

(...)
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
> new file mode 100644
> index 0000000..3bf34f9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
> @@ -0,0 +1,142 @@
> +* Mediatek MT65XX Pin Controller
> +
> +The Mediatek's Pin controller is used to control SoC pins.
> +
> +Required properties:
> +- compatible: value should be either of the following.
> +    (a) "mediatek,mt8135-pinctrl", compatible with mt8135 pinctrl.
> +- mediatek,pctl-regmap: Should be a phandle of the syscfg node.
> +- gpio-controller : Marks the device node as a gpio controller.
> +- #gpio-cells: number of cells in GPIO specifier. Since the generic GPIO
> +  binding is used, the amount of cells must be specified as 2. See the below
> +  mentioned gpio binding representation for description of particular cells.
> +
> +       Eg: <&pio 6 0>
> +       <[phandle of the gpio controller node]
> +       [pin number within the gpio controller]

Call this "line number", not "pin number" as GPIO != pin

> +       [flags]>
> +
> +       Values for gpio specifier:
> +       - Pin number: is a value between 0 to 202.

Line number.

> +       - Flags:  bit field of flags, as defined in <dt-bindings/gpio/gpio.h>.
> +            Only the following flags are supported:
> +            0 - GPIO_ACTIVE_HIGH
> +            1 - GPIO_ACTIVE_LOW
> +- reg: physicall address base for EINT registers
> +- interrupt-controller: Marks the device node as an interrupt controller
> +- #interrupt-cells: Should be two.
> +- interrupts : The interrupt outputs from the controller.
> +
> +Please refer to pinctrl-bindings.txt in this directory for details of the
> +common pinctrl bindings used by client devices.
> +
> +A pinctrl node should contain at least one subnodes representing the
> +pinctrl groups available on the machine. Each subnode will list the
> +pins it needs, and how they should be configured, with regard to muxer
> +configuration, pullups, drive strngth, input enable/disable and input schmitt.
> +
> +Required subnode-properties:
> +
> +- pins: 2 integers array, represents gpio pinmux number and config
> +  setting. The format as following
> +
> +    node {
> +     pins = <PIN_NUMBER_PINMUX>;
> +                     GENERIC_PINCONFIG;
> +    };

As discussed with sascha, pins = ... is for pins specified with a string.

Either

- Specify your pins with a string

- Come up wiyj some new unique way to name pins identfied by
  numbers, maybe just "pinno = <...>" Sascha suggested "pinmux"
  but that is strange if the number is used for pin config.

(Check with Sascha!)

> +    The PIN_NUMBER_PINMUX is combination of GPIO number and pinmux, it can
> +    use macros which already defind in boot/dts/mt8135-pinfunc.h directly.

So is that prop to be named pinmux, pinno, pinid or something..

> +    The GENERIC_PINCONFIG is the generic pinconfig options to use, bias-disable,
> +    bias-pull-down, bias-pull-up, input-enable, input-disable, output-low, output-high,
> +    input-schmitt-enable, input-schmitt-disable and drive-strength are valid.

Nice!

> +       pinctrl@01c20800 {
> +               compatible = "mediatek,mt8135-pinctrl";
> +               reg = <0 0x1000B000 0 0x1000>;
> +               mediatek,pctl-regmap = <&syscfg_pctl_a &syscfg_pctl_b>;
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +               interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
> +                               <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
> +                               <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
> +
> +               i2c0_pins_a: i2c0@0 {
> +                       pins1 {
> +                               pins = <MT8135_PIN_100_SDA0__FUNC_SDA0>,
> +                                               <MT8135_PIN_101_SCL0__FUNC_SCL0>;

So this prop need to be renamed.

> +                               bias-disable;
> +                       };
> +               };

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
