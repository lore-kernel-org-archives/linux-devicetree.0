Return-Path: <SRS0=lRFq=VH=ti.com=jjhiblot@kernel.org>
Subject: Re: devicetree bindings for a generic led-based backlight driver
References: <69f3a300-9e37-448d-e6fa-49c1c9ca0dd6@ti.com>
 <400ac00b-d3c7-b58f-52fa-8b18b6c7e4a2@gmail.com>
 <283a3b7c-c3ed-719e-14e3-fc73e08af880@ti.com>
 <e7c5a500-4107-8895-d0fc-377c71cd3b34@gmail.com> <20190706151941.GB9856@amd>
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <616bb9bb-4518-3d25-cafe-afccd23d1070@ti.com>
Date: Wed, 10 Jul 2019 11:26:14 +0200
MIME-Version: 1.0
In-Reply-To: <20190706151941.GB9856@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
To: Pavel Machek <pavel@ucw.cz>, Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, robh@kernel.org, "Valkeinen, Tomi" <tomi.valkeinen@ti.com>
List-ID: <devicetree@vger.kernel.org>

Hi Pavel

On 06/07/2019 17:19, Pavel Machek wrote:
> Hi!
>
>>>>> A few years ago (2015), Tomi Valkeinen posted a series implementing a
>>>>> backlight driver on top of a LED device.
>>>>>
>>>>> https://patchwork.kernel.org/patch/7293991/
>>>>> https://patchwork.kernel.org/patch/7294001/
>>>>> https://patchwork.kernel.org/patch/7293981/
>>>>>
>>>>> The discussion stopped� because he lacked the time to work on it.
>>>>>
>>>>> I will be taking over the task and, before heading in the wrong
>>>>> direction, wanted a confirmation that the binding Tomi last proposed in
>>>>> hist last email was indeed the preferred option.
>>>>>
>>>>> It will probably require some modifications in the LED core to create
>>>>> the right kind of led-device (normal, flash or backlight) based on the
>>>>> compatible option.
>>>> I recall that discussion. I gave my ack for the LED changes but
>>>> now we have more LED people that might want to look into that.
>>> Regarding the LED bindings as discussed by Tom and Rob in
>>> https://patchwork.kernel.org/patch/7293991/, what do you think of using
>>> a 'compatible' string to make a LED device also a backlight or a flash LED ?
>> After going through the referenced discussion and refreshing my memory
>> it looks to me the most reasonable way to go for backlight case.
>>
>> Nevertheless I'd not tamper at LED flash support - if it's not broken,
>> don't fix it.
>>
>> Best regards,
>> Jacek Anaszewski
>>
>>> Here is the example from Tomi at the end of the discussion:
>>>
>>> /* tlc59108 is an i2c device */
>>> tlc59116@40 {
>>> 	#address-cells = <1>;
>>> 	#size-cells = <0>;
>>> 	compatible = "ti,tlc59108";
>>> 	reg = <0x40>;
>>>
>>> 	wan@0 {
>>> 		label = "wrt1900ac:amber:wan";
>>> 		reg = <0x0>;
>>> 	};
>>>
>>> 	bl@2 {
>>> 		label = "backlight";
>>> 		reg = <0x2>;
>>>
>>> 		compatible = "led-backlight";
>>> 		brightness-levels = <0 243 245 247 248 249 251 252 255>;
>>> 		default-brightness-level = <8>;
>>>
>>> 		enable-gpios = <&pcf_lcd 13 GPIO_ACTIVE_LOW>;
> So... this needs some kind of reference to display it belongs to,
> right?

This is the reverse. The display uses a reference the backlight.

JJ

>
> 									Pavel
>
