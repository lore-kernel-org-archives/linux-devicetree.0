From: Ramiro Oliveira <Ramiro.Oliveira-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v9 2/2] Add support for OV5647 sensor.
Date: Wed, 22 Feb 2017 10:51:21 +0000
Message-ID: <94622194-78dc-ad6f-3f6e-4d7df0ac5383@synopsys.com>
References: <cover.1487334912.git.roliveir@synopsys.com>
 <412e51e695630281d2084a77c0329fd273ea00d7.1487334912.git.roliveir@synopsys.com>
 <cea82e22-07eb-dd8a-c781-7384ac27823e@mentor.com>
 <c39814c2-20a0-db08-38c1-ce95ccc49738@synopsys.com>
 <21847f33-901c-7d26-15d8-6b92f10c8b15@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <21847f33-901c-7d26-15d8-6b92f10c8b15-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Ramiro Oliveira <Ramiro.Oliveira-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: CARLOS.PALMINHA-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Ivaylo Dimitrov <ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Zakari,

On 2/21/2017 8:36 PM, Vladimir Zapolskiy wrote:
> Hi Ramiro,
> 
> On 02/21/2017 06:42 PM, Ramiro Oliveira wrote:
>> Hi Vladimir,
>>
>> Thank you for your feedback
>>
>> On 2/21/2017 3:54 PM, Vladimir Zapolskiy wrote:
>>> Hi Ramiro,
>>>
>>> please find some review comments below.
>>>
>>> On 02/17/2017 03:14 PM, Ramiro Oliveira wrote:
>>>> The OV5647 sensor from Omnivision supports up to 2592x1944 @ 15 fps, RAW 8
>>>> and RAW 10 output formats, and MIPI CSI-2 interface.
>>>>
>>>> The driver adds support for 640x480 RAW 8.
>>>>
>>>> Signed-off-by: Ramiro Oliveira <roliveir-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>>>> ---
>>>
>>> [snip]
>>>
>>>> +
>>>> +struct ov5647 {
>>>> +	struct v4l2_subdev		sd;
>>>> +	struct media_pad		pad;
>>>> +	struct mutex			lock;
>>>> +	struct v4l2_mbus_framefmt	format;
>>>> +	unsigned int			width;
>>>> +	unsigned int			height;
>>>> +	int				power_count;
>>>> +	struct clk			*xclk;
>>>> +	/* External clock frequency currently supported is 30MHz */
>>>> +	u32				xclk_freq;
>>>
>>> See a comment about 25MHz vs 30MHz below.
>>>
>>> Also I assume you can remove 'xclk_freq' from the struct fields,
>>> it can be replaced by a local variable.
>>>
>>
>> I'll do that.
>>
>>>> +};
>>>
>>> [snip]
>>>
>>>> +
>>>> +static int ov5647_read(struct v4l2_subdev *sd, u16 reg, u8 *val)
>>>> +{
>>>> +	int ret;
>>>> +	unsigned char data_w[2] = { reg >> 8, reg & 0xff };
>>>> +	struct i2c_client *client = v4l2_get_subdevdata(sd);
>>>> +
>>>> +	ret = i2c_master_send(client, data_w, 2);
>>>> +	if (ret < 0) {
>>>> +		dev_dbg(&client->dev, "%s: i2c read error, reg: %x\n",
>>>
>>> s/i2c read error/i2c write error/
>>>
>>
>> I'm not sure I understand what you mean.
> 
> That's a sed expression for string substitution. Here you do i2c_master_send()
> but dev_dbg() comment says "i2c read error". It's a simple copy-paste typo to fix.
> 

Ohh... now I see. I'll change it.

>>>> +			__func__, reg);
>>>> +		return ret;
>>>> +	}
>>>> +
> 
> [snip]
> 
>>>> +
>>>> +static int sensor_power(struct v4l2_subdev *sd, int on)
> 
> On the caller's side (functions ov5647_open() and ov5647_close()) the second
> argument of the function is of 'bool' type, however .s_power callback from
> struct v4l2_subdev_core_ops (see include/media/v4l2-subdev.h) defines it as
> 'int'.
> 
> It's just a nitpicking, please feel free to ignore the comment above or
> please consider to change the arguments on callers' side to integers.
> 
> Also you may consider to add 'ov5647_' prefix to the function name to
> distinguish it from a potentially added in future sensor_power() function,
> the original name sounds too generic.
> 

OK. I'll add the prefix and change the variable type from int to bool.

>>>> +{
>>>> +	int ret;
>>>> +	struct ov5647 *ov5647 = to_state(sd);
>>>> +	struct i2c_client *client = v4l2_get_subdevdata(sd);
>>>> +
>>>> +	ret = 0;
>>>> +	mutex_lock(&ov5647->lock);
>>>> +
>>>> +	if (on && !ov5647->power_count)	{
>>>> +		dev_dbg(&client->dev, "OV5647 power on\n");
>>>> +
>>>> +		clk_set_rate(ov5647->xclk, ov5647->xclk_freq);
>>>
>>> Now clk_set_rate() is redundant, please remove it.
>>>
>>> If once it is needed again, please move it to the .probe function, so
>>> it is called only once in the runtime.
>>>
>>
>> Ok. I'll remove it for now.
>>
>>>> +
>>>> +		ret = clk_prepare_enable(ov5647->xclk);
>>>
>>> I wonder would it be possible to unload the driver or to unbind the device
>>> and leave the clock unintentionally enabled? If yes, then this is a bug.
>>>
>>
>> You're saying that if the driver was unloaded and the clock was left enabled
>> when the driver was loaded again this line would cause an error?
> 
> Not exactly, here I saw a potential resource leak, namely a potentially left
> prepared/enabled clock.
> 
>>
>> Should I disable the clock when the driver is removed?
>>
> 
> The driver (and framework) shall guarantee that when it is detached from
> device(s) (e.g. by unloading "ov5647" kernel module or unbinding ov5647 device),
> all acquired resources are released.
> 
> But in this particular case most probably I've been overly alert, I believe
> that V4L2 framework correcly handles device power states, so please ignore my
> comment.
> 
> To add something valuable to the review, could you please confirm that
> ov5647_subdev_internal_ops data is in use by the driver?
> 
> E.g. shouldn't it be registered by
> 
>   sd->internal_ops = &ov5647_subdev_internal_ops;
> 
> before calling v4l2_async_register_subdev(sd) ?
> 

You're right, it's not being registered. I think I'll remove them since they
aren't being used.

> --
> With best wishes,
> Vladimir
> 

-- 
Best Regards

Ramiro Oliveira
Ramiro.Oliveira-HKixBCOQz3hWk0Htik3J/w@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
