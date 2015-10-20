From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH 1/4] Documentation: tps65086: Add DT bindings for the
 TPS65086 PMIC
Date: Tue, 20 Oct 2015 09:02:56 -0500
Message-ID: <56264990.8050501@ti.com>
References: <1445014753-15450-1-git-send-email-afd@ti.com>
 <1445014753-15450-2-git-send-email-afd@ti.com> <20151019091311.GH31804@x1>
 <5625095F.5080204@ti.com> <20151019152100.GK31804@x1>
 <56250AF9.3030907@ti.com> <20151020113128.GN31804@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20151020113128.GN31804@x1>
Sender: linux-gpio-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Brown <broonie@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/20/2015 06:31 AM, Lee Jones wrote:
> On Mon, 19 Oct 2015, Andrew F. Davis wrote:
>
>> On 10/19/2015 10:21 AM, Lee Jones wrote:
>>> On Mon, 19 Oct 2015, Andrew F. Davis wrote:
>>>
>>>> On 10/19/2015 04:13 AM, Lee Jones wrote:
>>>>> On Fri, 16 Oct 2015, Andrew F. Davis wrote:
>>>>>
>>>>>> The TPS65086 PMIC contains several regulators and a GPO controller.
>>>>>> Add bindings for the TPS65086 PMIC.
>>>>>>
>>>>>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>>>>>> ---
>>>>>>   .../devicetree/bindings/gpio/gpio-tps65086.txt     | 17 ++++++++
>>>>>>   Documentation/devicetree/bindings/mfd/tps65086.txt | 46 ++++++++++++++++++++++
>>>>>>   .../bindings/regulator/tps65086-regulator.txt      | 36 +++++++++++++++++
>>>>>
>>>>> Please split these up into separate patches.
>>>>>
>>>>> There is no functional reason to bundle them up.
>>>>>
>>>>
>>>> ACK
>>>>
>>>>>>   3 files changed, 99 insertions(+)
>>>>>>   create mode 100644 Documentation/devicetree/bindings/gpio/gpio-tps65086.txt
>>>>>>   create mode 100644 Documentation/devicetree/bindings/mfd/tps65086.txt
>>>>>>   create mode 100644 Documentation/devicetree/bindings/regulator/tps65086-regulator.txt
>>>>>
>>>>> [...]
>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/mfd/tps65086.txt b/Documentation/devicetree/bindings/mfd/tps65086.txt
>>>>>> new file mode 100644
>>>>>> index 0000000..4b6aeb4
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/mfd/tps65086.txt
>>>>>> @@ -0,0 +1,46 @@
>>>>>> +* TPS65086 Power Management Integrated Circuit bindings
>>>>>> +
>>>>>> +Required properties:
>>>>>> + - compatible		: Should be "ti,tps65086".
>>>>>
>>>>> Any indication that it's a PMIC?
>>>>>
>>>>
>>>> In the compatible string?
>>>
>>> Ya.
>>>
>>
>> Not sure what you mean then?, no one else seems to be doing that,
>> "xx,xxxxxxx-pmic" is usually used for matching the regulator node,
>> not the device itself.
>
> Either the driver is MFD is the PMIC or it's not.
>
> If it is, the compatible should reflect that, if isn't not then the
> description in the header comment and the one above is not correct.
>
> IMO, 'pmic' should not be used in the regulator compatible strings, as
> it's a general description of the overall device.  The regulators are
> just a component of that device.
>

I agree about not using compatible in regulator nodes (Mark Brown and I had
a discussion on this topic), what I mean with "xxxxxxx-pmic" is for the MFD
core to match sub-drivers (mfd_cells). For example drivers/mfd/tps80031.c,
matches the regulator with "tps80031-pmic", the clock with "tps80031-clock",
the charger with "tps80031-charger", etc..

The core device itself is just matched with "ti,tps65086" through the I2C bus
matching.

I could change the core to be "tps65086-pmic", then call the regulator
driver "tps65086-regulator" if this works for you, this seems to be the
way new drivers name the regulator driver (max77843.c).

>>>>>> + - reg			: Slave address.
>>>>>
>>>>> I2C/SPI?
>>>>>
>>>>
>>>> ACK
>>>>
>>>>>> + - interrupt-parent	: The parent interrupt controller.
>>>>>
>>>>> Phandled to ...
>>>>>
>>>>
>>>> ACK
>>>>
>>>>>> + - interrupts		: The interrupt line the device is connected to.
>>>>>> + - interrupt-controller	: Marks the device node as an interrupt controller.
>>>>>> + - #interrupt-cells	: The number of cells to describe an IRQ, this
>>>>>> +			  should be 2. The first cell is the IRQ number.
>>>>>> +			  The second cell is the flags, encoded as the trigger
>>>>>> +			  masks from ../interrupt-controller/interrupts.txt.
>>>>>
>>>>> Masks?  What masks?
>>>>>
>>>>> Best to make a link to the header where the flags are defined here.
>>>>>
>>>>
>>>> ACK
>>>>
>>>>>> +Additional nodes defined in:
>>>>>> + - Regulators	: ../regulator/tps65086-regulator.txt.
>>>>>> + - GPIO		: ../gpio/gpio-tps65086.txt.
>>>>>
>>>>> I'd suggest removing the full stops from all of the lines above.
>>>>>
>>>>> Just treat them as bullet points like we normally do.
>>>>>
>>>>
>>>> ACK
>>>>
>>>>>> +Example:
>>>>>> +
>>>>>> +	pmic: tps65086@5e {
>>>>>> +		compatible = "ti,tps65086";
>>>>>> +		reg = <0x5e>;
>>>>>> +		interrupt-parent = <&gpio1>;
>>>>>> +		interrupts = <28 IRQ_TYPE_LEVEL_LOW>;
>>>>>> +		interrupt-controller;
>>>>>> +		#interrupt-cells = <2>;
>>>>>> +
>>>>>> +		regulators {
>>>>>> +			compatible = "ti,tps65086-regulator";
>>>>>> +
>>>>>> +			buck1 {
>>>>>> +				regulator-name = "vcc1";
>>>>>> +				regulator-min-microvolt = <1600000>;
>>>>>> +				regulator-max-microvolt = <1600000>;
>>>>>> +				regulator-boot-on;
>>>>>> +				ti,regulator-decay;
>>>>>> +				ti,regulator-step-size-25mv;
>>>>>> +			};
>>>>>> +		};
>>>>>> +
>>>>>> +		gpio4: tps65086_gpio {
>>>>>> +			compatible = "ti,tps65086-gpio";
>>>>>> +			gpio-controller;
>>>>>> +			#gpio-cells = <2>;
>>>>>> +		};
>>>>>> +	};
>>>>>
>>>>> [...]
>>>>>
>>>>
>>>
>>
>
