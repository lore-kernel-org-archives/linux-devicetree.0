From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: [PATCH v2 0/5] Add HD44780 Character LCD support
Date: Fri, 10 Mar 2017 15:15:16 +0100
Message-ID: <1489155321-25666-1-git-send-email-geert@linux-m68k.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Miguel Ojeda Sandonis <miguel.ojeda.sandonis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Willy Tarreau <willy-W4YR9g1X7EZBDgjK7y7TUQ@public.gmane.org>, Ksenija Stanojevic <ksenija.stanojevic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Akira Tsukamoto <akira.tsukamoto-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

    Hi all,

Character LCDs are currently typically driven from userspace, either
directly through bit-banging, or via some kind of serial (UART/i2c)
interface.

This patch series adds kernel support for character LCDs using an
Hitachi HD44780 Character LCD Controller where its M6800 bus interface
is connected to GPIOs.  It does so after extracting the character LCD
core support from the existing Parallel port LCD/Keypad Panel driver
into its own subdriver.

  - Patch 1 extracts the character LCD core support from the panel
    driver into an auxdisplay charlcd subdriver,
  - Patches 2 and 3 add new features to the character LCD core driver
    (support for 4-bit interfaces and displays with more than 2 lines),
  - Patch 4 adds DT bindings for describing HD44780 Character LCDs,
  - Patch 5 adds a driver for HD44780 Character LCDs connected to GPIOs,
    using the new character LCD core.

Note that Linux has other support for HD44780 Character LCDs, but none of
it is generic:
  - drivers/misc/arm-charlcd.c involves a custom IP block for interfacing
    to the LCD controller,
  - drivers/parisc/led.c is tightly coupled to LED handling on various HP
    PA-RISC machines.

This has been tested using a 20x4 character LCD with backlight, using both
8-bit and 4-bit wiring to one or two 74HC595 shift registers connected to
an SPI master controller.

Regression testing on original "panel" hardware would be appreciated.

Changes compared to v1:
  - Dropped accepted patches (panel driver fixes, cleanups, and
    improvements),
  - Move backlight mutex initialization before call to
    charlcd_init_display(), to prevent locking an uninitialized mutex
    (reported by 0day).
  - Added rationale for not yet supporting memory-mapped configurations,
  - Drop the dependency on OF by switching to the device property API,
  - Depend on GPIOLIB || COMPILE_TEST.

Thanks!

Geert Uytterhoeven (5):
  auxdisplay: charlcd: Extract character LCD core from misc/panel
  auxdisplay: charlcd: Add support for 4-bit interfaces
  auxdisplay: charlcd: Add support for displays with more than two lines
  dt-bindings: auxdisplay: Add bindings for Hitachi HD44780
  auxdisplay: Add HD44780 Character LCD support

 .../devicetree/bindings/auxdisplay/hit,hd44780.txt |  44 ++
 drivers/auxdisplay/Kconfig                         |  14 +
 drivers/auxdisplay/Makefile                        |   2 +
 drivers/auxdisplay/charlcd.c                       | 818 ++++++++++++++++++++
 drivers/auxdisplay/hd44780.c                       | 325 ++++++++
 drivers/misc/Kconfig                               |   1 +
 drivers/misc/panel.c                               | 827 +++------------------
 include/misc/charlcd.h                             |  42 ++
 8 files changed, 1338 insertions(+), 735 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/auxdisplay/hit,hd44780.txt
 create mode 100644 drivers/auxdisplay/charlcd.c
 create mode 100644 drivers/auxdisplay/hd44780.c
 create mode 100644 include/misc/charlcd.h

-- 
2.7.4

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
