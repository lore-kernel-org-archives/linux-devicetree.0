From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH 1/5] [media] tc358743: register v4l2 asynchronous subdevice
Date: Mon, 13 Jul 2015 12:47:21 +0200
Message-ID: <55A39739.5030408@xs4all.nl>
References: <1436533897-3060-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1436533897-3060-1-git-send-email-p.zabel@pengutronix.de>
Sender: linux-media-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>, Mats Randgaard <matrandg@cisco.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

On 07/10/2015 03:11 PM, Philipp Zabel wrote:
> Add support for registering the sensor subdevice using the v4l2-async API.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  drivers/media/i2c/tc358743.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
> index 34d4f32..48d1575 100644
> --- a/drivers/media/i2c/tc358743.c
> +++ b/drivers/media/i2c/tc358743.c
> @@ -1710,6 +1710,16 @@ static int tc358743_probe(struct i2c_client *client,
>  		goto err_hdl;
>  	}
>  
> +	state->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	err = media_entity_init(&sd->entity, 1, &state->pad, 0);
> +	if (err < 0)
> +		goto err_hdl;
> +
> +	sd->dev = &client->dev;
> +	err = v4l2_async_register_subdev(sd);
> +	if (err < 0)
> +		goto err_hdl;
> +
>  	mutex_init(&state->confctl_mutex);
>  
>  	INIT_DELAYED_WORK(&state->delayed_work_enable_hotplug,
> @@ -1740,6 +1750,7 @@ err_work_queues:
>  	destroy_workqueue(state->work_queues);
>  	mutex_destroy(&state->confctl_mutex);
>  err_hdl:
> +	media_entity_cleanup(&sd->entity);
>  	v4l2_ctrl_handler_free(&state->hdl);
>  	return err;
>  }
> @@ -1751,6 +1762,7 @@ static int tc358743_remove(struct i2c_client *client)
>  
>  	cancel_delayed_work(&state->delayed_work_enable_hotplug);
>  	destroy_workqueue(state->work_queues);
> +	v4l2_async_unregister_subdev(sd);

Shouldn't there be a media_entity_cleanup() call in tc358743_remove() as well?

Regards,

	Hans

>  	v4l2_device_unregister_subdev(sd);
>  	mutex_destroy(&state->confctl_mutex);
>  	v4l2_ctrl_handler_free(&state->hdl);
> 
