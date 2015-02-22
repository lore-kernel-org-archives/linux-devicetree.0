From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM: bcm2835: Add header file for pinctrl constants
Date: Sun, 22 Feb 2015 21:13:23 +0100
Message-ID: <5700696.0jJhSRhno5@wuerfel>
References: <1424624396-812-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424624396-812-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: swarren@wwwdotorg.org, lee@kernel.org, linux@arm.linux.org.uk, robh+dt@kernel.org, pawel.moll@arm.com, galak@codeaurora.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sunday 22 February 2015 16:59:56 Charles Keepax wrote:
> +
> +/* IRQ Flags */
> +#define BCM2835_PIN_IRQ_RISING                         1
> +#define BCM2835_PIN_IRQ_FALLING                                2
> +#define BCM2835_PIN_IRQ_EDGE   (BCM2835_PIN_IRQ_RISING | \
> +                                BCM2835_PIN_IRQ_FALLING)
> +#define BCM2835_PIN_IRQ_LOW                            4
> +#define BCM2835_PIN_IRQ_HIGH                           8

Are these different from the standard definitions?

> +/* Pin Function Settings */
> +#define BCM2835_PIN_FUNC_GPIO_IN                       0
> +#define BCM2835_PIN_FUNC_GPIO_OUT                      1
> +#define BCM2835_PIN_FUNC_ALT5                          2
> +#define BCM2835_PIN_FUNC_ALT4                          3
> +#define BCM2835_PIN_FUNC_ALT0                          4
> +#define BCM2835_PIN_FUNC_ALT1                          5
> +#define BCM2835_PIN_FUNC_ALT2                          6
> +#define BCM2835_PIN_FUNC_ALT3                          7

Why are these required? They don't seem to be used by any driver,
which leads me to suspect that they are just the hardware numbers.

In that case, don't add any syntactical sugar like that and just
use the hardware numbers directly.

What's with the strange mapping of numbers anyway?

	Arnd
