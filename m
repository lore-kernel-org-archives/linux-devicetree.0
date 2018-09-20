From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH net-next 0/7] add support for VSC8584 and VSC8574
 Microsemi quad-port PHYs
Date: Thu, 20 Sep 2018 14:38:44 -0700
Message-ID: <CACRpkdZYpDJGzexRr7y4LO+hyJ92aEu_eRquK50iBWaaox5H5Q@mail.gmail.com>
References: <cover.b921b010b6d6bde1c11e69551ae38f3b2818645b.1536916714.git-series.quentin.schulz@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <cover.b921b010b6d6bde1c11e69551ae38f3b2818645b.1536916714.git-series.quentin.schulz@bootlin.com>
Sender: netdev-owner@vger.kernel.org
To: quentin.schulz@bootlin.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Ralf Baechle <ralf@linux-mips.org>, paul.burton@mips.com, James Hogan <jhogan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, allan.nielsen@microchip.com, Linux MIPS <linux-mips@linux-mips.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, netdev <netdev@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>
List-Id: devicetree@vger.kernel.org

Just as a drive-by comment this seems vaguely related to the Vitesse
DSA switch I merged in drivers/net/dsa/vitesse-vsc73xx.c
The VSC* product name handily gives away the origin in Vitesse's
product line.

The VSC73xx also have the 8051 CPU and internal RAM, but are
accessed (typically) over SPI, and AFAICT this thing is talking over
MDIO.

The Vitesse 73xx however also supports a WAN port and VLANs
which makes it significantly different, falling into switch class I
guess.

These VSC85*4's does have an SPI interface as well, according
to the data sheet but I assume your target boards don't even
connect it?

When it comes to 8051 code we have quite a lot of this in the kernel
these days, I suspect the 8051 snippets in this code could be
disassembled and put into linux-firmware in source form, but
that is maybe a bit overly ambitious. We have done that for a few
USB to serial controllers using the EzUSB 8051 though:
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/keyspan_pda
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/usbdux

These can rebuild their firmware using the as31 assembler.
https://github.com/nitsky/as31

Yours,
Linus Walleij
