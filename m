From: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v8 2/2] Add support for OV5647 sensor.
Date: Mon, 13 Feb 2017 22:19:44 +0200
Message-ID: <551549a2-bd4d-9aed-b4b0-fa54e851f6ff@mentor.com>
References: <cover.1486984040.git.roliveir@synopsys.com>
 <6b023e996ec7bcfc84b489f8d700eeff328bef7b.1486984040.git.roliveir@synopsys.com>
 <b947bd60-b08b-1841-eb8c-ee275a234ef3@mentor.com>
 <b44432b0-34aa-dd36-db4c-f154c98932e4@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b44432b0-34aa-dd36-db4c-f154c98932e4-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ramiro Oliveira <Ramiro.Oliveira-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: CARLOS.PALMINHA-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Ivaylo Dimitrov <ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Ramiro,

On 02/13/2017 09:14 PM, Ramiro Oliveira wrote:
> Hi Vladimir,
> 
> Thank you for your feedback.
> 
> On 2/13/2017 12:21 PM, Vladimir Zapolskiy wrote:
>> Hello Ramiro,
>>
>> On 02/13/2017 01:25 PM, Ramiro Oliveira wrote:
>>> Modes supported:
>>>  - 640x480 RAW 8
>>>

[snip]

>>> +static int ov5647_probe(struct i2c_client *client,
>>> +			const struct i2c_device_id *id)
>>> +{
>>> +	struct device *dev = &client->dev;
>>> +	struct ov5647 *sensor;
>>> +	int ret;
>>> +	struct v4l2_subdev *sd;
>>> +
>>> +	dev_info(&client->dev, "Installing OmniVision OV5647 camera driver\n");
>>
>> Please remove the informational line, it will pollute the kernel log for no
>> good reason.
>>
> 
> Is it okay if I change it to debug?
> 

Most probably here it is okay to change it to dev_dbg(), however

1) please note that ftrace functionality should provide all the magic for you,
   and by the way this makes dev_dbg() calls from ov5647_write(), ov5647_read(),
   ov5647_stream_on(), ov5647_stream_off() and __sensor_init() all redundant,

2) please move the informational message to the end of the .probe function,
   right before returning success to avoid duplicates on deferred re-probing:

	dev_dbg(&client->dev, "OmniVision OV5647 camera driver probed\n");
	                                                      ^^^^^^^^
[snip]

>>> +
>>> +static const struct i2c_device_id ov5647_id[] = {
>>> +	{ "ov5647", 0 },
>>> +	{ }
>>> +};
>>> +MODULE_DEVICE_TABLE(i2c, ov5647_id);
>>> +
>>> +#if IS_ENABLED(CONFIG_OF)
>>
>> From Kconfig the driver depends on OF.
>>
> 
> You're right. Do you think I should remove the dependency in Kconfig or the
> check here?
> 

Let see...

I've been able to locate only one place where OF dependency is utterly needed:

	ret = of_property_read_u32(dev->of_node, "clock-frequency",
				    &sensor->xclk_freq);
	if (ret) {
		dev_err(dev, "could not get xclk frequency\n");
		return ret;
	}

It might be preferred to change this snippet of code into something like one
below:

	sensor->xclk_freq = clk_get_rate(sensor->xclk);
	if (sensor->xclk_freq != 30000000) {
		dev_err(dev, "Unsupported clock frequency: %lu\n",
			sensor->xclk_freq);
		return -EINVAL;
	}

Then

1) in case of an OF platform "xclk" clock frequency can be set directly
   in a board DTS file, please reference to clock-bindings.txt,
2) next you can drop 'clock-frequency' property from the sensor bindings,
3) you can drop 'depends on OF' from drivers/media/i2c/Kconfig,
4) you can drop 'clk_set_rate()' from sensor_power().

The proposed code is slightly more flexible, at least the change gives
a little chance to run the driver successfully on a non-OF platform,
otherwise it is known in advance that the driver is unusable on any
non-OF platforms and thus an explicit CONFIG_OF build dependency makes
sense.

>>> +static const struct of_device_id ov5647_of_match[] = {
>>> +	{ .compatible = "ovti,ov5647" },
>>> +	{ /* sentinel */ },
>>> +};
>>> +MODULE_DEVICE_TABLE(of, ov5647_of_match);
>>> +#endif
>>> +
>>> +/**
>>> + * @short i2c driver structure
>>> + */
>>> +static struct i2c_driver ov5647_driver = {
>>> +	.driver = {
>>> +		.of_match_table = of_match_ptr(ov5647_of_match),
>>
>> Same comment as above, from Kconfig the driver depends on OF.
>>
> 
> I'm sorry but I'm not understanding what you're trying to say.
> 

You may take a look at of_match_ptr() macro definition from include/linux/of.h:

#ifdef CONFIG_OF
...
#define of_match_ptr(_ptr)      (_ptr)
...
#else
...
#define of_match_ptr(_ptr)      NULL
...
#endif

Hence if the code compilation always depends on the enabled CONFIG_OF option,
then of_match_ptr() macro should be dropped:

	.of_match_table = ov5647_of_match,

>>> +		.owner	= THIS_MODULE,
>>
>> .owner is set by the core, please remove it.
>>
> 
> Ok.
> 
>>> +		.name	= "ov5647",
>>
>> May be .name = SENSOR_NAME, ?
>>
>> Otherwise SENSOR_NAME macro is unused and it should be removed.
>>
> 
> I'll change it to .name = SENSOR_NAME,
> 
>>> +	},
>>> +	.probe		= ov5647_probe,
>>> +	.remove		= ov5647_remove,
>>> +	.id_table	= ov5647_id,
>>> +};
>>> +
>>> +module_i2c_driver(ov5647_driver);
>>> +
>>> +MODULE_AUTHOR("Ramiro Oliveira <roliveir-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>");
>>> +MODULE_DESCRIPTION("A low-level driver for OmniVision ov5647 sensors");
>>> +MODULE_LICENSE("GPL v2");
>>>
>>

--
With best wishes,
Vladimir
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
