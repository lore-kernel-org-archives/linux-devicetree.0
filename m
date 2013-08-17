Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:63776 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754415Ab3HQVO2 (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Sat, 17 Aug 2013 17:14:28 -0400
Received: by mail-pd0-f177.google.com with SMTP id y10so3502151pdj.36
        for <devicetree@vger.kernel.org>; Sat, 17 Aug 2013 14:14:28 -0700 (PDT)
Date: Sat, 17 Aug 2013 14:14:23 -0700
From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v4 1/4] mtd: nand: gpio: Add DT property to automatically
 determine bus width
Message-ID: <20130817211423.GF11210@norris.computersforpeace.net>
References: <1376637583-12485-1-git-send-email-shc_work@mail.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1376637583-12485-1-git-send-email-shc_work@mail.ru>
Sender: devicetree-owner@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Aug 16, 2013 at 11:19:42AM +0400, Alexander Shiyan wrote:
> This patch adds a property to automatically determine the NAND
> bus width. This property works if the bus width is not specified
> explicitly.
> 
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> ---
>  .../devicetree/bindings/mtd/gpio-control-nand.txt        |  2 ++
>  drivers/mtd/nand/gpio.c                                  | 16 ++++++++++++----
>  2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
> index 36ef07d..91070d0 100644
> --- a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
> @@ -19,6 +19,8 @@ Optional properties:
>    defaults to 1 byte.
>  - chip-delay : chip dependent delay for transferring data from array to
>    read registers (tR).  If not present then a default of 20us is used.
> +- gpio-control-nand,bank-width-auto : Device bus width is determined
> +  automatically if "bank-width" is omitted (Boolean).
>  - gpio-control-nand,io-sync-reg : A 64-bit physical address for a read
>    location used to guard against bus reordering with regards to accesses to
>    the GPIO's and the NAND flash data bus.  If present, then after changing
> diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
> index e826f89..8eea181 100644
> --- a/drivers/mtd/nand/gpio.c
> +++ b/drivers/mtd/nand/gpio.c
> @@ -116,6 +116,10 @@ static int gpio_nand_get_config_of(const struct device *dev,
>  			dev_err(dev, "invalid bank-width %u\n", val);
>  			return -EINVAL;
>  		}
> +	} else {

Combine with the 'if' and make it 'else if'.

> +		if (of_get_property(dev->of_node,
> +				    "gpio-control-nand,bank-width-auto", NULL))

of_property_read_bool()

> +			plat->options |= NAND_BUSWIDTH_AUTO;
>  	}
>  
>  	plat->gpio_rdy = of_get_gpio(dev->of_node, 0);
> @@ -223,6 +227,14 @@ static int gpio_nand_probe(struct platform_device *pdev)
>  	if (IS_ERR(chip->IO_ADDR_R))
>  		return PTR_ERR(chip->IO_ADDR_R);
>  
> +	ret = gpio_nand_get_config(&pdev->dev, &gpiomtd->plat);
> +	if (ret)
> +		return ret;
> +
> +	if (resource_size(res) < 2)
> +		gpiomtd->plat.options &= ~(NAND_BUSWIDTH_16 |
> +					   NAND_BUSWIDTH_AUTO);

I can't quite figure out what the significance of resource_size(res) < 2
is. It doesn't quite match my reading of the device-tree documentation.
Maybe I'm being dense. Is the resource provided as either an 8-bit IO
address (length=1) or 16-bit IO address (length=2)?

> +
>  	res = gpio_nand_get_io_sync(pdev);
>  	if (res) {
>  		gpiomtd->io_sync = devm_ioremap_resource(&pdev->dev, res);
> @@ -230,10 +242,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
>  			return PTR_ERR(gpiomtd->io_sync);
>  	}
>  
> -	ret = gpio_nand_get_config(&pdev->dev, &gpiomtd->plat);
> -	if (ret)
> -		return ret;
> -
>  	ret = devm_gpio_request(&pdev->dev, gpiomtd->plat.gpio_nce, "NAND NCE");
>  	if (ret)
>  		return ret;

I can fixup the first 2 without a resend. Depending on your response to
the third comment, I'll apply this.

Thanks,
Brian
