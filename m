From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2 1/5] gnss: sirf: write data to gnss only when the gnss
 device is open
Date: Thu, 10 Jan 2019 13:02:28 +0100
Message-ID: <20190110120228.GB3430@localhost>
References: <20181209195150.5192-1-andreas@kemnade.info>
 <20181209195150.5192-2-andreas@kemnade.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181209195150.5192-2-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Kemnade <andreas@kemnade.info>
Cc: johan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
List-Id: devicetree@vger.kernel.org

On Sun, Dec 09, 2018 at 08:51:46PM +0100, Andreas Kemnade wrote:
> The api forbids writing data there otherwise. Prepare for the
> serdev_open()/close() being a part of runtime pm.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
> Changes in v2:
>  add locking
> 
>  drivers/gnss/sirf.c | 28 +++++++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gnss/sirf.c b/drivers/gnss/sirf.c
> index 2c22836d3ffd..ba663de1db49 100644
> --- a/drivers/gnss/sirf.c
> +++ b/drivers/gnss/sirf.c
> @@ -35,6 +35,12 @@ struct sirf_data {
>  	struct gpio_desc *wakeup;
>  	int irq;
>  	bool active;
> +	/*
> +	 * There might be races between returning data and closing the gnss
> +	 * device.
> +	 */

Please drop this comment, which is too verbose. The mutex protects the
opened flag, and that could be indicated using a new line above the
mutex and below the flag, or using a short comment before the mutex.

> +	struct mutex gdev_mutex;

Please rename "mutex". We should be able to reuse this for the serdev
open count as well, right?

> +	bool opened;

Rename "open" (i.e. same tense as "active").

And just add a newline here too.

>  	wait_queue_head_t power_wait;
>  };
>  
> @@ -44,6 +50,7 @@ static int sirf_open(struct gnss_device *gdev)
>  	struct serdev_device *serdev = data->serdev;
>  	int ret;
>  
> +	data->opened = true;

Always hold the mutex when manipulating the open flag so we don't have
to worry about ordering issues.

>  	ret = serdev_device_open(serdev);
>  	if (ret)
>  		return ret;
> @@ -55,6 +62,7 @@ static int sirf_open(struct gnss_device *gdev)
>  	if (ret < 0) {
>  		dev_err(&gdev->dev, "failed to runtime resume: %d\n", ret);
>  		pm_runtime_put_noidle(&serdev->dev);
> +		data->opened = false;

And to avoid problems on error paths.

>  		goto err_close;
>  	}
>  
> @@ -74,6 +82,9 @@ static void sirf_close(struct gnss_device *gdev)
>  	serdev_device_close(serdev);
>  
>  	pm_runtime_put(&serdev->dev);

Add a newline here.

> +	mutex_lock(&data->gdev_mutex);
> +	data->opened = false;
> +	mutex_unlock(&data->gdev_mutex);
>  }
>  
>  static int sirf_write_raw(struct gnss_device *gdev, const unsigned char *buf,
> @@ -105,8 +116,22 @@ static int sirf_receive_buf(struct serdev_device *serdev,
>  {
>  	struct sirf_data *data = serdev_device_get_drvdata(serdev);
>  	struct gnss_device *gdev = data->gdev;
> +	int ret = 0;
> +
> +	/*
> +	 * we might come here everytime when runtime is resumed
> +	 * and data is received. Two cases are possible
> +	 * 1. device is opened during initialisation
> +	 * 2. kernel is compiled without runtime pm
> +	 *    and device is opened all the time
> +	 */

This comments makes little sense with the current code. Please remove.

> +	mutex_lock(&data->gdev_mutex);
> +	if (data->opened)
> +		ret = gnss_insert_raw(gdev, buf, count);
>  

No new line (or add one after mutex_lock() above).

> -	return gnss_insert_raw(gdev, buf, count);
> +	mutex_unlock(&data->gdev_mutex);
> +
> +	return ret;
>  }
>  
>  static const struct serdev_device_ops sirf_serdev_ops = {
> @@ -275,6 +300,7 @@ static int sirf_probe(struct serdev_device *serdev)
>  	data->serdev = serdev;
>  	data->gdev = gdev;
>  
> +	mutex_init(&data->gdev_mutex);
>  	init_waitqueue_head(&data->power_wait);
>  
>  	serdev_device_set_drvdata(serdev, data);

Johan
