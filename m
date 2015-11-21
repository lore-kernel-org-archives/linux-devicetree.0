From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 3/5] misc: eeprom_93xx46: Implement eeprom_93xx46 DT
 bindings.
Date: Sat, 21 Nov 2015 20:36:09 +0200
Message-ID: <5650B999.8010905@mleia.com>
References: <1447903781-3910-1-git-send-email-cory.tusar@pid1solutions.com> <1447903781-3910-4-git-send-email-cory.tusar@pid1solutions.com> <564D632D.8020107@mleia.com> <564FF5C5.2070107@pid1solutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <564FF5C5.2070107-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, agust-ynQEQJNshbs@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, afd-l0cyMroinI0@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, Chris.Healy-c8ZVq/bFV1I@public.gmane.org, Keith.Vennel-c8ZVq/bFV1I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 21.11.2015 06:40, Cory Tusar wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 11/19/2015 12:50 AM, Vladimir Zapolskiy wrote:
>> Hi Cory,
>>
>> On 19.11.2015 05:29, Cory Tusar wrote:
>>> This commit implements bindings in the eeprom_93xx46 driver allowing
>>> device word size and read-only attributes to be specified via
>>> devicetree.
>>>
>>> Signed-off-by: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
>>> ---
>>>  drivers/misc/eeprom/eeprom_93xx46.c | 62 +++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 62 insertions(+)
>>>
>>> diff --git a/drivers/misc/eeprom/eeprom_93xx46.c b/drivers/misc/eeprom/eeprom_93xx46.c
>>> index e1bf0a5..1f29d9a 100644
>>> --- a/drivers/misc/eeprom/eeprom_93xx46.c
>>> +++ b/drivers/misc/eeprom/eeprom_93xx46.c
>>> @@ -13,6 +13,8 @@
>>>  #include <linux/kernel.h>
>>>  #include <linux/module.h>
>>>  #include <linux/mutex.h>
>>> +#include <linux/of.h>
>>> +#include <linux/of_device.h>
>>>  #include <linux/slab.h>
>>>  #include <linux/spi/spi.h>
>>>  #include <linux/sysfs.h>
>>> @@ -294,12 +296,71 @@ static ssize_t eeprom_93xx46_store_erase(struct device *dev,
>>>  }
>>>  static DEVICE_ATTR(erase, S_IWUSR, NULL, eeprom_93xx46_store_erase);
>>>  
>>> +#ifdef CONFIG_OF
>>> +static const struct of_device_id eeprom_93xx46_of_table[] = {
>>> +	{ .compatible = "eeprom-93xx46", },
>>> +	{}
>>> +};
>>> +MODULE_DEVICE_TABLE(of, eeprom_93xx46_of_table);
>>> +
>>
>> Please move this declaration closer to struct spi_driver
>> eeprom_93xx46_driver below.
> 
> As Andrew noted in his follow-up, it's used in the function immediately
> after this declaration.  Seems logical to leave it here?

IMO no, see my comment below.

>> Also you can avoid #ifdef here, if you write
>>
>>    .of_match_table = of_match_ptr(eeprom_93xx46_of_table)
> 
> Will change this to use of_match_ptr().
> 
>> Whenever possible please avoid #ifdef's in .c files.
> 
> Agreed.  #ifdef CONFIG_OF still seems to be fairly pervasive though...?
> 

In my opinion it is better to avoid it, and many nice drivers don't have
#ifdef CONFIG_OF.

>>> +static int eeprom_93xx46_probe_dt(struct spi_device *spi)
>>> +{
>>> +	struct device_node *np = spi->dev.of_node;
>>> +	struct eeprom_93xx46_platform_data *pd;
>>> +	u32 tmp;
>>> +	int ret;
>>> +
>>> +	if (!of_match_device(eeprom_93xx46_of_table, &spi->dev))
>>> +		return 0;

This check above is redundant, please remove it.

Imagine, how can you get here !of_match_device(..) condition, if you
have driver initialization from a valid device node?

>>> +
>>> +	pd = devm_kzalloc(&spi->dev, sizeof(*pd), GFP_KERNEL);
>>> +	if (!pd)
>>> +		return -ENOMEM;
>>> +
>>> +	ret = of_property_read_u32(np, "data-size", &tmp);
>>> +	if (ret < 0) {
>>> +		dev_err(&spi->dev, "data-size property not found\n");
>>> +		goto error_free;
>>
>> Because you use devm_* resource allocation in .probe, just return error.
> 
> Will fix.
> 
>> Plus I would suggest to change "data-size" property to an optional one,
>> here I mean that if it is omitted, then by default consider pd->flags |=
>> EE_ADDR8.
> 
> I don't see such an assumption as safe...data word size is an inherent
> property of the device (or the way it's strapped on a given platform),
> and should be required for proper operation.
> 

Ok.

>>> +	}
>>> +
>>> +	if (tmp == 8) {
>>> +		pd->flags |= EE_ADDR8;
>>> +	} else if (tmp == 16) {
>>> +		pd->flags |= EE_ADDR16;
>>> +	} else {
>>> +		dev_err(&spi->dev, "invalid data-size (%d)\n", tmp);
>>> +		goto error_free;
>>
>> Same here.
> 
> Will fix.
> 
>>> +	}
>>> +
>>> +	if (of_property_read_bool(np, "read-only"))
>>> +		pd->flags |= EE_READONLY;
>>> +
>>> +	spi->dev.platform_data = pd;
>>> +
>>> +	return 1;
>>
>> On success please return 0.
> 
> Fixed.
> 
>>> +error_free:
>>> +	devm_kfree(&spi->dev, pd);
>>> +	return ret;
>>> +}
>>> +
>>> +#else
>>> +static inline int eeprom_93xx46_probe_dt(struct spi_device *spi)
>>> +{
>>> +	return 0;
>>> +}
>>> +#endif
>>> +
>>
>> I actually don't see a point to have #ifdef CONFIG_OF here.
>>
>> Instead please add a check for !spi->dev.of_node at the beginning of
>> eeprom_93xx46_probe_dt() or in .probe()
> 
> How about...
> 
> 	if (IS_ENABLED(CONFIG_OF) && spi->dev.of_node) {
> 		err = eeprom_93xx46_probe_dt(spi);
> 		if (err < 0)
> 			return err;
> 	}
> 
> ...at the beginning of eeprom_93xx46_probe() (as below)?
> 

	if (spi->dev.of_node) {
		err = eeprom_93xx46_probe_dt(spi);
		if (err < 0)
			return err;
	}

is good enough.

Condition (!IS_ENABLED(CONFIG_OF) && spi->dev.of_node) is always false.

>>>  static int eeprom_93xx46_probe(struct spi_device *spi)
>>>  {
>>>  	struct eeprom_93xx46_platform_data *pd;
>>>  	struct eeprom_93xx46_dev *edev;
>>>  	int err;
>>>  
>>> +	err = eeprom_93xx46_probe_dt(spi);
>>> +	if (err < 0)
>>> +		return err;
>>> +
>>>  	pd = spi->dev.platform_data;
>>>  	if (!pd) {
>>>  		dev_err(&spi->dev, "missing platform data\n");
>>> @@ -370,6 +431,7 @@ static int eeprom_93xx46_remove(struct spi_device *spi)
>>>  static struct spi_driver eeprom_93xx46_driver = {
>>>  	.driver = {
>>>  		.name	= "93xx46",
>>> +		.of_match_table = eeprom_93xx46_of_table,
>>>  	},
>>>  	.probe		= eeprom_93xx46_probe,
>>>  	.remove		= eeprom_93xx46_remove,
>>>
> 
> 
--
With best wishes,
Vladimir
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
