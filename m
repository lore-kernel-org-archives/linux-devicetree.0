From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/3] rtc: pcf85263: Support multiple centuries
Date: Wed, 21 Sep 2016 23:33:11 +0200
Message-ID: <20160921213311.luqfdytg6tyapw6e@piout.net>
References: <20160801155029.32232.56063.stgit@localhost>
 <20160801155036.32232.7242.stgit@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160801155036.32232.7242.stgit@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 01/08/2016 at 17:50:36 +0200, Martin Fuzzey wrote :
> The hardware has neither a century register nor a century warp around bit.
> 
> However it does have a single byte of non volatile RAM.
> 
> Use this to provide full century and wrap around support by storing:
> * The current century
> * The current half century (lower=00-49, upper=50-99)
> 
> If the byte is not set the 21st century is assumed.
> 

While the idea is certainly interesting and properly implemented, this
is not working as expected because the RTC thinks that year 00 is a leap
year and both 1900 and 2100 are not leap years.

While it is possible to wark around that, I don't think there is any
added benefit as this RTC will work properly as is until 2099 (and by
then it will probably have been replaced).

> Signed-off-by: Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/rtc/rtc-pcf85263.c |  105 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 103 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-pcf85263.c b/drivers/rtc/rtc-pcf85263.c
> index 997742d..7b55d92 100644
> --- a/drivers/rtc/rtc-pcf85263.c
> +++ b/drivers/rtc/rtc-pcf85263.c
> @@ -83,6 +83,10 @@
>  
>  #define PCF85263_HR_PM		BIT(5)
>  
> +/* Our data stored in the RAM byte */
> +#define PCF85263_STATE_CENTURY_MASK		0x7f
> +#define PCF85263_STATE_UPPER_HALF_CENTURY	BIT(7)
> +
>  enum pcf85263_irqpin {
>  	PCF85263_IRQPIN_NONE,
>  	PCF85263_IRQPIN_INTA,
> @@ -101,6 +105,8 @@ struct pcf85263 {
>  	struct regmap *regmap;
>  	enum pcf85263_irqpin irq_pin;
>  	int irq;
> +	u8 century;		/* 1 = 1900 2 = 2000, ... */
> +	bool century_half;	/* false = 0-49, true=50-99 */
>  	bool mode_12h;
>  };
>  
> @@ -136,6 +142,85 @@ static int pcf85263_bin24h_to_bcd12h(int hr24)
>  	return bin2bcd(hr12) | pm ? 0 : PCF85263_HR_PM;
>  }
>  
> +static inline bool pcf85263_century_half(int year)
> +{
> +	return (year % 100) >= 50;
> +}
> +
> +/*
> + * Since the hardware only has a year range of 00 to 99 we use
> + * the ram byte to store the century. 1=1900, 2=2000, 3=2100
> + * A value of zero is assumed to be 2000
> + *
> + * Set the ram byte when we set the clock which lets us use any
> + * century supported by linux (tm_year=0 => 1900)
> + *
> + * Unfortunately the hardware has no wrap around flag so fix it
> + * by also storing a flag indicating if the year is in the
> + * upper or lower half of the century.
> + */
> +static int pcf85263_update_ram_byte(struct pcf85263 *pcf85263)
> +{
> +	u8 val = pcf85263->century & PCF85263_STATE_CENTURY_MASK;
> +
> +	if (pcf85263->century_half)
> +		val |= PCF85263_STATE_UPPER_HALF_CENTURY;
> +
> +	return regmap_write(pcf85263->regmap, PCF85263_REG_RAM_BYTE, val);
> +}
> +
> +static int pcf85263_read_ram_byte(struct pcf85263 *pcf85263)
> +{
> +	unsigned int regval;
> +	int ret;
> +
> +	ret = regmap_read(pcf85263->regmap, PCF85263_REG_RAM_BYTE, &regval);
> +	if (ret)
> +		return ret;
> +
> +	pcf85263->century = regval & PCF85263_STATE_CENTURY_MASK;
> +	pcf85263->century_half = !!(regval & PCF85263_STATE_UPPER_HALF_CENTURY);
> +
> +	if (!pcf85263->century) { /* Not valid => not initialised yet */
> +		int year;
> +
> +		ret = regmap_read(pcf85263->regmap,
> +				  PCF85263_REG_RTC_YR, &regval);
> +		if (ret)
> +			return ret;
> +
> +		pcf85263->century = 2;
> +		year = bcd2bin(regval) + 1900 + (pcf85263->century - 1) * 100;
> +		pcf85263->century_half = pcf85263_century_half(year);
> +
> +		dev_warn(pcf85263->dev, "No century in NVRAM - assume %d\n",
> +			 year);
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * Detect year overflow by comparing the half (upper, lower) of
> + * the current year with the half the last time we read it
> + */
> +static int pcf85263_update_century(struct pcf85263 *pcf85263, int year)
> +{
> +	bool cur_century_half;
> +
> +	cur_century_half = pcf85263_century_half(year);
> +
> +	if (cur_century_half == pcf85263->century_half)
> +		return 0;
> +
> +	if (!cur_century_half) /* Year has wrapped around */
> +		pcf85263->century++;
> +
> +	pcf85263->century_half = cur_century_half;
> +
> +	return pcf85263_update_ram_byte(pcf85263);
> +}
> +
>  static int pcf85263_read_time(struct device *dev, struct rtc_time *tm)
>  {
>  	struct pcf85263 *pcf85263 = dev_get_drvdata(dev);
> @@ -169,7 +254,11 @@ static int pcf85263_read_time(struct device *dev, struct rtc_time *tm)
>  	tm->tm_mon  = bcd2bin(regs[PCF85263_REG_RTC_MO - first]) - 1;
>  	tm->tm_year = bcd2bin(regs[PCF85263_REG_RTC_YR - first]);
>  
> -	tm->tm_year += 100;  /* Assume 21st century */
> +	ret = pcf85263_update_century(pcf85263, tm->tm_year);
> +	if (ret)
> +		return ret;
> +
> +	tm->tm_year += (pcf85263->century - 1) * 100;
>  
>  	return 0;
>  }
> @@ -214,7 +303,14 @@ static int pcf85263_set_time(struct device *dev, struct rtc_time *tm)
>  	}
>  
>  	/* Start it again */
> -	return regmap_write(pcf85263->regmap, PCF85263_REG_STOPENABLE, 0);
> +	ret = regmap_write(pcf85263->regmap, PCF85263_REG_STOPENABLE, 0);
> +	if (ret)
> +		return ret;
> +
> +	pcf85263->century = (tm->tm_year / 100) + 1;
> +	pcf85263->century_half = pcf85263_century_half(tm->tm_year);
> +
> +	return pcf85263_update_ram_byte(pcf85263);
>  }
>  
>  static int pcf85263_enable_alarm(struct pcf85263 *pcf85263, bool enable)
> @@ -422,6 +518,11 @@ static int pcf85263_init_hw(struct pcf85263 *pcf85263)
>  		return ret;
>  	}
>  
> +	/* Get our persistent state from the ram byte */
> +	ret = pcf85263_read_ram_byte(pcf85263);
> +	if (ret < 0)
> +		return ret;
> +
>  	/* Determine 12/24H mode */
>  	ret = regmap_read(pcf85263->regmap, PCF85263_REG_OSC, &regval);
>  	if (ret)
> 

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
