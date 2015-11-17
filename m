From: Cory Tusar <cory.tusar@pid1solutions.com>
Subject: Re: [PATCH 6/7] misc: eeprom: 93xx46: Add DT binding for a GPIO
 'select' line.
Date: Tue, 17 Nov 2015 16:19:13 -0500
Message-ID: <564B99D1.5070308@pid1solutions.com>
References: <1447733796-15546-1-git-send-email-cory.tusar@pid1solutions.com>
 <1447733796-15546-7-git-send-email-cory.tusar@pid1solutions.com>
 <20151117205901.GA10669@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151117205901.GA10669@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, agust@denx.de, gregkh@linuxfoundation.org, jic23@kernel.org, vz@mleia.com, broonie@kernel.org, afd@ti.com, andrew@lunn.ch, Chris.Healy@zii.aero, Keith.Vennel@zii.aero, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 11/17/2015 03:59 PM, Rob Herring wrote:
> On Mon, Nov 16, 2015 at 11:16:35PM -0500, Cory Tusar wrote:
>> This commit documents an additional devicetree binding in the
>> eeprom_93x46 driver allowing a GPIO line to function as a 'select'
>> or 'enable' signal prior to accessing the EEPROM.
> 
> You can just fold all the DT binding patches into 1. They don't have to 
> match up to driver changes.

Will do.

>>
>> Signed-off-by: Cory Tusar <cory.tusar@pid1solutions.com>
>> ---
>>  Documentation/devicetree/bindings/misc/eeprom-93xx46.txt | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/misc/eeprom-93xx46.txt b/Documentation/devicetree/bindings/misc/eeprom-93xx46.txt
>> index 34a0cc2..75b16f4 100644
>> --- a/Documentation/devicetree/bindings/misc/eeprom-93xx46.txt
>> +++ b/Documentation/devicetree/bindings/misc/eeprom-93xx46.txt
>> @@ -6,6 +6,8 @@ Required properties:
>>  
>>  Optional properties:
>>  - read-only : parameter-less property which disables writes to the EEPROM
>> +- select-gpio : if present, specifies the GPIO that will be asserted prior to
>> +  each access to the EEPROM (e.g. for SPI bus multiplexing)
> 
> This should be "select-gpios".

Will fix, thanks.

>>  
>>  Property rules described in Documentation/devicetree/bindings/spi/spi-bus.txt
>>  apply.  In particular, "reg" and "spi-max-frequency" properties must be given.
>> @@ -17,4 +19,5 @@ Example:
>>  		spi-max-frequency = <1000000>;
>>  		spi-cs-high;
>>  		data-size = <8>;
>> +		select-gpio = <&gpio4 4 GPIO_ACTIVE_HIGH>;
>>  	};
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

iEYEARECAAYFAlZLmdEACgkQHT1tsfGwHJ+2xACdFuo21bKIe5y4tYHw63b5OA/s
x20AnRKVla1svFEX15dNvrCwzgCBZ7cl
=lXQy
-----END PGP SIGNATURE-----
