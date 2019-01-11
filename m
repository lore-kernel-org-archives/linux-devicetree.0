Return-Path: <robherring2@gmail.com>
Date: Fri, 11 Jan 2019 10:41:56 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/4] gpio: add core support for pull-up/pull-down
 configuration
Message-ID: <20190111164156.GA28883@bogus>
References: <20190103164102.31437-1-thomas.petazzoni@bootlin.com>
 <20190103164102.31437-4-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190103164102.31437-4-thomas.petazzoni@bootlin.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, Jan 03, 2019 at 05:41:01PM +0100, Thomas Petazzoni wrote:
> This commit adds support for configuring the pull-up and pull-down
> resistors available in some GPIO controllers. While configuring
> pull-up/pull-down is already possible through the pinctrl subsystem,
> some GPIO controllers, especially simple ones such as GPIO expanders
> on I2C, don't have any pinmuxing capability and therefore do not use
> the pinctrl subsystem.
> 
> This commit implements the GPIO_PULL_UP and GPIO_PULL_DOWN flags,
> which can be used from the Device Tree, to enable a pull-up or
> pull-down resistor on a given GPIO.
> 
> The flag is simply propagated all the way to the core GPIO subsystem,
> where it is used to call the gpio_chip ->set_config callback with the
> appropriate existing PIN_CONFIG_BIAS_* values.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  drivers/gpio/gpiolib-of.c       |  5 +++++
>  drivers/gpio/gpiolib.c          | 12 ++++++++++++
>  drivers/gpio/gpiolib.h          |  2 ++
>  include/dt-bindings/gpio/gpio.h |  6 ++++++

It's fine, but really this one should be part of the binding patch.

>  include/linux/gpio/machine.h    |  2 ++
>  include/linux/of_gpio.h         |  2 ++
>  6 files changed, 29 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
