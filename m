From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 4/5] dt-bindings: auxdisplay: Add bindings for Hitachi HD44780
Date: Mon, 20 Mar 2017 16:27:01 +0100
Message-ID: <CAMuHMdX_9-yze0ErxKxTM0rgLAhWhtfvkW8wvXxR6vMdVXXGbg@mail.gmail.com>
References: <1489155321-25666-1-git-send-email-geert@linux-m68k.org>
 <1489155321-25666-5-git-send-email-geert@linux-m68k.org> <20170320151516.dscqfjihoeezzhgi@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170320151516.dscqfjihoeezzhgi@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>, Willy Tarreau <willy@haproxy.com>, Ksenija Stanojevic <ksenija.stanojevic@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>, Akira Tsukamoto <akira.tsukamoto@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob, Greg,

On Mon, Mar 20, 2017 at 4:15 PM, Rob Herring <robh@kernel.org> wrote:
> On Fri, Mar 10, 2017 at 03:15:20PM +0100, Geert Uytterhoeven wrote:
>> Add DT bindings for an Hitachi HD44780 Character LCD Controller where
>> its M6800 bus interface is connected to GPIOs.
>>
>> Memory-mapped configurations are not yet supported.
>>
>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/auxdisplay/hit,hd44780.txt

>> +Required properties:
>> +  - compatible: Must contain "hit,hd44780",
>> +  - data-gpios: Must contain an array of either 4 or 8 GPIO specifiers,
>> +    referring to the GPIO pins connected to the data signal lines DB0-DB7
>> +    (8-bit mode) or DB4-DB7 (4-bit mode) of the LCD Controller's bus interface,
>> +  - enable-gpios: Must contain a GPIO specifier, referring to the GPIO pin
>> +    connected to the "E" (Enable) signal line of the LCD Controller's bus
>> +    interface,
>> +  - rs-gpios: Must contain a GPIO specifier, referring to the GPIO pin
>> +    connected to the "RS" (Register Select) signal line of the LCD Controller's
>> +    bus interface,
>> +  - display-height: Height of the display, in character cells,
>> +  - display-width: Width of the display, in character cells.
>
> display-{width,height}-chars

Makes sense.

Greg: As this is already in char-misc-next, shall I send an update for
the bindings
and the driver?

>> +Optional properties:
>> +  - rw-gpios: Must contain a GPIO specifier, referring to the GPIO pin
>> +    connected to the "RW" (Read/Write) signal line of the LCD Controller's bus
>> +    interface,
>> +  - backlight-gpios: Must contain a GPIO specifier, referring to the GPIO pin
>> +    used for enabling the LCD's backlight,
>
> Active state?

That's typically handled via the last cell of the GPIO specifier, cfr.
GPIO_ACTIVE_HIGH / GPIO_ACTIVE_LOW in <dt-bindings/gpio/gpio.h>.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
