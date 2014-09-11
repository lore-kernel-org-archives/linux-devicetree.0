From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH 4/4 v3] GPIO: gpio-dwapb: Suspend & Resume PM enabling
Date: Thu, 11 Sep 2014 11:40:13 -0500
Message-ID: <alpine.DEB.2.02.1409111138080.4869@atx-linux-37>
References: <1410286081-16653-1-git-send-email-alvin.chen@intel.com> <1410286081-16653-5-git-send-email-alvin.chen@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1410286081-16653-5-git-send-email-alvin.chen@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Weike Chen <alvin.chen@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Boon Leong Ong <boon.leong.ong@intel.com>, Hock Leong Kweh <hock.leong.kweh@intel.com>, Darren Hart <dvhart@linux.intel.com>, Sebastian Andrzej Siewior <sebastian@breakpoint.cc>, Mika Westerberg <mika.westerberg@intel.com>, Andriy Shevchenko <andriy.shevchenko@intel.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On Tue, 9 Sep 2014, Weike Chen wrote:

>  
>  struct dwapb_gpio;
> +struct dwapb_context;
>  
>  struct dwapb_gpio_port {
>  	struct bgpio_chip	bgc;
>  	bool			is_registered;
>  	struct dwapb_gpio	*gpio;
> +	struct dwapb_context	*ctx;

Alvin,

Will this build if CONFIG_PM_SLEEP is not defined?

Alan

> +	unsigned int		idx;
>  };
>  

>  struct dwapb_gpio {
> @@ -377,6 +380,7 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
>  
>  	port = &gpio->ports[offs];
>  	port->gpio = gpio;
> +	port->idx = pp->idx;
>  
>  	dat = gpio->regs + GPIO_EXT_PORTA + (pp->idx * GPIO_EXT_PORT_SIZE);
>  	set = gpio->regs + GPIO_SWPORTA_DR + (pp->idx * GPIO_SWPORT_DR_SIZE);
> @@ -584,10 +588,115 @@ static const struct of_device_id dwapb_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, dwapb_of_match);
>  
> +#ifdef CONFIG_PM_SLEEP
> +/* Store GPIO context across system-wide suspend/resume transitions */
> +struct dwapb_context {
> +	u32 data;
> +	u32 dir;
> +	u32 ext;
> +	u32 int_en;
> +	u32 int_mask;
> +	u32 int_type;
> +	u32 int_pol;
> +	u32 int_deb;
> +};
> +
