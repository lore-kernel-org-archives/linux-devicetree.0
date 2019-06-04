From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] dt-bindings: thermal: Make cooling-maps property optional
Date: Tue, 4 Jun 2019 08:04:16 +0200
Message-ID: <f4675fc5-a7d1-1a6c-51ed-b6b6b599f5fe@linaro.org>
References: <20190515093647.47656-1-andy.tang@nxp.com>
 <VI1PR04MB43335AE882F7898F4DDD1A23F3150@VI1PR04MB4333.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <VI1PR04MB43335AE882F7898F4DDD1A23F3150@VI1PR04MB4333.eurprd04.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Tang <andy.tang@nxp.com>, "rui.zhang@intel.com" <rui.zhang@intel.com>, "edubezval@gmail.com" <edubezval@gmail.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 04/06/2019 07:56, Andy Tang wrote:
> Hi Edubezval, Rui,
> 
> Any further comments?

>From my POV, this patch makes sense. We may be interested to show up the
thermal zones in sysfs and optionally mitigate them via an userspace
governor.

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

>> -----Original Message-----
>> From: Yuantian Tang <andy.tang@nxp.com>
>> Sent: 2019Äê5ÔÂ15ÈÕ 17:37
>> To: rui.zhang@intel.com; edubezval@gmail.com
>> Cc: robh+dt@kernel.org; daniel.lezcano@linaro.org; mark.rutland@arm.com;
>> linux-pm@vger.kernel.org; devicetree@vger.kernel.org;
>> linux-kernel@vger.kernel.org; Andy Tang <andy.tang@nxp.com>
>> Subject: [PATCH] dt-bindings: thermal: Make cooling-maps property optional
>>
>> There may be no cooling device on system, or there are no enough cooling
>> devices for each thermal zone in multiple thermal zone cases since cooling
>> devices can't be shared.
>> So make this property optional to remove such limitations.
>>
>> Signed-off-by: Yuantian Tang <andy.tang@nxp.com>
>> ---
>>  .../devicetree/bindings/thermal/thermal.txt        |    4 ++--
>>  1 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/thermal/thermal.txt
>> b/Documentation/devicetree/bindings/thermal/thermal.txt
>> index ca14ba9..694e834 100644
>> --- a/Documentation/devicetree/bindings/thermal/thermal.txt
>> +++ b/Documentation/devicetree/bindings/thermal/thermal.txt
>> @@ -142,11 +142,11 @@ Required properties:
>>  - trips:		A sub-node which is a container of only trip point nodes
>>    Type: sub-node	required to describe the thermal zone.
>>
>> +
>> +Optional property:
>>  - cooling-maps:		A sub-node which is a container of only cooling device
>>    Type: sub-node	map nodes, used to describe the relation between
>> trips
>>  			and cooling devices.
>> -
>> -Optional property:
>>  - coefficients:		An array of integers (one signed cell) containing
>>    Type: array		coefficients to compose a linear relation between
>>    Elem size: one cell	the sensors listed in the thermal-sensors property.
>> --
>> 1.7.1
> 


-- 
 <http://www.linaro.org/> Linaro.org ©¦ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
