From: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [RFC v4 0/2] gpio: add DT support for basic memory-mapped GPIOs
Date: Wed, 27 Apr 2016 00:51:51 +0200
Message-ID: <cover.1461710784.git.chunkeey@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series adds device tree support for basic memory-mapped GPIO=
s.
The GPIO library already allows drivers and architecture support code t=
o
reuse generic code for manageing a GPIO chip. Currently, a developer ha=
s
to create a platform device "basic-mmio-gpio" and attach a bgpio_pdata
platform data structure to make use of it. However, for architectures
which rely on the device tree to enumerate devices, creating custom
platform devices is another extra step that can be avoided by having
direct support via a device tree binding.

I initially came across this patch [0] from =C3=81lvaro Fern=C3=A1ndez =
Rojas,
while looking for an easy way to add support for the GPIO of my
WD MyBook Live [1] (APM82181 - ppc464). This generic approach patch
allowed me to easily get the GPIO (and the connected LEDs,
buttons, gpiohogs, etc.) up and running. Even tought, Mr. Fernandez
initially developed it for his work on the brcm63xx [2].

[0] <https://patchwork.ozlabs.org/patch/422121/>
[1] <https://github.com/chunkeey/MBL-openwrt>
[2] <https://wiki.openwrt.org/doc/hardware/soc/soc.broadcom.bcm63xx>

---
Note: Since it was such a long time ago, I had issues with getting
all the replies from lkml.org (the side simply browned-out some
replies and comments to the original, v2 and v3 series. So please
if you have already had a comment on the previous patch that wasn't
implemented in this RFC, let me know.

Thanks! (Please keep me in the CC)
---

Christian Lamparter (1):
  gpio: generic: fix GPIO_GENERIC_PLATFORM is set to module case

=C3=81lvaro Fern=C3=A1ndez Rojas (2):
  gpio: dt-bindings: add basic-mmio-gpio bindings
  gpio: generic: add DT support for basic memory-mapped GPIOs

 .../devicetree/bindings/gpio/basic-mmio-gpio.txt   | 73 ++++++++++++++=
++++++++
 drivers/gpio/gpio-generic.c                        | 72 ++++++++++++++=
++++++-
 2 files changed, 142 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/basic-mmio-g=
pio.txt

--=20
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
