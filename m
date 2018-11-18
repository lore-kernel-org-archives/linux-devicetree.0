From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: ina3221: Convert to using %pOFn instead of
 device_node.name
Date: Sun, 18 Nov 2018 14:43:20 -0800
Message-ID: <20181118224320.GA949@roeck-us.net>
References: <20181116220540.17222-1-robh@kernel.org>
 <20181116220540.17222-2-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181116220540.17222-2-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 16, 2018 at 04:05:38PM -0600, Rob Herring wrote:
> In preparation to remove the node name pointer from struct device_node,
> convert printf users to use the %pOFn format specifier.
> 
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-hwmon@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/ina3221.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
> index d61688f04594..27abbc5b9d46 100644
> --- a/drivers/hwmon/ina3221.c
> +++ b/drivers/hwmon/ina3221.c
> @@ -469,10 +469,10 @@ static int ina3221_probe_child_from_dt(struct device *dev,
>  
>  	ret = of_property_read_u32(child, "reg", &val);
>  	if (ret) {
> -		dev_err(dev, "missing reg property of %s\n", child->name);
> +		dev_err(dev, "missing reg property of %pOFn\n", child);
>  		return ret;
>  	} else if (val > INA3221_CHANNEL3) {
> -		dev_err(dev, "invalid reg %d of %s\n", val, child->name);
> +		dev_err(dev, "invalid reg %d of %pOFn\n", val, child);
>  		return ret;
>  	}
>  
> @@ -490,8 +490,8 @@ static int ina3221_probe_child_from_dt(struct device *dev,
>  	/* Overwrite default shunt resistor value optionally */
>  	if (!of_property_read_u32(child, "shunt-resistor-micro-ohms", &val)) {
>  		if (val < 1 || val > INT_MAX) {
> -			dev_err(dev, "invalid shunt resistor value %u of %s\n",
> -				val, child->name);
> +			dev_err(dev, "invalid shunt resistor value %u of %pOFn\n",
> +				val, child);
>  			return -EINVAL;
>  		}
>  		input->shunt_resistor = val;
