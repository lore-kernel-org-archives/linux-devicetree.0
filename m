From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] gpio: syscon: Add support for the Xylon LogiCVC GPIOs
Date: Thu, 12 Sep 2019 10:17:15 +0100
Message-ID: <CACRpkdY40PZc9R-yFwooR4-WMgn3LH7K+yTx00ZNxyq6OOnw6A@mail.gmail.com>
References: <20190910152855.111588-1-paul.kocialkowski@bootlin.com> <20190910152855.111588-3-paul.kocialkowski@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190910152855.111588-3-paul.kocialkowski@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 10, 2019 at 4:29 PM Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:

> The LogiCVC display hardware block comes with GPIO capabilities
> that must be exposed separately from the main driver (as GPIOs) for
> use with regulators and panels. A syscon is used to share the same
> regmap across the two drivers.
>
> Since the GPIO capabilities are pretty simple, add them to the syscon
> GPIO driver.
>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

I'm fine with this for now, but the gpio-syscon driver is now growing
big and when you use it you are getting support for a whole bunch
of systems you're not running on included in your binary.

We need to think about possibly creating drivers/gpio/syscon
and split subdrivers into separate files and config options
so that people can slim down to what they actually need.

> +       *bit = 1 << offset;

Please do this:

#include <linux/bits.h>

*bit = BIT(offset);

Yours,
Linus Walleij
