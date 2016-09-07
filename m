From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 8/8] gpio: Add Aspeed driver
Date: Wed, 7 Sep 2016 16:59:17 +0200
Message-ID: <CACRpkdbXu7i1_wHuF-tMK6vxK-UFV_YihQzrGKC3EmCtbrMozA@mail.gmail.com>
References: <20160830075427.11493-1-andrew@aj.id.au> <20160830075427.11493-9-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160830075427.11493-9-andrew@aj.id.au>
Sender: linux-gpio-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alistair Popple <alistair@popple.id.au>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 30, 2016 at 9:54 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

> From: Joel Stanley <joel@jms.id.au>
>
> The Aspeed SoCs contain GPIOs banked by letter, where each bank contains
> 8 pins. The GPIO banks are then grouped in sets of four in the register
> layout.
>
> The implementation exposes multiple banks through the one driver and
> requests and releases pins via the pinctrl subsystem. The hardware
> supports generation of interrupts from all GPIO-capable pins.
>
> A number of hardware features are not yet supported: Configuration of
> interrupt direction (ARM or LPC), debouncing, and WDT reset tolerance
> for output ports.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Alistair Popple <alistair@popple.id.au>
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied to the GPIO tree.

As there are no compile-time dependencies between the
pin control and GPIO drivers I choose to merge the pinctrl
stuff through the pinctrl tree and the GPIO stuff through the GPIO
tree.

Yours,
Linus Walleij
