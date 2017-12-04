From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/3] eeprom: at25: Add DT support for EEPROMs with odd
 address bits
Date: Mon, 4 Dec 2017 10:17:47 +0100
Message-ID: <CAMuHMdWczQ0KiH7soGLKxX8CQEwxA=kVDc_saYqgytE2U_3WKw@mail.gmail.com>
References: <1512048586-17534-1-git-send-email-geert+renesas@glider.be> <1512048586-17534-2-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1512048586-17534-2-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Ivo Sieben <meltedpianoman@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chris Wright <chrisw@sous-sol.org>, Wolfram Sang <wsa@the-dreams.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 30, 2017 at 2:29 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Certain EEPROMS have a size that is larger than the number of address
> bytes would allow, and store the MSB of the address in bit 3 of the
> instruction byte.
>
> This can be described in platform data using EE_INSTR_BIT3_IS_ADDR, or
> in DT using the obsolete legacy "at25,addr-mode" property.
> But currently there exists no non-deprecated way to describe this in DT.
>
> Hence extend the existing "address-width" DT property to allow
> specifying 9, 17, or 25 address bits, and enable support for that in the
> driver.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> EEPROMs using 9 address bits are common (e.g. M95040, 25AA040/25LC040).
> Do EEPROMs using 17 or 25 address bits, as mentioned in
> include/linux/spi/eeprom.h, really exist?
> Or should we just limit it to a single odd value (9 bits)?

At least for the real Atmel parts, only the AT25040 part uses odd (8 +
1 bit) addressing.
AT25M01 uses 3-byte addressing (it needs 17 bits).

So I tend to believe EEPROMs using 16 + 1  or 24 + 1 address bits (with the
extra bit in the instruction byte) do not exist?

> ---
>  Documentation/devicetree/bindings/eeprom/at25.txt | 4 +++-
>  drivers/misc/eeprom/at25.c                        | 4 ++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/eeprom/at25.txt b/Documentation/devicetree/bindings/eeprom/at25.txt
> index 1d3447165c374f67..d00779e4ab4377b9 100644
> --- a/Documentation/devicetree/bindings/eeprom/at25.txt
> +++ b/Documentation/devicetree/bindings/eeprom/at25.txt
> @@ -6,7 +6,9 @@ Required properties:
>  - spi-max-frequency : max spi frequency to use
>  - pagesize : size of the eeprom page
>  - size : total eeprom size in bytes
> -- address-width : number of address bits (one of 8, 16, or 24)
> +- address-width : number of address bits (one of 8, 9, 16, 17, 24, or 25).
> +  For odd values, the MSB of the address is sent as bit 3 of the instruction
> +  byte, before the address byte(s).

Alternatively, we can drop the binding change, i.e. keep on using
address-width = <8> for 512-byte '040...

>  Optional properties:
>  - spi-cpha : SPI shifted clock phase, as per spi-bus bindings.
> diff --git a/drivers/misc/eeprom/at25.c b/drivers/misc/eeprom/at25.c
> index 5afe4cd165699060..a50a0f16fa0e1d1d 100644
> --- a/drivers/misc/eeprom/at25.c
> +++ b/drivers/misc/eeprom/at25.c
> @@ -275,6 +275,10 @@ static int at25_fw_to_chip(struct device *dev, struct spi_eeprom *chip)
>                                 "Error: missing \"address-width\" property\n");
>                         return -ENODEV;
>                 }
> +               if (val & 1) {
> +                       chip->flags |= EE_INSTR_BIT3_IS_ADDR;
> +                       val -= 1;
> +               }

... and handle it here like:

        if (chip->byte_len == 2U << val)
                chip->flags |= EE_INSTR_BIT3_IS_ADDR;

However, that would IMHO be a bit confusing, as the "address-width"
property is no longer the real address width, but indicates how many bits
are specified in address bytes sent after the read/write command.
So "address-bytes" = 1, 2, or 3 would be more correct ;-)

Or deprecate this whole "specify parameters using DT properties" business,
and derive them from the compatible value. But that would mean adding a
large and ever growing table to an old driver...

Thoughts?

Thanks again!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
