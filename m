From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 3/5] gpio: use new gpio_set_config() helper in more
 places
Date: Sat, 16 Mar 2019 14:45:19 +0100
Message-ID: <20190316144519.07805478@windsurf>
References: <20190207162859.26252-1-thomas.petazzoni@bootlin.com>
        <20190207162859.26252-4-thomas.petazzoni@bootlin.com>
        <20190316014352.GA6124@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190316014352.GA6124@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jan =?UTF-8?B?S3VuZHLDoXQ=?= <jan.kundrat@cesnet.cz>
List-Id: devicetree@vger.kernel.org

Hello,

On Fri, 15 Mar 2019 18:43:52 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index cf8a4402fef1..9762a836fec9 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -2762,7 +2762,7 @@ int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
> >  	}
> >  
> >  	config = pinconf_to_config_packed(PIN_CONFIG_INPUT_DEBOUNCE, debounce);
> > -	return chip->set_config(chip, gpio_chip_hwgpio(desc), config);
> > +	return gpio_set_config(chip, gpio_chip_hwgpio(desc), config);  
> 
> Are you sure this is correct ? This patch results in a number of tracebacks
> in mainline. Reverting it fixes the problem.
> 
> gpio_set_config() seems to pack config, but it is already packed above.
> That seems a bit suspicious.

I'll have a look. In the mean time, I'm fine with the patch being
reverted.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
