From: Thor Thayer <tthayer@opensource.altera.com>
Subject: Re: [PATCH 01/11] dt-bindings: mfd: Add Altera Arria10 System
 Resource Chip bindings
Date: Tue, 26 Apr 2016 08:54:54 -0500
Message-ID: <571F732E.6090301@opensource.altera.com>
References: <1461339219-15255-1-git-send-email-tthayer@opensource.altera.com>
 <1461339219-15255-2-git-send-email-tthayer@opensource.altera.com>
 <20160425125514.GA5100@rob-hp-laptop> <571E3160.60702@opensource.altera.com>
 <20160426123332.GA25487@rob-hp-laptop>
Reply-To: <tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-hwmon-owner@vger.kernel.org>
In-Reply-To: <20160426123332.GA25487@rob-hp-laptop>
Sender: linux-hwmon-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: lee.jones@linaro.org, linus.walleij@linaro.org, gnurou@gmail.com, jdelvare@suse.com, linux@roeck-us.net, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, dinguyen@opensource.altera.com, linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 04/26/2016 07:33 AM, Rob Herring wrote:
> On Mon, Apr 25, 2016 at 10:01:52AM -0500, Thor Thayer wrote:
>>
>>
>> On 04/25/2016 07:55 AM, Rob Herring wrote:
>>> On Fri, Apr 22, 2016 at 10:33:29AM -0500, tthayer@opensource.altera.com wrote:
>>>> From: Thor Thayer <tthayer@opensource.altera.com>
>>>>
>>>> The Altera Arria10 Devkit System Resource chip is a Multi-Function
>>>> Device with a GPIO expander and power supply alarm.
>>>
>>> An alarm with no interrupt? Are the GPIOs interrupt capable?
>>
>> The alarms have no interrupt but the GPIOs are interrupt capable (not
>> implemented with interrupt capability in this patch series).
>
> Please make the binding as complete as possible even if you don't
> support features in the driver yet. Driver features may evolve, but a
> specific h/w doesn't.
>
> Rob
>
Understood. Thanks for the explanation.
