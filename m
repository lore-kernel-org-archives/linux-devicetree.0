Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:44193 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933104Ab3GWQUR (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 23 Jul 2013 12:20:17 -0400
Message-ID: <51EEAD3E.1040606@nvidia.com>
Date: Tue, 23 Jul 2013 09:20:14 -0700
From: Stephen Warren <swarren@nvidia.com>
MIME-Version: 1.0
Subject: Re: [PATCH V4] gpio: palmas: add dt support
References: <1374564964-1281-1-git-send-email-ldewangan@nvidia.com>
In-Reply-To: <1374564964-1281-1-git-send-email-ldewangan@nvidia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linus.walleij@linaro.org, grant.likely@linaro.org, rob.herring@calxeda.com, rob@landley.net, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, kishon@ti.com, j-keerthy@ti.com, gg@slimlogic.co.uk
List-ID: <devicetree@vger.kernel.org>

On 07/23/2013 12:36 AM, Laxman Dewangan wrote:
> Add of_device_id table for Palma GPIO to be enable the
> driver from DT file.
> 
> The driver can be registered from DT file as:
> 	palmas: tps65913@58 {
> 		:::::::::::
> 		palmas_gpio: palmas_gpio {
> 			compatible = "ti,palmas-gpio";
> 			gpio-controller;
> 			#gpio-cells = <2>;
> 		};
> 	};

The binding at least,
Acked-by: Stephen Warren <swarren@nvidia.com>

> diff --git a/drivers/gpio/gpio-palmas.c b/drivers/gpio/gpio-palmas.c

>  #ifdef CONFIG_OF_GPIO
> -	palmas_gpio->gpio_chip.of_node = palmas->dev->of_node;
> +	palmas_gpio->gpio_chip.of_node = pdev->dev.of_node;
>  #endif

That still scares me slightly, in case someone is already using this
driver and this changes how it works, and it breaks something, but I
don't think anyone is, so this should be OK too.
