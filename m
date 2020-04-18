Return-Path: <SRS0=a4mE=6C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39EC1C352BE
	for <linux-devicetree@archiver.kernel.org>; Sat, 18 Apr 2020 21:08:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E9212223D
	for <linux-devicetree@archiver.kernel.org>; Sat, 18 Apr 2020 21:08:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AYjGRpCo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728206AbgDRVI1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 18 Apr 2020 17:08:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbgDRVI1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 18 Apr 2020 17:08:27 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 336ACC061A0C;
        Sat, 18 Apr 2020 14:08:27 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id ay1so2426025plb.0;
        Sat, 18 Apr 2020 14:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PQ+VkFm1IL2gzeFXBK+nXbQRBkL26Rg4FqNHDJ9y8EQ=;
        b=AYjGRpComkMu9tmzqiNJx9vkjUQvgwfMriME7vyHciHhfmHM3qzNM6vHy1pEkbIXE+
         HRVRTfHcE2Bhyagjkgroedt6tcXsBCT62Rdd63bis9wzGFHUSKxh5/+oB1pt+RuBRzVF
         7qdcy86JYX3rfeoAw1b8hXUeq7nYw0F0N0arPPgjinm8jGhE4y7HYM0qHx5DvivczTaa
         bQPQoetLyYiVKPaHY7dHcBxGyCe/yJoTkTt1HtYFfu2kRFTwSG1nbZruFWF9iws2N7Di
         LinDuQyAAk7cc95wF9HEWPlXuNvz4/enyC7AN0wYR+s9n6lE6Uw0tnp4yx8YMKo4JCX0
         ZL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=PQ+VkFm1IL2gzeFXBK+nXbQRBkL26Rg4FqNHDJ9y8EQ=;
        b=ey3vtmhinr1WtzomV2RrdJm08nTmoPjrFSeREhMadOcIcJ5tPcrlINbt4w0opnPgtx
         /3XdMwGfLos1nFAEDwZgLIRn8U5gV0dwFga71d/ZSiUK8Aul3XqVz05P8sRU7ozHbpqC
         aSxhCYkgjaw/7vCnjzTfyz4iHgIFizZHEEvx/i+DE0h0vL1z33weLmPZf3AWiz3+DPI4
         n9M32EjZak2QhKG/d4VXQpPvRDS22VRpr0U8gfDXyCs7gySQCXumOcFiXWeRd68nMs6C
         D07l7ZMTcqeHne5Hkip8m4Ui8TUc3SAaQPqdWcHfOo5VvSd1uHskZ4grMT44TCiysqBt
         fM9Q==
X-Gm-Message-State: AGi0PuawGrMgTXPeZGzZ4TlUtO8emFBKphuJodyfok3f2DbVIqCY1LDr
        oaoweFvRwIELsulSXl+ZcoM=
X-Google-Smtp-Source: APiQypIyy0mikmBUcY8Ngq2DMMEAWudajPedCmpZBm3jPRbJNq8QifzfQfTTZyI6773clVmWuXtpyw==
X-Received: by 2002:a17:902:5997:: with SMTP id p23mr5617071pli.89.1587244106720;
        Sat, 18 Apr 2020 14:08:26 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c84sm14751055pfb.153.2020.04.18.14.08.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 18 Apr 2020 14:08:26 -0700 (PDT)
Date:   Sat, 18 Apr 2020 14:08:25 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Tobias Schramm <t.schramm@manjaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Yueyao Zhu <yueyao@google.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH] usb: fusb302: Convert to use GPIO descriptors
Message-ID: <20200418210825.GA20485@roeck-us.net>
References: <20200415192448.305257-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415192448.305257-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

No idea what to do about the above, but the change itself looks ok to me.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Guenter

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
> 
