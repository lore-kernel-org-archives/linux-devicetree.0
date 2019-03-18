From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 2/2] pinctrl: meson: add support of drive-strength
Date: Mon, 18 Mar 2019 14:12:28 +0100
Message-ID: <544af6b6-acf4-9904-3b32-9a99567e6ac9@baylibre.com>
References: <20190314163725.7918-1-jbrunet@baylibre.com>
 <20190314163725.7918-3-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190314163725.7918-3-jbrunet@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Guillaume La Roque <glaroque@baylibre.com>, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 14/03/2019 17:37, Jerome Brunet wrote:
> From: Guillaume La Roque <glaroque@baylibre.com>
> 
> drive-strength is a new feature needed for G12A SoC.
> the default DS setting after boot is usually 0.5mA and it is not enough for
> many functions. We need to be able to set the drive strength to reliably
> enable things like MMC, I2C, etc ...
> 
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/pinctrl/meson/pinctrl-meson-g12a.c |  36 ++---
>  drivers/pinctrl/meson/pinctrl-meson.c      | 166 ++++++++++++++++-----
>  drivers/pinctrl/meson/pinctrl-meson.h      |  20 ++-
>  3 files changed, 162 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-g12a.c b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
> index d494492e98e9..3475cd7bd2af 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-g12a.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-g12a.c

[...]

>  static int meson_pinconf_get(struct pinctrl_dev *pcdev, unsigned int pin,
>  			     unsigned long *config)
>  {
>  	struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
>  	enum pin_config_param param = pinconf_to_config_param(*config);
>  	u16 arg;
> +	int ret;
>  
>  	switch (param) {
>  	case PIN_CONFIG_BIAS_DISABLE:
> @@ -291,6 +373,10 @@ static int meson_pinconf_get(struct pinctrl_dev *pcdev, unsigned int pin,
>  		else
>  			return -EINVAL;
>  		break;
> +	case PIN_CONFIG_DRIVE_STRENGTH:
> +		ret = meson_pinconf_get_drive_strength(pc, pin, &arg);
> +		if (ret)
> +			return ret;

Missing break here !

Neil


>  	default:
>  		return -ENOTSUPP;
>  	}
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
> index 5eaab925f427..1a88103dcb9b 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.h
> +++ b/drivers/pinctrl/meson/pinctrl-meson.h
> @@ -71,9 +71,20 @@ enum meson_reg_type {
>  	REG_DIR,
>  	REG_OUT,
>  	REG_IN,
> +	REG_DS,
>  	NUM_REG,
>  };
>  
> +/**
> + * enum meson_pinconf_drv - value of drive-strength supported
> + */
> +enum meson_pinconf_drv {
> +	MESON_PINCONF_DRV_500UA,
> +	MESON_PINCONF_DRV_2500UA,
> +	MESON_PINCONF_DRV_3000UA,
> +	MESON_PINCONF_DRV_4000UA,
> +};
> +
>  /**
>   * struct meson bank
>   *
> @@ -132,7 +143,8 @@ struct meson_pinctrl {
>  		.num_groups = ARRAY_SIZE(fn ## _groups),		\
>  	}
>  
> -#define BANK(n, f, l, fi, li, per, peb, pr, pb, dr, db, or, ob, ir, ib)	\
> +#define BANK_DS(n, f, l, fi, li, per, peb, pr, pb, dr, db, or, ob, ir, ib,     \
> +		dsr, dsb)                                                      \
>  	{								\
>  		.name		= n,					\
>  		.first		= f,					\
> @@ -145,8 +157,12 @@ struct meson_pinctrl {
>  			[REG_DIR]	= { dr, db },			\
>  			[REG_OUT]	= { or, ob },			\
>  			[REG_IN]	= { ir, ib },			\
> +			[REG_DS]	= { dsr, dsb },			\
>  		},							\
> -	 }
> +	}
> +
> +#define BANK(n, f, l, fi, li, per, peb, pr, pb, dr, db, or, ob, ir, ib) \
> +	BANK_DS(n, f, l, fi, li, per, peb, pr, pb, dr, db, or, ob, ir, ib, 0, 0)
>  
>  #define MESON_PIN(x) PINCTRL_PIN(x, #x)
>  
> 
