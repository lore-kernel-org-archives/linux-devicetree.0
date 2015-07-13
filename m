From: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>
Subject: Re: [PATCH 3/6] mfd: devicetree: bindings: 88pm800: Add DT property
 for 32KHz output enable
Date: Mon, 13 Jul 2015 12:54:46 +0530
Message-ID: <55A367BE.6040103@linaro.org>
References: <1436442431-3471-1-git-send-email-vaibhav.hiremath@linaro.org> <1436442431-3471-4-git-send-email-vaibhav.hiremath@linaro.org> <55A0C1B8.4030402@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55A0C1B8.4030402@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, sameo@linux.intel.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, lee.jones@linaro.org
List-Id: devicetree@vger.kernel.org



On Saturday 11 July 2015 12:41 PM, Krzysztof Kozlowski wrote:
> W dniu 09.07.2015 o 20:47, Vaibhav Hiremath pisze:
>> 88PM800 family of device supports output of 32KHz clock (low jitter)
>> on CLK32K2/3 pin which can be supplied to other peripherals on the b=
oard.
>>
>> This patch adds the devicetree binding to enable this feature.
>>
>> Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/mfd/88pm800.txt | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/88pm800.txt b/Doc=
umentation/devicetree/bindings/mfd/88pm800.txt
>> index dec842f..ae1311c 100644
>> --- a/Documentation/devicetree/bindings/mfd/88pm800.txt
>> +++ b/Documentation/devicetree/bindings/mfd/88pm800.txt
>> @@ -9,6 +9,12 @@ Required parent device properties:
>>   - #interrupt-cells 	: should be 1.
>>   			  The cell is the 88pm80x local IRQ number
>>
>> +Optional properties :
>> + - marvell,88pm800-32khz-xolj-out-en	: If set, driver will enable l=
ow jitter
>> +   version of 32Khz clock output on
>
> I am not sure if I understand it correctly. The hardware always has s=
uch
> clocks and you only want to enable/disable it in DT? Any reasons why
> these should not be enabled always?
>

Small amount of Power savings...
Although currently I do not have power numbers to justify this.

As per spec, (it only talks about power consumption in power down state=
)

Power-down State =3D> VSYS > 2.8   =3D> 4.5 =CE=BCA
                     CLK32K2 =3D 0  =3D> 18 =CE=BCW

> Enabling it in DT does not look like a job for DT. Maybe you there
> should be just a clock driver (clock provider)?
>

It's init time (and one time) settings, wouldn't clock-provider
be overkill for this?


Thanks,
Vaibhav
