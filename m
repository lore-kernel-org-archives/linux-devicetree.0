From: Thor Thayer <tthayer@opensource.altera.com>
Subject: Re: [RFC 1/8] dt-bindings: mfd: Add Altera Arria10 System Resource
 Chip bindings
Date: Fri, 15 Apr 2016 12:02:03 -0500
Message-ID: <57111E8B.1040503@opensource.altera.com>
References: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
 <1459278791-3646-2-git-send-email-tthayer@opensource.altera.com>
 <20160330113532.GI3323@x1>
Reply-To: <tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160330113532.GI3323@x1>
Sender: linux-gpio-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org, pawell.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, dinguyen@opensource.altera.com, linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Lee

On 03/30/2016 06:35 AM, Lee Jones wrote:
> On Tue, 29 Mar 2016, tthayer@opensource.altera.com wrote:
>
>> From: Thor Thayer <tthayer@opensource.altera.com>
>>
>> The Altera Arria10 Devkit System Resource chip is a Multi-Function
>> Device, it has two subdevices:
>>       - GPIO
>>       - HWMON
>>
>> This patch adds documentation for the Altera A10-SR DT bindings.
>>
>> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
>> ---
>>   .../devicetree/bindings/mfd/altera-a10sr.txt       |   35 ++++++++++++++++++++
>>   1 file changed, 35 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mfd/altera-a10sr.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/altera-a10sr.txt b/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
>> new file mode 100644
>> index 0000000..564c761
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
>> @@ -0,0 +1,35 @@
>> +* Altera Arria10 Development Kit System Resource Chip
>> +
>> +Required parent device properties:
>> +- compatible : "altr,altr_a10sr"
>> +- spi-max-frequency : Maximum SPI frequency.
>> +- reg : the SPI Chip Select address for the Arria10 System Resource chip
>
> DT bindings are much easier to read in the following format:
>
> - compatible		: "altr,altr_a10sr"
> - spi-max-frequency	: Maximum SPI frequency.
> - reg			: the SPI Chip Select address for the Arria10 System Resource chip
>
> ... also, sentences start with an uppercase char.
>
>> +The A10SR consists of this varied group of sub-devices:
>> +
>> +Device                   Description
>> +------                   ----------
>> +altr_a10sr_gpio          GPIO Controller
>> +altr_a10sr_hwmon         Hardware Monitor
>> +
>> +The LEDs are implemented entirely in the device tree using
>> +the gpio-led framework.
>
> This is a Linuxisum and should not live in DT bindings.
>
>> +Example:
>> +
>> +        a10-sr: a10-sr@0 {
>
> Nodes should be named after their device 'type'.
>
> Does this device really start a address 0?
>

I see in the documentation on device trees there are a number of 
categories I can use. GPIO is easy because it is one of the categories 
but I'm not sure about the new device I'm adding since the a10sr is a 
new device.

I believe I should only call out the name and address on the SPI bus like:

a10sr@0 {

>> +		compatible = "altr,altr-a10sr";
>> +		reg = <0>;
>> +		spi-max-frequency = <100000>;
>> +
>> +		a10sr_gpio: a10sr_gpio {
>
> Device type only please.
>

and this would be a10sr_gpio: gpio-controller {

Does that seem correct?

>> +			compatible = "altr,a10sr-gpio";
>> +			gpio-controller;
>> +			#gpio-cells = <2>;
>> +			ngpios = <16>;
>> +		};
>> +
>> +		a10sr_hwmon: a10sr_hwmon {
>
> Device type only please.
>
I need to revisit where this will live (hwmon does not seem to be the 
correct place) so it will change but I can follow the format above if it 
is correct.

Thanks for reviewing.

>> +			compatible = "altr,a10sr-hwmon";
>> +		};
>> +	};
>
