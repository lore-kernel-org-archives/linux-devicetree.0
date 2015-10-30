From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH v5 1/5] Documentation: tps65912: Add DT bindings for the
 TPS65912 PMIC
Date: Fri, 30 Oct 2015 13:01:28 -0500
Message-ID: <5633B078.7080209@ti.com>
References: <1446161922-8755-1-git-send-email-afd@ti.com>
 <1446161922-8755-2-git-send-email-afd@ti.com> <20151030171006.GZ4058@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20151030171006.GZ4058@x1>
Sender: linux-gpio-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/30/2015 12:10 PM, Lee Jones wrote:
> On Thu, 29 Oct 2015, Andrew F. Davis wrote:
>
>> The TPS65912 PMIC contains several regulators and a GPIO controller.
>> Add bindings for the TPS65912 PMIC.
>>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> ---
>>   .../devicetree/bindings/gpio/gpio-tps65912.txt     | 16 +++++++
>
> Why have you dropped Linus' Review-by?
>

Strange, I thought I made a change to this. Well this brings up a question,
how much change can we have before we are supposed to drop Reviewed/Acked-by?

>>   Documentation/devicetree/bindings/mfd/tps65912.txt | 51 ++++++++++++++++++++++
>>   .../bindings/regulator/tps65912-regulator.txt      | 28 ++++++++++++
>>   3 files changed, 95 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/gpio/gpio-tps65912.txt
>>   create mode 100644 Documentation/devicetree/bindings/mfd/tps65912.txt
>>   create mode 100644 Documentation/devicetree/bindings/regulator/tps65912-regulator.txt
>>
>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-tps65912.txt b/Documentation/devicetree/bindings/gpio/gpio-tps65912.txt
>> new file mode 100644
>> index 0000000..0c5c05c4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpio/gpio-tps65912.txt
>> @@ -0,0 +1,16 @@
>> +* TPS65912 GPIO Controller bindings
>> +
>> +Required properties:
>> + - compatible : Should be "ti,tps65912-gpio".
>> + - gpio-controller : Marks the device node as a GPIO Controller.
>> + - #gpio-cells : Should be two.  The first cell is the pin number and
>
> You should add a (See: ../gpio/gpio.txt) here I think.
>

ACK

>> +     the second cell is used to specify flags.
>> +     See include/dt-bindings/gpio/gpio.h for possible values.
>
> This is a Linuxisum and shouldn't really live in here.
>
> I think it would be better to document them in ../gpio/gpio.txt and
> reference that instead.
>

Looks like that is already in ../gpio/gpio.txt:57

>> +Example:
>> +
>> +	gpio4: tps65912_gpio {
>
> Device names don't belong in node names.
>
> Just "gpio" will do.
>

ACK

>> +		compatible = "ti,tps65912-gpio";
>> +		gpio-controller;
>> +		#gpio-cells = <2>;
>> +	};
>> diff --git a/Documentation/devicetree/bindings/mfd/tps65912.txt b/Documentation/devicetree/bindings/mfd/tps65912.txt
>> new file mode 100644
>> index 0000000..da5804a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/tps65912.txt
>> @@ -0,0 +1,51 @@
>> +* TPS65912 Power Management Integrated Circuit bindings
>> +
>> +Required properties:
>> + - compatible : Should be "ti,tps65912".
>> + - reg : Slave address or chip select number (I2C / SPI).
>> + - interrupt-parent : The parent interrupt controller.
>> + - interrupts : The interrupt line the device is connected to.
>> + - interrupt-controller : Marks the device node as an interrupt controller.
>> + - #interrupt-cells: The number of cells to describe an IRQ, this should be 2.
>> +     The first cell is the IRQ number.
>> +     The second cell is the flags, encoded as the trigger masks from
>> +     ../interrupt-controller/interrupts.txt
>
> Nit: We *normally* treat these as bullet-points and not place
> full-stops on them:
>
> $ git grep "compatible" -- Documentation/devicetree/bindings/ | grep -v "\.$" | wc -l
> 5227
> $ git grep "compatible.*\.$" -- Documentation/devicetree/bindings/ | wc -l
> 486
>

What about for multi-sentence descriptions, we need the middle full-stops, then to not
have one on the end seems kinda odd looking.

> ... and I *personally* think it's easier to read the document if it's
> formatted as follows:
>
> - compatible			: Should be "ti,tps65912".
> - reg				: Slave address or chip select number (I2C / SPI).
> - interrupt-parent		: The parent interrupt controller.
> - interrupts			: The interrupt line the device is connected to.
> - interrupt-controller		: Marks the device node as an interrupt controller.
> - #interrupt-cells		: The number of cells to describe an IRQ, this should be 2.
> 					The first cell is the IRQ number.
> 					The second cell is the flags, encoded as the trigger masks from
> 					../interrupt-controller/interrupts.txt
>
> ... I hope you agree.
>

Yeah, I did that with the last driver, not sure why I forgot to fix that here, I'll fix this.

> [...]
>
