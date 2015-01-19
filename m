From: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [PATCH 7/8] gpio/mpc8xxx: Convert to platform device interface.
Date: Mon, 19 Jan 2015 23:48:16 +0100
Message-ID: <87k30i9ykv.fsf@dell.be.48ers.dk>
References: <1421581173-28416-1-git-send-email-ricardo.ribalda@gmail.com>
	<1421581173-28416-8-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1421581173-28416-8-git-send-email-ricardo.ribalda@gmail.com>
	(Ricardo Ribalda Delgado's message of "Sun, 18 Jan 2015 12:39:32
	+0100")
Sender: linux-gpio-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Peter Korsgaard <jacmet@sunsite.dk>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

>>>>> "Ricardo" == Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> writes:

 > This way we do not need to transverse the device tree manually.
 > Cc: Linus Walleij <linus.walleij@linaro.org>
 > Cc: Alexandre Courbot <gnurou@gmail.com>
 > Cc: Grant Likely <grant.likely@linaro.org>
 > Cc: Rob Herring <robh+dt@kernel.org>
 > Cc: Peter Korsgaard <jacmet@sunsite.dk>
 > Cc: devicetree@vger.kernel.org
 > Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
 > ---
 >  drivers/gpio/gpio-mpc8xxx.c | 48 +++++++++++++++++++++------------------------
 >  1 file changed, 22 insertions(+), 26 deletions(-)

 > diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
 > index d1ff879..57eb794 100644
 > --- a/drivers/gpio/gpio-mpc8xxx.c
 > +++ b/drivers/gpio/gpio-mpc8xxx.c
 > @@ -15,6 +15,7 @@
 >  #include <linux/of.h>
 >  #include <linux/of_gpio.h>
 >  #include <linux/of_irq.h>
 > +#include <linux/of_platform.h>
 >  #include <linux/gpio.h>
 >  #include <linux/slab.h>
 >  #include <linux/irq.h>
 > @@ -342,8 +343,9 @@ static struct of_device_id mpc8xxx_gpio_ids[] __initdata = {
 >  	{}
 >  };
 
 > -static void __init mpc8xxx_add_controller(struct device_node *np)
 > +static int mpc8xxx_probe(struct platform_device *pdev)
 >  {
 > +	struct device_node *np = pdev->dev.of_node;
 >  	struct mpc8xxx_gpio_chip *mpc8xxx_gc;
 >  	struct of_mm_gpio_chip *mm_gc;
 >  	struct gpio_chip *gc;
 > @@ -351,11 +353,9 @@ static void __init mpc8xxx_add_controller(struct device_node *np)
 >  	unsigned hwirq;
 >  	int ret;
 
 > -	mpc8xxx_gc = kzalloc(sizeof(*mpc8xxx_gc), GFP_KERNEL);
 > -	if (!mpc8xxx_gc) {
 > -		ret = -ENOMEM;
 > -		goto err;
 > -	}
 > +	mpc8xxx_gc = devm_kzalloc(&pdev->dev, sizeof(*mpc8xxx_gc), GFP_KERNEL);
 > +	if (!mpc8xxx_gc)
 > +		return -ENOMEM;
 
 >  	spin_lock_init(&mpc8xxx_gc->lock);
 
 > @@ -375,16 +375,16 @@ static void __init mpc8xxx_add_controller(struct device_node *np)
 
 >  	ret = of_mm_gpiochip_add(np, mm_gc);
 >  	if (ret)
 > -		goto err;
 > +		return ret;
 
 >  	hwirq = irq_of_parse_and_map(np, 0);
 >  	if (hwirq == NO_IRQ)
 > -		goto skip_irq;
 > +		return 0;

Actually, looking closer - Isn't this leaking mm_gc? It was as well
before, but it would be good to get it fixed.


 >       mpc8xxx_gc-> irq = irq_domain_add_linear(np, MPC8XXX_GPIO_PINS,
 >  					&mpc8xxx_gpio_irq_ops, mpc8xxx_gc);
 >  	if (!mpc8xxx_gc->irq)
 > -		goto skip_irq;
 > +		return 0;

And here as well?


-- 
Bye, Peter Korsgaard
