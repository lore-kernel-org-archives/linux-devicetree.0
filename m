From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 3/7] arm: dts: dt-bindings: Add Renesas RZ pinctrl header
Date: Thu, 30 Mar 2017 10:15:05 +0200
Message-ID: <CACRpkda_Gw9vhLqpWw8oOZyZ59nj5j9Q-T5RXVsf0vsxWcjyHg@mail.gmail.com>
References: <1490368934-12494-1-git-send-email-jacopo+renesas@jmondi.org>
 <1490368934-12494-4-git-send-email-jacopo+renesas@jmondi.org>
 <CACRpkdZ4Z6c2YDu-e6kZ8-K7Dv_tRGxZj0vAqgPBx7rWwmHU-g@mail.gmail.com> <SG2PR06MB11659AB956F83E8DCE2C9AA18A350@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <SG2PR06MB11659AB956F83E8DCE2C9AA18A350@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 29, 2017 at 4:55 PM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Wednesday, March 29, 2017, Linus Walleij wrote:
>> On Fri, Mar 24, 2017 at 4:22 PM, Jacopo Mondi <jacopo+renesas@jmondi.org>
>> wrote:
>>
>> > Add dt-bindings for Renesas r7s72100 pin controller header file.
>> >
>> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>>
>> > +/*
>> > + * Pin is bi-directional.
>> > + * An alternate function that needs both input/output functionalities
>> > +shall
>> > + * be configured as bidirectional.
>> > + * Eg. SDA/SCL pins of an I2c interface.
>> > + */
>> > +#define BI_DIR                 (1 << 3)
>>
>> Any specific reason why this should not simply be added to
>> include/linux/pinctrl/pinconf-generic.h
>> as PIN_CONFIG_BIDIRECTIONAL and parsed in drivers/pinctrl/pinconf-
>> generic.c from the (new) DT property "bidirectional" simply?
>
> I see your point. It would cut down from every driver out there
> inventing some new property or config instead of everyone just sharing
> a fixed set.
> Maybe someone else out there will end up having a need for a
> "bidirectional" option.

I was thinking about that one. It is a bit weird electrically, like what
kind of electronics is really bidirectional?

It seems like a fancy name for open drain/open source, what we
call "single ended" configuration. (See docs in
Documentation/gpio/driver.txt)

It would be great if you could check if that is what they mean,
actually.

> But, what do we do for Ethernet? All the pins are "normal" except just
> the MDIO pin needs to be bidirectional.

I see Geert clarified what we could do here.

Yours,
Linus Walleij
