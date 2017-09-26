From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v14 26/28] ov5670: Add support for flash and lens devices
Date: Tue, 26 Sep 2017 10:27:08 +0200
Message-ID: <7978e2fb-6c6c-ec9a-6576-b067d8b30542@xs4all.nl>
References: <20170925222540.371-1-sakari.ailus@linux.intel.com>
 <20170925222540.371-28-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20170925222540.371-28-sakari.ailus@linux.intel.com>
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
>  drivers/media/i2c/ov5670.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
> index 6f7a1d6d2200..0a1723f5a66c 100644
> --- a/drivers/media/i2c/ov5670.c
> +++ b/drivers/media/i2c/ov5670.c
> @@ -2514,7 +2514,7 @@ static int ov5670_probe(struct i2c_client *client)
>  	}
>  
>  	/* Async register for subdev */
> -	ret = v4l2_async_register_subdev(&ov5670->sd);
> +	ret = v4l2_async_register_subdev_sensor_common(&ov5670->sd);
>  	if (ret < 0) {
>  		err_msg = "v4l2_async_register_subdev() error";
>  		goto error_entity_cleanup;
> 
