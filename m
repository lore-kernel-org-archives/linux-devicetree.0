From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] video: hd44780: Add hd44780 lcd display driver
Date: Wed, 6 Dec 2017 16:04:10 +0100
Message-ID: <CAMuHMdUn-wx7YC=QWazb4e-vJGts8iXbkC64NYiEjha-kQPKLg@mail.gmail.com>
References: <20171206135255.6990-1-poeschel@lemonage.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171206135255.6990-1-poeschel@lemonage.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lars Poeschel <poeschel@lemonage.de>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, =?UTF-8?Q?Manuel_Sch=C3=B6lling?= <manuel.schoelling@gmx.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@c-s.fr>, Randy Dunlap <rdunlap@infradead.org>, Kate Stewart <kstewart@linuxfoundation.org>, Philippe Ombredanne <pombredanne@nexb.com>, Sean Paul <seanpaul@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, DRI Development <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux
List-Id: devicetree@vger.kernel.org

Hi Lars,

On Wed, Dec 6, 2017 at 2:52 PM, Lars Poeschel <poeschel@lemonage.de> wrote:
> This adds a console driver for hd44780 based character lcd displays and
> clones. The driver currently supports 20x4 character displays with
> character ROMs A00 and A02.
> The hardware wirings to the display have to be supplied to the kernel in
> the devicetree. The binding doc has the necessary information.
> There are also tons of these cheap displays sold with a serial
> interface. Many of them use a simple pcf8574 gpio expanders. An example
> for using that kind of display is also in the binding doc.
>
> Signed-off-by: Lars Poeschel <poeschel@lemonage.de>

Thanks for your patch!

> ---
>  .../bindings/video/console/hd44780con.txt          |  42 ++
>  drivers/video/console/Kconfig                      |  13 +
>  drivers/video/console/Makefile                     |   1 +
>  drivers/video/console/hd44780con.c                 | 676 +++++++++++++++++++++

I'm wondering if you could implement this on top of the existing charlcd
framework:

    drivers/auxdisplay/charlcd.c
    include/misc/charlcd.h

which can use the existing hd44780 backend:

    Documentation/devicetree/bindings/auxdisplay/hit,hd44780.txt
    drivers/auxdisplay/hd44780.c

That way it can be used on other character LCDs, like the one supported by
drivers/auxdisplay/panel.c.

Thanks!

P.S. I did something similar a long time ago, cfr.
     https://github.com/geertu/hd44780/blob/master/lcdcon.c

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
