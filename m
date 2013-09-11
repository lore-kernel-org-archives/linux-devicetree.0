From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V2] regulator: core: add support for configuring turn-on
 time through constraints
Date: Wed, 11 Sep 2013 23:16:06 +0530
Message-ID: <5230AC5E.2020504@nvidia.com>
References: <1378904331-5665-1-git-send-email-ldewangan@nvidia.com> <5230A593.9010401@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5230A593.9010401@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "broonie@kernel.org" <broonie@kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "rob@landley.net" <rob@landley.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wednesday 11 September 2013 10:47 PM, Stephen Warren wrote:
> On 09/11/2013 06:58 AM, Laxman Dewangan wrote:
>> The Turn-on time of the regulator depends on the regulator device's
>> electrical characteristics. Sometimes regulator turn-on time also
>> depends on the capacitive load on the given platform and it can be
>> more than the datasheet value.
>>
>> The driver provides the enable-time as per datasheet.
>>
>> Add support for configure the enable ramp time through regulator
>> constraints so that regulator core can take this value for enable
>> time for that regulator.
>> diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Documentation/devicetree/bindings/regulator/regulator.txt
>>   - regulator-ramp-delay: ramp delay for regulator(in uV/uS)
>>     For hardwares which support disabling ramp rate, it should be explicitly
>>     intialised to zero (regulator-ramp-delay = <0>) for disabling ramp delay.
>> +- regulator-enable-ramp-delay: Turn-on time for regulator(in uSec). This is
>> +  the time time taken to reach within some proportion of the target voltage
>> +  from off state.
> This is still a bit unclear. What proportion of the target voltage?
> There's no mention that this describes the delay due to the
> board/environment rather than the delay due to the internal operation of
> the regulator itself. How about:
>
> - regulator-enable-ramp-delay: The time taken, in uSec, for the supply
> rail to reach the target voltage, plus/minus whatever tolerance the
> board design requires, once the regulator output itself has ramped up.
> This value is in addition to whatever built-in ramp time is inherent in
> the regulator's own internal design or configuration. This property
> describes the additional ramp time required due to board design issues
> such as trace capacitance and load on the supply.
>
> That's text repeats "additional" a bit, but I think describes the
> situation correctly?

I wanted to provide the absolute delay rather than additional delay on 
top of inherit delay from device.
