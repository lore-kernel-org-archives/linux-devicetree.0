From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v8 7/9] dt: bindings: lp50xx: Introduce the lp50xx family
 of RGB drivers
Date: Tue, 24 Sep 2019 09:52:39 -0500
Message-ID: <5c1091b6-788e-79b2-a6ac-911401b58ed3@ti.com>
References: <20190920174139.30079-1-dmurphy@ti.com>
 <20190920174139.30079-8-dmurphy@ti.com>
 <73a95bac-7433-5b06-5701-c742307aa004@gmail.com>
 <ba92d95a-9f2c-6b37-74d3-4e3a87ad28bf@ti.com>
 <6788e600-460a-7846-04d0-480268e674a1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6788e600-460a-7846-04d0-480268e674a1@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, pavel@ucw.cz, Rob Herring <robh+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Rob

On 9/23/19 4:42 PM, Jacek Anaszewski wrote:
> Dan,
>
> On 9/23/19 5:28 PM, Dan Murphy wrote:
>> Jacek
>>
>> On 9/21/19 10:13 AM, Jacek Anaszewski wrote:
>>> Dan,
>>>
>>> On 9/20/19 7:41 PM, Dan Murphy wrote:
>>>> Introduce the bindings for the Texas Instruments LP5036, LP5030, LP5024,
>>>> LP5018, LP5012 and LP5009 RGB LED device driver.  The
>>>> LP5036/30/24/18/12/9
>>>> can control RGB LEDs individually or as part of a control bank group.
>>>> These devices have the ability to adjust the mixing control for the RGB
>>>> LEDs to obtain different colors independent of the overall brightness of
>>>> the LED grouping.
>>>>
>>>> Datasheet:
>>>> http://www.ti.com/lit/ds/symlink/lp5012.pdf
>>>> http://www.ti.com/lit/ds/symlink/lp5024.pdf
>>>> http://www.ti.com/lit/ds/symlink/lp5036.pdf
>>>>
>>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>>> ---
>>>>    .../devicetree/bindings/leds/leds-lp50xx.txt  | 148 ++++++++++++++++++
>>>>    1 file changed, 148 insertions(+)
>>>>    create mode 100644
>>>> Documentation/devicetree/bindings/leds/leds-lp50xx.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/leds/leds-lp50xx.txt
>>>> b/Documentation/devicetree/bindings/leds/leds-lp50xx.txt
>>>> new file mode 100644
>>>> index 000000000000..9d05f43042e0
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/leds/leds-lp50xx.txt
>>>> @@ -0,0 +1,148 @@
>>>> +* Texas Instruments - LP5009/12/18/24/30/36 RGB LED driver
>>>> +
>>>> +The LP50XX is multi-channel, I2C RGB LED Drivers that can group RGB
>>>> LEDs into
>>>> +a LED group or control them individually.
>>>> +
>>>> +The difference in these RGB LED drivers is the number of supported
>>>> RGB modules.
>>>> +
>>>> +Required parent properties:
>>>> +    - compatible:
>>>> +        "ti,lp5009"
>>>> +        "ti,lp5012"
>>>> +        "ti,lp5018"
>>>> +        "ti,lp5024"
>>>> +        "ti,lp5030"
>>>> +        "ti,lp5036"
>>>> +    - reg :  I2C slave address
>>>> +        lp5009/12 - 0x28
>>>> +        lp5018/24 - 0x28
>>>> +        lp5030/36 - 0x30
>>>> +    - #address-cells : 1
>>>> +    - #size-cells : 0
>>>> +
>>>> +Optional parent properties:
>>>> +    - enable-gpios : gpio pin to enable/disable the device.
>>>> +    - vled-supply : LED supply
>>>> +
>>>> +Required child properties:
>>>> +    - #address-cells : 1
>>>> +    - #size-cells : 0
>>>> +    - reg : This is the LED module number.
>>>> +    - color : see Documentation/devicetree/bindings/leds/common.txt
>>>> +    - function : see Documentation/devicetree/bindings/leds/common.txt
>>>> +
>>>> +Required child properties only is LED modules will be banked:
>>>> +    - ti,led-bank : This property denotes the LED module numbers
>>>> that will
>>>> +            be controlled as a single RGB cluster.  Each LED module
>>>> +            number will be controlled by a single LED class instance.
>>>> +            There can only be one instance of the ti,led-bank
>>>> +            property for each device node.
>>>> +
>>>> +Required grandchildren properties:
>>>> +    - reg : A single entry denoting the LED module that controls
>>>> +        the RGB cluster.
>>>> +    - color : see
>>>> Documentation/devicetree/bindings/leds/leds-multicolor.txt
>>>> +    - led-sources : see
>>>> Documentation/devicetree/bindings/leds/common.txt
>>>> +
>>>> +The LED outputs associated with the LED modules are defined in Table
>>>> 1 of the
>>>> +corresponding data sheets.
>>> We must enclose this information here.
>> That will make this doc pretty messy especially with the LP5036 entries.
>>
>> I would have to do ascii art to make it understandable and basically
>> there is not a delta in the lesser devices in the outputs
>>
>> I don't see value in reproducing this data sheet contents in the
>> dt-bindings.
> IMO DT bindings should be self-contained. We cannot assume that
> user will always have Internet access.
>
>> For example (LP5012) and then for the LP5036 multiply this by 3
>>
>> Table 1.
>>
>> Bank Number and LED Number Assignment
>> OUT NUMBER BANK NUMBER  RGB LED MODULE NUMBER
>> OUT0                    Bank A
>> OUT1                    Bank B                        LED0
>> OUT2                    Bank C
>>
>> OUT3                    Bank A
>> OUT4                    Bank B                        LED1
>> OUT5                    Bank C
>>
>> OUT6                    Bank A
>> OUT7                    Bank B                        LED2
>> OUT8                    Bank C
>>
>> OUT9 (LP5012 only) Bank A
>> OUT10 (LP5012 only) Bank B                  LED3
>> OUT11 (LP5012 only) Bank C
>
> I'd say it is required. But let's wait for DT guys' opinion.
>
Do you have an opinion on whether we need to publish in the DT the 
output to module map?

This is the last item I have to fix before submitting v9.

Dan


>>>> +
>>>> +LP5009 - 2 Total RGB cluster LED outputs 0-1
>> This should be 3 total not 2
>>
>> Dan
>>
>>>> +LP5012 - 4 Total RGB cluster LED outputs 0-3
>>>> +LP5018 - 6 Total RGB cluster LED outputs 0-5
>>>> +LP5024 - 8 Total RGB cluster LED outputs 0-7
>>>> +LP5030 - 10 Total RGB cluster LED outputs 0-9
>>>> +LP5036 - 12 Total RGB cluster LED outputs 0-11
>>>> +
>>>> +Optional child properties:
>>>> +    - label : see Documentation/devicetree/bindings/leds/common.txt
>>>> +    - linux,default-trigger :
>>>> +       see Documentation/devicetree/bindings/leds/common.txt
>>>> +
>>>> +Examples:
>>>> +led-controller@29 {
>>>> +    #address-cells = <1>;
>>>> +    #size-cells = <0>;
>>>> +    compatible = "ti,lp5024";
>>>> +    reg = <0x29>;
>>>> +    enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
>>>> +    vled-supply = <&vmmcsd_fixed>;
>>>> +
>>>> +    multi-led@1 {
>>>> +        #address-cells = <1>;
>>>> +        #size-cells = <0>;
>>>> +        reg = <1>;
>>>> +        color = <LED_COLOR_ID_MULTI>;
>>>> +        function = LED_FUNCTION_STATUS;
>>>> +
>>>> +        led@3 {
>>>> +            reg = <3>;
>>>> +            color = <LED_COLOR_ID_RED>;
>>>> +        };
>>>> +
>>>> +        led@4 {
>>>> +            reg = <4>;
>>>> +            color = <LED_COLOR_ID_GREEN>;
>>>> +        };
>>>> +
>>>> +        led@5 {
>>>> +            reg = <5>;
>>>> +            color = <LED_COLOR_ID_BLUE>;
>>>> +        };
>>>> +    };
>>>> +
>>>> +    multi-led@2 {
>>>> +        #address-cells = <1>;
>>>> +        #size-cells = <0>;
>>>> +        reg = <2>;
>>>> +        color = <LED_COLOR_ID_MULTI>;
>>>> +        function = LED_FUNCTION_STANDBY;
>>>> +        ti,led-bank = <2 3 5>;
>>>> +
>>>> +        led@6 {
>>>> +            reg = <0x6>;
>>>> +            color = <LED_COLOR_ID_RED>;
>>>> +            led-sources = <6 9 15>;
>>>> +        };
>>>> +
>>>> +        led@7 {
>>>> +            reg = <0x7>;
>>>> +            color = <LED_COLOR_ID_GREEN>;
>>>> +            led-sources = <7 10 16>;
>>>> +        };
>>>> +
>>>> +        led@8 {
>>>> +            reg = <0x8>;
>>>> +            color = <LED_COLOR_ID_BLUE>;
>>>> +            led-sources = <8 11 17>;
>>>> +        };
>>>> +    };
>>>> +
>>>> +    multi-led@4 {
>>>> +        #address-cells = <1>;
>>>> +        #size-cells = <0>;
>>>> +        reg = <4>;
>>>> +        color = <LED_COLOR_ID_MULTI>;
>>>> +        function = LED_FUNCTION_ACTIVITY;
>>>> +
>>>> +        led@12 {
>>>> +            reg = <12>;
>>>> +            color = <LED_COLOR_ID_RED>;
>>>> +        };
>>>> +
>>>> +        led@13 {
>>>> +            reg = <13>;
>>>> +            color = <LED_COLOR_ID_GREEN>;
>>>> +        };
>>>> +
>>>> +        led@14 {
>>>> +            reg = <14>;
>>>> +            color = <LED_COLOR_ID_BLUE>;
>>>> +        };
>>>> +    };
>>>> +};
>>>> +
>>>> +For more product information please see the link below:
>>>> +http://www.ti.com/lit/ds/symlink/lp5012.pdf
>>>> +http://www.ti.com/lit/ds/symlink/lp5024.pdf
>>>> +http://www.ti.com/lit/ds/symlink/lp5036.pdf
>>>>
