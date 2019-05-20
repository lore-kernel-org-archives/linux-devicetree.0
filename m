Return-Path: <SRS0=wy44=TU=c-mauderer.de=oss@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: leds: Add binding for spi-byte LED.
References: <20190513193307.11591-1-oss@c-mauderer.de>
 <20190519212501.GC31403@amd>
From: Christian Mauderer <oss@c-mauderer.de>
Message-ID: <1850ba07-2c0c-2624-4ff3-fd507e49439f@c-mauderer.de>
Date: Mon, 20 May 2019 19:19:03 +0200
MIME-Version: 1.0
In-Reply-To: <20190519212501.GC31403@amd>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On 19/05/2019 23:25, Pavel Machek wrote:
> Hi!
> 
>> From: Christian Mauderer <oss@c-mauderer.de>
>>
>> This patch adds the binding documentation for a simple SPI based LED
>> controller which use only one byte for setting the brightness.
>>
>> Signed-off-by: Christian Mauderer <oss@c-mauderer.de>
>> ---
> 
>> diff --git a/Documentation/devicetree/bindings/leds/leds-spi-byte.txt b/Documentation/devicetree/bindings/leds/leds-spi-byte.txt
>> new file mode 100644
>> index 000000000000..28b6b2d9091e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-spi-byte.txt
>> @@ -0,0 +1,44 @@
>> +* Single Byte SPI LED Device Driver.
> 
>> +The driver can be used for controllers with a very simple SPI protocol:
>> +- one LED is controlled by a single byte on MOSI
>> +- the value of the byte gives the brightness between two values (lowest to
>> +  highest)
>> +- no return value is necessary (no MISO signal)
> 
> I'd expect this file to be named acb-spi-led.txt, or something, and
> talk about that u-controller, not its device driver -- as devicetree
> binding describes hardware, not driver.
> 
> But you already have an ack from rob, so...
> 									Pavel
> 									

So basically it would have been better to move the description that I
added to the c-file as "supported devices" in the device tree file?

With both commits already acked: Rob and Pavel: Should I change that?

If you both say yes, I would rename the file in the binding like
suggested and move the detailed protocol description from the driver to
the binding.

Best regards

Christian
