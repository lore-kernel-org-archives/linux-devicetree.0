Return-Path: <SRS0=KaV4=TY=essensium.com=charles-antoine.couret@kernel.org>
Subject: Re: [PATCH v3 1/5] iio: ad7949: Fix dummy read cycle placement
References: <1557759185-167857-1-git-send-email-adam.michaelis@rockwellcollins.com>
 <CA+U=DsoHuzt27CnwFK-2tdLhNMea1JttncdhZaBjRpfticgfEg@mail.gmail.com>
From: Couret Charles-Antoine <charles-antoine.couret@essensium.com>
Message-ID: <8a3b7dca-8653-ba51-7302-bc5bcb3bc497@essensium.com>
Date: Fri, 24 May 2019 13:49:00 +0200
MIME-Version: 1.0
In-Reply-To: <CA+U=DsoHuzt27CnwFK-2tdLhNMea1JttncdhZaBjRpfticgfEg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
To: Alexandru Ardelean <ardeleanalex@gmail.com>, Adam Michaelis <adam.michaelis@rockwellcollins.com>
Cc: linux-iio@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, "Hennerich, Michael" <michael.hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, brandon.maier@rockwellcollins.com, clayton.shotwell@rockwellcollins.com, Alexandru Ardelean <alexandru.ardelean@analog.com>, Stefan Popa <stefan.popa@analog.com>
List-ID: <devicetree@vger.kernel.org>


Le 23/05/2019 à 13:47, Alexandru Ardelean a écrit :
> diff --git a/drivers/iio/adc/ad7949.c b/drivers/iio/adc/ad7949.c
>> index ac0ffff6c5ae..c7fe27aa2519 100644
>> --- a/drivers/iio/adc/ad7949.c
>> +++ b/drivers/iio/adc/ad7949.c
>> @@ -100,6 +100,23 @@ static int ad7949_spi_write_cfg(struct ad7949_adc_chip *ad7949_adc, u16 val,
>>           * send a new command to the device
>>           */
>>          udelay(2);
>> +
>> +       /*
>> +        * Perform extra read cycle to allow configuration, acquisition,
>> +        * and conversion sequences to complete for new configuration.
>> +        */
>> +       ad7949_adc->buffer = 0;
>> +
>> +       spi_message_init_with_transfers(&msg, tx, 1);
>> +
>> +       ret = spi_sync(ad7949_adc->spi, &msg);
>> +
>> +       /*
>> +        * This delay is to avoid a new request before the required time
>> +        * to send a new command to the device.
>> +        */
>> +       udelay(2);
>> +
> Is this needed if the channel doesn't change ?
> If it isn't, maybe add a check in ad7949_spi_read_channel() to skip
> the call to ad7949_spi_write_cfg().
>
> We should also take performance into account when doing SPI
> transactions to the device, and if we can skip some of them, all the
> better.
> This change, introduces a performance penalty by doing this extra read + udelay.

I wrote the initial driver and you're right. It is not required in the 
situation where the channel is not changed.

In our product the channel changed every time so we didn't think about 
this kind of optimisations. It is relevant to implement them.

>>          return ret;
>>   }
>>
>> @@ -229,11 +246,10 @@ static int ad7949_spi_init(struct ad7949_adc_chip *ad7949_adc)
>>          ret = ad7949_spi_write_cfg(ad7949_adc, 0x3C79, AD7949_MASK_TOTAL);
>>
>>          /*
>> -        * Do two dummy conversions to apply the first configuration setting.
>> +        * Do a dummy conversion to apply the first configuration setting.
>>           * Required only after the start up of the device.
>>           */
>>          ad7949_spi_read_channel(ad7949_adc, &val, ad7949_adc->current_channel);
>> -       ad7949_spi_read_channel(ad7949_adc, &val, ad7949_adc->current_channel);
> The datasheet mentions that 2 dummy conversions are needed on power-up / init.
>
> The way, this was done here was a bit easier to follow (or
> straightforward) with the datasheet.
>
> This isn't to say that this is bad, but if we need to do an extra SPI
> read (and skip the SPI write part), then I would just add an SPI read
> function, instead of moving it completely into ad7949_spi_write_cfg(),
> which would then compact things in ad7949_spi_read_channel().

+1. It is more readable from my point of view to have two explicit 
commands for this step.

I agree with your solution.


Regards,

Charles-Antoine Couret
