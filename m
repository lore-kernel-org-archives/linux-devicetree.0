From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V11 6/6] gpio: max77620: add gpio driver for MAX77620/MAX20024
Date: Sat, 30 Apr 2016 13:38:24 +0200
Message-ID: <CACRpkdZxVsGkC1U5Y9+M1fh6Z1T_ZBZC4eyH4ryzBijUq2hvCg@mail.gmail.com>
References: <1461837540-17071-1-git-send-email-ldewangan@nvidia.com>
	<1461837540-17071-7-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1461837540-17071-7-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>, Thierry Reding <treding@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 28, 2016 at 11:59 AM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

> MAXIM Semiconductor's PMIC, MAX77620/MAX20024 has 8 GPIO
> pins. It also supports interrupts from these pins.
>
> Add GPIO driver for these pins to control via GPIO APIs.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Gnah there is still a problem with this, I just saw it:

> +config GPIO_MAX77620
> +       bool "GPIO support for PMIC MAX77620 and MAX20024"

bool == not a module

> +MODULE_DEVICE_TABLE(platform, max77620_gpio_devtype);
(...)
> +module_platform_driver(max77620_gpio_driver);
(...)
> +MODULE_DESCRIPTION("GPIO interface for MAX77620 and MAX20024 PMIC");
> +MODULE_AUTHOR("Laxman Dewangan <ldewangan@nvidia.com>");
> +MODULE_AUTHOR("Chaitanya Bandi <bandik@nvidia.com>");
> +MODULE_ALIAS("platform:max77620-gpio");
> +MODULE_LICENSE("GPL v2");

git log --author=Gortmaker and you will see what you need to do.

Yours,
Linus Walleij
