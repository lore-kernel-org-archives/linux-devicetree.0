From: Nandor Han <nandor.han@ge.com>
Subject: [PATCH v2 0/4] XRA1403,gpio - add XRA1403 gpio expander driver
Date: Thu, 13 Apr 2017 13:27:47 +0300
Message-ID: <cover.1492077070.git.nandor.han@ge.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, davem@davemloft.net, geert@linux-m68k.org, mchehab@kernel.org, daniel.vetter@ffwll.ch, linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Nandor Han <nandor.han@ge.com>
List-Id: devicetree@vger.kernel.org

The patchset will add a driver to support basic functionality for
XRA1403 device. Features supported:
        - get/set GPIO direction (input, output)
        - get/set GPIO level (low, high)

Documentation: A gpio-xra1403.txt file was added to document the DTS
	bindings related to driver.

Testing:

1.1 XRA1403 connected to iMX53 MCU
1.2 Use the GPIO tools provided by kernel from tools/gpio dir

2.1 `lsgpio`

root@csmon ppd:~# lsgpio
GPIO chip: gpiochip8, "xra1403", 16 GPIO lines
        line  0: unnamed unused [output]
        line  1: unnamed unused [output]
        line  2: unnamed unused [output]
        line  3: unnamed unused [output]
        line  4: unnamed unused [output]
        line  5: unnamed unused
        line  6: unnamed unused
        line  7: unnamed unused [output]
        line  8: unnamed unused [output]
        line  9: unnamed unused
        line 10: unnamed unused [output]
        line 11: unnamed unused
        line 12: unnamed unused
        line 13: unnamed unused
        line 14: unnamed unused
        line 15: unnamed unused [output]
GPIO chip: gpiochip7, "xra1403", 16 GPIO lines
        line  0: unnamed unused
        line  1: unnamed unused
        line  2: unnamed unused
        line  3: unnamed unused
        line  4: unnamed unused
        line  5: unnamed unused
        line  6: unnamed unused
        line  7: unnamed unused
        line  8: unnamed unused
        line  9: unnamed unused
        line 10: unnamed unused
        line 11: unnamed unused
        line 12: unnamed unused
        line 13: unnamed unused
        line 14: unnamed unused
        line 15: unnamed unused

3.1 `gpio-hammer`

root@csmon ppd:~# gpio-hammer -n gpiochip8 -o0 -o1 -o2 -o3
Hammer lines [0, 1, 2, 3] on gpiochip8, initial states: [0, 0, 0, 0]
[\] [0: 0, 1: 0, 2: 0, 3: 0]
...
[\] [0: 1, 1: 1, 2: 1, 3: 1]

When using `gpio-hammer` I also attached an oscilloscope to one of the pins and I was
able to monitor and validate the GPIO status.

Nandor Han (4):
  dt-bindings: gpio - add exar to vendor prefixes list
  gpio - Add EXAR XRA1403 SPI GPIO expander driver
  doc,dts - add XRA1403 DTS binding documentation
  Add XRA1403 support to MAINTAINERS file

 .../devicetree/bindings/gpio/gpio-xra1403.txt      |  46 ++++
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 MAINTAINERS                                        |   8 +
 drivers/gpio/Kconfig                               |   5 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-xra1403.c                        | 236 +++++++++++++++++++++
 6 files changed, 297 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-xra1403.txt
 create mode 100644 drivers/gpio/gpio-xra1403.c

-- 
2.10.1

