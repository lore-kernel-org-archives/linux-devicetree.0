From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: add binding documentation for
 adt7475
Date: Sun, 18 Nov 2018 14:56:56 -0800
Message-ID: <f3a29bc9-dbfc-bfb8-8707-2b67d96c2e04@roeck-us.net>
References: <20181108225607.7521-1-chris.packham@alliedtelesis.co.nz>
 <20181108225607.7521-2-chris.packham@alliedtelesis.co.nz>
 <20181117152949.GA31247@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181117152949.GA31247@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On 11/17/18 7:29 AM, Rob Herring wrote:
> On Fri, Nov 09, 2018 at 11:56:06AM +1300, Chris Packham wrote:
>> With the addition of the invert-pwm property the adt7475 needs its own
>> binding documentation rather being captured under trivial-devices.txt.
>>
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>> ---
>> Changes in v2:
>> - use pwm-polarity attiribute to indicate normal or inverted polarity.
>>
>>   .../devicetree/bindings/hwmon/adt7475.txt     | 24 +++++++++++++++++++
>>   .../devicetree/bindings/trivial-devices.txt   |  4 ----
>>   2 files changed, 24 insertions(+), 4 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/hwmon/adt7475.txt
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/adt7475.txt b/Documentation/devicetree/bindings/hwmon/adt7475.txt
>> new file mode 100644
>> index 000000000000..d9212b5e9036
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/adt7475.txt
>> @@ -0,0 +1,24 @@
>> +*ADT7475 hwmon sensor.
>> +
>> +Required properties:
>> +- compatible: One of
>> +	"adi,adt7473"
>> +	"adi,adt7475"
>> +	"adi,adt7476"
>> +	"adi,adt7490"
>> +
>> +- reg: I2C address
>> +
>> +optional properties:
>> +
>> +- pwm-polarity: This configures the polarity of the PWM. 0
>> +		(PWM_POLARITY_NORMAL) uses logic high for 100% duty cycle. 1
>> +                (PWM_POLARITY_INVERSED) uses logic low for 100% duty cycle.
> 
> So we're using part of the PWM binding, but none of the rest of it? What
> is the PWM connection here?
> The chip has a built-in PWM controller to control fan speeds. PWM frequency
as well as PWM polarity are configurable. I had suggested to use the terminology
from Documentation/devicetree/bindings/pwm/pwm.txt. Other than terminology there
is no connection to a standard pwm controller.

Another option/possibility would be to use a boolean, such as pwm-polarity-inverted.
We are open to suggestions.

> It sounds like this is common for sensors, so this should be documented
> somewhere common.
> 
Sure, no problem. Any suggestion where ?

Thanks,
Guenter
