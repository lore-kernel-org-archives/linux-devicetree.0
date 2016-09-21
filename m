From: Todor Tomov <todor.tomov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 2/2] media: Add a driver for the ov5645 camera sensor.
Date: Wed, 21 Sep 2016 17:01:15 +0300
Message-ID: <57E292AB.9060808@linaro.org>
References: <1467989679-29774-1-git-send-email-todor.tomov@linaro.org>
 <1467989679-29774-3-git-send-email-todor.tomov@linaro.org>
 <20160824101708.GI12130@valkosipuli.retiisi.org.uk>
 <57BDBC2F.7020902@linaro.org>
 <20160825071800.GK12130@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160825071800.GK12130-S+BSfZ9RZZmRSg0ZkenSGLdO1Tsj/99ntUK59QYPAWc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, matrandg-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Sakari,

One more question below:

On 08/25/2016 10:18 AM, Sakari Ailus wrote:
>>>> +
>>>> +static struct v4l2_subdev_core_ops ov5645_core_ops = {
>>>> +	.s_power = ov5645_s_power,
>>>> +};
>>>> +
>>>> +static struct v4l2_subdev_video_ops ov5645_video_ops = {
>>>> +	.s_stream = ov5645_s_stream,
>>>> +};
>>>> +
>>>> +static struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
>>>> +	.enum_mbus_code = ov5645_enum_mbus_code,
>>>> +	.enum_frame_size = ov5645_enum_frame_size,
>>>> +	.get_fmt = ov5645_get_format,
>>>> +	.set_fmt = ov5645_set_format,
>>>> +	.get_selection = ov5645_get_selection,
>>>
>>> Could you add init_cfg() pad op to initialise the try format and selections?
>>
>> Yes, I'll do that.

If I follow the code correctly this init_cfg() is called whenever the device is opened, right?
This means that the format will be reset to default values every time the userspace opens the device.
So I wonder if this is what we really want, or do we want to keep the last set format instead. For
example if we use media-ctl only to get the current format, this is already enough - it opens the
subdev node and resets the format to default.


-- 
Best regards,
Todor Tomov
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
