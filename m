From: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 3/3] ARM: e3xx: Add header file for pinctrl constants
Date: Fri, 6 Nov 2015 08:01:25 -0800
Message-ID: <CAAtXAHcdxkJWkGENLukYhqpH2CzozA-ScG8gV-OQt4ta_GNb6Q@mail.gmail.com>
References: <1446766883-25703-1-git-send-email-moritz.fischer@ettus.com>
	<1446766883-25703-4-git-send-email-moritz.fischer@ettus.com>
	<3715539.QztuvljIIp@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3715539.QztuvljIIp@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On Fri, Nov 6, 2015 at 12:54 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Thursday 05 November 2015 15:41:23 Moritz Fischer wrote:
>> +/* Pin names for the E31x usecase */
>> +#define E31X_TX_BANDSEL_2      "DB_1"
>> +#define E31X_RX1B_BANDSEL_0    "DB_3"
>> +#define E31X_RX1B_BANDSEL_1    "DB_5"
>> +#define E31X_VCTXRX2_V2                "DB_7"
>> +#define E31X_TX_ENABLE1A       "DB_9"
>> +#define E31X_TX_ENABLE2A       "DB_11"
>> +#define E31X_TX_BANDSEL_0      "DB_12"
>
> Why not put the strings directly into the .dts files and change the
> lookup table in the driver accordingly:
>
> +static const struct pinctrl_pin_desc e3xx_pins[] = {
> +       /* pin0 doesn't exist */
> +       PINCTRL_PIN(1, "TX_BANDSEL_2"),
> +       PINCTRL_PIN(3, "RX1B_BANDSEL_0"),
> +       PINCTRL_PIN(5, "RX1B_BANDSEL_1"),
> +       PINCTRL_PIN(7, "VCTXRX2_V2"),

That's actually the way I initially had it, however the pin names
literally changed
in the schematic depending on which daughter-board you stick into the slot.
So my plan was to add the #defines for the second daughter-board in a
follow up patch
once the pin assignment is final. This would allow me to have something like:

pins = E31X_TX_BANDSEL_2;
output-low;

in one .dts, while having something like

pins = E33X_TX_BANDSEL_2
output low;

in the second dts

The other option would have been to stick a e31x_pins and a e33x_pins
into the driver,
and set them according to a compatible string or "ettus,daughterboard"
property on probe.

Does that make sense, or do you think there's a cleaner / better way
to achieve this sort of behavior?

Thanks for your feedback!

Cheers,
Moritz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
