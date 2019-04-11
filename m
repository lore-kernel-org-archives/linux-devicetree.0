From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] dt-bindings: gpio: lpc32xx: document interrupt bindings
Date: Thu, 11 Apr 2019 15:49:58 +0200
Message-ID: <CACRpkdZfdxNwU_9h3PtcJkAE++QZnC_JifoqNfLwJyqj_ofJuA@mail.gmail.com>
References: <20190410103926.8781-1-alexandre.belloni@bootlin.com> <20190410103926.8781-2-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190410103926.8781-2-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Vladimir Zapolskiy <vz@mleia.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Alexandre,

thanks for your patch!

On Wed, Apr 10, 2019 at 12:39 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:

> Some of the LPC32xx gpios are wired directly to one of the interrupt
> controllers while port 0 and port 1 share the same interrupt for their
> interrupt capable gpios.
>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(...)

> +- interrupts: Should be the interrupt shared by port 0 and port 1 and the
> +  interrupts for individual pins from port 3.
> +- interrupt-names : Should be the names of irq resources. The shared port
> +  interrupt is named "p01", the other use the pin names.

The recent design pattern with hierarchical interrupts such as this one
is to simply hardcode the relationship between parent interrupt controller
and child interrupt controller in the driver.

However you should add interrupt-controller and possibly
interrupt-parent to the bindings and example.

More comments in patch 2.

Yours,
Linus Walleij
