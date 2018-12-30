Return-Path: <SRS0=1pG6=PH=denx.de=marex@kernel.org>
Subject: Re: [PATCH V2 01/10] input: touchscreen: ili210x: Add DT binding
 document
References: <20181220204305.28807-1-marex@denx.de>
 <20181220204305.28807-2-marex@denx.de> <20181227214146.GA13210@bogus>
From: Marek Vasut <marex@denx.de>
Message-ID: <f614d695-9df9-14b9-0e94-7de177da732e@denx.de>
Date: Sun, 30 Dec 2018 17:01:36 +0100
MIME-Version: 1.0
In-Reply-To: <20181227214146.GA13210@bogus>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh@kernel.org>
Cc: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Henrik Rydberg <rydberg@bitmath.org>, Olivier Sobrie <olivier@sobrie.be>, Philipp Puschmann <pp@emlix.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 12/27/18 10:41 PM, Rob Herring wrote:
> On Thu, Dec 20, 2018 at 09:42:56PM +0100, Marek Vasut wrote:
>> Add DT binding document for the Ilitek ILI210x and ILI251x
>> touchscreen controllers.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>> Cc: Henrik Rydberg <rydberg@bitmath.org>
>> Cc: Olivier Sobrie <olivier@sobrie.be>
>> Cc: Philipp Puschmann <pp@emlix.com>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> To: linux-input@vger.kernel.org
>> ---
>> V2: New patch
>> ---
>>  .../bindings/input/ilitek,ili2xxx.txt         | 25 +++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/input/ilitek,ili2xxx.txt
>>
>> diff --git a/Documentation/devicetree/bindings/input/ilitek,ili2xxx.txt b/Documentation/devicetree/bindings/input/ilitek,ili2xxx.txt
>> new file mode 100644
>> index 000000000000..bc256557ae8c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/input/ilitek,ili2xxx.txt
>> @@ -0,0 +1,25 @@
>> +Ilitek ILI210x/ILI251x touchscreen controller
>> +
>> +Required properties:
>> +- compatible:
>> +    ilitek,ili210x for ILI210x
>> +    ilitek,ili251x for ILI251x
> 
> Generally, we don't have wildcards in compatible strings. What's the 'x' 
> signify? I couldn't find much info on these parts.

Presumably there are other parts in that family of chips. I don't have
the datasheet for any of the chips either, I extracted the necessary
driver adjustments from the ilitek kernel driver (6500 kLoC , where C
probably doesn't stand for Code, but something else ...).

In my case, the chip itself is attached to the panel assembly, which is
covered in thick aluminum casing, so I'm unable to visually check the
chip markings ; if there are any on it.

As for the older ili210x, that's at least what some DTs might've matched
on as an i2c simple device. However, there's no in-tree DT that uses it.

>> +
>> +- reg: The I2C address of the device
>> +
>> +- interrupts: The sink for the touchscreen's IRQ output
>> +    See ../interrupt-controller/interrupts.txt
>> +
>> +Optional properties for main touchpad device:
>> +
>> +- reset-gpios: GPIO specifier for the touchscreen's reset pin (active low)
>> +
>> +Example:
>> +
>> +	touch@41 {
> 
> touchscreen@41

Fixed

>> +		compatible = "ilitek,ili251x";
>> +		reg = <0x41>;
>> +		interrupt-parent = <&gpio4>;
>> +		interrupts = <7 IRQ_TYPE_EDGE_FALLING>;
>> +		reset-gpios = <&gpio5 21 GPIO_ACTIVE_LOW>;
>> +	};
>> -- 
>> 2.19.2
>>


-- 
Best regards,
Marek Vasut
