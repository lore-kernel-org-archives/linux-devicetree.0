From: Matheus Castello <matheus@castello.eng.br>
Subject: Re: [PATCH v3 2/5] dt-bindings: power: supply: Max17040: Add low
 level SOC alert threshold
Date: Sun, 2 Jun 2019 18:38:26 -0300
Message-ID: <71c4f6b6-fbbb-14ba-0cf0-2377498fdfbc@castello.eng.br>
References: <CAJKOXPf=nPrmw6Vzi_=LmO=dVsV4Gvoc-q75XP2FBEgm9Gxv0A@mail.gmail.com>
 <20190527022258.32748-1-matheus@castello.eng.br>
 <20190527022258.32748-3-matheus@castello.eng.br>
 <CAJKOXPdtsyY_GhniBAb0yV=HOhGx+x4xRPqNgdO+d0MDZRZ_7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPdtsyY_GhniBAb0yV=HOhGx+x4xRPqNgdO+d0MDZRZ_7w@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sre@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Chanwoo Choi <cw00.choi@samsung.com>, =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= <b.zolnierkie@samsung.com>, lee.jones@linaro.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> On Mon, 27 May 2019 at 04:45, Matheus Castello <matheus@castello.eng.br> wrote:
>>
>> For configure low level state of charge threshold alert signaled from
>> max17040 we add "maxim,alert-low-soc-level" property.
>>
>> Signed-off-by: Matheus Castello <matheus@castello.eng.br>
>> ---
>>   .../power/supply/max17040_battery.txt         | 28 +++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/power/supply/max17040_battery.txt
>>
>> diff --git a/Documentation/devicetree/bindings/power/supply/max17040_battery.txt b/Documentation/devicetree/bindings/power/supply/max17040_battery.txt
>> new file mode 100644
>> index 000000000000..a13e8d50ff7b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/power/supply/max17040_battery.txt
>> @@ -0,0 +1,28 @@
>> +max17040_battery
>> +~~~~~~~~~~~~~~~~
>> +
>> +Required properties :
>> + - compatible : "maxim,max17040" or "maxim,max77836-battery"
> 
> One more comment. The datasheet for max17040 says that there is on
> ALERT pin and ALERT bits in RCOMP register. Which device are you
> using? If it turns out that max17040 does not support it, then the
> driver and bindings should reflect this - interrupts should not be set
> on max17040.
> 

Yes you are right, max17040 have no ALERT pin. I am using max17043. Let 
me know what you think would be best, put a note about it in the 
description, add a compatibles like "maxim,max17043" and 
"maxim,max17044"? What do you think?

Best Regards,
Matheus Castello

> Best regards,
> Krzysztof
> 
