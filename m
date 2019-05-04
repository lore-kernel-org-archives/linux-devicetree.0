Return-Path: <SRS0=vTZI=TE=c-mauderer.de=list@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: leds: Add binding for ubnt-spi LED.
References: <20190504122825.11883-1-list@c-mauderer.de>
 <20190504161237.GA24060@amd>
From: Christian Mauderer <list@c-mauderer.de>
Message-ID: <b63ce0cf-ea71-2e4b-c9d9-55d6f62bbb96@c-mauderer.de>
Date: Sat, 4 May 2019 18:46:57 +0200
MIME-Version: 1.0
In-Reply-To: <20190504161237.GA24060@amd>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
To: Pavel Machek <pavel@ucw.cz>, oss@c-mauderer.de
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On 04/05/2019 18:12, Pavel Machek wrote:
> On Sat 2019-05-04 14:28:24, list@c-mauderer.de wrote:
>> From: Christian Mauderer <oss@c-mauderer.de>
>>
>> This patch adds the binding documentation for the LED controller found
>> in Ubiquity airCube ISP devices.
>>
>> Signed-off-by: Christian Mauderer <oss@c-mauderer.de>
>> ---
>>
>> I tested the patches with a 4.14 and a 4.19 kernel on the current OpenWRT.
>> Although I didn't get the kernel running due to file system problems they build
>> fine with a 5.1-rc7.
>>
>> I shortly described the protocol of the controller in a comment in the driver
>> file in the second patch.
>>
>> Checkpatch gives the following warning for both patches:
>>
>>   WARNING: added, moved or deleted file(s), does MAINTAINERS need
>> updating?
> 
> Ignore that :-).

OK. Thanks.

> 
>> diff --git a/Documentation/devicetree/bindings/leds/leds-ubnt-spi.txt b/Documentation/devicetree/bindings/leds/leds-ubnt-spi.txt
>> new file mode 100644
>> index 000000000000..ab1478cdc139
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-ubnt-spi.txt
>> @@ -0,0 +1,49 @@
>> +Binding for the controller based LED found in Ubiquity airCube ISP and most
>> +likely some other Ubiquity devices.
> 
> It would be good to know what chip it is.. and name the binding
> accordingly.

The chip they use is a SONiX 8F26E611LA which is a generic 8-Bit
microcontroller. Ubiquiti seems to have programmed it to be a LED
controller. But it could do something completely different in another
hardware too. Therefore I didn't use the name.

> 
> Alternatively, call its led-spi-byte, or something, as it is really
> trivial protocol. Maybe other chips will have same interface?

See my other mail: I'll use the generic approach with that name.

> 
>> +Example for the airCube ISP (with SPI controller matching that device):
>> +
>> +led_spi {
>> +	compatible = "spi-gpio";
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +
>> +	gpio-sck = <&gpio 3 GPIO_ACTIVE_HIGH>;
>> +	gpio-mosi = <&gpio 2 GPIO_ACTIVE_HIGH>;
>> +	cs-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
>> +	num-chipselects = <1>;
>> +
>> +	led_ubnt@0 {
>> +		compatible = "ubnt,spi-led";
>> +		reg = <0>;
>> +		spi-max-frequency = <100000>;
>> +
>> +		led {
>> +			label = "system";
>> +			/* keep the LED slightly on to show powered device */
>> +			ubnt-spi,off_bright = /bits/ 8 <4>;
>> +		};
>> +	};
>> +};
> 
> Otherwise looks good to me,
> 
> Acked-by: Pavel Machek <pavel@ucw.cz>
> 
