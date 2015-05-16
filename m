From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH] gpio: add ETRAXFS GPIO driver
Date: Sat, 16 May 2015 15:59:27 +0200
Message-ID: <1431784767.2341.28.camel@x220>
References: <1431728843-21583-1-git-send-email-rabin@rab.in>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431728843-21583-1-git-send-email-rabin@rab.in>
Sender: linux-kernel-owner@vger.kernel.org
To: Rabin Vincent <rabin@rab.in>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, 2015-05-16 at 00:27 +0200, Rabin Vincent wrote:
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
 
> +config GPIO_ETRAXFS
> +	bool "Axis ETRAX FS General I/O"
> +	depends on CRIS || COMPILE_TEST
> +	depends on OF
> +	select GPIO_GENERIC
> +	help
> +	  Say yes here to support the GPIO controller on Axis ETRAX FS SoCs.

> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile

> +obj-$(CONFIG_GPIO_ETRAXFS)	+= gpio-etraxfs.o

GPIO_ETRAXFS is a bool symbol, so gpio-etraxfs.o can only be built-in,
right?

> --- /dev/null
> +++ b/drivers/gpio/gpio-etraxfs.c

> +MODULE_DEVICE_TABLE(of, etraxfs_gpio_of_table);

> +module_platform_driver(etraxfs_gpio_driver);

(A patch was submitted that would allow built-in only code to use
builtin_platform_driver(), see https://lkml.org/lkml/2015/5/10/125 .) 

> +MODULE_DESCRIPTION("ETRAX FS GPIO driver");
> +MODULE_LICENSE("GPL");

But the code this patch adds contains a bit of module specific
boilerplate. Was it perhaps your intention to make GPIO_ETRAXFS
tristate?


Paul Bolle
