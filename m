From: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
Subject: Re: [PATCH 4/7] misc: eeprom: 93xx46: Add DT binding for Atmel
 AT93C46D devices.
Date: Tue, 17 Nov 2015 16:15:30 -0500
Message-ID: <564B98F2.6060705@pid1solutions.com>
References: <1447733796-15546-1-git-send-email-cory.tusar@pid1solutions.com>
 <1447733796-15546-5-git-send-email-cory.tusar@pid1solutions.com>
 <20151117205652.GA8990@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151117205652.GA8990@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, agust-ynQEQJNshbs@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, afd-l0cyMroinI0@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, Chris.Healy-c8ZVq/bFV1I@public.gmane.org, Keith.Vennel-c8ZVq/bFV1I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 11/17/2015 03:56 PM, Rob Herring wrote:
> On Mon, Nov 16, 2015 at 11:16:33PM -0500, Cory Tusar wrote:
>> This commit adds a compatible string to the eeprom_93xx46 devicetree
>> bindings in support of Atmel AT93C46D devices.
>>
>> Signed-off-by: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/misc/eeprom-93xx46.txt | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/misc/eeprom-93xx46.txt b/Documentation/devicetree/bindings/misc/eeprom-93xx46.txt
>> index ba493a8..34a0cc2 100644
>> --- a/Documentation/devicetree/bindings/misc/eeprom-93xx46.txt
>> +++ b/Documentation/devicetree/bindings/misc/eeprom-93xx46.txt
>> @@ -1,7 +1,7 @@
>>  EEPROMs (SPI) compatible with Microchip Technology 93xx46 family.
>>  
>>  Required properties:
>> -- compatible : "eeprom-93xx46"
>> +- compatible : "eeprom-93xx46", "atmel,at93c46d"
> 
> This needs to be clear that it should be the opposite order. Something 
> like this:
> 
> compatible: One of the following:
> 	"atmel,at93c46d"
> 	Followed by "eeprom-93xx46"

Will fix, thanks.

>>  - data-size : number of data bits per word (either 8 or 16)
>>  
>>  Optional properties:
>> -- 
>> 2.4.10
>>


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

iEYEARECAAYFAlZLmPIACgkQHT1tsfGwHJ9FrACeKfmCgXePFz/N3v9QMV7c4ASj
SxcAnREBHu6lR5iAeyAtLpz8UCOOtDbn
=EfAl
-----END PGP SIGNATURE-----
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
