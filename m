From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [PATCHv4 12/15] ov2640: add MC support
Date: Fri, 10 Mar 2017 12:23:02 +0100
Message-ID: <3d9a96ec-47b0-d2a1-e78e-2e89e34df63a@xs4all.nl>
References: <20170310102614.20922-1-hverkuil@xs4all.nl>
 <20170310102614.20922-13-hverkuil@xs4all.nl>
 <20170310111531.GE3220@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170310111531.GE3220-S+BSfZ9RZZmRSg0ZkenSGLdO1Tsj/99ntUK59QYPAWc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guennadi Liakhovetski <guennadi.liakhovetski-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Songjun Wu <songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/03/17 12:15, Sakari Ailus wrote:
> Hi Hans,
> 
> On Fri, Mar 10, 2017 at 11:26:11AM +0100, Hans Verkuil wrote:
>> From: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
>>
>> The MC support is needed by the em28xx driver.
>>
>> Signed-off-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/media/i2c/ov2640.c | 21 +++++++++++++++++++--
>>  1 file changed, 19 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov2640.c b/drivers/media/i2c/ov2640.c
>> index 0445963c5fae..00df042fd6f1 100644
>> --- a/drivers/media/i2c/ov2640.c
>> +++ b/drivers/media/i2c/ov2640.c
>> @@ -282,6 +282,9 @@ struct ov2640_win_size {
>>  
>>  struct ov2640_priv {
>>  	struct v4l2_subdev		subdev;
>> +#if defined(CONFIG_MEDIA_CONTROLLER)
>> +	struct media_pad pad;
>> +#endif
>>  	struct v4l2_ctrl_handler	hdl;
>>  	u32	cfmt_code;
>>  	struct clk			*clk;
>> @@ -1073,19 +1076,30 @@ static int ov2640_probe(struct i2c_client *client,
>>  		ret = priv->hdl.error;
>>  		goto err_hdl;
>>  	}
> 
> As this is a sensor the format etc. should be accessible from the user
> space, shouldn't you have V4L2_SUBDEV_FL_HAS_DEVNODE flag for the
> sub-device as well?
> 
> The device node isn't exposed unless v4l2_device_register_subdev_nodes() is
> called anyway.

Can do this for both ov2640 and ov7670.

> 
>> +#if defined(CONFIG_MEDIA_CONTROLLER)
>> +	priv->pad.flags = MEDIA_PAD_FL_SOURCE;
>> +	priv->subdev.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>> +	ret = media_entity_pads_init(&priv->subdev.entity, 1, &priv->pad);
>> +	if (ret < 0)
>> +		goto err_hdl;
>> +#endif
>>  
>>  	ret = ov2640_video_probe(client);
>>  	if (ret < 0)
>> -		goto err_hdl;
>> +		goto err_videoprobe;
>>  
>>  	ret = v4l2_async_register_subdev(&priv->subdev);
>>  	if (ret < 0)
>> -		goto err_hdl;
>> +		goto err_videoprobe;
>>  
>>  	dev_info(&adapter->dev, "OV2640 Probed\n");
>>  
>>  	return 0;
>>  
>> +err_videoprobe:
>> +#if defined(CONFIG_MEDIA_CONTROLLER)
>> +	media_entity_cleanup(&priv->subdev.entity);
> 
> I believe you can call media_entity_cleanup() as the function does nothing
> right now. In general, we should provide nop variants if MC is disabled.

You mean that I don't have to check CONFIG_MEDIA_CONTROLLER for this, right?

Makes sense.

> 
>> +#endif
>>  err_hdl:
>>  	v4l2_ctrl_handler_free(&priv->hdl);
>>  err_clk:
>> @@ -1099,6 +1113,9 @@ static int ov2640_remove(struct i2c_client *client)
>>  
>>  	v4l2_async_unregister_subdev(&priv->subdev);
>>  	v4l2_ctrl_handler_free(&priv->hdl);
>> +#if defined(CONFIG_MEDIA_CONTROLLER)
>> +	media_entity_cleanup(&priv->subdev.entity);
>> +#endif
>>  	v4l2_device_unregister_subdev(&priv->subdev);
>>  	clk_disable_unprepare(priv->clk);
>>  	return 0;
> 

Regards,

	Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
