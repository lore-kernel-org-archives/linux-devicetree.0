From: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Subject: Re: [PATCH v3 2/2] iio: ad5272: Add support for Analog Devices
 digital potentiometers
Date: Mon, 29 Jan 2018 10:08:16 +0800
Message-ID: <59571332-0fd7-940a-7c45-c32a5e224195@electromag.com.au>
References: <1516160308-16937-1-git-send-email-preid@electromag.com.au>
 <1516160308-16937-3-git-send-email-preid@electromag.com.au>
 <20180120171241.7d36898d@archlinux>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180120171241.7d36898d@archlinux>
Content-Language: en-AU
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Michael.Hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alexandru.ardelean-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 21/01/2018 01:12, Jonathan Cameron wrote:
> On Wed, 17 Jan 2018 11:38:28 +0800
> Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org> wrote:
> 
>> Add implementation for Analog Devices AD5272 and AD5274 digital
>> potentiometer devices.
>>
>> Signed-off-by: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
> A couple more minor comments.
> 
...

>>   menu "Digital potentiometers"
>>   
>> +config AD5272
>> +	tristate "Analog Devices AD5272 Digital Potentiometer driver"
>> +	depends on I2C
>> +	help
>> +	  Say yes here to build support for the Analog Devices AD5272
>> +	  digital potentiometer chip.
> 
> You need to list he compatible parts here so that people looking for
> the driver can find it.  Usually the short text states 'and similar'
> and the help text contains a list of parts.  AD5274 is missing here.

ok

...

>> +	if (reset_gpio) {
>> +		udelay(1);
>> +		gpiod_set_value(reset_gpio, 1);
>> +	} else {
>> +		ad5272_write(data, AD5272_RESET, 0);
>> +	}
>> +	usleep_range(1000, 2000);
> kernel coding conventions (and readability) put a blank line
> before return statements.
> ok

-- 
Regards
Phil Reid
