From: Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: Re: [PATCH v2 1/7] pinctrl: at91: add option to use drive strength
 bits
Date: Wed, 6 Feb 2019 09:13:04 +0100
Message-ID: <20190206081304.cv344rjzvz7wzih5@M43218.corp.atmel.com>
References: <1548951466-26297-1-git-send-email-claudiu.beznea@microchip.com>
 <1548951466-26297-2-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548951466-26297-2-git-send-email-claudiu.beznea@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Claudiu Beznea - M18063 <Claudiu.Beznea@microchip.com>
Cc: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Nicolas Ferre - M43238 <Nicolas.Ferre@microchip.com>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 31, 2019 at 05:18:04PM +0100, Claudiu Beznea - M18063 wrote:
> From: Claudiu Beznea <claudiu.beznea@microchip.com>
> 
> SAM9X60 uses high and low drive strengths. To implement this, in
> at91_pinctrl_mux_ops::set_drivestrength and
> at91_pinctrl_mux_ops::get_drivestrength we need bit numbers of
> drive strengths (1 for low, 2 for high), thus change the code to
> allow the usage of drive strength bit numbers.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  drivers/pinctrl/pinctrl-at91.c | 32 ++++++++++++++++++++------------
>  1 file changed, 20 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
> index 3d49bbbcdbc7..31f06dafca2e 100644
> --- a/drivers/pinctrl/pinctrl-at91.c
> +++ b/drivers/pinctrl/pinctrl-at91.c
> @@ -72,10 +72,15 @@ static int gpio_banks;
>   * DRIVE_STRENGTH_DEFAULT is just a placeholder to avoid changing the drive
>   * strength when there is no dt config for it.
>   */
> -#define DRIVE_STRENGTH_DEFAULT		(0 << DRIVE_STRENGTH_SHIFT)
> -#define DRIVE_STRENGTH_LOW          (1 << DRIVE_STRENGTH_SHIFT)
> -#define DRIVE_STRENGTH_MED          (2 << DRIVE_STRENGTH_SHIFT)
> -#define DRIVE_STRENGTH_HI           (3 << DRIVE_STRENGTH_SHIFT)
> +enum drive_strength_bit {
> +	DRIVE_STRENGTH_BIT_DEF,
> +	DRIVE_STRENGTH_BIT_LOW,
> +	DRIVE_STRENGTH_BIT_MED,
> +	DRIVE_STRENGTH_BIT_HI,
> +};
> +
> +#define DRIVE_STRENGTH_BIT_MSK(name)	(DRIVE_STRENGTH_BIT_##name << \
> +					 DRIVE_STRENGTH_SHIFT)
>  
>  /**
>   * struct at91_pmx_func - describes AT91 pinmux functions
> @@ -551,7 +556,7 @@ static unsigned at91_mux_sama5d3_get_drivestrength(void __iomem *pio,
>  	/* SAMA5 strength is 1:1 with our defines,
>  	 * except 0 is equivalent to low per datasheet */
>  	if (!tmp)
> -		tmp = DRIVE_STRENGTH_LOW;
> +		tmp = DRIVE_STRENGTH_BIT_MSK(LOW);
>  
>  	return tmp;
>  }
> @@ -564,7 +569,7 @@ static unsigned at91_mux_sam9x5_get_drivestrength(void __iomem *pio,
>  
>  	/* strength is inverse in SAM9x5s hardware with the pinctrl defines
>  	 * hardware: 0 = hi, 1 = med, 2 = low, 3 = rsvd */
> -	tmp = DRIVE_STRENGTH_HI - tmp;
> +	tmp = DRIVE_STRENGTH_BIT_MSK(HI) - tmp;
>  
>  	return tmp;
>  }
> @@ -600,7 +605,7 @@ static void at91_mux_sam9x5_set_drivestrength(void __iomem *pio, unsigned pin,
>  
>  	/* strength is inverse on SAM9x5s with our defines
>  	 * 0 = hi, 1 = med, 2 = low, 3 = rsvd */
> -	setting = DRIVE_STRENGTH_HI - setting;
> +	setting = DRIVE_STRENGTH_BIT_MSK(HI) - setting;
>  
>  	set_drive_strength(pio + at91sam9x5_get_drive_register(pin), pin,
>  				setting);
> @@ -959,11 +964,11 @@ static int at91_pinconf_set(struct pinctrl_dev *pctldev,
>  	}					\
>  } while (0)
>  
> -#define DBG_SHOW_FLAG_MASKED(mask,flag) do {	\
> +#define DBG_SHOW_FLAG_MASKED(mask,flag,name) do {	\

checkpatch error: space required

>  	if ((config & mask) == flag) {		\
>  		if (num_conf)			\
>  			seq_puts(s, "|");	\
> -		seq_puts(s, #flag);		\
> +		seq_puts(s, #name);		\
>  		num_conf++;			\
>  	}					\
>  } while (0)
> @@ -981,9 +986,12 @@ static void at91_pinconf_dbg_show(struct pinctrl_dev *pctldev,
>  	DBG_SHOW_FLAG(PULL_DOWN);
>  	DBG_SHOW_FLAG(DIS_SCHMIT);
>  	DBG_SHOW_FLAG(DEGLITCH);
> -	DBG_SHOW_FLAG_MASKED(DRIVE_STRENGTH, DRIVE_STRENGTH_LOW);
> -	DBG_SHOW_FLAG_MASKED(DRIVE_STRENGTH, DRIVE_STRENGTH_MED);
> -	DBG_SHOW_FLAG_MASKED(DRIVE_STRENGTH, DRIVE_STRENGTH_HI);
> +	DBG_SHOW_FLAG_MASKED(DRIVE_STRENGTH, DRIVE_STRENGTH_BIT_MSK(LOW),
> +			     DRIVE_STRENGTH_LOW);
> +	DBG_SHOW_FLAG_MASKED(DRIVE_STRENGTH, DRIVE_STRENGTH_BIT_MSK(MED),
> +			     DRIVE_STRENGTH_MED);
> +	DBG_SHOW_FLAG_MASKED(DRIVE_STRENGTH, DRIVE_STRENGTH_BIT_MSK(HI),
> +			     DRIVE_STRENGTH_HI);
>  	DBG_SHOW_FLAG(DEBOUNCE);
>  	if (config & DEBOUNCE) {
>  		val = config >> DEBOUNCE_VAL_SHIFT;
> -- 
> 2.7.4
> 
