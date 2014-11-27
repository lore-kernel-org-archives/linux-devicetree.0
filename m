From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] gpio: mcp23s08: Add option to configure IRQ as active high
Date: Thu, 27 Nov 2014 14:58:39 +0100
Message-ID: <CACRpkdZCA7Zxs0HDpFZSmFmg5hYYAHmeNySFpM-Xq3G322mmbw@mail.gmail.com>
References: <1416213491-9775-1-git-send-email-alexander.stein@systec-electronic.com>
	<1416213491-9775-3-git-send-email-alexander.stein@systec-electronic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1416213491-9775-3-git-send-email-alexander.stein@systec-electronic.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 17, 2014 at 9:38 AM, Alexander Stein
<alexander.stein@systec-electronic.com> wrote:

> Default is active low, but if property is specified in DT set INTPOL flag.
>
> Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
> ---
>  .../devicetree/bindings/gpio/gpio-mcp23s08.txt     |  2 ++
>  drivers/gpio/gpio-mcp23s08.c                       | 30 +++++++++++++++++-----
>  2 files changed, 25 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-mcp23s08.txt b/Documentation/devicetree/bindings/gpio/gpio-mcp23s08.txt
> index c306a2d0..47dab72 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-mcp23s08.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-mcp23s08.txt
> @@ -57,6 +57,8 @@ Optional device specific properties:
>          occurred on. If it is not set, the interrupt are only generated for the
>          bank they belong to.
>          On devices with only one interrupt output this property is useless.
> +- microchip,irq-active-high: Sets the INTPOL flag in the IOCON register. This
> +        configures the IRQ output as active high.

I don't understand this AT ALL.

The normal way is that the *client* using the resource specify the
polarity.

#include <dt-bindings/interrupt-controller/irq.h>

interrupts = <0 60 IRQ_TYPE_LEVEL_LOW>;

This will then result in .set_type() being called on the irqchip.

I suspect the real change you want to do is to support
IRQ_TYPE_LEVEL_HIGH and IRQ_TYPE_LEVEL_LOW
in the .set_type() callback or something, or just switch all
clients from rising to falling edge or vice versa.

And it says is "configures the IRQ output", this seems more like
an input trigger?

Sorry too confused by this, can you explain?

Yours,
Linus Walleij
