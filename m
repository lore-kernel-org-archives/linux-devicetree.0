From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: Re: [RFC 3/3] ARM: e3xx: Add header file for pinctrl constants
Date: Fri, 6 Nov 2015 09:55:28 -0800
Message-ID: <CAAtXAHeQA2-XeK2n+ow8OC_s7_UcSBhxDN1NZyhc9M43F6KHpA@mail.gmail.com>
References: <1446766883-25703-1-git-send-email-moritz.fischer@ettus.com>
	<3715539.QztuvljIIp@wuerfel>
	<CAAtXAHcdxkJWkGENLukYhqpH2CzozA-ScG8gV-OQt4ta_GNb6Q@mail.gmail.com>
	<4813305.v3X2DlHJmB@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <4813305.v3X2DlHJmB@wuerfel>
Sender: linux-gpio-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 6, 2015 at 8:42 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Friday 06 November 2015 08:01:25 Moritz Fischer wrote:
>> Hi Arnd,
>>
>> On Fri, Nov 6, 2015 at 12:54 AM, Arnd Bergmann <arnd@arndb.de> wrote:
>> > On Thursday 05 November 2015 15:41:23 Moritz Fischer wrote:
>> >> +/* Pin names for the E31x usecase */
>> >> +#define E31X_TX_BANDSEL_2      "DB_1"
>> >> +#define E31X_RX1B_BANDSEL_0    "DB_3"
>> >> +#define E31X_RX1B_BANDSEL_1    "DB_5"
>> >> +#define E31X_VCTXRX2_V2                "DB_7"
>> >> +#define E31X_TX_ENABLE1A       "DB_9"
>> >> +#define E31X_TX_ENABLE2A       "DB_11"
>> >> +#define E31X_TX_BANDSEL_0      "DB_12"
>> >
>> > Why not put the strings directly into the .dts files and change the
>> > lookup table in the driver accordingly:
>> >
>> > +static const struct pinctrl_pin_desc e3xx_pins[] = {
>> > +       /* pin0 doesn't exist */
>> > +       PINCTRL_PIN(1, "TX_BANDSEL_2"),
>> > +       PINCTRL_PIN(3, "RX1B_BANDSEL_0"),
>> > +       PINCTRL_PIN(5, "RX1B_BANDSEL_1"),
>> > +       PINCTRL_PIN(7, "VCTXRX2_V2"),
>>
>> That's actually the way I initially had it, however the pin names
>> literally changed
>> in the schematic depending on which daughter-board you stick into the slot.
>> So my plan was to add the #defines for the second daughter-board in a
>> follow up patch
>> once the pin assignment is final. This would allow me to have something like:
>>
>> pins = E31X_TX_BANDSEL_2;
>> output-low;
>>
>> in one .dts, while having something like
>>
>> pins = E33X_TX_BANDSEL_2
>> output low;
>>
>> in the second dts
>
> That doesn't seem helpful though, because the assignment of the
> pins is not hidden from the source file that should be documenting
> it: if someone wants to know how the pins are muxed, they now have
> to cross-reference the dts file with the header. If you just put the
> pin number directly into the dts, it becomes completely clear
> what the setting is.

Just to clarify, you're suggesting using "DB_0" etc in the dts file?
At that point
the name becomes kinda useless. I found the PINCTRL_PIN_ANON macro,
but haven't found any use throughout the tree, is using it discouraged?

>> The other option would have been to stick a e31x_pins and a e33x_pins
>> into the driver,
>> and set them according to a compatible string or "ettus,daughterboard"
>> property on probe.
>>
>> Does that make sense, or do you think there's a cleaner / better way
>> to achieve this sort of behavior?
>
> The driver should not be board specific.

Agreed, thank you!

Cheers,

Moritz
