From: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 16/24] media: Add i.MX media core driver
Date: Mon, 23 Jan 2017 17:38:33 -0800
Message-ID: <481289bb-424f-4ac4-66f1-7e1b4a0b7065@gmail.com>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com>
 <1483755102-24785-17-git-send-email-steve_longerbeam@mentor.com>
 <1484320822.31475.96.camel@pengutronix.de>
 <a94025b4-c4dd-de51-572e-d2615a7246e4@gmail.com>
 <1484574468.8415.136.camel@pengutronix.de>
 <e38feca9-ed6f-8288-e006-768d6ba2fe5a@gmail.com>
 <1485170006.2874.63.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1485170006.2874.63.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Steve Longerbeam <steve_longerbeam@me>
List-Id: devicetree@vger.kernel.org



On 01/23/2017 03:13 AM, Philipp Zabel wrote:
> Hi Steve,
>
> On Sun, 2017-01-22 at 18:31 -0800, Steve Longerbeam wrote:
>> On 01/16/2017 05:47 AM, Philipp Zabel wrote:
>>> On Sat, 2017-01-14 at 14:46 -0800, Steve Longerbeam wrote:
>>> [...]
>>>>>> +Unprocessed Video Capture:
>>>>>> +--------------------------
>>>>>> +
>>>>>> +Send frames directly from sensor to camera interface, with no
>>>>>> +conversions:
>>>>>> +
>>>>>> +-> ipu_smfc -> camif
>>>>> I'd call this capture interface, this is not just for cameras. Or maybe
>>>>> idmac if you want to mirror hardware names?
>>>> Camif is so named because it is the V4L2 user interface for video
>>>> capture. I suppose it could be named "capif", but that doesn't role
>>>> off the tongue quite as well.
>>> Agreed, capif sounds weird. I find camif a bit confusing though, because
>>> Samsung S3C has a camera interface that is actually called "CAMIF".
>> how about simply "capture" ?
> That sounds good to me.

done.

>
>>>>> This should really be handled by v4l2_pipeline_pm_use.
>>>> I thought about this earlier, but v4l2_pipeline_pm_use() seems to be
>>>> doing some other stuff that bothered me, at least that's what I remember.
>>>> I will revisit this.
>>> I have used it with a tc358743 -> mipi-csi2 pipeline, it didn't cause
>>> any problems. It would be better to reuse and, if necessary, fix the
>>> existing infrastructure where available.
>> I tried this API, by switching to v4l2_pipeline_pm_use() in camif
>> open/release,
>> and switched to v4l2_pipeline_link_notify() instead of
>> imx_media_link_notify()
>> in the media driver's media_device_ops.
>>
>> This API assumes the video device has an open file handle while the media
>> links are being established. This doesn't work for me, I want to be able to
>> establish the links using 'media-ctl -l', and that won't work unless
>> there is an
>> open file handle on the video capture device node.
>>
>> Also, I looked into calling v4l2_pipeline_pm_use() during
>> imx_media_link_notify(),
>> instead of imx_media_pipeline_set_power(). Again there are problems with
>> that.
>>
>> First, v4l2_pipeline_pm_use() acquires the graph mutex, so it can't be
>> called inside
>> link_notify which already acquires that lock. The header for this
>> function also
>> clearly states it should only be called in open/release.
> So why not call it in open/release then?

er, see above (?)

>
>> Second, ignoring the above locking issue for a moment,
>> v4l2_pipeline_pm_use()
>> will call s_power on the sensor _first_, then the mipi csi-2 s_power,
>> when executing
>> media-ctl -l '"ov5640 1-003c":0 -> "imx6-mipi-csi2":0[1]'. Which is the
>> wrong order.
>> In my version which enforces the correct power on order, the mipi csi-2
>> s_power
>> is called first in that link setup, followed by the sensor.
> I don't understand why you want to power up subdevs as soon as the links
> are established.

Because that is the precedence, all other media drivers do pipeline
power on/off at link_notify. And v4l2_pipeline_link_notify() was written
as a link_notify method.

>   Shouldn't that rather be done for all subdevices in the
> pipeline when the corresponding capture device is opened?

that won't work. There's no guarantee the links will be established
at capture device open time.

> It seems to me that powering up the pipeline should be the last step
> before userspace actually starts the capture.

Well, I'm ok with moving pipeline power on/off to start/stop streaming.
I would actually prefer to do it then, I only chose at link_notify because
of precedence. I'll look into it.

Steve

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
