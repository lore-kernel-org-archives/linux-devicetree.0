From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v2 4/5] rtc: pcf8523: set xtal load capacitance from DT
Date: Wed, 16 Jan 2019 22:04:41 +0100
Message-ID: <20190116210441.GE2627@piout.net>
References: <20190108185414.26922-1-sam@ravnborg.org>
 <20190108185414.26922-5-sam@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190108185414.26922-5-sam@ravnborg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Andrew Jeffery <andrew@aj.id.au>, Fabio Estevam <fabio.estevam@nxp.com>, Joel Stanley <joel@jms.id.au>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>, Urs =?iso-8859-1?Q?F=E4ssler?= <urs.fassler@bbv.ch>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08/01/2019 19:54:13+0100, Sam Ravnborg wrote:
> Add support for specifying the xtal load capacitance in the DT node.
> The pcf8523 supports xtal load capacitance of 7pF or 12.5pF.
> If the rtc has the wrong configuration the time will
> drift several hours/week.
> 
> The driver use the default value 12.5pF.
> 
> The DT may specify either 7000fF or 12500fF.
> (The DT uses femto Farad to avoid decimal numbers).
> Other values are warned and the driver uses the default value.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  drivers/rtc/rtc-pcf8523.c | 28 ++++++++++++++++++++--------
>  1 file changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-pcf8523.c b/drivers/rtc/rtc-pcf8523.c
> index 3fcd2cbafc84..dbbc00b53b50 100644
> --- a/drivers/rtc/rtc-pcf8523.c
> +++ b/drivers/rtc/rtc-pcf8523.c
> @@ -97,8 +97,9 @@ static int pcf8523_voltage_low(struct i2c_client *client)
>  	return !!(value & REG_CONTROL3_BLF);
>  }
>  
> -static int pcf8523_select_capacitance(struct i2c_client *client, bool high)
> +static int pcf8523_load_capacitance(struct i2c_client *client)
>  {
> +	u32 load;
>  	u8 value;
>  	int err;
>  
> @@ -106,14 +107,24 @@ static int pcf8523_select_capacitance(struct i2c_client *client, bool high)
>  	if (err < 0)
>  		return err;
>  
> -	if (!high)
> -		value &= ~REG_CONTROL1_CAP_SEL;
> -	else
> +	load = 12500;
> +	of_property_read_u32(client->dev.of_node, "quartz-load-femtofarads",
> +			     &load);
> +
> +	switch (load) {
> +	default:
> +		dev_warn(&client->dev, "Unknown quartz-load-femtofarads value: %d. Assuming 12500",
> +			load);

This alignment is not correct, as you will be respinning for the DT doc,
please fix ;)

> +		/* fall through */
> +	case 12500:
>  		value |= REG_CONTROL1_CAP_SEL;
> +		break;
> +	case 7000:
> +		value &= ~REG_CONTROL1_CAP_SEL;
> +		break;
> +	}
>  
>  	err = pcf8523_write(client, REG_CONTROL1, value);
> -	if (err < 0)
> -		return err;
>  
>  	return err;
>  }
> @@ -347,9 +358,10 @@ static int pcf8523_probe(struct i2c_client *client,
>  	if (!pcf)
>  		return -ENOMEM;
>  
> -	err = pcf8523_select_capacitance(client, true);
> +	err = pcf8523_load_capacitance(client);
>  	if (err < 0)
> -		return err;
> +		dev_warn(&client->dev, "failed to set xtal load capacitance: %d",
> +			err);
Ditto

>  
>  	err = pcf8523_set_pm(client, 0);
>  	if (err < 0)
> -- 
> 2.12.0
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
