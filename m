From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] iio: proximity: add support for PulsedLight LIDAR
Date: Sun, 2 Aug 2015 20:52:58 +0100
Message-ID: <55BE751A.5040308@kernel.org>
References: <1438401484-22101-1-git-send-email-mranostay@gmail.com>
 <1438401484-22101-3-git-send-email-mranostay@gmail.com>
 <55BDE5F8.9090201@metafoo.de> <55BE6025.5030001@kernel.org>
 <55BE63F2.5080204@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55BE63F2.5080204-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, marex-ynQEQJNshbs@public.gmane.org, matt-agtwNxEcTQJWk0Htik3J/w@public.gmane.org, pantelis.antoniou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/08/15 19:39, Lars-Peter Clausen wrote:
> On 08/02/2015 08:23 PM, Jonathan Cameron wrote:
>> On 02/08/15 10:42, Lars-Peter Clausen wrote:
>>> On 08/01/2015 05:58 AM, Matt Ranostay wrote:
>>> [...]
>>>> +
>>>> +struct lidar_data {
>>>> +	struct mutex lock;
>>>> +	struct iio_dev *indio_dev;
>>>> +	struct i2c_client *client;
>>>> +
>>>> +	/* config */
>>>> +	int calib_bias;
>>>> +
>>>> +	u16 buffer[5]; /* 2 byte distance + 8 byte timestamp */
>>>
>>> Needs to be in its own cacheline to avoid issues if the I2C controller is
>>> using DMA.
>> Would do if spi, but in the case of i2c I thought all bus drivers were
>> obliged to deal with this rather than leaving it to the client drivers?
> 
> Where did you find this? There definitely seem to be I2C drivers which
> directly map the i2c_msg buffers.
Right now I can't track down an explicit reference.  However, all sorts
of nastiness occurs if we end up using the i2c_smbus_xfer_emulated as
that uses local buffers on the stack.

Hmm. Will look into this more when I get a chance.  We have a lot of
i2c drivers that don't have aligned buffers...

> 
> But I just realized that in this case the buffer is not passed to the i2c
> driver anyway so we should be fine.
> 
> - Lars
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
