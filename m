From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 27/32] gpio: Add support for the FXL6408 GPIO expander.
Date: Mon, 6 Jun 2016 17:02:29 -0700
Message-ID: <57560F15.6020006@gmail.com>
References: <1464817421-8519-1-git-send-email-kraxel@redhat.com>
 <1464817421-8519-28-git-send-email-kraxel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464817421-8519-28-git-send-email-kraxel@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gerd Hoffmann <kraxel@redhat.com>, linux-rpi-kernel@lists.infradead.org
Cc: Eric Anholt <eric@anholt.net>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "open list:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." <bcm-kernel-feedback-list@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 06/01/2016 02:43 PM, Gerd Hoffmann wrote:
> From: Eric Anholt <eric@anholt.net>
> 
> This commit needs to be split up and cleaned up.  Also we should add
> interrupt support before pushing upstream.
> 
> Signed-off-by: Eric Anholt <eric@anholt.net>
> 
> Conflicts:
> 	arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts
> ---
>  arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts |  16 ++
>  drivers/gpio/Kconfig                             |   6 +
>  drivers/gpio/Makefile                            |   1 +
>  drivers/gpio/gpio-fxl6408.c                      | 244 +++++++++++++++++++++++
>  4 files changed, 267 insertions(+)
>  create mode 100644 drivers/gpio/gpio-fxl6408.c
> 
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts b/arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts
> index 099dd48d..4bc191e 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts
> +++ b/arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts
> @@ -39,3 +39,19 @@
>  &hdmi {
>  	hpd-gpios = <&gpio 46 GPIO_ACTIVE_LOW>;
>  };
> +
> +/* Connect the GPIO expander to I2C1 */
> +&i2c0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c0_gpio44>;
> +
> +	gpio_expander: gpio@43 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		reg = <0x43>;
> +		compatible = "fcs,fxl6408";
> +	};
> +};
> +
> +bt {
> +};
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 48da857..34056cd 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -665,6 +665,12 @@ config GPIO_ADNP
>  	  enough to represent all pins, but the driver will assume a
>  	  register layout for 64 pins (8 registers).
>  
> +config GPIO_FXL6408
> +	tristate "FXL6408 I2C GPIO expander"
> +	help
> +	  This option enables support for 8 GPIOs found
> +	  on the Fairchild Semiconductor FXL6408.
> +
>  config GPIO_MAX7300
>  	tristate "Maxim MAX7300 GPIO expander"
>  	select GPIO_MAX730X
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 991598e..59a25ef 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -43,6 +43,7 @@ obj-$(CONFIG_GPIO_EM)		+= gpio-em.o
>  obj-$(CONFIG_GPIO_EP93XX)	+= gpio-ep93xx.o
>  obj-$(CONFIG_GPIO_ETRAXFS)	+= gpio-etraxfs.o
>  obj-$(CONFIG_GPIO_F7188X)	+= gpio-f7188x.o
> +obj-$(CONFIG_GPIO_FXL6408)	+= gpio-fxl6408.o
>  obj-$(CONFIG_GPIO_GE_FPGA)	+= gpio-ge.o
>  obj-$(CONFIG_GPIO_GRGPIO)	+= gpio-grgpio.o
>  obj-$(CONFIG_GPIO_ICH)		+= gpio-ich.o
> diff --git a/drivers/gpio/gpio-fxl6408.c b/drivers/gpio/gpio-fxl6408.c
> new file mode 100644
> index 0000000..02b2816
> --- /dev/null
> +++ b/drivers/gpio/gpio-fxl6408.c
> @@ -0,0 +1,244 @@
> +/*
> + *  Copyright (C) 2016 Broadcom Limited.

BTW, since you need to resubmit that, the new Copyright should be
without the "Limited", just Broadcom, which covers all entities.
-- 
Florian
