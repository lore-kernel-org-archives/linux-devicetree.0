From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/4] pinctrl: aspeed: Read and write bits in LPC and
 GFX controllers
Date: Wed, 14 Dec 2016 10:46:45 -0600
Message-ID: <CAL_JsqJvhxDSVqpAFCberferxCjvLPRTFXcgTafaPf1DwOa2Xw@mail.gmail.com>
References: <20161206031152.3004-1-andrew@aj.id.au> <20161206031152.3004-2-andrew@aj.id.au>
 <20161212162712.u2uypxkqhh6cinsp@rob-hp-laptop> <1481609543.3112.34.camel@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1481609543.3112.34.camel@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 13, 2016 at 12:12 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Mon, 2016-12-12 at 10:27 -0600, Rob Herring wrote:
>> On Tue, Dec 06, 2016 at 02:11:49PM +1100, Andrew Jeffery wrote:
>> > The System Control Unit IP block in the Aspeed SoCs is typically where
>> > the pinmux configuration is found, but not always. A number of pins
>> > depend on state in one of LPC Host Control (LHC) or SoC Display
>> > Controller (GFX) IP blocks, so the Aspeed pinmux drivers should have the
>> > means to adjust these as necessary.
>> >
>> > We use syscon to cast a regmap over the GFX and LPC blocks, which is
>> > used as an arbitration layer between the relevant driver and the pinctrl
>> > subsystem. The regmaps are then exposed to the SoC-specific pinctrl
>> > drivers by phandles in the devicetree, and are selected during a mux
>> > request by querying a new 'ip' member in struct aspeed_sig_desc.
>> >
>> > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> > ---
>> >  .../devicetree/bindings/pinctrl/pinctrl-aspeed.txt |  50 ++++++-
>> >  drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c         |  18 +--
>> >  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         |  48 ++++--
>> >  drivers/pinctrl/aspeed/pinctrl-aspeed.c            | 161 +++++++++++++--------
>> >  drivers/pinctrl/aspeed/pinctrl-aspeed.h            |  32 ++--
>> >  5 files changed, 214 insertions(+), 95 deletions(-)
>> >
>> > diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
>> > index 2ad18c4ea55c..115b0cce6c1c 100644
>> > --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
>> > +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
>> > @@ -4,12 +4,19 @@ Aspeed Pin Controllers
>> >  The Aspeed SoCs vary in functionality inside a generation but have a common mux
>> >  device register layout.
>> >
>> > -Required properties:
>> > -- compatible : Should be any one of the following:
>> > > > -               "aspeed,ast2400-pinctrl"
>> > > > -               "aspeed,g4-pinctrl"
>> > > > -               "aspeed,ast2500-pinctrl"
>> > > > -               "aspeed,g5-pinctrl"
>> > +Required properties for g4:
>> > > > +- compatible :                         Should be any one of the following:
>> > > > +                               "aspeed,ast2400-pinctrl"
>> > > > +                               "aspeed,g4-pinctrl"
>> > +
>> > +Required properties for g5:
>> > > > +- compatible :                         Should be any one of the following:
>> > > > +                               "aspeed,ast2500-pinctrl"
>> > > > +                               "aspeed,g5-pinctrl"
>> > +
>> > > > +- aspeed,external-nodes:       A cell of phandles to external controller nodes:
>> > > > +                               0: compatible with "aspeed,ast2500-gfx", "syscon"
>> > > > +                               1: compatible with "aspeed,ast2500-lpchc", "syscon"
>> >
>> >  The pin controller node should be a child of a syscon node with the required
>> >  property:
>> > @@ -47,7 +54,7 @@ RGMII1 RGMII2 RMII1 RMII2 SD1 SPI1 SPI1DEBUG SPI1PASSTHRU TIMER4 TIMER5 TIMER6
>> >  TIMER7 TIMER8 VGABIOSROM
>> >
>> >
>> > -Examples:
>> > +g4 Example:
>> >
>> > > >  syscon: scu@1e6e2000 {
>> > > >         compatible = "syscon", "simple-mfd";
>> > > > @@ -63,5 +70,34 @@ syscon: scu@1e6e2000 {
>> > > >         };
>> >  };
>> >
>> > +g5 Example:
>> > +
>> > +apb {
>> > > > > > +   gfx: display@1e6e6000 {
>> > > > +               compatible = "aspeed,ast2500-gfx", "syscon";
>> > > > +               reg = <0x1e6e6000 0x1000>;
>> > > > +       };
>> > +
>> > > > > > +   lpchc: lpchc@1e7890a0 {
>> > > > +               compatible = "aspeed,ast2500-lpchc", "syscon";
>> > > > +               reg = <0x1e7890a0 0xc4>;
>> > > > +       };
>> > +
>> > > > > > +   syscon: scu@1e6e2000 {
>> > +           compatible = "syscon", "simple-mfd";
>>
>> I must have missed this the first time, but "syscon" should be used with
>> a specific compatible. Though, the scu binding does define one.
>
> Yes, the example should be fixed.
>
>>
>> > > > +               reg = <0x1e6e2000 0x1a8>;
>> > +
>> > +           pinctrl: pinctrl {
>>
>> Is this the only child?
>
> No. A incomplete list of other functions in the SCU includes:
>
> * An RNG
> * Power management
> * PCI configuration
> * System reset
> * Clock configuration
>
>>
>> > +                   compatible = "aspeed,g5-pinctrl";
>>
>> There's no register range for pinctrl?
>
> This may be a mistake on my part; when I wrote this I had no experience
> with writing devicetree bindings (and still don't have a lot).
>
> The SCU does have register regions for pinctrl but on reflection I feel
> neither the mfd nor syscon bindings describe how children's resources
> should be treated in general. The example in the mfd bindings is for
> hardware that is register-bit-led,compatible, whose bindings use the
> 'offset' property rather than 'reg', which still describes where, but
> not using the reg property. Given my uncertainty with reg in an mfd
> child, I wrote the pinctrl/pinmux driver using offsets from the base of
> the SCU's syscon rather than describing the exact region(s) of the
> syscon that should be used.
>
> The issue you raise here occurred to me when writing the LPC Host
> Controller bindings, but there I wasn't convinced using the ranges
> property to give offsets was the right thing to do either.
>
> Regardless, whilst there are two dedicated regions of pinmux registers,
> the mux state also depends on bits in SCU registers outside of these
> regions. Assuming we define an appropriate ranges property for the SCU
> syscon the pinctrl reg property would look like:
>
>     reg = <0x2c 0x1>, <0x3c 0x1>, <0x48 0x1>, <0x70 0x1>, <0x7c 0x1>, <0x80 0x18>, <0xa0 0x10>, <0xd0 0x1>;
>
> This is the list of registers affecting the mux taken from the pinctrl-
> aspeed.h.

With other registers in the holes, right? If it is sparse like that,
then yes you probably just want to have reg in the parent for the
whole block.

> What action do you recommend here? The pinctrl dts patches for the
> Aspeed SoCs are yet to be applied, so changing the bindings to require
> a reg property can't break any existing in-tree users as there are
> none. The pinctrl driver can be patched to respect the reg property
> after the fact, though actually using the region descriptions might be
> interesting.
>
>>
>> > +                   aspeed,external-nodes = <&gfx, &lpchc>;
>
> Did you have feedback on this approach? I queried you about it in the
> previous revision, but never received a reply:

It seems okay. At least, I don't have a better suggestion.

Rob
