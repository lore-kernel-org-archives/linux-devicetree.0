From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 1/5] gnss: sirf: write data to gnss only when the gnss
 device is open
Date: Wed, 5 Dec 2018 15:47:39 +0100
Message-ID: <20181205144739.GE15689@localhost>
References: <20181118215801.12280-1-andreas@kemnade.info>
 <20181118215801.12280-2-andreas@kemnade.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181118215801.12280-2-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Kemnade <andreas@kemnade.info>
Cc: johan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
List-Id: devicetree@vger.kernel.org

On Sun, Nov 18, 2018 at 10:57:57PM +0100, Andreas Kemnade wrote:
> The api forbids writing data there otherwise. Prepare for the
> serdev_open()/close() being a part of runtime pm.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  drivers/gnss/sirf.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
 
> @@ -73,6 +76,7 @@ static void sirf_close(struct gnss_device *gdev)
>  	serdev_device_close(serdev);
>  
>  	pm_runtime_put(&serdev->dev);
> +	data->opened = false;
>  }
>  
>  static int sirf_write_raw(struct gnss_device *gdev, const unsigned char *buf,
> @@ -105,7 +109,17 @@ static int sirf_receive_buf(struct serdev_device *serdev,
>  	struct sirf_data *data = serdev_device_get_drvdata(serdev);
>  	struct gnss_device *gdev = data->gdev;
>  
> -	return gnss_insert_raw(gdev, buf, count);
> +	/*
> +	 * we might come here everytime when runtime is resumed
> +	 * and data is received. Two cases are possible
> +	 * 1. device is opened during initialisation
> +	 * 2. kernel is compiled without runtime pm
> +	 *    and device is opened all the time
> +	 */
> +	if (data->opened)
> +		return gnss_insert_raw(gdev, buf, count);

This can race with sirf_close() when you move serdev handling out of
sirf_open()/close(). Not sure how best to handle that yet.

Johan
