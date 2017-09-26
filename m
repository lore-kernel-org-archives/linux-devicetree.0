From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v14 25/28] et8ek8: Add support for flash and lens devices
Date: Tue, 26 Sep 2017 10:27:00 +0200
Message-ID: <c6e8b44e-94d2-77a0-bfbc-48b45edc0c34@xs4all.nl>
References: <20170925222540.371-1-sakari.ailus@linux.intel.com>
 <20170925222540.371-27-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20170925222540.371-27-sakari.ailus@linux.intel.com>
Sender: linux-media-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: niklas.soderlund@ragnatech.se, maxime.ripard@free-electrons.com, robh@kernel.org, laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org, pavel@ucw.cz, sre@kernel.org
List-Id: devicetree@vger.kernel.org

On 26/09/17 00:25, Sakari Ailus wrote:
> Parse async sub-devices related to the sensor by switching the async
> sub-device registration function.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Hans Verkuil <hans.verkuil@cisco.com>

> ---
>  drivers/media/i2c/et8ek8/et8ek8_driver.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/et8ek8/et8ek8_driver.c b/drivers/media/i2c/et8ek8/et8ek8_driver.c
> index c14f0fd6ded3..e9eff9039ef5 100644
> --- a/drivers/media/i2c/et8ek8/et8ek8_driver.c
> +++ b/drivers/media/i2c/et8ek8/et8ek8_driver.c
> @@ -1453,7 +1453,7 @@ static int et8ek8_probe(struct i2c_client *client,
>  		goto err_mutex;
>  	}
>  
> -	ret = v4l2_async_register_subdev(&sensor->subdev);
> +	ret = v4l2_async_register_subdev_sensor_common(&sensor->subdev);
>  	if (ret < 0)
>  		goto err_entity;
>  
> 
