Return-Path: <SRS0=uFL0=6E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E3AC3815B
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 06:38:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9FDF12073A
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 06:38:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725896AbgDTGiL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Apr 2020 02:38:11 -0400
Received: from mga03.intel.com ([134.134.136.65]:32467 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725815AbgDTGiK (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 20 Apr 2020 02:38:10 -0400
IronPort-SDR: AP6NocAneAfJtVIXO/V3SHiA0xizX7IcheYA2nGuSh1zv5Zh/0D4Dv027BYlmBA55qTnZC511T
 o4pxFDCogqvA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2020 23:38:10 -0700
IronPort-SDR: S6x9w74MCfZBElGJ91IF4yeKTW9ZLv0dFAMJYzzr/ATQNLPifhOxPwJ3TMKqy9nvjtYO8DeqH6
 ywuGZEsAm92w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,406,1580803200"; 
   d="scan'208";a="364912315"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 19 Apr 2020 23:38:06 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 20 Apr 2020 09:38:06 +0300
Date:   Mon, 20 Apr 2020 09:38:06 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Tobias Schramm <t.schramm@manjaro.org>,
        Yueyao Zhu <yueyao@google.com>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org
Subject: Re: [PATCH] usb: fusb302: Convert to use GPIO descriptors
Message-ID: <20200420063806.GB3768833@kuha.fi.intel.com>
References: <20200415192448.305257-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415192448.305257-1-linus.walleij@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Apr 15, 2020 at 09:24:48PM +0200, Linus Walleij wrote:
> This converts the FUSB302 driver to use GPIO descriptors.
> The conversion to descriptors per se is pretty straight-forward.
> 
> In the process I discovered that:
> 
> 1. The driver uses a completely undocumented device tree binding
>    for the interrupt GPIO line, "fcs,int_n". Ooops.
> 
> 2. The undocumented binding, presumably since it has not seen
>    review, is just "fcs,int_n", lacking the compulsory "-gpios"
>    suffix and also something that is not a good name because
>    the "_n" implies the line is inverted which is something we
>    handle with flags in the device tree. Ooops.
> 
> 3. Possibly the driver should not be requesting the line as a
>    GPIO and request the corresponding interrupt line by open
>    coding, the GPIO chip is very likely doubleing as an IRQ
>    controller and can probably provide an interrupt directly
>    for this line with interrupts-extended = <&gpio0 ...>;
> 
> 4. Possibly the IRQ should just be tagged on the I2C client node
>    in the device tree like apparently ACPI does, as it overrides
>    this IRQ with client->irq if that exists.
> 
> But now it is too late to do much about that and as I can see
> this is used like this in the Pinebook which is a shipping product
> so let'a just contain the mess and move on.
> 
> The property currently appears in:
> arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> 
> Create a quirk in the GPIO OF library to allow this property
> specifically to be specified without the "-gpios" suffix, we have
> other such bindings already.
> 
> Cc: Tobias Schramm <t.schramm@manjaro.org>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Yueyao Zhu <yueyao@google.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

FWIW:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> This is now covered as far as GPIO is concerned but you might
> want to look into creating proper bindings for this or
> correcting the devicetree.
> ---
>  drivers/gpio/gpiolib-of.c        | 21 +++++++++++++++++++++
>  drivers/usb/typec/tcpm/fusb302.c | 32 +++++++++-----------------------
>  2 files changed, 30 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index ccc449df3792..20c2c428168e 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -460,6 +460,24 @@ static struct gpio_desc *of_find_arizona_gpio(struct device *dev,
>  	return of_get_named_gpiod_flags(dev->of_node, con_id, 0, of_flags);
>  }
>  
> +static struct gpio_desc *of_find_usb_gpio(struct device *dev,
> +					  const char *con_id,
> +					  enum of_gpio_flags *of_flags)
> +{
> +	/*
> +	 * Currently this USB quirk is only for the Fairchild FUSB302 host which is using
> +	 * an undocumented DT GPIO line named "fcs,int_n" without the compulsory "-gpios"
> +	 * suffix.
> +	 */
> +	if (!IS_ENABLED(CONFIG_TYPEC_FUSB302))
> +		return ERR_PTR(-ENOENT);
> +
> +	if (!con_id || strcmp(con_id, "fcs,int_n"))
> +		return ERR_PTR(-ENOENT);
> +
> +	return of_get_named_gpiod_flags(dev->of_node, con_id, 0, of_flags);
> +}
> +
>  struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
>  			       unsigned int idx, unsigned long *flags)
>  {
> @@ -504,6 +522,9 @@ struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
>  	if (PTR_ERR(desc) == -ENOENT)
>  		desc = of_find_arizona_gpio(dev, con_id, &of_flags);
>  
> +	if (PTR_ERR(desc) == -ENOENT)
> +		desc = of_find_usb_gpio(dev, con_id, &of_flags);
> +
>  	if (IS_ERR(desc))
>  		return desc;
>  
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> index b498960ff72b..b28facece43c 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -9,14 +9,13 @@
>  #include <linux/delay.h>
>  #include <linux/errno.h>
>  #include <linux/extcon.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/of_device.h>
> -#include <linux/of_gpio.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/proc_fs.h>
>  #include <linux/regulator/consumer.h>
> @@ -83,7 +82,7 @@ struct fusb302_chip {
>  	struct work_struct irq_work;
>  	bool irq_suspended;
>  	bool irq_while_suspended;
> -	int gpio_int_n;
> +	struct gpio_desc *gpio_int_n;
>  	int gpio_int_n_irq;
>  	struct extcon_dev *extcon;
>  
> @@ -1618,30 +1617,17 @@ static void fusb302_irq_work(struct work_struct *work)
>  
>  static int init_gpio(struct fusb302_chip *chip)
>  {
> -	struct device_node *node;
> +	struct device *dev = chip->dev;
>  	int ret = 0;
>  
> -	node = chip->dev->of_node;
> -	chip->gpio_int_n = of_get_named_gpio(node, "fcs,int_n", 0);
> -	if (!gpio_is_valid(chip->gpio_int_n)) {
> -		ret = chip->gpio_int_n;
> -		dev_err(chip->dev, "cannot get named GPIO Int_N, ret=%d", ret);
> -		return ret;
> -	}
> -	ret = devm_gpio_request(chip->dev, chip->gpio_int_n, "fcs,int_n");
> -	if (ret < 0) {
> -		dev_err(chip->dev, "cannot request GPIO Int_N, ret=%d", ret);
> -		return ret;
> -	}
> -	ret = gpio_direction_input(chip->gpio_int_n);
> -	if (ret < 0) {
> -		dev_err(chip->dev,
> -			"cannot set GPIO Int_N to input, ret=%d", ret);
> -		return ret;
> +	chip->gpio_int_n = devm_gpiod_get(dev, "fcs,int_n", GPIOD_IN);
> +	if (IS_ERR(chip->gpio_int_n)) {
> +		dev_err(dev, "failed to request gpio_int_n\n");
> +		return PTR_ERR(chip->gpio_int_n);
>  	}
> -	ret = gpio_to_irq(chip->gpio_int_n);
> +	ret = gpiod_to_irq(chip->gpio_int_n);
>  	if (ret < 0) {
> -		dev_err(chip->dev,
> +		dev_err(dev,
>  			"cannot request IRQ for GPIO Int_N, ret=%d", ret);
>  		return ret;
>  	}
> -- 
> 2.25.2

thanks,

-- 
heikki
