Return-Path: <SRS0=9zIi=6I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B058C54FD0
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Apr 2020 12:25:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 264D220776
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Apr 2020 12:25:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727773AbgDXMZW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 24 Apr 2020 08:25:22 -0400
Received: from gloria.sntech.de ([185.11.138.130]:47502 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728695AbgDXMZU (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 24 Apr 2020 08:25:20 -0400
Received: from p508fd049.dip0.t-ipconnect.de ([80.143.208.73] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1jRxO6-0003cR-Hk; Fri, 24 Apr 2020 14:24:58 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Tobias Schramm <t.schramm@manjaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Yueyao Zhu <yueyao@google.com>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] usb: fusb302: Convert to use GPIO descriptors
Date:   Fri, 24 Apr 2020 14:24:57 +0200
Message-ID: <1936344.48hpDf0ZCg@phil>
In-Reply-To: <22317f07-ad49-ada2-b323-ad16695ae3d2@arm.com>
References: <20200415192448.305257-1-linus.walleij@linaro.org> <22317f07-ad49-ada2-b323-ad16695ae3d2@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Am Donnerstag, 23. April 2020, 14:02:42 CEST schrieb Robin Murphy:
> On 2020-04-15 8:24 pm, Linus Walleij wrote:
> > This converts the FUSB302 driver to use GPIO descriptors.
> > The conversion to descriptors per se is pretty straight-forward.
> > 
> > In the process I discovered that:
> > 
> > 1. The driver uses a completely undocumented device tree binding
> >     for the interrupt GPIO line, "fcs,int_n". Ooops.
> > 
> > 2. The undocumented binding, presumably since it has not seen
> >     review, is just "fcs,int_n", lacking the compulsory "-gpios"
> >     suffix and also something that is not a good name because
> >     the "_n" implies the line is inverted which is something we
> >     handle with flags in the device tree. Ooops.
> > 
> > 3. Possibly the driver should not be requesting the line as a
> >     GPIO and request the corresponding interrupt line by open
> >     coding, the GPIO chip is very likely doubleing as an IRQ
> >     controller and can probably provide an interrupt directly
> >     for this line with interrupts-extended = <&gpio0 ...>;
> > 
> > 4. Possibly the IRQ should just be tagged on the I2C client node
> >     in the device tree like apparently ACPI does, as it overrides
> >     this IRQ with client->irq if that exists.
> > 
> > But now it is too late to do much about that and as I can see
> > this is used like this in the Pinebook which is a shipping product
> > so let'a just contain the mess and move on.
> > 
> > The property currently appears in:
> > arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> > 
> > Create a quirk in the GPIO OF library to allow this property
> > specifically to be specified without the "-gpios" suffix, we have
> > other such bindings already.
> 
> FWIW, the datasheet makes it clear than INT_N is just a regular IRQ 
> output, so it really should be specified as an interrupt targeting the 
> GPIO controller just like any other I2C chip, and the FUSB302 binding 
> itself supports.
> 
> The Pinebook Pro devicetree has only just landed this cycle, so there 
> should still be plenty of time to fix it and not have to worry about an 
> ugly undocumented quirk. The downstream vendor kernels use a totally 
> different FUSB302 driver from the upstream one (based on extcon rather 
> than the typec framework) so I don't think downstream DTBs are a concern.

I guess it's just about removing the "fcs,int_n" property, right?
Does someone want to send a patch removing that?

I'm hopeful the whole extcon mess will go away ... cros-ec-power-delivery
now seems to have moved to the typec framework, so at some point
the rk3399 typec-phy-driver could be converted as well, enabling us to
also have real type-c on non-chromebook rk3399 boards.


Heiko

> > Cc: Tobias Schramm <t.schramm@manjaro.org>
> > Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Cc: Yueyao Zhu <yueyao@google.com>
> > Cc: Guenter Roeck <linux@roeck-us.net>
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> > This is now covered as far as GPIO is concerned but you might
> > want to look into creating proper bindings for this or
> > correcting the devicetree.
> > ---
> >   drivers/gpio/gpiolib-of.c        | 21 +++++++++++++++++++++
> >   drivers/usb/typec/tcpm/fusb302.c | 32 +++++++++-----------------------
> >   2 files changed, 30 insertions(+), 23 deletions(-)
> > 
> > diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> > index ccc449df3792..20c2c428168e 100644
> > --- a/drivers/gpio/gpiolib-of.c
> > +++ b/drivers/gpio/gpiolib-of.c
> > @@ -460,6 +460,24 @@ static struct gpio_desc *of_find_arizona_gpio(struct device *dev,
> >   	return of_get_named_gpiod_flags(dev->of_node, con_id, 0, of_flags);
> >   }
> >   
> > +static struct gpio_desc *of_find_usb_gpio(struct device *dev,
> > +					  const char *con_id,
> > +					  enum of_gpio_flags *of_flags)
> > +{
> > +	/*
> > +	 * Currently this USB quirk is only for the Fairchild FUSB302 host which is using
> > +	 * an undocumented DT GPIO line named "fcs,int_n" without the compulsory "-gpios"
> > +	 * suffix.
> > +	 */
> > +	if (!IS_ENABLED(CONFIG_TYPEC_FUSB302))
> > +		return ERR_PTR(-ENOENT);
> > +
> > +	if (!con_id || strcmp(con_id, "fcs,int_n"))
> > +		return ERR_PTR(-ENOENT);
> > +
> > +	return of_get_named_gpiod_flags(dev->of_node, con_id, 0, of_flags);
> > +}
> > +
> >   struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
> >   			       unsigned int idx, unsigned long *flags)
> >   {
> > @@ -504,6 +522,9 @@ struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
> >   	if (PTR_ERR(desc) == -ENOENT)
> >   		desc = of_find_arizona_gpio(dev, con_id, &of_flags);
> >   
> > +	if (PTR_ERR(desc) == -ENOENT)
> > +		desc = of_find_usb_gpio(dev, con_id, &of_flags);
> > +
> >   	if (IS_ERR(desc))
> >   		return desc;
> >   
> > diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> > index b498960ff72b..b28facece43c 100644
> > --- a/drivers/usb/typec/tcpm/fusb302.c
> > +++ b/drivers/usb/typec/tcpm/fusb302.c
> > @@ -9,14 +9,13 @@
> >   #include <linux/delay.h>
> >   #include <linux/errno.h>
> >   #include <linux/extcon.h>
> > -#include <linux/gpio.h>
> > +#include <linux/gpio/consumer.h>
> >   #include <linux/i2c.h>
> >   #include <linux/interrupt.h>
> >   #include <linux/kernel.h>
> >   #include <linux/module.h>
> >   #include <linux/mutex.h>
> >   #include <linux/of_device.h>
> > -#include <linux/of_gpio.h>
> >   #include <linux/pinctrl/consumer.h>
> >   #include <linux/proc_fs.h>
> >   #include <linux/regulator/consumer.h>
> > @@ -83,7 +82,7 @@ struct fusb302_chip {
> >   	struct work_struct irq_work;
> >   	bool irq_suspended;
> >   	bool irq_while_suspended;
> > -	int gpio_int_n;
> > +	struct gpio_desc *gpio_int_n;
> >   	int gpio_int_n_irq;
> >   	struct extcon_dev *extcon;
> >   
> > @@ -1618,30 +1617,17 @@ static void fusb302_irq_work(struct work_struct *work)
> >   
> >   static int init_gpio(struct fusb302_chip *chip)
> >   {
> > -	struct device_node *node;
> > +	struct device *dev = chip->dev;
> >   	int ret = 0;
> >   
> > -	node = chip->dev->of_node;
> > -	chip->gpio_int_n = of_get_named_gpio(node, "fcs,int_n", 0);
> > -	if (!gpio_is_valid(chip->gpio_int_n)) {
> > -		ret = chip->gpio_int_n;
> > -		dev_err(chip->dev, "cannot get named GPIO Int_N, ret=%d", ret);
> > -		return ret;
> > -	}
> > -	ret = devm_gpio_request(chip->dev, chip->gpio_int_n, "fcs,int_n");
> > -	if (ret < 0) {
> > -		dev_err(chip->dev, "cannot request GPIO Int_N, ret=%d", ret);
> > -		return ret;
> > -	}
> > -	ret = gpio_direction_input(chip->gpio_int_n);
> > -	if (ret < 0) {
> > -		dev_err(chip->dev,
> > -			"cannot set GPIO Int_N to input, ret=%d", ret);
> > -		return ret;
> > +	chip->gpio_int_n = devm_gpiod_get(dev, "fcs,int_n", GPIOD_IN);
> > +	if (IS_ERR(chip->gpio_int_n)) {
> > +		dev_err(dev, "failed to request gpio_int_n\n");
> > +		return PTR_ERR(chip->gpio_int_n);
> >   	}
> > -	ret = gpio_to_irq(chip->gpio_int_n);
> > +	ret = gpiod_to_irq(chip->gpio_int_n);
> >   	if (ret < 0) {
> > -		dev_err(chip->dev,
> > +		dev_err(dev,
> >   			"cannot request IRQ for GPIO Int_N, ret=%d", ret);
> >   		return ret;
> >   	}
> > 
> 




