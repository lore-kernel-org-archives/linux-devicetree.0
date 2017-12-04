From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/3] eeprom: at25: Add DT support for 25lc040
Date: Mon, 4 Dec 2017 15:22:15 -0600
Message-ID: <20171204212215.f5dqiei6eqk6d7de@rob-hp-laptop>
References: <1512048586-17534-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1512048586-17534-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ivo Sieben <meltedpianoman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chris Wright <chrisw-69jw2NvuJkxg9hUCZPvPmw@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 30, 2017 at 02:29:43PM +0100, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> Some "atmel,at25" compatible SPI EEPROMs (e.g. Microchip 25lc040) use an
> odd number of address bits.  This patch series adds support for
> instantiating such devices from DT.
> 
> Do EEPROMs using 17 or 25 address bits, as mentioned in 
> include/linux/spi/eeprom.h, really exist?
> Or should we just limit it to a single odd value (9 bits)?
> 
> This has been tested with a bunch of 25lc040 EEPROMs.
> 
> Thanks!
> 
> Geert Uytterhoeven (3):
>   eeprom: at25: Add DT support for EEPROMs with odd address bits
>   dt-bindings: eeprom: at25: Grammar s/are can/can/
>   dt-bindings: eeprom: at25: Document device-specific compatible values

2 and 3 are fixes and I'll apply for 4.15 if you don't mind.

Rob

> 
>  Documentation/devicetree/bindings/eeprom/at25.txt | 17 ++++++++++++-----
>  drivers/misc/eeprom/at25.c                        |  4 ++++
>  2 files changed, 16 insertions(+), 5 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
