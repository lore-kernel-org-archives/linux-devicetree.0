From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC 3/3] ARM: e3xx: Add header file for pinctrl constants
Date: Fri, 06 Nov 2015 17:42:02 +0100
Message-ID: <4813305.v3X2DlHJmB@wuerfel>
References: <1446766883-25703-1-git-send-email-moritz.fischer@ettus.com> <3715539.QztuvljIIp@wuerfel> <CAAtXAHcdxkJWkGENLukYhqpH2CzozA-ScG8gV-OQt4ta_GNb6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAAtXAHcdxkJWkGENLukYhqpH2CzozA-ScG8gV-OQt4ta_GNb6Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Friday 06 November 2015 08:01:25 Moritz Fischer wrote:
> Hi Arnd,
> 
> On Fri, Nov 6, 2015 at 12:54 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Thursday 05 November 2015 15:41:23 Moritz Fischer wrote:
> >> +/* Pin names for the E31x usecase */
> >> +#define E31X_TX_BANDSEL_2      "DB_1"
> >> +#define E31X_RX1B_BANDSEL_0    "DB_3"
> >> +#define E31X_RX1B_BANDSEL_1    "DB_5"
> >> +#define E31X_VCTXRX2_V2                "DB_7"
> >> +#define E31X_TX_ENABLE1A       "DB_9"
> >> +#define E31X_TX_ENABLE2A       "DB_11"
> >> +#define E31X_TX_BANDSEL_0      "DB_12"
> >
> > Why not put the strings directly into the .dts files and change the
> > lookup table in the driver accordingly:
> >
> > +static const struct pinctrl_pin_desc e3xx_pins[] = {
> > +       /* pin0 doesn't exist */
> > +       PINCTRL_PIN(1, "TX_BANDSEL_2"),
> > +       PINCTRL_PIN(3, "RX1B_BANDSEL_0"),
> > +       PINCTRL_PIN(5, "RX1B_BANDSEL_1"),
> > +       PINCTRL_PIN(7, "VCTXRX2_V2"),
> 
> That's actually the way I initially had it, however the pin names
> literally changed
> in the schematic depending on which daughter-board you stick into the slot.
> So my plan was to add the #defines for the second daughter-board in a
> follow up patch
> once the pin assignment is final. This would allow me to have something like:
> 
> pins = E31X_TX_BANDSEL_2;
> output-low;
> 
> in one .dts, while having something like
> 
> pins = E33X_TX_BANDSEL_2
> output low;
> 
> in the second dts

That doesn't seem helpful though, because the assignment of the
pins is not hidden from the source file that should be documenting
it: if someone wants to know how the pins are muxed, they now have
to cross-reference the dts file with the header. If you just put the
pin number directly into the dts, it becomes completely clear
what the setting is.

> The other option would have been to stick a e31x_pins and a e33x_pins
> into the driver,
> and set them according to a compatible string or "ettus,daughterboard"
> property on probe.
> 
> Does that make sense, or do you think there's a cleaner / better way
> to achieve this sort of behavior?

The driver should not be board specific.

	Arnd
