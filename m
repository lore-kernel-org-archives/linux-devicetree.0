From: David Julian Veenstra <davidjulianveenstra@gmail.com>
Subject: Re: [PATCH v2 06/13] staging: iio: ad2s1200: Introduce variable for
 repeated value
Date: Sun, 22 Apr 2018 16:29:47 +0200
Message-ID: <87o9ibmi04.fsf@gmail.com>
References: <cover.1524247563.git.davidjulianveenstra@gmail.com>
 <6ec9752ef32af09d0f0f419030be09d1dec68c6d.1524247563.git.davidjulianveenstra@gmail.com>
 <20180421175051.05f7e1b1@archlinux>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-reply-to: <20180421175051.05f7e1b1@archlinux>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com, linux-iio@vger.kernel.org, robh+dt@kernel.org, pmeerw@pmeerw.net, knaack.h@gmx.de, daniel.baluta@nxp.com
List-Id: devicetree@vger.kernel.org


On 21, April 2018 18:50, Jonathan Cameron wrote:

> On Fri, 20 Apr 2018 21:30:19 +0200
> David Veenstra <davidjulianveenstra@gmail.com> wrote:
>
>> Add variable to hold &spi->dev in ad2s1200_probe. This value is repeatedly
>> used in ad2s1200_probe.
>> 
>> Signed-off-by: David Veenstra <davidjulianveenstra@gmail.com>
> No significant gain in readability.   Perhaps even a slight lost I'm
> going to say no to this one.

We discussed this in [1]. But after removal of platform data it will
be even less worth it. I'll remove this patch in v3.

Best regards,
David Veenstra

[1] https://marc.info/?l=linux-iio&m=152190029808229&w=2

>
> Jonathan
>
>> ---
>>  drivers/staging/iio/resolver/ad2s1200.c | 13 ++++++++-----
>>  1 file changed, 8 insertions(+), 5 deletions(-)
>> 
>> diff --git a/drivers/staging/iio/resolver/ad2s1200.c b/drivers/staging/iio/resolver/ad2s1200.c
>> index f07aab7e7a35..0a5fc9917e32 100644
>> --- a/drivers/staging/iio/resolver/ad2s1200.c
>> +++ b/drivers/staging/iio/resolver/ad2s1200.c
>> @@ -117,19 +117,22 @@ static int ad2s1200_probe(struct spi_device *spi)
>>  	unsigned short *pins = spi->dev.platform_data;
>>  	struct ad2s1200_state *st;
>>  	struct iio_dev *indio_dev;
>> +	struct device *dev;
>>  	int pn, ret = 0;
>>  
>> +	dev = &spi->dev;
>> +
>>  	for (pn = 0; pn < AD2S1200_PN; pn++) {
>> -		ret = devm_gpio_request_one(&spi->dev, pins[pn], GPIOF_DIR_OUT,
>> +		ret = devm_gpio_request_one(dev, pins[pn], GPIOF_DIR_OUT,
>>  					    DRV_NAME);
>>  		if (ret) {
>> -			dev_err(&spi->dev, "request gpio pin %d failed\n",
>> +			dev_err(dev, "request gpio pin %d failed\n",
>>  				pins[pn]);
>>  			return ret;
>>  		}
>>  	}
>>  
>> -	indio_dev = devm_iio_device_alloc(&spi->dev, sizeof(*st));
>> +	indio_dev = devm_iio_device_alloc(dev, sizeof(*st));
>>  	if (!indio_dev)
>>  		return -ENOMEM;
>>  
>> @@ -140,14 +143,14 @@ static int ad2s1200_probe(struct spi_device *spi)
>>  	st->sample = pins[0];
>>  	st->rdvel = pins[1];
>>  
>> -	indio_dev->dev.parent = &spi->dev;
>> +	indio_dev->dev.parent = dev;
>>  	indio_dev->info = &ad2s1200_info;
>>  	indio_dev->modes = INDIO_DIRECT_MODE;
>>  	indio_dev->channels = ad2s1200_channels;
>>  	indio_dev->num_channels = ARRAY_SIZE(ad2s1200_channels);
>>  	indio_dev->name = spi_get_device_id(spi)->name;
>>  
>> -	ret = devm_iio_device_register(&spi->dev, indio_dev);
>> +	ret = devm_iio_device_register(dev, indio_dev);
>>  	if (ret)
>>  		return ret;
>>  
