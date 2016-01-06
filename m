From: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
Subject: Re: [PATCH v4 2/5] Documentation: devicetree: Add DT bindings to
 eeprom_93xx46 driver.
Date: Tue, 5 Jan 2016 21:38:16 -0500
Message-ID: <568C7E18.6060101@pid1solutions.com>
References: <1449720055-25965-1-git-send-email-cory.tusar@pid1solutions.com>
 <1449720055-25965-3-git-send-email-cory.tusar@pid1solutions.com>
 <567892EF.6060508@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <567892EF.6060508-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, afd-l0cyMroinI0@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, Chris.Healy-c8ZVq/bFV1I@public.gmane.org, Keith.Vennel-c8ZVq/bFV1I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 12/21/2015 07:01 PM, Vladimir Zapolskiy wrote:
> Hi Cory,
> 
> On 10.12.2015 06:00, Cory Tusar wrote:
>> This commit documents bindings to be added to the eeprom_93xx46 driver
>> which will allow:
>>
>>   - Device word size and read-only attributes to be specified.
>>   - A device-specific compatible string for use with Atmel AT93C46D
>>     EEPROMs.
>>   - Specifying a GPIO line to function as a 'select' or 'enable' signal
>>     prior to accessing the EEPROM.
>>
>> Signed-off-by: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Tested-by: Chris Healy <chris.healy-c8ZVq/bFV1I@public.gmane.org>
>> ---
>>  .../devicetree/bindings/misc/eeprom-93xx46.txt     | 25 ++++++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/misc/eeprom-93xx46.txt b/Documentation/devicetree/bindings/misc/eeprom-93xx46.txt
>> new file mode 100644
>> index 0000000..a8ebb46
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/misc/eeprom-93xx46.txt
>> @@ -0,0 +1,25 @@
>> +EEPROMs (SPI) compatible with Microchip Technology 93xx46 family.
>> +
>> +Required properties:
>> +- compatible : shall be one of:
>> +    "atmel,at93c46d"
>> +    "eeprom-93xx46"
> 
> the second compatible property value is not recommended by ePAPR, I would
> suggest to remove it from here and from the example below.

Hi Vladimir,

Yes, I know.  It's a "generic" binding, intended to allow any existing
users of this driver to move easily to DT with the exact same
configuration parameters exposed as the current platform device
implementation.

I took the at24 bindings (i.e. "at24c00") as an example.  I suppose I
could have stuck with just "93xx46" for the model, but instead used
"eeprom-93xx46" to match the name of the driver.

> But I see that Rob acked this change though...

Rob, does this still have your ACK as-is, given the above?

Thanks and best regards,
- -Cory


>> +- data-size : number of data bits per word (either 8 or 16)
>> +
>> +Optional properties:
>> +- read-only : parameter-less property which disables writes to the EEPROM
>> +- select-gpios : if present, specifies the GPIO that will be asserted prior to
>> +  each access to the EEPROM (e.g. for SPI bus multiplexing)
>> +
>> +Property rules described in Documentation/devicetree/bindings/spi/spi-bus.txt
>> +apply.  In particular, "reg" and "spi-max-frequency" properties must be given.
>> +
>> +Example:
>> +	eeprom@0 {
>> +		compatible = "eeprom-93xx46";
>> +		reg = <0>;
>> +		spi-max-frequency = <1000000>;
>> +		spi-cs-high;
>> +		data-size = <8>;
>> +		select-gpios = <&gpio4 4 GPIO_ACTIVE_HIGH>;
>> +	};
>>
> 
> --
> With best wishes,
> Vladimir
> 


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

iEYEARECAAYFAlaMfhgACgkQHT1tsfGwHJ+QRwCffOZe1SiQnQPScyC2k8xU9px/
dt8An2X0c2K9TVaKo8euOIBNP/+8Y+z8
=4vbd
-----END PGP SIGNATURE-----
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
