From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v5 01/10] pinctrl: generic: Add bi-directional and output-enable
Date: Tue, 9 May 2017 12:54:54 +0200
Message-ID: <CAMuHMdXK9VmghZy1RounHWn-HDqgeT_12V_9RVihiuiajn+RDg@mail.gmail.com>
References: <1493281194-5200-2-git-send-email-jacopo+renesas@jmondi.org>
 <CAHp75Vcy1OE+9htFx9k3kQhGARQPT1C0gg3SEKZd7ULu_vkUMA@mail.gmail.com>
 <CACRpkdayW0qPXDcc_JofkwtX5UHhDPxiY_8deZZ7+hPNJkjgeQ@mail.gmail.com>
 <SG2PR06MB1165E7E651BE96CD7B7738B08A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAHp75Vcp_eMWrjZRX-x3=Tt3JRXcL_wWG43MymF=oyLLP4EJwg@mail.gmail.com>
 <SG2PR06MB11658EC3A3A80C57E6F539AC8A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAHp75VeLtOuty=iaxuCaH43rnBZDTT03iH7JyjDJBQhTD-EjzA@mail.gmail.com>
 <CACRpkdZkNGSUvTrEdjbGKO1hr799QpJBGSHPVbsBibph7Jx61A@mail.gmail.com>
 <20170508160120.GB25206@w540> <CAHp75VfOMKOhpkec+htA6DRQhivpSmNXy1=Ayig1W+ZC84gTLw@mail.gmail.com>
 <20170508172516.GC25206@w540> <CACRpkdY1h+yfFuk2y9=nZqqvW9=G33_eHCisvuMkJ5b3zizY7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdY1h+yfFuk2y9=nZqqvW9=G33_eHCisvuMkJ5b3zizY7Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: jmondi <jacopo@jmondi.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Chris Brandt <Chris.Brandt@renesas.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Linus et al,

On Mon, May 8, 2017 at 11:19 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Mon, May 8, 2017 at 7:25 PM, jmondi <jacopo@jmondi.org> wrote:
>> From my perspective these flags are configurations internal to the pin
>> controller hardware used to enable/disable input buffers when a pin needs to
>> perform in both direction.
>> The level of detail I can provide on this is the logical diagram we have pointed
>> you to already.
>>
>> As I assume you are trying to get this answer from us in order to
>> avoid duplicating things in pin controller sub-system, and I
>> understand this, but my question here was "can we have those flags as part
>> of the pinmux property argument list, as that property description
>> seems to allow us to do that, instead of making them generic pin
>> configuration properties and upset other developers?"
>
> Pinmux with all it's magic flags baked into one is not any better
> or any more readable. The solution is already very pretty except
> for these two flags which I am sure we can agree on a way forward
> for.
>
> What we choose between is not this or another less transparent
> pin configuration mechanism, the mechanism (whether magic bits
> to pinmux or reasonable properties) does not matter.
>
> There is a strong preference to use the generic bindings.
>
> So the discussion is whether to use:
>
> bi-directional;
> output-enable;
>
> Or some already defined config flags.
>
> If these are too idiomatic to be used by others, they should anyways
> look similar, like:
>
> renesas,bi-directional;
> renesas,output-enable;
>
> Like the Qualcomm weirdness found in drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
>
> qcom,pull-up-strength = <..>;
>
> Check how they use
> #define PMIC_GPIO_CONF_PULL_UP                 (PIN_CONFIG_END + 1)

The question I'm asking myself is: are these settings related to pin
configuration (i.e. depending on the use of the pin, and several settings
are valid, depending on the use case), or are they related to pinmux
(i.e. defined by the function)?

Configuring drive strength or pull-up are clearly related to pin
configuration.  Depending on what you connect, or on how you connect it,
you want a different drive strength, or choose a different output buffer
type (e.g. totem pole vs. open-collector). All of these are valid
configurations, depending on the use case.

But the settings RZ/A1H needs are different.  Some (e.g. "input-enable")
may sound like related to pin configuration. However, the big discerning
factor is that these settings are implied by the pinmux function. Their
presence is purely dictated by the chosen pinmux function. There's no use
case for doing otherwise (i.e. adding them when not needed, or removing
them when needed, according to the datasheet).

Note that e.g. the existing "input-enable" property is clearly a pin
configuration property. This is even reflected in DT, as the property is
not specified as part of the "pinmux" property, but in the surrounding pin
subnode of the pin-controller.

Hence I think we should not use generic pin properties, but consider these
settings to be part of pinmux configuration.
As having large tables in the driver is undesirable, I think storing the
settings in the "pinmux" property (by encoding them as flags passed to the
RZA1_PINMUX() macro) is our best option.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
