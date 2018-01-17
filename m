From: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Subject: Re: [PATCH v2 2/2] iio: ad5272: Add support for Analog Devices
 digital potentiometers
Date: Wed, 17 Jan 2018 09:46:23 +0800
Message-ID: <c05bc74f-dd6e-39ec-a316-5aa3436f36cf@electromag.com.au>
References: <1516096140-88161-1-git-send-email-preid@electromag.com.au>
 <1516096140-88161-3-git-send-email-preid@electromag.com.au>
 <da493367-8156-792f-5d3c-3cfd9a910271@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <da493367-8156-792f-5d3c-3cfd9a910271-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Content-Language: en-AU
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Michael.Hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alexandru.ardelean-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

G'day Lars-Peter,

On 17/01/2018 01:01, Lars-Peter Clausen wrote:
> On 01/16/2018 10:49 AM, Phil Reid wrote:
>> Add implementation for Analog Devices AD5272 and AD5274 digital
>> potentiometer devices.
>>
>> Signed-off-by: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
> 
> Hi,
> 
> Thanks for the patch. Looks mostly good.
> 
>> diff --git a/drivers/iio/potentiometer/ad5272.c b/drivers/iio/potentiometer/ad5272.c
>> new file mode 100644
>> index 0000000..a04b018
>> --- /dev/null
>> +++ b/drivers/iio/potentiometer/ad5272.c
>> @@ -0,0 +1,227 @@
>> +/*
>> + * Analog Devices AD5372 digital potentiometer driver
>> + * Copyright (C) 2018 Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
>> + *
>> + * Datasheet: http://www.analog.com/media/en/technical-documentation/data-sheets/AD5272_5274.pdf
>> + *
>> + * DEVID	#Wipers	#Positions	Resistor Opts (kOhm)	i2c address
>> + * ad5272	1	1024		20, 50, 100		01011xx
>> + * ad5274	1	256		20, 100			01011xx
>> + *
>> + * SPDX-License-Identifier: GPL-2.0+
> 
> People will probably complain about this, there are some weired rules where
> and how the SPDX identifier should be.
> 
Jonathan suggested this in his review of v1. Forgot to mention that in the change list.


>> + */
> [...]
>> +
>> +static const struct ad5272_cfg ad5272_cfg[] = {
>> +	/* on-semiconductor parts */
> 
> Copy&paste error?

yeap.
> 
>> +	[AD5272_020] = { .max_pos = 1024, .kohms = 20 },
>> +	[AD5272_050] = { .max_pos = 1024, .kohms = 50 },
>> +	[AD5272_100] = { .max_pos = 1024, .kohms = 100 },
>> +	[AD5274_020] = { .max_pos = 256,  .kohms = 20,  .shift = 2 },
>> +	[AD5274_100] = { .max_pos = 256,  .kohms = 100, .shift = 2 },
>> +};
> [...]
>> +
>> +static int ad5272_write(struct ad5272_data *data, int reg, int val)
>> +{
>> +	u8 buf[2] = { (reg << 2) | ((val >> 8) & 0x3), (u8)val };
>> +	int ret;
>> +
>> +	mutex_lock(&data->lock);
>> +	ret = i2c_master_send(data->client, buf, sizeof(buf));
>> +	mutex_unlock(&data->lock);
>> +	return ret < 0 ? ret : 0;
>> +}
>> +
>> +static int ad5272_read(struct ad5272_data *data, int reg, int *val)
>> +{
>> +	u8 buf[2] = {reg << 2, 0};
> 
> I believe the general recommendation is to not use stack based transfer
> buffer to avoid potential issues in case the I2C master driver uses DMA.
> There are many examples IIO example drivers that use DMA safe transfer
> buffers. Look for ____cacheline_aligned.
ok.


> 
>> +	int ret;
>> +
>> +	mutex_lock(&data->lock);
>> +	ret = i2c_master_send(data->client, buf, sizeof(buf));
>> +	if (ret < 0)
>> +		goto error;
>> +
>> +	ret = i2c_master_recv(data->client, buf, sizeof(buf));
>> +	if (ret < 0)
>> +		goto error;
>> +
> 
> This should be one I2C transfer, otherwise some other driver might get its
> own transfer between the send and recv, which could cause issues.

Yeah I considered that.
But the datasheet for the device states that a stop must be issued after the write,
before the read.
Docs for i2c_transfer state that the stop is issued only at the end.



> 
>> +	*val = ((buf[0] & 0x3) << 8) | buf[1];
>> +	ret = 0;
>> +error:
>> +	mutex_unlock(&data->lock);
>> +	return ret;
>> +}
> 
> 


-- 
Regards
Phil Reid
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
