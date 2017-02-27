From: Richard Leitner <richard.leitner@skidata.com>
Subject: Re: [PATCH v5] usb: misc: add USB251xB/xBi Hi-Speed Hub Controller
 Driver
Date: Mon, 27 Feb 2017 13:04:35 +0100
Message-ID: <984819e5-4699-45ee-7fd6-5b2e594088f0@skidata.com>
References: <1486714767-25930-1-git-send-email-richard.leitner@skidata.com>
 <20170216023004.25dwzy7ppxdoasfz@rob-hp-laptop>
 <31fd459f-aed3-9d4a-2a63-651131216542@g0hl1n.net>
 <CAL_JsqJ=ViO+QnTiZXSL7zyO7xu_+f7C4aSkfA7VmqiU92EeHg@mail.gmail.com>
 <a44c2244-bdb3-ebc3-cfd2-271d3dabe011@skidata.com>
 <1488188908.2612.18.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1488188908.2612.18.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Jan_L=c3=bcbbe?= <jlu@pengutronix.de>, Rob Herring <robh@kernel.org>
Cc: Linux USB List <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, dev@g0hl1n.net
List-Id: devicetree@vger.kernel.org

On 02/27/2017 10:48 AM, Jan Lübbe wrote:
> On Di, 2017-02-21 at 15:57 +0100, Richard Leitner wrote:
>>>>> This is a lot of properties. Are you really finding a need for all of
>>>>> them? Is this to handle h/w designers too cheap to put down the EEPROM?
>>>>> Maybe better to just define an eeprom property in the format the h/w
>>>>> expects.
>>>>
>>>>
>>>> I need about 15 of these properties. I just exposed them all to dt because I
>>>> thought they could be useful for somebody.
>>>>
>>>> Yes, these are a subset of the settings which can be configured via an
>>>> external EEPROM (By strapping some pins of the hub you can select if it
>>>> loads its configuration from an EEPROM or receives it via SMBus).
>>>>
>>>> My first thought was also to define only a byte array in dt, but IMHO these
>>>> options are much more readable and convenient for everybody. I'd also be
>>>> fine with removing the properties I don't need from dt. But that may lead to
>>>> future patches where somebody needs some of the options not already exposed
>>>> to dt.
>>>
>>> Okay. It's really a judgement call. If this is most of the settings,
>>> then it's fine. If it was only a fraction of them, then maybe we'd
>>> want to do just a byte array. Sounds like it is the former.
>>
>> In fact there are 6 more parameters available according to the
>> datasheet. So how should I proceed here? Remove the one's I'm not using
>> at the moment, leave them as they are or add the missing 6 too?
> 
> Rob, several of these properties look more like configuration rather
> than HW description ('skip-config', '*-id', 'manufacturer', 'product',
> 'serial'). Is DT the right place for this? I would expect userspace to
> provide the configuration.

Jan, on the one hand you're right, some (most) of the properties are
configuration parameters for the hub chip. On the other hand setting
these parameters (and therefore configuring the hub) avoids an
additional EEPROM chip and IMHO that's some kind of describing an
"imaginary HW". Isn't it? :-)

If DT is not the right place for it: Which userspace tool/procedure
would be appropriate for it? In my case the hub needs to be available
(in a configured state) when the initramfs gets executed.

Thanks for your feedback & regards,
Richard L
