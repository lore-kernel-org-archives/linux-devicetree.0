From: Daniel Schultz <d.schultz@phytec.de>
Subject: Re: [PATCH] mfd: dt-bindings: Add PMIC reset property
Date: Thu, 29 Mar 2018 16:46:52 +0200
Message-ID: <64961d3c-3037-d141-ee3c-c1a71ac275db@phytec.de>
References: <1521111530-39920-1-git-send-email-d.schultz@phytec.de>
 <20180318125207.5dotrxc37owbeyyb@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180318125207.5dotrxc37owbeyyb@rob-hp-laptop>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: mark.rutland@arm.com, heiko@sntech.de, w.egorov@phytec.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 03/18/2018 01:52 PM, Rob Herring wrote:
> On Thu, Mar 15, 2018 at 11:58:50AM +0100, Daniel Schultz wrote:
>> Add documentation about a new rk808 devicetree property, which can
>> enable resets by the PMIC.
> 
> The subject needs to be more specific that this is for Rockchip PMIC.
> 
>>
>> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
>> ---
>>   Documentation/devicetree/bindings/mfd/rk808.txt | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/rk808.txt b/Documentation/devicetree/bindings/mfd/rk808.txt
>> index 91b6522..fa1a30f 100644
>> --- a/Documentation/devicetree/bindings/mfd/rk808.txt
>> +++ b/Documentation/devicetree/bindings/mfd/rk808.txt
>> @@ -20,6 +20,8 @@ Optional properties:
>>     default output clock name
>>   - rockchip,system-power-controller: Telling whether or not this pmic is controlling
>>     the system power.
>> +- rockchip,system-reset-controller: Telling whether or not this pmic is controlling
>> +  the system reset.
> 
> Would you ever really have power and reset controlled by different
> things? IOW, why do we need 2 properties?
> 
The existing property enables the shutdown function and since the 
preferred way for resetting the system is the soft reset (control and 
reset module), rockchip wishes to have an extra property.

-- 
Mit freundlichen Grüßen,
With best regards,
   Daniel Schultz
