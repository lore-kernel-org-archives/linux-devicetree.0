From: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
Subject: Re: [PATCH v4 3/5] misc: eeprom_93xx46: Implement eeprom_93xx46 DT
 bindings.
Date: Tue, 5 Jan 2016 22:18:33 -0500
Message-ID: <568C8789.10701@pid1solutions.com>
References: <1449720055-25965-1-git-send-email-cory.tusar@pid1solutions.com>
 <1449720055-25965-4-git-send-email-cory.tusar@pid1solutions.com>
 <5678955B.4070700@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5678955B.4070700-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, afd-l0cyMroinI0@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, Chris.Healy-c8ZVq/bFV1I@public.gmane.org, Keith.Vennel-c8ZVq/bFV1I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 12/21/2015 07:12 PM, Vladimir Zapolskiy wrote:
> Hi Cory,
> 
> On 10.12.2015 06:00, Cory Tusar wrote:
>> This commit implements bindings in the eeprom_93xx46 driver allowing
>> device word size and read-only attributes to be specified via
>> devicetree.
>>
>> Signed-off-by: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
>> Tested-by: Chris Healy <chris.healy-c8ZVq/bFV1I@public.gmane.org>
>> ---
>>  drivers/misc/eeprom/eeprom_93xx46.c | 49 +++++++++++++++++++++++++++++++++++++
>>  1 file changed, 49 insertions(+)
>>
>> diff --git a/drivers/misc/eeprom/eeprom_93xx46.c b/drivers/misc/eeprom/eeprom_93xx46.c
>> index e1bf0a5..cc27e11 100644
>> --- a/drivers/misc/eeprom/eeprom_93xx46.c
>> +++ b/drivers/misc/eeprom/eeprom_93xx46.c
>> @@ -13,6 +13,8 @@
>>  #include <linux/kernel.h>
>>  #include <linux/module.h>
>>  #include <linux/mutex.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>>  #include <linux/slab.h>
>>  #include <linux/spi/spi.h>
>>  #include <linux/sysfs.h>
>> @@ -294,12 +296,58 @@ static ssize_t eeprom_93xx46_store_erase(struct device *dev,
>>  }
>>  static DEVICE_ATTR(erase, S_IWUSR, NULL, eeprom_93xx46_store_erase);
>>  
>> +static const struct of_device_id eeprom_93xx46_of_table[] = {
>> +	{ .compatible = "eeprom-93xx46", },
> 
> immediately do you want to add the second (and much, much more preferred IMO)
> mentioned compatible value "atmel,at93c46d" to the list? Also see a note
> below.

Hi Vladimir,

That compatible value is included as part of the next patch; the Atmel
part required additional quirk support which was (IMO) separate from
exposing just existing platform device parameters.

> 
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(of, eeprom_93xx46_of_table);
>> +
>> +static int eeprom_93xx46_probe_dt(struct spi_device *spi)
>> +{
>> +	struct device_node *np = spi->dev.of_node;
>> +	struct eeprom_93xx46_platform_data *pd;
>> +	u32 tmp;
>> +	int ret;
>> +
>> +	pd = devm_kzalloc(&spi->dev, sizeof(*pd), GFP_KERNEL);
>> +	if (!pd)
>> +		return -ENOMEM;
>> +
>> +	ret = of_property_read_u32(np, "data-size", &tmp);
>> +	if (ret < 0) {
>> +		dev_err(&spi->dev, "data-size property not found\n");
>> +		return ret;
>> +	}
>> +
>> +	if (tmp == 8) {
>> +		pd->flags |= EE_ADDR8;
>> +	} else if (tmp == 16) {
>> +		pd->flags |= EE_ADDR16;
>> +	} else {
>> +		dev_err(&spi->dev, "invalid data-size (%d)\n", tmp);
>> +		return -EINVAL;
>> +	}
> 
> If you insist on mandatory "data-size" property, could you please check
> arch/x86/platform/ce4100/falconfalls.dts , does it require updates?

Unknown.  I see no other documented reference to that particular
compatible string...looks like it was a placeholder back when the
CE4100 platform was first added.

> In that DTS you may find "atmel,at93c46" compatible value, is that kind
> of devices covered by this driver? If yes, does it make sense to
> add "atmel,at93c46" to the list of compatible values replacing
> "atmel,at93c46d" ?

Yes, that device _should_ generally work, but a quick look at both
datasheets leads me to believe that quirks differ enough to probably
warrant its own compatible value.

For example, EWEN for an x8 strapped AT93C46 is b'10011xxxxx and
b'10011xxxxxxx for the AT93C46D.  That difference is handled by
EEPROM_93XX46_QUIRK_INSTRUCTION_LENGTH.

> 
>> +
>> +	if (of_property_read_bool(np, "read-only"))
>> +		pd->flags |= EE_READONLY;
>> +
>> +	spi->dev.platform_data = pd;
>> +
>> +	return 0;
>> +}
>> +
>>  static int eeprom_93xx46_probe(struct spi_device *spi)
>>  {
>>  	struct eeprom_93xx46_platform_data *pd;
>>  	struct eeprom_93xx46_dev *edev;
>>  	int err;
>>  
>> +	if (spi->dev.of_node) {
>> +		err = eeprom_93xx46_probe_dt(spi);
>> +		if (err < 0)
>> +			return err;
>> +	}
>> +
>>  	pd = spi->dev.platform_data;
>>  	if (!pd) {
>>  		dev_err(&spi->dev, "missing platform data\n");
>> @@ -370,6 +418,7 @@ static int eeprom_93xx46_remove(struct spi_device *spi)
>>  static struct spi_driver eeprom_93xx46_driver = {
>>  	.driver = {
>>  		.name	= "93xx46",
>> +		.of_match_table = of_match_ptr(eeprom_93xx46_of_table),
>>  	},
>>  	.probe		= eeprom_93xx46_probe,
>>  	.remove		= eeprom_93xx46_remove,
>>
> 
> Reviewed-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>

Thanks and best regards,
- -Cory


- -- 
Cory Tusar
Principal
PID 1 Solutions, Inc.


"There are two ways of constructing a software design.  One way is to
 make it so simple that there are obviously no deficiencies, and the
 other way is to make it so complicated that there are no obvious
 deficiencies."  --Sir Charles Anthony Richard Hoare

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaMh4kACgkQHT1tsfGwHJ/cpgCgmedYRGYlq+tTNzl2akHZk2C7
3s8AoJ0qI14wafGJypOfbQii3kX+6Kdd
=z4WO
-----END PGP SIGNATURE-----
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
