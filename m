From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 3/5] gpio: use new gpio_set_config() helper in more
 places
Date: Tue, 26 Mar 2019 13:03:02 -0700
Message-ID: <20190326200302.GA15712@roeck-us.net>
References: <20190207162859.26252-1-thomas.petazzoni@bootlin.com>
 <20190207162859.26252-4-thomas.petazzoni@bootlin.com>
 <20190316014352.GA6124@roeck-us.net>
 <20190316144519.07805478@windsurf>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190316144519.07805478@windsurf>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jan =?iso-8859-1?Q?Kundr=E1t?= <jan.kundrat@cesnet.cz>
List-Id: devicetree@vger.kernel.org

On Sat, Mar 16, 2019 at 02:45:19PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 15 Mar 2019 18:43:52 -0700
> Guenter Roeck <linux@roeck-us.net> wrote:
> 
> > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > > index cf8a4402fef1..9762a836fec9 100644
> > > --- a/drivers/gpio/gpiolib.c
> > > +++ b/drivers/gpio/gpiolib.c
> > > @@ -2762,7 +2762,7 @@ int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
> > >  	}
> > >  
> > >  	config = pinconf_to_config_packed(PIN_CONFIG_INPUT_DEBOUNCE, debounce);
> > > -	return chip->set_config(chip, gpio_chip_hwgpio(desc), config);
> > > +	return gpio_set_config(chip, gpio_chip_hwgpio(desc), config);  
> > 
> > Are you sure this is correct ? This patch results in a number of tracebacks
> > in mainline. Reverting it fixes the problem.
> > 
> > gpio_set_config() seems to pack config, but it is already packed above.
> > That seems a bit suspicious.
> 
> I'll have a look. In the mean time, I'm fine with the patch being
> reverted.
> 

The problem is still seen in the latest kernel as of last night, and
I did not see any further activities. Should I send a revert request ?

Guenter
