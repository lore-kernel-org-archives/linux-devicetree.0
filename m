Return-Path: <SRS0=DKhf=VK=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45684 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726474AbfGMNam (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 13 Jul 2019 09:30:42 -0400
Date: Sat, 13 Jul 2019 06:30:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 2/2] drivers: hwmon: lm75: add support for PCT2075
Message-ID: <20190713133039.GA32420@roeck-us.net>
References: <20190711124504.7580-1-daniel@zonque.org>
 <20190711124504.7580-2-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190711124504.7580-2-daniel@zonque.org>
Sender: devicetree-owner@vger.kernel.org
To: Daniel Mack <daniel@zonque.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, jdelvare@suse.com
List-ID: <devicetree@vger.kernel.org>

On Thu, Jul 11, 2019 at 02:45:04PM +0200, Daniel Mack wrote:
> The NXP PCT2075 is largely compatible with other chips already supported
> by the LM75 driver. It uses an 11-bit resolution and defaults to 100 ms
> sampling period. The datasheet is here:
> 
>   https://www.nxp.com/docs/en/data-sheet/PCT2075.pdf
> 
> Signed-off-by: Daniel Mack <daniel@zonque.org>

Applied to hwmon-next. Note that I also updated Documentation/hwmon/lm75.rst.

Guenter

> ---
>  drivers/hwmon/lm75.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
> index 447af07450f1..a8aba628468e 100644
> --- a/drivers/hwmon/lm75.c
> +++ b/drivers/hwmon/lm75.c
> @@ -49,6 +49,7 @@ enum lm75_type {		/* keep sorted in alphabetical order */
>  	max6626,
>  	max31725,
>  	mcp980x,
> +	pct2075,
>  	stds75,
>  	stlm75,
>  	tcn75,
> @@ -353,6 +354,10 @@ lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  		data->resolution = 9;
>  		data->sample_time = MSEC_PER_SEC / 8;
>  		break;
> +	case pct2075:
> +		data->resolution = 11;
> +		data->sample_time = MSEC_PER_SEC / 10;
> +		break;
>  	case mcp980x:
>  		data->resolution_limits = 9;
>  		/* fall through */
> @@ -428,6 +433,7 @@ static const struct i2c_device_id lm75_ids[] = {
>  	{ "max31725", max31725, },
>  	{ "max31726", max31725, },
>  	{ "mcp980x", mcp980x, },
> +	{ "pct2075", pct2075, },
>  	{ "stds75", stds75, },
>  	{ "stlm75", stlm75, },
>  	{ "tcn75", tcn75, },
> @@ -496,6 +502,10 @@ static const struct of_device_id lm75_of_match[] = {
>  		.compatible = "maxim,mcp980x",
>  		.data = (void *)mcp980x
>  	},
> +	{
> +		.compatible = "nxp,pct2075",
> +		.data = (void *)pct2075
> +	},
>  	{
>  		.compatible = "st,stds75",
>  		.data = (void *)stds75
