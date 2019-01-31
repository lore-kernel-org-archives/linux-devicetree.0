From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH RFC 1/3] dt-bindings: hwmon: Add tachometer interrupt to
 pwm-fan
Date: Thu, 31 Jan 2019 09:02:33 +0100
Message-ID: <fbfd2b67-f6d2-4d6e-9351-d1d2165e571b@i2se.com>
References: <1548860827-29796-1-git-send-email-stefan.wahren@i2se.com>
 <1548860827-29796-2-git-send-email-stefan.wahren@i2se.com>
 <20190130172815.GC14781@roeck-us.net>
 <625436113.118199.1548879811777@email.ionos.de>
 <20190130203525.GA23614@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190130203525.GA23614@roeck-us.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Kamil Debski <kamil@wypas.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Guenter,

Am 30.01.19 um 21:35 schrieb Guenter Roeck:
> On Wed, Jan 30, 2019 at 09:23:31PM +0100, Stefan Wahren wrote:
>> Hi Guenter,
>>
>>> Guenter Roeck <linux@roeck-us.net> hat am 30. Januar 2019 um 18:28 geschrieben:
>>>
>>>
>>> On Wed, Jan 30, 2019 at 04:07:05PM +0100, Stefan Wahren wrote:
>>>> This adds the tachometer interrupt to the pwm-fan binding, which is
>>>> necessary for RPM support.
>>>>
>>>> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/hwmon/pwm-fan.txt | 3 +++
>>>>  1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.txt b/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
>>>> index 49ca5d8..7f69b0b 100644
>>>> --- a/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
>>>> +++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
>>>> @@ -8,6 +8,9 @@ Required properties:
>>>>  
>>>>  Optional properties:
>>>>  - fan-supply    : phandle to the regulator that provides power to the fan
>>>> +- interrupts    : contains a single interrupt specifier which describes the
>>>> +                  tachometer pin output of a 2 pulse-per-revolution fan.
>>>> +                  See interrupt-controller/interrupts.txt for the format.
>>> So a hypothetical {1,4} pulse-per-revolution fan would explicitly not be
>>> supported ? Why ?
>> i could add an additional property to specify the pulse per revolution and use the 2 as default (according to the Intel spec for 4 pin pwm fan) which should fit in most cases.
>>
> That would be a possibility and make sense, but that is not
> the point here.  The "interrupts" property does not and should
> not care how many pulses per revolution the fan provides.

sorry, i'm not sure what's the problem about. Do you want me to use a
GPIO instead of interrupt?

Or is it the wording here?

Suggestion:

contains a single interrupt specifier which is describes the tachometer
output of the fan as an input

Stefan

>
> Guenter
