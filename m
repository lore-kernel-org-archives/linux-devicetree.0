From: Heiko Schocher <hs@denx.de>
Subject: Re: [PATCH 1/2] misc: add cc1101 devicetree binding
Date: Thu, 3 Oct 2019 07:21:40 +0200
Message-ID: <2329ed8f-7e34-596a-ae94-c9b5ac263908@denx.de>
References: <20190922060356.58763-1-hs@denx.de>
 <20190922060356.58763-2-hs@denx.de>
 <5d94b1e3.1c69fb81.9d89.1cce@mx.google.com>
Reply-To: hs@denx.de
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5d94b1e3.1c69fb81.9d89.1cce@mx.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello Rob,

Am 02.10.2019 um 16:19 schrieb Rob Herring:
> On Sun, Sep 22, 2019 at 08:03:55AM +0200, Heiko Schocher wrote:
>> add devicetree binding for cc1101 misc driver.
>>
>> Signed-off-by: Heiko Schocher <hs@denx.de>
>> ---
>>
>>   .../devicetree/bindings/misc/cc1101.txt       | 27 +++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/misc/cc1101.txt
> 
> Can you please convert this to DT schema.

Of course, missed this point, sorry, reworked. Is there a HowTo
for writting a schema?
(beside Documentation/devicetree/bindings/example-schema.yaml)

>> diff --git a/Documentation/devicetree/bindings/misc/cc1101.txt b/Documentation/devicetree/bindings/misc/cc1101.txt
>> new file mode 100644
>> index 0000000000000..afea6acf4a9c5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/misc/cc1101.txt
> 
> Normal naming is to use compatible string. So ti,cc1101.yaml for schema.

renamed.

> 
>> @@ -0,0 +1,27 @@
>> +driver cc1101 Low-Power Sub-1 GHz RF Transceiver chip from Texas
>> +Instruments.
>> +
>> +Requires node properties:
>> +- compatible : should be "ti,cc1101";
>> +- reg        : Chip select address of device, see:
>> +               Documentation/devicetree/bindings/spi/spi-bus.txt
>> +- gpios      : list of 2 gpios, first gpio is for GDO0 pin
>> +               second for GDO2 pin, see more:
> 
> Is there a GDO1? Would be hard to add later because you can't change the
> indices once defined.

Good point. There is a GDO1, so yes, this makes sense, added.

> 
>> +               Documentation/devicetree/bindings/gpio/gpio.txt
>> +
>> +Recommended properties:
>> + - spi-max-frequency: Definition as per
>> +                Documentation/devicetree/bindings/spi/spi-bus.txt
> 
> Notice that this file is now just in redirection...

Ok.

> 
>> + - freq       : used spi frequency for communication with cc1101 chip
> 
> What's this? Doesn't spi-max-frequency cover it?

Of course, removed.

Thanks for your time and review.

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de
