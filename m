From: Michael Hennerich <michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] iio/adc/ltc2497: Driver for Linear Technology LTC2497 ADC
Date: Wed, 29 Mar 2017 10:51:57 +0200
Message-ID: <025f8461-c823-1f07-5742-e488c3e34f9f@analog.com>
References: <1490265310-6162-1-git-send-email-michael.hennerich@analog.com>
 <6774c073-7fe4-e259-306e-3cf4621f7c69@metafoo.de>
Reply-To: <michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6774c073-7fe4-e259-306e-3cf4621f7c69-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 23.03.2017 12:05, Lars-Peter Clausen wrote:

Sorry - I missed some of this review feedback ...

>> +
>> +static int ltc2497_wait_conv(struct ltc2497_st *st)
>> +{
>> +	s64 time_elapsed;
>> +
>> +	time_elapsed = ktime_ms_delta(ktime_get(), st->time_prev);
>> +
>> +	if (time_elapsed < LTC2497_CONVERSION_TIME_MS) {
>> +		/* delay if conversion time not passed
>> +		 * since last read or write
>> +		 */
>> +		msleep(LTC2497_CONVERSION_TIME_MS - time_elapsed);
>
> Considering how long this sleeps msleep_interruptible() might be the better
> choice.

Wondering what should be the outcome of this?
We can't simply replace it. Actually I've seen cases here in drivers/iio 
where the delay is essential, but the return value of 
msleep_interruptible() is not being checked.
Thus causing a malicious access, in case a signal is received.

We must delay here. If we switch to msleep_interruptible() the only 
reason for this would be to cancel the read and return -EINTR to the user.

Also there is another msleep below which would also need this kind of 
handling.

>
>> +		return 0;
>> +	}
>> +
>> +	if (time_elapsed - LTC2497_CONVERSION_TIME_MS <= 0) {
>> +		/* We're in automatic mode -
>> +		 * so the last reading is stil not outdated
>> +		 */
>> +		return 0;
>> +	}
>> +
>> +	return -ETIMEDOUT;
>> +}
>> +
>> +static int ltc2497_read(struct ltc2497_st *st, u8 address, int *val)
>> +{
>> +	struct i2c_client *client = st->client;
>> +	__be32 buf = 0;
>
> transfer buffers must not be on the stack to avoid issues if the controller
> should use DMA.
>
>> +	int ret;
>> +
>> +	ret = ltc2497_wait_conv(st);
>> +	if (ret < 0 || st->addr_prev != address) {
>> +		ret = i2c_smbus_write_byte(st->client, 0xA0 | address);
>> +		if (ret < 0)
>> +			return ret;
>> +		st->addr_prev = address;
>> +		msleep(LTC2497_CONVERSION_TIME_MS);
>> +	}
>> +	ret = i2c_master_recv(client, (char *)&buf, 3);
>> +	if (ret < 0)  {
>> +		dev_err(&client->dev, "i2c_master_recv failed\n");
>> +		return ret;
>> +	}
>> +	st->time_prev = ktime_get();
>> +	*val = (be32_to_cpu(buf) >> 14) - (1 << 17);
>> +
>> +	return ret;
>> +}
> [...]
>


-- 
Greetings,
Michael

--
Analog Devices GmbH      Otl-Aicher Strasse 60-64      80807 München
Sitz der Gesellschaft München, Registergericht München HRB 40368,
Geschäftsführer: Peter Kolberg, Ali Raza Husain, Eileen Wynne
