From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH RFC 4/5] gnss: sirf: add a separate supply for a lna
Date: Wed, 5 Dec 2018 16:06:24 +0100
Message-ID: <20181205150624.GH15689@localhost>
References: <20181118215801.12280-1-andreas@kemnade.info>
 <20181118215801.12280-5-andreas@kemnade.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181118215801.12280-5-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Kemnade <andreas@kemnade.info>
Cc: johan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
List-Id: devicetree@vger.kernel.org

On Sun, Nov 18, 2018 at 10:58:00PM +0100, Andreas Kemnade wrote:
> Devices might have a separate lna between antenna output of the gps
> chip and the antenna which might have a separate supply
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  drivers/gnss/sirf.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/gnss/sirf.c b/drivers/gnss/sirf.c
> index 6a0e5c0a2d62..f7573ca2dacd 100644
> --- a/drivers/gnss/sirf.c
> +++ b/drivers/gnss/sirf.c
> @@ -30,6 +30,7 @@ struct sirf_data {
>  	struct serdev_device *serdev;
>  	speed_t	speed;
>  	struct regulator *vcc;
> +	struct regulator *lna;
>  	struct gpio_desc *on_off;
>  	struct gpio_desc *wakeup;
>  	int irq;
> @@ -217,6 +218,7 @@ static int sirf_runtime_suspend(struct device *dev)
>  
>  	if (!data->on_off)
>  		return regulator_disable(data->vcc);
> +	regulator_disable(data->lna);

I don't think you want to disable it until the device has entered
hibernate mode.

>  	ret = sirf_set_active(data, false);
>  
>  	if (ret)
> @@ -245,13 +247,20 @@ static int sirf_runtime_resume(struct device *dev)
>  		if (ret)
>  			goto err_close_serdev;
>  	}
> +
> +	ret = regulator_enable(data->lna);
> +	if (ret)
> +		goto err_disable_vcc;

This one needs to be managed as vcc in the case where we have no
onoff-signal connected, right? Similar for suspend of course.

> +
>  	ret = sirf_set_active(data, true);
>  
>  	if (!ret)
>  		return 0;
>  
> +err_disable_vcc:
>  	if (!data->on_off)
>  		regulator_disable(data->vcc);
> +

Superfluous newline.

>  err_close_serdev:
>  	serdev_device_close(data->serdev);
>  	return ret;

Johan
