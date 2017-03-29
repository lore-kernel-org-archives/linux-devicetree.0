From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 3/7] arm: dts: dt-bindings: Add Renesas RZ pinctrl header
Date: Wed, 29 Mar 2017 16:59:24 +0200
Message-ID: <CAMuHMdVx_fyGsw0p-s4ZAoe2k+r0RuwxjwNV_-8fXY7Yv8y3kQ@mail.gmail.com>
References: <1490368934-12494-1-git-send-email-jacopo+renesas@jmondi.org>
 <1490368934-12494-4-git-send-email-jacopo+renesas@jmondi.org>
 <CACRpkdZ4Z6c2YDu-e6kZ8-K7Dv_tRGxZj0vAqgPBx7rWwmHU-g@mail.gmail.com> <SG2PR06MB11659AB956F83E8DCE2C9AA18A350@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <SG2PR06MB11659AB956F83E8DCE2C9AA18A350@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Chris,

On Wed, Mar 29, 2017 at 4:55 PM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Wednesday, March 29, 2017, Linus Walleij wrote:
>> On Fri, Mar 24, 2017 at 4:22 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
>> > +/*
>> > + * Flags used to ask software to drive the pin I/O direction
>> > +overriding the
>> > + * alternate function configuration.
>> > + * Some alternate functions require software to force I/O direction
>> > +of a pin,
>> > + * overriding the designated one.
>> > + * Refer to the HW manual to know when this flag shall be used.
>> > + */
>> > +#define SWIO_IN                        (1 << 4)
>> > +#define SWIO_OUT               (1 << 5)
>>
>> What is wrong in doing this with generic pin config using
>> PIN_CONFIG_INPUT_ENABLE and PIN_CONFIG_OUTPUT (ignoring the argument)?
>>
>> In the device tree use input-enable and add a new output-enable (with
>> unspecified value) with proper description and DT bindings?
>
> Again, that's probably fine. It seems we are still doing the same thing
> which is using the DT to pass extra config information to the driver.
> And, we can do whatever we want with that info.
>
>
>> And if you think these have no general applicability, by the end of the
>> day they are *still* pin config, not magic flags we can choose to toss in
>> with the muxing, so you can do what the Qualcomm driver does and add
>> custom pin configurations extending the generic pin config, see
>> drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
>> qcom,pull-up-strength etc.
>
> But, it seems that when you set a config option, it applies to everything
> in "pins"?
>
> I2C Example: (seem OK)
>         /* P1_6 = RIIC3SCL (bi dir) */
>         /* P1_7 = RIIC3SDA (bi dir) */
>         i2c3_pins: i2c3 {
>                 pins = <PIN(1, 6) | FUNC_1>,
>                        <PIN(1, 7) | FUNC_1>;
>                 bidirectional;
>         };

Correct.

> But, what do we do for Ethernet? All the pins are "normal" except just
> the MDIO pin needs to be bidirectional.
> That's the part I'm confused by.
> How do we flag that just the ET_MDIO needs "bidirectional"?

You add subnodes, cfr. arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts:

        avb_pins: avb {
                mux {
                        groups = "avb_link", "avb_phy_int", "avb_mdc",
                                 "avb_mii";
                        function = "avb";
                };

                pins_mdc {
                        groups = "avb_mdc";
                        drive-strength = <24>;
                };

                pins_mii_tx {
                        pins = "PIN_AVB_TX_CTL", "PIN_AVB_TXC", "PIN_AVB_TD0",
                               "PIN_AVB_TD1", "PIN_AVB_TD2", "PIN_AVB_TD3";
                        drive-strength = <12>;
                };
        };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
