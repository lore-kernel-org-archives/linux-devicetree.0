From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH] hwmon: Convert to using %pOF instead of full_name
Date: Tue, 18 Jul 2017 18:47:20 -0700
Message-ID: <b96d4243-03fa-08b8-fa53-8d0e4db9bc68@roeck-us.net>
References: <20170718214339.7774-25-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170718214339.7774-25-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dirk Eibach <eibach-dJ+jgKLZIg4@public.gmane.org>, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/18/2017 02:43 PM, Rob Herring wrote:
> Now that we have a custom printf format specifier, convert users of
> full_name to use %pOF instead. This is preparation to remove storing
> of the full path string for each node.
> 
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Dirk Eibach <eibach-dJ+jgKLZIg4@public.gmane.org>
> Cc: Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>
> Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> Cc: linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Applied to hwmon-next.

Thanks,
Guenter

> ---
>   drivers/hwmon/ads1015.c | 14 ++++++--------
>   1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hwmon/ads1015.c b/drivers/hwmon/ads1015.c
> index 357b42607164..98c704d3366a 100644
> --- a/drivers/hwmon/ads1015.c
> +++ b/drivers/hwmon/ads1015.c
> @@ -191,24 +191,23 @@ static int ads1015_get_channels_config_of(struct i2c_client *client)
>   		unsigned int data_rate = ADS1015_DEFAULT_DATA_RATE;
> 
>   		if (of_property_read_u32(node, "reg", &pval)) {
> -			dev_err(&client->dev, "invalid reg on %s\n",
> -				node->full_name);
> +			dev_err(&client->dev, "invalid reg on %pOF\n", node);
>   			continue;
>   		}
> 
>   		channel = pval;
>   		if (channel >= ADS1015_CHANNELS) {
>   			dev_err(&client->dev,
> -				"invalid channel index %d on %s\n",
> -				channel, node->full_name);
> +				"invalid channel index %d on %pOF\n",
> +				channel, node);
>   			continue;
>   		}
> 
>   		if (!of_property_read_u32(node, "ti,gain", &pval)) {
>   			pga = pval;
>   			if (pga > 6) {
> -				dev_err(&client->dev, "invalid gain on %s\n",
> -					node->full_name);
> +				dev_err(&client->dev, "invalid gain on %pOF\n",
> +					node);
>   				return -EINVAL;
>   			}
>   		}
> @@ -217,8 +216,7 @@ static int ads1015_get_channels_config_of(struct i2c_client *client)
>   			data_rate = pval;
>   			if (data_rate > 7) {
>   				dev_err(&client->dev,
> -					"invalid data_rate on %s\n",
> -					node->full_name);
> +					"invalid data_rate on %pOF\n", node);
>   				return -EINVAL;
>   			}
>   		}
> --
> 2.11.0
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
