Return-Path: <SRS0=qbJX=PT=bootlin.com=thomas.petazzoni@kernel.org>
Date: Fri, 11 Jan 2019 13:58:03 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 3/4] gpio: add core support for pull-up/pull-down
 configuration
Message-ID: <20190111135803.5644f06e@windsurf>
In-Reply-To: <CACRpkdbypbX0-NsSG4DmFCv6hC2gYEQZSUyoKdJbgwiMDZ4yvg@mail.gmail.com>
References: <20190103164102.31437-1-thomas.petazzoni@bootlin.com>
	<20190103164102.31437-4-thomas.petazzoni@bootlin.com>
	<CACRpkdbypbX0-NsSG4DmFCv6hC2gYEQZSUyoKdJbgwiMDZ4yvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS  <devicetree@vger.kernel.org>, Marek Vasut" <marek.vasut@gmail.com>
List-ID: <devicetree@vger.kernel.org>

Hello Linus,

On Fri, 11 Jan 2019 11:05:03 +0100, Linus Walleij wrote:

> > The flag is simply propagated all the way to the core GPIO subsystem,
> > where it is used to call the gpio_chip ->set_config callback with the
> > appropriate existing PIN_CONFIG_BIAS_* values.
> >
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>  
> 
> I'm overall happy with this approach.

Thanks for this review and feedback, very useful.

> 
> > +/* Bit 4 express pull up */
> > +#define GPIO_PULL_UP 16
> > +
> > +/* Bit 5 express pull down */
> > +#define GPIO_PULL_DOWN 32  
> 
> Please use
> #define GPIO_PULL_UP BIT(5)
> #define GPIO_PULL_DOWN BIT(6)

Here, I did exactly like below: keep the existing approach used in the
file. Today it has:

/* Bit 0 express polarity */
#define GPIO_ACTIVE_HIGH 0
#define GPIO_ACTIVE_LOW 1

/* Bit 1 express single-endedness */
#define GPIO_PUSH_PULL 0
#define GPIO_SINGLE_ENDED 2

/* Bit 2 express Open drain or open source */
#define GPIO_LINE_OPEN_SOURCE 0
#define GPIO_LINE_OPEN_DRAIN 4

[...]

/* Bit 3 express GPIO suspend/resume and reset persistence */
#define GPIO_PERSISTENT 0
#define GPIO_TRANSITORY 8

So I kept the same logic and used 16 and 32 to define the
GPIO_PULL_UP/GPIO_PULL_DOWN values instead of BIT(x). BIT(x) would have
been more logical.

However, we are in the dt-bindings includes here, and apparently, there
is no definition for the BIT() macro in those headers.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
