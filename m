From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/2] iio: light: add support for TI's opt3001 light
 sensor
Date: Sun, 19 Jul 2015 14:16:17 +0100
Message-ID: <55ABA321.1030800@kernel.org>
References: <1435876079-26287-1-git-send-email-dannenberg@ti.com> <1435876079-26287-2-git-send-email-dannenberg@ti.com> <55993A4C.10105@kernel.org> <559D5366.8030003@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <559D5366.8030003-l0cyMroinI0@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas Dannenberg <dannenberg-l0cyMroinI0@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/07/15 17:44, Andreas Dannenberg wrote:
> On 07/05/2015 09:08 AM, Jonathan Cameron wrote:
> <snip>
>> Looking pretty good to me, though I'd like to give Peter time to take
>> another look and give his reviewed-by etc.
>>
>> One really minor suggestion from me...
>> <snip>
>>> +
>>> +static int opt3001_probe(struct i2c_client *client,
>>> +		const struct i2c_device_id *id)
>>> +{
>>> +	struct device *dev = &client->dev;
>>> +
>>> +	struct iio_dev *iio;
>>> +	struct opt3001 *opt;
>>> +	int irq = client->irq;
>>> +	int ret = -ENOMEM;
>>> +
>>> +	iio = devm_iio_device_alloc(dev, sizeof(*opt));
>>> +	if (!iio)
>> return -ENOMEM; would be cleaner, then there is no need to initialize
>> ret either.
> 
> Hi Jonathan,
> thanks for looking at my code. While we are waiting for additional feedback would you
> like me to go ahead and re-spin/re-test the patch with your latest suggestion?
> 
> Regards,
> 
Not to worry, I made that trivial change when applying.
There was also some fuzz in the makefiles and kconfig as
a result of other drivers going in, but all trivial.

Applied to the togreg branch of iio.git.

Thanks,

Jonathan
