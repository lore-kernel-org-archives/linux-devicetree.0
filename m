From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v2 4/5] dt-bindings: auxdisplay: Add bindings for Hitachi HD44780
Date: Tue, 21 Mar 2017 09:07:00 +0100
Message-ID: <CAMuHMdWHWL6sPCLUHHpo3mMyQhbASGVQFBcBvqMKmHg-8zy=dQ@mail.gmail.com>
References: <1489155321-25666-1-git-send-email-geert@linux-m68k.org>
 <1489155321-25666-5-git-send-email-geert@linux-m68k.org> <20170320151516.dscqfjihoeezzhgi@rob-hp-laptop>
 <CAMuHMdX_9-yze0ErxKxTM0rgLAhWhtfvkW8wvXxR6vMdVXXGbg@mail.gmail.com> <CAL_Jsq+80ut=9eGK8v2e6pW_q0yPCV-Hk25C=KeE3xZVc5ooeg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+80ut=9eGK8v2e6pW_q0yPCV-Hk25C=KeE3xZVc5ooeg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Miguel Ojeda Sandonis <miguel.ojeda.sandonis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Willy Tarreau <willy-W4YR9g1X7EZBDgjK7y7TUQ@public.gmane.org>, Ksenija Stanojevic <ksenija.stanojevic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Akira Tsukamoto <akira.tsukamoto-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Mon, Mar 20, 2017 at 6:00 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Mon, Mar 20, 2017 at 10:27 AM, Geert Uytterhoeven
> <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
>> On Mon, Mar 20, 2017 at 4:15 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>> On Fri, Mar 10, 2017 at 03:15:20PM +0100, Geert Uytterhoeven wrote:
>>>> Add DT bindings for an Hitachi HD44780 Character LCD Controller where
>>>> its M6800 bus interface is connected to GPIOs.
>>>>
>>>> Memory-mapped configurations are not yet supported.
>>>>
>>>> Signed-off-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
>>
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/auxdisplay/hit,hd44780.txt
>>
>>>> +Required properties:
>>>> +  - compatible: Must contain "hit,hd44780",
>>>> +  - data-gpios: Must contain an array of either 4 or 8 GPIO specifiers,
>>>> +    referring to the GPIO pins connected to the data signal lines DB0-DB7
>>>> +    (8-bit mode) or DB4-DB7 (4-bit mode) of the LCD Controller's bus interface,
>>>> +  - enable-gpios: Must contain a GPIO specifier, referring to the GPIO pin
>>>> +    connected to the "E" (Enable) signal line of the LCD Controller's bus
>>>> +    interface,
>>>> +  - rs-gpios: Must contain a GPIO specifier, referring to the GPIO pin
>>>> +    connected to the "RS" (Register Select) signal line of the LCD Controller's
>>>> +    bus interface,
>>>> +  - display-height: Height of the display, in character cells,
>>>> +  - display-width: Width of the display, in character cells.
>>>
>>> display-{width,height}-chars
>>
>> Makes sense.
>>
>> Greg: As this is already in char-misc-next, shall I send an update for
>> the bindings
>> and the driver?
>>
>>>> +Optional properties:
>>>> +  - rw-gpios: Must contain a GPIO specifier, referring to the GPIO pin
>>>> +    connected to the "RW" (Read/Write) signal line of the LCD Controller's bus
>>>> +    interface,
>>>> +  - backlight-gpios: Must contain a GPIO specifier, referring to the GPIO pin
>>>> +    used for enabling the LCD's backlight,
>>>
>>> Active state?
>>
>> That's typically handled via the last cell of the GPIO specifier, cfr.
>> GPIO_ACTIVE_HIGH / GPIO_ACTIVE_LOW in <dt-bindings/gpio/gpio.h>.
>
> Yes, I know. I want to be able to read the binding and validate the
> dts file, so I need to know what is the correct flag.

For the LCD Controller's bus, the GPIOs are wired straight, so they should
be ACTIVE_HIGH (unless there's an inverting buffer in between :-).

The backlight is separate from the LCD Controller, hence the polarity
depends on the actual hardware configuration.

Is it worth documenting that?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
