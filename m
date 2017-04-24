From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/4] gpio - Add EXAR XRA1403 SPI GPIO expander driver
Date: Mon, 24 Apr 2017 15:47:10 +0200
Message-ID: <CACRpkdZHMWH2W-i4MGZ7NKzPHUURRmC-5YwiK7cVLCHKDsb7sw@mail.gmail.com>
References: <cover.1492077070.git.nandor.han@ge.com> <f28eef264102786357ac5ed7205813619c508fb4.1492077070.git.nandor.han@ge.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <f28eef264102786357ac5ed7205813619c508fb4.1492077070.git.nandor.han@ge.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Nandor Han <nandor.han@ge.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, "David S. Miller" <davem@davemloft.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Semi Malinen <semi.malinen@ge.com>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 13, 2017 at 12:27 PM, Nandor Han <nandor.han@ge.com> wrote:

> This is a simple driver that provides a /sys/class/gpio
> interface for controlling and configuring the GPIO lines.
> It does not provide support for chip select or interrupts.
>
> Signed-off-by: Nandor Han <nandor.han@ge.com>
> Signed-off-by: Semi Malinen <semi.malinen@ge.com>

I almost want to make the driver depend on !GPIO_SYSFS because
of this commit message.

DO NOT USE OR ENCOURAGE THE USE OF THE GPIO SYSFS
INTERFACE.

Use the character device.

Use the example in tools/gpio/* as a guideline and testbed.

Use libgpiod as a rich userspace.

And the commit message should state that this is a driver
for such and such Exar hardware instead.

Thanks.

> +#include <linux/bitops.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of_device.h>
> +#include <linux/of_gpio.h>
> +#include <linux/spi/spi.h>
> +#include <linux/regmap.h>

You are missing
#include <linux/seq_file.h>

and that is why the build robot is complaining.

Yours,
Linus Walleij
