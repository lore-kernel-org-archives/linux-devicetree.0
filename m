From: Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 00/13] pinctrl: add BCM63XX pincontrol support
Date: Fri, 19 Aug 2016 12:53:32 +0200
Message-ID: <1471604025-21575-1-git-send-email-jonas.gorski@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset adds appropriate binding documentation and drivers for
pin controller cores found in the BCM63XX MIPS SoCs currently supported.

While the GPIO part is always the same, the pinmux part varies quite a
lot between different SoCs. Sometimes they have defined groups which
can be muxed into different functions, sometimes each function has a
different group. Sometimes you can mux individual pins. Often it is a
combination of single pins and groups.

Some core versions require the GPIO direction to be set according to the
function, most do not. Sometimes the mux register(s) contain bits for
unrelated other functions.

I intentionally left out any MIPS patches so keep the patchset smaller
and to make it clearer to which tree this belongs.

Some implementation notes:

BCM6348 has one mux function that enables two unrelated functions at the
same time; additional SPI CS signals as well as extra UART pins. This
means that in case both the uart as well as the spi driver needs it, it
would need to be requested globally, as the same mux can't be requested
by two different devices. Since this is a linux internal detail, I
chose to not try to split this function and try to work around it in
the driver (by refcounting etc).

BCM6358 has two "invert-mii-clock" bits in its GPIO Mode register for
the ethernet cores. This didn't seem to fit well into pinmux/conf; at
best as two pins which you could apply exactly one property,
"brcm,invert-clock". So I chose syscon so the ethernet driver can poke
at the bits itself.

BCM6368 has several additional bits in its GPIO BaseMode register for
enabling RGMII pins, UTOPIA, or changing the PCI clock to 66 MHz. These
seemed to fit even less.


Based on the current HEAD of linux-pinctrl/for-next.

Jonas Gorski (13):
  pinctrl: add bcm63xx base code
  Documentation: add BCM6328 pincontroller binding documentation
  pinctrl: add a pincontrol driver for BCM6328
  Documentation: add BCM6348 pincontroller binding documentation
  pinctrl: add a pincontrol driver for BCM6348
  Documentation: add BCM6358 pincontroller binding documentation
  pinctrl: add a pincontrol driver for BCM6358
  Documentation: add BCM6362 pincontroller binding documentation
  pinctrl: add a pincontrol driver for BCM6362
  Documentation: add BCM6368 pincontroller binding documentation
  pinctrl: add a pincontrol driver for BCM6368
  Documentation: add BCM63268 pincontroller binding documentation
  pinctrl: add a pincontrol driver for BCM63268

 .../bindings/pinctrl/brcm,bcm63268-pinctrl.txt     |  88 +++
 .../bindings/pinctrl/brcm,bcm6328-pinctrl.txt      |  61 ++
 .../bindings/pinctrl/brcm,bcm6348-pinctrl.txt      |  32 +
 .../bindings/pinctrl/brcm,bcm6358-pinctrl.txt      |  44 ++
 .../bindings/pinctrl/brcm,bcm6362-pinctrl.txt      |  79 +++
 .../bindings/pinctrl/brcm,bcm6368-pinctrl.txt      |  67 ++
 MAINTAINERS                                        |   1 +
 drivers/pinctrl/Kconfig                            |   1 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/bcm63xx/Kconfig                    |  47 ++
 drivers/pinctrl/bcm63xx/Makefile                   |   7 +
 drivers/pinctrl/bcm63xx/pinctrl-bcm63268.c         | 710 +++++++++++++++++++++
 drivers/pinctrl/bcm63xx/pinctrl-bcm6328.c          | 456 +++++++++++++
 drivers/pinctrl/bcm63xx/pinctrl-bcm6348.c          | 392 ++++++++++++
 drivers/pinctrl/bcm63xx/pinctrl-bcm6358.c          | 393 ++++++++++++
 drivers/pinctrl/bcm63xx/pinctrl-bcm6362.c          | 692 ++++++++++++++++++++
 drivers/pinctrl/bcm63xx/pinctrl-bcm6368.c          | 573 +++++++++++++++++
 drivers/pinctrl/bcm63xx/pinctrl-bcm63xx.c          | 141 ++++
 drivers/pinctrl/bcm63xx/pinctrl-bcm63xx.h          |  14 +
 19 files changed, 3799 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6348-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6362-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6368-pinctrl.txt
 create mode 100644 drivers/pinctrl/bcm63xx/Kconfig
 create mode 100644 drivers/pinctrl/bcm63xx/Makefile
 create mode 100644 drivers/pinctrl/bcm63xx/pinctrl-bcm63268.c
 create mode 100644 drivers/pinctrl/bcm63xx/pinctrl-bcm6328.c
 create mode 100644 drivers/pinctrl/bcm63xx/pinctrl-bcm6348.c
 create mode 100644 drivers/pinctrl/bcm63xx/pinctrl-bcm6358.c
 create mode 100644 drivers/pinctrl/bcm63xx/pinctrl-bcm6362.c
 create mode 100644 drivers/pinctrl/bcm63xx/pinctrl-bcm6368.c
 create mode 100644 drivers/pinctrl/bcm63xx/pinctrl-bcm63xx.c
 create mode 100644 drivers/pinctrl/bcm63xx/pinctrl-bcm63xx.h

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
