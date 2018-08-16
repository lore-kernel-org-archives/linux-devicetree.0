From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: 74x164: add lines-initial-states property
Date: Thu, 16 Aug 2018 10:11:38 +0200
Message-ID: <CACRpkdYTxvWjLizTr8Qg-FmSPjnnU+kj2+VrUUcz5F0nkhrUrg@mail.gmail.com>
References: <20180815201855.29738-1-mail@david-bauer.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180815201855.29738-1-mail@david-bauer.net>
Sender: linux-kernel-owner@vger.kernel.org
To: mail@david-bauer.net
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi David,

On Wed, Aug 15, 2018 at 10:19 PM David Bauer <mail@david-bauer.net> wrote:

> This adds the ability to define the initial state of each output line on
> device probe.
>
> Signed-off-by: David Bauer <mail@david-bauer.net>

(...)
>  Optional properties:
>  - enable-gpios: GPIO connected to the OE (Output Enable) pin.
> +- lines-initial-states: Bitmask that specifies the initial state of
> +  each line. When a bit is set to zero, the corresponding output line
> +  is initialized LOW. When a bit is set to one, the corresponding
> +  output line is initialized HIGH. In case this property is not
> +  defined, all lines will be initialized as LOW.

This sounds like something that should be generic, and not use
a bitmask, but offsets. It should work even if the number of
GPIOs from the chip is > 32.

Is the usecase different from hogs?
See Documentation/devicetree/bindings/gpio.txt

There has been extensive discussion about supporting initial values
with something similar to hogs, but I haven't got anything ACKed
by the DT maintainers so it has kind of stalled.

I would make sure to both make it generic, get ACK from the DT
mainatiners, and make sure to implement it in
drivers/gpio/gpiolib-of.c and not locally in drivers.

Yours,
Linus Walleij
