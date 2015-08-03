From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 2/2] iio: proximity: add support for PulsedLight LIDAR
Date: Mon, 03 Aug 2015 10:00:29 +0200
Message-ID: <55BF1F9D.30207@metafoo.de>
References: <1438401484-22101-1-git-send-email-mranostay@gmail.com>	<1438401484-22101-3-git-send-email-mranostay@gmail.com>	<55BDE5F8.9090201@metafoo.de> <CAKzfze_ZNeSBo_hKn4ju1uNM4iyaFrvGo89Dv_80DK3Tfb24yg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKzfze_ZNeSBo_hKn4ju1uNM4iyaFrvGo89Dv_80DK3Tfb24yg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex-ynQEQJNshbs@public.gmane.org>, Matt Porter <matt-agtwNxEcTQJWk0Htik3J/w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/02/2015 11:28 PM, Matt Ranostay wrote:
> On Sun, Aug 2, 2015 at 2:42 AM, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org> wrote:
>> On 08/01/2015 05:58 AM, Matt Ranostay wrote:
>> [...]
>>> +
>>> +struct lidar_data {
>>> +     struct mutex lock;
>>> +     struct iio_dev *indio_dev;
>>> +     struct i2c_client *client;
>>> +
>>> +     /* config */
>>> +     int calib_bias;
>>> +
>>> +     u16 buffer[5]; /* 2 byte distance + 8 byte timestamp */
>>
>> Needs to be in its own cacheline to avoid issues if the I2C controller is
>> using DMA.
> 
> Ah though this was only needed for SPI.

At least some I2C master drivers directly use the buffer for DMA. But I was
being stupid here anyway, you don't actually pass the buffer itself to the
I2C transfer functions so everything is fine as it was.

> 
>>
>>         u16 buffer[5] ____cacheline_aligned;
>>
>>> +};
>> [...]
>>> +static inline int lidar_read_byte(struct lidar_data *data, int reg)
>>
>> I'd drop the inline. The compiler is smart enough to figure out whether it
>> makes sense to inline it or not.
>>
> Got it.
> 
>>> +{
>>> +     struct i2c_client *client = data->client;
>>> +     int ret;
>>> +
>>> +     ret = i2c_smbus_write_byte(client, reg);
>>> +     if (ret < 0) {
>>> +             dev_err(&client->dev, "cannot write addr value");
>>> +             return ret;
>>> +     }
>>> +
>>> +     ret = i2c_smbus_read_byte(client);
>>> +     if (ret < 0) {
>>> +             dev_err(&client->dev, "cannot read data value");
>>> +             return ret;
>>> +     }
>>
>> Instead of using a write_byte/read_byte combination rather use
>> i2c_smbus_read_byte_data(). I think that will do the same, but in one atomic
>> operation.
> Yes I would normally do that but this device doesn't seem to support
> that functionally, always returns zeros.

That's an interesting device. Maybe add a comment explaining the oddity. I'm
sure I'm not the only one who'll wonder about this.

[...]
>>> +static struct i2c_driver lidar_driver = {
>>> +     .driver = {
>>> +             .name   = LIDAR_DRV_NAME,
>>> +             .owner  = THIS_MODULE,
>>
>> You added a DT vendor prefix, but there is no of match table for the driver.
> 
> So without of_match_table it isn't needed to have a vendor id?
> "pulsedlight,lidar" maps to the i2c_device_id

I thinking the other way around. If you intend to instantiate the device via
devicetree it is better to explicit add a of_device_id table rather than
relying on the implicit mechanism that uses i2c_device_id.

You should also add an entry for the device to
Documentation/devicetree/bindings/i2c/trivial-devices.txt
