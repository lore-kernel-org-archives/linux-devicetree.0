From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 0/2] iio: light: add support for APDS9660 sensor
Date: Sun, 2 Aug 2015 16:45:39 +0100
Message-ID: <55BE3B23.8010608@kernel.org>
References: <1437364640-7470-1-git-send-email-mranostay@gmail.com>
 <CAKzfze8tccxiWTcx4DWocdnm4M=W-5fToK-ABELW-JrdKtq-iA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKzfze8tccxiWTcx4DWocdnm4M=W-5fToK-ABELW-JrdKtq-iA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Marek_Va=c5=a1ut?= <marex-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 29/07/15 05:28, Matt Ranostay wrote:
> Jonathan,
> 
> Does this solve the issues in v3 minus the apds9960_regfield_init() cleanup?
> 
> 
> Thanks,
> 
> Matt
> 
Sorry, was on holiday last week.  Catching up now.
> On Sun, Jul 19, 2015 at 8:57 PM, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> This patchset adds support for the APDS9960 ALS + proximity + gesture
>> sensor.
>>
>> Included support for the various adjustable settings and controls:
>>  * Falling and rising ALS + proximity thresholds events
>>  * Gain controls
>>  * ALS time integration
>>
>> Changes from v3:
>>  * Added interrupt client mode document reference in DT bindings
>>  * Add missing dep for CONFIG_REGMAP_I2C in respective Kconfig
>>  * Changed from iio_trigger_poll_chained() to irq_work queue
>>  * Changed channel masks to prevent channels that can't be polled from
>>    having sysfs entries
>>  * Renamed regmap_field declarations with apds9660_* prefix
>>  * Added available channel masks and removed unneeded buffer copy in
>>    poll function
>>  * Remove unneeded default regmap values in apds9960_reg_defaults
>>  * Clear interrupts from ALS and proximity sensor seperately to avoid
>>    race condition
>>  * Changed max threshold values to a macro define, and prevent values
>>    less than 0
>>  * Avoid needlessly checking the APDS9960_REG_GFLVL value until we read
>>    all the FIFO from the count value. Note this can save up to 32
>>    superfluous i2c reads per gesture engine entry
>>
>> Matt Ranostay (2):
>>   iio: light: DT binding docs for APDS9960 driver
>>   iio: light: add APDS9960 ALS + promixity driver
>>
>>  .../ABI/testing/sysfs-bus-iio-light-apds9960       |    7 +
>>  .../devicetree/bindings/iio/light/apds9960.txt     |   22 +
>>  drivers/iio/light/Kconfig                          |   13 +
>>  drivers/iio/light/Makefile                         |    1 +
>>  drivers/iio/light/apds9960.c                       | 1191 ++++++++++++++++++++
>>  5 files changed, 1234 insertions(+)
>>  create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-light-apds9960
>>  create mode 100644 Documentation/devicetree/bindings/iio/light/apds9960.txt
>>  create mode 100644 drivers/iio/light/apds9960.c
>>
>> --
>> 1.9.1
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
