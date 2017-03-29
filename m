From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: pinctrl: Add RZ/A1 bindings doc
Date: Wed, 29 Mar 2017 13:20:39 +0200
Message-ID: <CAMuHMdX0OdZXYDOZvFutjfBFVd65C567_G+++kHygre4KK+jLg@mail.gmail.com>
References: <1490026491-21742-1-git-send-email-jacopo+renesas@jmondi.org>
 <1490026491-21742-3-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdWT6vJNmMhYzMEqYRbuT=W=ZuND-WfG812LfH0r0AzM_g@mail.gmail.com>
 <20170323160204.GL30223@w540> <CACRpkdYmitsPvv_1bsb-EKkhcWqaKNsLBfxZgf8cjVvcqCpYXA@mail.gmail.com>
 <b9eaac8a63dced229bb152ba412e8ec1@jmondi.org> <CACRpkdbZS72xkHaM5P-Zw==A_V_BxeszLPmc0_Zy0-RRjvAbNA@mail.gmail.com>
 <CAMuHMdXkN91uBTKhz_bveFxOgcyNe0dAbtDEVfHNKdDWNaY3jQ@mail.gmail.com> <CACRpkdbT3091MzAQ_hO5Hc9=gQz-eDNCDtEnVG-3G+jJ+eO+Fw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbT3091MzAQ_hO5Hc9=gQz-eDNCDtEnVG-3G+jJ+eO+Fw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: jacopo <jacopo@jmondi.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On Wed, Mar 29, 2017 at 12:15 PM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> On Wed, Mar 29, 2017 at 9:35 AM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>>> See for example:
>>> include/dt-bindings/pinctrl/mt65xx.h
>>>
>>> And how that is used in:
>>> arch/arm/boot/dts/mt2701-pinfunc.h
>>> arch/arm/boot/dts/mt2701-evb.dts
>>>
>>> The docs are here:
>>> Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
>>
>> All of the above pack the information for a pin into a single 32-bit integer.
>> Is that what you want us to use, too?
>> Currently we use two integers: 1) pin index, and 2) function/flags combo.
>
> I don't really know what you need, sorry. But some kind of figure, yes.
> I would say whatever makes sense. 16+16 bits makes sense in most
> combinatorial spaces does it not? If you split 32 bits  in 16 bits for
> pin and 16 bits for function, do you have more than 2^16 pins or 2^16
> functions?
>
> If you really do we may need to go for u64 but ... really? Is there
> a rational reason for that other than "we did it like this first"?
>
> I do not understand the notion of "flags" here. I hope that is not referring

Flags refers to BI_DIR, SWIO_IN, and SWIO_OUT, from
https://patchwork.kernel.org/patch/9643047/

32-bit should be enough to cover pins, function, and flags.

> to pin config, because I expect that to use the standard pin config
> bindings outside of the pinmux value which should just define the
> pin+function combo:
>
> node {
>     pinmux = <PIN_NUMBER_PINMUX>;
>     GENERIC_PINCONFIG;
> };
>
> Example from Mediatek:
>
> i2c1_pins_a: i2c1@0 {
>     pins {
>         pinmux = <MT8135_PIN_195_SDA1__FUNC_SDA1>,
>                         <MT8135_PIN_196_SCL1__FUNC_SCL1>;

If we follow this example, then we can list all combinations in
include/dt-bindings/pinctrl/r7s72100-pinctrl.h, instead of creating the value
by combining the bits using a macro where we need it in the DTS.

It's gonna be a long list, though...

>         bias-pull-up = <55>;
>     };
> };
>
> So this allows for a combine pin+function number but pull ups,
> bias etc are not baked into the thing, they have to be added on
> separately with the generic bindings, which is nice and very readable.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
