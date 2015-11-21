From: Cory Tusar <cory.tusar@pid1solutions.com>
Subject: Re: [PATCH v2 3/5] misc: eeprom_93xx46: Implement eeprom_93xx46 DT
 bindings.
Date: Fri, 20 Nov 2015 23:53:10 -0500
Message-ID: <564FF8B6.5050104@pid1solutions.com>
References: <1447903781-3910-1-git-send-email-cory.tusar@pid1solutions.com>
 <1447903781-3910-4-git-send-email-cory.tusar@pid1solutions.com>
 <564D632D.8020107@mleia.com> <564DD5E7.6080700@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <564DD5E7.6080700@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>, Vladimir Zapolskiy <vz@mleia.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, agust@denx.de, gregkh@linuxfoundation.org
Cc: jic23@kernel.org, broonie@kernel.org, andrew@lunn.ch, Chris.Healy@zii.aero, Keith.Vennel@zii.aero, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 11/19/2015 09:00 AM, Andrew F. Davis wrote:
> On 11/18/2015 11:50 PM, Vladimir Zapolskiy wrote:
>> Hi Cory,
>>
>> On 19.11.2015 05:29, Cory Tusar wrote:
>>> This commit implements bindings in the eeprom_93xx46 driver allowing
>>> device word size and read-only attributes to be specified via
>>> devicetree.
>>>
>>> Signed-off-by: Cory Tusar <cory.tusar@pid1solutions.com>

[snip]

>>> +error_free:
>>> +    devm_kfree(&spi->dev, pd);
>>> +    return ret;
>>> +}
>>> +
>>> +#else
>>> +static inline int eeprom_93xx46_probe_dt(struct spi_device *spi)
>>> +{
>>> +    return 0;
>>> +}
>>> +#endif
>>> +
>>
>> I actually don't see a point to have #ifdef CONFIG_OF here.
>>
> 
> Usually to avoid a lot of dead code and data when OF is not enabled.

Hi Andrew,

I tend to agree, but I'm going to cross-check by building a couple
variants of this to see just how much gets optimized out automagically
when using Vladimir's suggestions.

>> Instead please add a check for !spi->dev.of_node at the beginning of
>> eeprom_93xx46_probe_dt() or in .probe()
>>
>>>   static int eeprom_93xx46_probe(struct spi_device *spi)
>>>   {
>>>       struct eeprom_93xx46_platform_data *pd;
>>>       struct eeprom_93xx46_dev *edev;
>>>       int err;
>>>
>>> +    err = eeprom_93xx46_probe_dt(spi);
>>> +    if (err < 0)
>>> +        return err;
>>> +
>>>       pd = spi->dev.platform_data;
>>>       if (!pd) {
>>>           dev_err(&spi->dev, "missing platform data\n");
>>> @@ -370,6 +431,7 @@ static int eeprom_93xx46_remove(struct spi_device *spi)
>>>   static struct spi_driver eeprom_93xx46_driver = {
>>>       .driver = {
>>>           .name    = "93xx46",
>>> +        .of_match_table = eeprom_93xx46_of_table,
>>>       },
>>>       .probe        = eeprom_93xx46_probe,
>>>       .remove        = eeprom_93xx46_remove,
>>>


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

iEYEARECAAYFAlZP+LYACgkQHT1tsfGwHJ8GjwCffZac5kr/MHgiLrBh0IxyT6UJ
3rMAn2a/bD5OdWXdxg+DscoHUQbtyHr9
=W3Rd
-----END PGP SIGNATURE-----
