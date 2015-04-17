From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 11/14] MIPS: ath79: Add OF support to the GPIO driver
Date: Fri, 17 Apr 2015 16:53:31 +0200
Message-ID: <4071167.An8CoV6UJC@wuerfel>
References: <1429280669-2986-1-git-send-email-albeu@free.fr> <1429280669-2986-12-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429280669-2986-12-git-send-email-albeu@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Alban Bedel <albeu@free.fr>
Cc: linux-mips@linux-mips.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Ralf Baechle <ralf@linux-mips.org>, Andrew Bresticker <abrestic@chromium.org>, Qais Yousef <qais.yousef@imgtec.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Friday 17 April 2015 16:24:26 Alban Bedel wrote:
> Replace the simple GPIO chip registration by a platform driver
> and make ath79_gpio_init() just register the device.
> 
> Signed-off-by: Alban Bedel <albeu@free.fr>
> ---
>  arch/mips/ath79/dev-common.c | 13 ++++++++
>  arch/mips/ath79/gpio.c       | 73 +++++++++++++++++++++++++++++++++++++++++---
>  2 files changed, 81 insertions(+), 5 deletions(-)

Could you move the driver to drivers/gpio/ now?

> +void __init ath79_gpio_init(void)
> +{
> +	struct resource res;
> +
> +	memset(&res, 0, sizeof(res));
> +
> +	res.flags = IORESOURCE_MEM;
> +	res.start = AR71XX_GPIO_BASE;
> +	res.end = res.start + AR71XX_GPIO_SIZE - 1;
> +
> +	platform_device_register_simple("ath79-gpio", -1, &res, 1);
> +}

Your code looks correct, but could be shortened to 

	struct resource mem = DEFINE_RES_MEM(AR71XX_GPIO_BASE, AR71XX_GPIO_SIZE);

>  
> -void __init ath79_gpio_init(void)
> +static const struct of_device_id ath79_gpio_of_match[] = {
> +	{
> +		.compatible = "qca,ar7100-gpio",
> +		.data = (void *)AR71XX_GPIO_COUNT,
> +	},
> +	{
> +		.compatible = "qca,ar7240-gpio",
> +		.data = (void *)AR7240_GPIO_COUNT,
> +	},
> +	{
> +		.compatible = "qca,ar7241-gpio",
> +		.data = (void *)AR7241_GPIO_COUNT,
> +	},
> +	{
> +		.compatible = "qca,ar9130-gpio",
> +		.data = (void *)AR913X_GPIO_COUNT,
> +	},
> +	{
> +		.compatible = "qca,ar9330-gpio",
> +		.data = (void *)AR933X_GPIO_COUNT,
> +	},
> +	{
> +		.compatible = "qca,ar9340-gpio",
> +		.data = (void *)AR934X_GPIO_COUNT,
> +	},
> +	{
> +		.compatible = "qca,qca9550-gpio",
> +		.data = (void *)QCA955X_GPIO_COUNT,
> +	},
> +	{},
> +};

How about putting the number into an 'ngpios' property like some other
bindings do?

	Arnd
