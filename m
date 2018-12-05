From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 2/5] gnss: sirf: power on logic for devices without
 wakeup signal
Date: Wed, 5 Dec 2018 16:01:16 +0100
Message-ID: <20181205150116.GF15689@localhost>
References: <20181118215801.12280-1-andreas@kemnade.info>
 <20181118215801.12280-3-andreas@kemnade.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181118215801.12280-3-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Kemnade <andreas@kemnade.info>
Cc: johan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
List-Id: devicetree@vger.kernel.org

On Sun, Nov 18, 2018 at 10:57:58PM +0100, Andreas Kemnade wrote:
> Some Wi2Wi devices do not have a wakeup output, so device state can
> only be indirectly detected by looking whether there is communitcation
> over the serial lines.
> Additionally it checks for the initial state of the device during
> probing to ensure it is off.
> Timeout values need to be increased, because the reaction on serial line
> is slower and are in line  with previous patches by
> Neil Brown <neilb@suse.de> and  H. Nikolaus Schaller <hns@goldelico.com>.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  drivers/gnss/sirf.c | 97 +++++++++++++++++++++++++++++++++++------------------
>  1 file changed, 65 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gnss/sirf.c b/drivers/gnss/sirf.c
> index b5efbb062316..6a0e5c0a2d62 100644
> --- a/drivers/gnss/sirf.c
> +++ b/drivers/gnss/sirf.c
> @@ -22,8 +22,8 @@
>  
>  #define SIRF_BOOT_DELAY			500
>  #define SIRF_ON_OFF_PULSE_TIME		100
> -#define SIRF_ACTIVATE_TIMEOUT		200
> -#define SIRF_HIBERNATE_TIMEOUT		200
> +#define SIRF_ACTIVATE_TIMEOUT		1000
> +#define SIRF_HIBERNATE_TIMEOUT		1000

We shouldn't increase the timeouts for the general case where we have
wakeup connected.

>  struct sirf_data {
>  	struct gnss_device *gdev;
> @@ -45,26 +45,14 @@ static int sirf_open(struct gnss_device *gdev)
>  	int ret;
>  
>  	data->opened = true;
> -	ret = serdev_device_open(serdev);
> -	if (ret)
> -		return ret;
> -
> -	serdev_device_set_baudrate(serdev, data->speed);
> -	serdev_device_set_flow_control(serdev, false);

And also here, I think we shouldn't change the general case (wakeup
connected) unnecessarily. Currently user space can request the receiver
to remain powered, while not keeping the port open unnecessarily.

>  
>  	ret = pm_runtime_get_sync(&serdev->dev);
>  	if (ret < 0) {
>  		dev_err(&gdev->dev, "failed to runtime resume: %d\n", ret);
>  		pm_runtime_put_noidle(&serdev->dev);
>  		data->opened = false;
> -		goto err_close;
>  	}
>  
> -	return 0;
> -
> -err_close:
> -	serdev_device_close(serdev);
> -
>  	return ret;
>  }
>  
> @@ -73,8 +61,6 @@ static void sirf_close(struct gnss_device *gdev)
>  	struct sirf_data *data = gnss_get_drvdata(gdev);
>  	struct serdev_device *serdev = data->serdev;
>  
> -	serdev_device_close(serdev);
> -
>  	pm_runtime_put(&serdev->dev);
>  	data->opened = false;
>  }
> @@ -109,6 +95,11 @@ static int sirf_receive_buf(struct serdev_device *serdev,
>  	struct sirf_data *data = serdev_device_get_drvdata(serdev);
>  	struct gnss_device *gdev = data->gdev;
>  
> +	if ((!data->wakeup) && (!data->active)) {

You have superfluous parenthesis like the above throughout the series.

> +		data->active = 1;

active is bool, so use "true".

> +		wake_up_interruptible(&data->power_wait);
> +	}
> +
>  	/*
>  	 * we might come here everytime when runtime is resumed
>  	 * and data is received. Two cases are possible
> @@ -149,6 +140,25 @@ static int sirf_wait_for_power_state(struct sirf_data *data, bool active,
>  {
>  	int ret;
>  
> +	/* no wakeup pin, success condition is that
> +	 * no byte comes in in the period
> +	 */

Multiline comment style needs to be fixed throughout. Also use sentence
case and periods where appropriate.

> +	if ((!data->wakeup) && (!active) && (data->active)) {
> +		/* some bytes might come, so sleep a bit first */
> +		msleep(timeout);

This changes the semantics of the functions and effectively doubles the
requested timeout.

> +		data->active = false;
> +		ret = wait_event_interruptible_timeout(data->power_wait,
> +			data->active == true, msecs_to_jiffies(timeout));
> +
> +		if (ret < 0)
> +			return ret;
> +
> +		/* we are still getting woken up -> timeout */
> +		if (ret > 0)
> +			return -ETIMEDOUT;
> +		return 0;
> +	}
> +
>  	ret = wait_event_interruptible_timeout(data->power_wait,
>  			data->active == active, msecs_to_jiffies(timeout));
>  	if (ret < 0)
> @@ -203,21 +213,48 @@ static int sirf_set_active(struct sirf_data *data, bool active)
>  static int sirf_runtime_suspend(struct device *dev)
>  {
>  	struct sirf_data *data = dev_get_drvdata(dev);
> +	int ret;
>  
>  	if (!data->on_off)
>  		return regulator_disable(data->vcc);

Missing newline.

> +	ret = sirf_set_active(data, false);
>  

Superfluous newline.

> -	return sirf_set_active(data, false);
> +	if (ret)
> +		dev_err(dev, "failed to deactivate");

Missing '\n'.

> +
> +	/* we should close it anyways, so the following receptions
> +	 * will not run into the empty
> +	 */

Not sure what you mean here, please rephrase.

> +	serdev_device_close(data->serdev);
> +	return 0;
>  }
>  
>  static int sirf_runtime_resume(struct device *dev)
>  {
> +	int ret;

Please, place after the next declaration (reverse xmas style).

>  	struct sirf_data *data = dev_get_drvdata(dev);

Missing newline.

> +	ret = serdev_device_open(data->serdev);
> +	if (ret)
> +		return ret;
>  
> -	if (!data->on_off)
> -		return regulator_enable(data->vcc);
> +	serdev_device_set_baudrate(data->serdev, data->speed);
> +	serdev_device_set_flow_control(data->serdev, false);
> +
> +	if (!data->on_off) {
> +		ret = regulator_enable(data->vcc);
> +		if (ret)
> +			goto err_close_serdev;
> +	}

Newline.

> +	ret = sirf_set_active(data, true);
> +
> +	if (!ret)
> +		return 0;

Add an error label instead, and return 0 unconditionally in the success
path.

>  
> -	return sirf_set_active(data, true);
> +	if (!data->on_off)
> +		regulator_disable(data->vcc);
> +err_close_serdev:
> +	serdev_device_close(data->serdev);
> +	return ret;
>  }
>  
>  static int __maybe_unused sirf_suspend(struct device *dev)
> @@ -311,18 +348,6 @@ static int sirf_probe(struct serdev_device *serdev)
>  	if (data->on_off) {
>  		data->wakeup = devm_gpiod_get_optional(dev, "sirf,wakeup",
>  				GPIOD_IN);
> -		if (IS_ERR(data->wakeup))
> -			goto err_put_device;

You still want to check for errors here.

> -
> -		/*
> -		 * Configurations where WAKEUP has been left not connected,
> -		 * are currently not supported.
> -		 */
> -		if (!data->wakeup) {
> -			dev_err(dev, "no wakeup gpio specified\n");
> -			ret = -ENODEV;
> -			goto err_put_device;
> -		}
>  	}
>  
>  	if (data->wakeup) {
> @@ -352,6 +377,13 @@ static int sirf_probe(struct serdev_device *serdev)
>  	if (IS_ENABLED(CONFIG_PM)) {
>  		pm_runtime_set_suspended(dev);	/* clear runtime_error flag */
>  		pm_runtime_enable(dev);
> +		/* device might be enabled at boot, so lets first enable it,
> +		 * then disable it to bring it into a clear state
> +		 */
> +		ret = pm_runtime_get_sync(dev);
> +		if (ret)
> +			goto err_disable_rpm;
> +		pm_runtime_put(dev);
>  	} else {
>  		ret = sirf_runtime_resume(dev);
>  		if (ret < 0)
> @@ -401,6 +433,7 @@ static const struct of_device_id sirf_of_match[] = {
>  	{ .compatible = "linx,r4" },
>  	{ .compatible = "wi2wi,w2sg0008i" },
>  	{ .compatible = "wi2wi,w2sg0084i" },
> +	{ .compatible = "wi2wi,w2sg0004" },

Keep the entries sorted.

>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, sirf_of_match);

Johan
