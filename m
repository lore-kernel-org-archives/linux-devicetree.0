From: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 16/34] [media] add Omnivision OV5640 sensor driver
Date: Sat, 3 Jun 2017 11:02:21 -0700
Message-ID: <ab04379b-d005-1251-343b-5e490ee6e72d@gmail.com>
References: <1495672189-29164-1-git-send-email-steve_longerbeam@mentor.com>
 <1495672189-29164-17-git-send-email-steve_longerbeam@mentor.com>
 <20170529155511.GI29527@valkosipuli.retiisi.org.uk>
 <c50c3c5f-71cf-fa73-f5a8-a4b5f59a87dc@gmail.com>
 <20170530065632.GK29527@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170530065632.GK29527-S+BSfZ9RZZmRSg0ZkenSGLdO1Tsj/99ntUK59QYPAWc@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-me
List-Id: devicetree@vger.kernel.org

Hi Sakari,


On 05/29/2017 11:56 PM, Sakari Ailus wrote:
> Hi Steve,
> 
> On Mon, May 29, 2017 at 02:50:34PM -0700, Steve Longerbeam wrote:
>>> <snip>
>>>
>>>> +
>>>> +static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
>>>> +{
>>>> +	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
>>>> +	struct ov5640_dev *sensor = to_ov5640_dev(sd);
>>>> +	int ret = 0;
>>>> +
>>>> +	mutex_lock(&sensor->lock);
>>> Could you use the same lock for the controls as you use for the rest? Just
>>> setting handler->lock after handler init does the trick.
>>
>> Can you please rephrase, I don't follow. "same lock for the controls as
>> you use for the rest" - there's only one device lock owned by this driver
>> and I am already using that same lock.
> 
> There's another in the control handler. You could use your own lock for the
> control handler as well.

I still don't understand.

> 
>>
>>
>>> <snip>
>>>> +
>>>> +static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
>>>> +{
>>>> +	struct ov5640_dev *sensor = to_ov5640_dev(sd);
>>>> +	int ret = 0;
>>>> +
>>>> +	mutex_lock(&sensor->lock);
>>>> +
>>>> +#if defined(CONFIG_MEDIA_CONTROLLER)
>>>> +	if (sd->entity.stream_count > 1)
>>> The entity stream_count isn't connected to the number of times s_stream(sd,
>>> true) is called. Please remove the check.
>>
>> It's incremented by media_pipeline_start(), even if the entity is already
>> a member of the given pipeline.
>>
>> I added this check because in imx-media, the ov5640 can be streaming
>> concurrently to multiple video capture devices, and each capture device
>> calls
>> media_pipeline_start() at stream on, which increments the entity stream
>> count.
>>
>> So if one capture device issues a stream off while others are still
>> streaming,
>> ov5640 should remain at stream on. So the entity stream count is being
>> used as a streaming usage counter. Is there a better way to do this? Should
>> I use a private stream use counter instead?
> 
> Different drivers may use media_pipeline_start() in different ways. Stream
> control shouldn't depend on that count. This could cause issues in using the
> driver with other ISP / receiver drivers.
> 
> I think it should be enough to move the check to the imx driver in this
> case.


I will remove this check.


>>>> +
>>>> +static int ov5640_remove(struct i2c_client *client)
>>>> +{
>>>> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>>>> +	struct ov5640_dev *sensor = to_ov5640_dev(sd);
>>>> +
>>>> +	regulator_bulk_disable(OV5640_NUM_SUPPLIES, sensor->supplies);
>>> Ditto.
>>
>> I don't understand. regulator_bulk_disable() is still needed, am I missing
>> something?
> 
> You still need to enable it first. I don't see that being done in probe. As
> the driver implements the s_power() op, I don't see a need for powering the
> device on at probe time (and conversely off at remove time).

Oh you're right, it must have been left over from a previous revision
I guess. Yes, regulator_bulk_enable|disable() is only called in
ov5640_set_power(). I'll remove regulator_bulk_disable() from
probe/remove.

Steve


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
