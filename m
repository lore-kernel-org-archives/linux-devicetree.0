From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/2] hwmon: (hih6130) add dtb compatibility tables
Date: Thu, 3 Jan 2019 20:25:45 -0800
Message-ID: <20190104042545.GA22722@roeck-us.net>
References: <20181227151349.29753-1-andreas@kemnade.info>
 <20181227151349.29753-2-andreas@kemnade.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181227151349.29753-2-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Kemnade <andreas@kemnade.info>
Cc: jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 27, 2018 at 04:13:48PM +0100, Andreas Kemnade wrote:
> This allows the hih6130 to be used in devicetree files and auto-probed
> that way.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Applie to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/hih6130.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/hih6130.c b/drivers/hwmon/hih6130.c
> index 0ae1ee1dbf76..de1b50ddc740 100644
> --- a/drivers/hwmon/hih6130.c
> +++ b/drivers/hwmon/hih6130.c
> @@ -254,8 +254,17 @@ static const struct i2c_device_id hih6130_id[] = {
>  };
>  MODULE_DEVICE_TABLE(i2c, hih6130_id);
>  
> +static const struct of_device_id hih6130_of_match[] = {
> +	{ .compatible = "honeywell,hih6130", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, hih6130_of_match);
> +
>  static struct i2c_driver hih6130_driver = {
> -	.driver.name = "hih6130",
> +	.driver = {
> +		.name = "hih6130",
> +		.of_match_table = of_match_ptr(hih6130_of_match),
> +	},
>  	.probe       = hih6130_probe,
>  	.id_table    = hih6130_id,
>  };
