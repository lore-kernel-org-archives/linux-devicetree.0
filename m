From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2 4/5] gnss: sirf: add a separate supply for a lna
Date: Thu, 10 Jan 2019 13:25:08 +0100
Message-ID: <20190110122508.GD3430@localhost>
References: <20181209195150.5192-1-andreas@kemnade.info>
 <20181209195150.5192-5-andreas@kemnade.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181209195150.5192-5-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Kemnade <andreas@kemnade.info>
Cc: johan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
List-Id: devicetree@vger.kernel.org

On Sun, Dec 09, 2018 at 08:51:49PM +0100, Andreas Kemnade wrote:
> Devices might have a separate lna between antenna output of the gps
> chip and the antenna which might have a separate supply.

Fix the s/antenna output/antenna input/ as per Nikolaus comment.

> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
> Changes in v2:
>  - handle lna also if there is no on-off gpio
>  - rebase on changed 2/5
> 
>  drivers/gnss/sirf.c | 26 ++++++++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)

You also need to update the binding docs. As already discussed I think
adding this to the generic binding is appropriate (even if only sirf
implements it initially).

> diff --git a/drivers/gnss/sirf.c b/drivers/gnss/sirf.c
> index c64369494afb..d339e8ef2508 100644
> --- a/drivers/gnss/sirf.c
> +++ b/drivers/gnss/sirf.c
> @@ -36,6 +36,7 @@ struct sirf_data {
>  	struct serdev_device *serdev;
>  	speed_t	speed;
>  	struct regulator *vcc;
> +	struct regulator *lna;
>  	struct gpio_desc *on_off;
>  	struct gpio_desc *wakeup;
>  	int irq;
> @@ -282,21 +283,32 @@ static int sirf_set_active(struct sirf_data *data, bool active)
>  static int sirf_runtime_suspend(struct device *dev)
>  {
>  	struct sirf_data *data = dev_get_drvdata(dev);
> +	int ret = 0;

No need to initialise.

>  	if (!data->on_off)

Perhaps invert this test now too.

> -		return regulator_disable(data->vcc);
> +		ret = regulator_disable(data->vcc);
> +	else
> +		ret = sirf_set_active(data, false);
>  
> -	return sirf_set_active(data, false);
> +	if (ret)
> +		return ret;
> +
> +	return regulator_disable(data->lna);

You need to undo the above if this call fails.

>  }
>  
>  static int sirf_runtime_resume(struct device *dev)
>  {
>  	struct sirf_data *data = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = regulator_enable(data->lna);
> +	if (ret)
> +		return ret;
>  
>  	if (!data->on_off)
>  		return regulator_enable(data->vcc);
> -
> -	return sirf_set_active(data, true);
> +	else
> +		return sirf_set_active(data, true);

You must undo the changes here too on errors since we call this function
directly from probe in one case.

>  }
>  
>  static int __maybe_unused sirf_suspend(struct device *dev)
> @@ -384,6 +396,12 @@ static int sirf_probe(struct serdev_device *serdev)
>  		goto err_put_device;
>  	}
>  
> +	data->lna = devm_regulator_get(dev, "lna");
> +	if (IS_ERR(data->lna)) {
> +		ret = PTR_ERR(data->lna);
> +		goto err_put_device;
> +	}
> +
>  	data->on_off = devm_gpiod_get_optional(dev, "sirf,onoff",
>  			GPIOD_OUT_LOW);
>  	if (IS_ERR(data->on_off))

Johan
